# Yukta: energy spec v0.1.0

**Status: draft, unvalidated.** The method (intake versus weight trend) is standard physics; the
constants and thresholds below are starting choices, marked where they are ours. Evidence for
every claim is in [../strategy/science-evidence.md](../strategy/science-evidence.md). This is a
wellness estimate, not a medical measurement.

Both the iOS and the future Android app implement this document. Golden fixtures in
`apps/yukta/spec/fixtures/` pin the results. Weights are in kg and energy in kcal internally;
the UI converts to lb if chosen.

## 1. Inputs per day

| Input | Source | Notes |
|-------|--------|-------|
| `weight` | Apple Health body mass (any scale, or the app's manual entry) | If several readings on a day, the **first of the day** |
| `intakeKcal` | Apple Health dietary energy consumed (any logger, or the app's quick-add) | Sum of the day's samples |
| `proteinG` | Apple Health dietary protein | Sum of the day's samples |
| `markedComplete` | The app | User marked the day's logging complete |
| `sleepMin` | Apple Health sleep analysis | Main sleep window as in recovery spec §1 |
| `steps` | Apple Health step count | Sum of the day |
| `strengthSessions` | Apple Health workouts of type traditional or functional strength training | Count |
| `hunger` | The app (optional, 1–5) | Stored locally; never written anywhere else |
| Profile | Apple Health date of birth, height, biological sex; user settings | Sex is used only to pick an equation (§5); the user can choose the equation instead |

Missing is never zero.

## 2. Weight trend (for display and status)

- Exponentially smoothed: `trend[d] = trend[d−1] + 0.1 × (weight[d] − trend[d−1])`, the method
  popularised by The Hacker's Diet (attribution and the 0.1 factor to be checked against the
  source, see evidence register).
- The first weigh-in starts the trend. A day with no weigh-in keeps yesterday's trend.
- The chart shows raw weigh-ins as dots and the trend as a line.

## 3. Expenditure from data

Over a window of the last **W = 21 days** (ending yesterday):

1. **Slope:** fit an ordinary least-squares line to the raw weigh-ins in the window (not the
   smoothed trend, so missing days don't bias it). `slope` in kg/day, with its standard error
   `se`.
2. **Mean intake:** the mean of `intakeKcal` over **valid intake days** in the window (§4).
3. **Energy density:** `ρ = 7,700 kcal/kg` (3,500 kcal/lb; roughly right for fat tissue).
4. **Estimate:** `E_data = meanIntake − slope × ρ`.
5. **Range** (about 80%): `meanIntake − (slope ± 1.28 × se) × ρ`, never narrower than ±100 kcal.

Computed only when the window has **at least 10 valid intake days and at least 6 weigh-ins on
different days**. Otherwise `E_data` is unavailable.

## 4. Valid intake days (the half-logged-day problem)

A day counts toward mean intake only if:

- it has at least one intake entry, **and**
- it is marked complete, **or** its total is at least **40%** of the median total of the last 28
  valid days (once 7 exist; before that, at least 800 kcal). Both thresholds are ours.

Days that fail are shown as "partly logged" and excluded. Days with nothing logged are excluded,
never counted as zero.

## 5. Starting estimate (before there's enough data)

- **BMR (Mifflin-St Jeor):** `10 × weight(kg) + 6.25 × height(cm) − 5 × age + s`, where `s` is
  +5 (male equation) or −161 (female equation). The user can pick the equation; if no sex is set
  and none is picked, use the mean of both.
- **Activity factor** chosen in onboarding: 1.2 (mostly sitting), 1.375 (light), 1.55
  (moderate), 1.725 (very active).
- `E_prior = BMR × activity factor`.

**Blend:** `E = w × E_data + (1 − w) × E_prior`, with `w = clamp((validIntakeDays − 7) / 14, 0, 1)`
when `E_data` exists, else `w = 0`. The UI says which it is ("starting estimate" until `w = 1`).

## 6. Targets

- **Goal modes:** lose, maintain, gain (all three in v1, decided 13 November).
- **Rate** `r` as % of trend weight per week: lose 0.25 / 0.5 (default) / 0.75 / 1.0; gain 0.25 /
  0.5; maintain 0.
- **Intake target:** `E + r × trendWeight × ρ / 7` (r negative for loss). Rounded to 10 kcal.
- **Update cadence:** once a week, on a check-in day the user picks (decided 13 November). On the
  check-in day the estimate `E`, the intake target and the protein target are recomputed and then
  held until the next check-in. Between check-ins the app still shows the latest trend, intake and
  levers, and the estimate's live value is visible in the Energy screen as "next check-in". Changing
  the goal or rate recomputes targets immediately.
- **Protein target:** `1.6 g × reference weight`, where the reference weight is the trend weight,
  or the weight at BMI 25 for the user's height if that is lower (the cap is our proposal, to be
  reviewed). Rounded to 5 g.

## 7. Guardrails (manifesto rule 11; enforced in YuktaKit and tested)

| Rule | Behaviour |
|------|-----------|
| **Floor** | The intake target is never below **max(BMR, 1,200 kcal)** (approved by Shirish, 13 November). If the chosen rate would require less, the target is clamped to the floor and the app explains the slower rate. 1,200 sits inside the 1,000–1,500 kcal range NHLBI's 1998 guidelines used for low-calorie diets; below 800 kcal is NICE's very-low-calorie-diet range (450–800), a clinical intervention the app never approaches |
| **Rate cap** | No loss rate above 1% of body weight a week exists in the UI |
| **Under 18** (date of birth) | No lose mode. Maintain and gain show estimates only |
| **BMI below 18.5** | No lose mode |
| **Fastest rate** | Shows "check with a doctor before losing this fast" |
| **Hide numbers** | Setting that replaces numbers with directions (on track / ahead / behind) everywhere, widgets included |

The 1% cap still needs a primary source before launch (evidence register, Guardrails).

## 8. Weekly status

- **Actual rate:** trend change over the last 14 days, as % of body weight per week.
- **On track** if within ±0.15% of the goal rate; otherwise **ahead** or **behind** (our
  thresholds).
- Maintain: on track if the 28-day trend change is within ±1% of body weight.

## 9. Levers

Evaluated over the last 7 days. A lever is **off** when:

| Lever | Off when | Default target |
|-------|----------|----------------|
| Sleep | 7-day average asleep is more than 30 min under target | 7 h (to be sourced: adult sleep guidelines) |
| Protein | Fewer than 4 of the last 7 valid intake days reach the protein target | §6 |
| Strength | Fewer than 2 strength sessions | 2 a week (to be sourced: WHO) |
| Steps | 7-day average below 80% of the 28-day median | Your own normal |

Off levers are listed in this order: sleep, protein, strength, steps (ordered by the strength of
their evidence for fat loss and lean-mass retention; see the register). Each shows its number,
its target and a one-line "why" linking to the evidence.

**Hunger (optional):** when 14+ ratings exist, the detail view may show the average rating after
nights under and over the sleep target. Descriptive only; no claims beyond the data.

## 10. Versioning and validation

- Any change to a formula, constant or rule bumps this version and regenerates fixtures.
  Exports record the version that produced each value.
- **Validation:** Shirish logs intake and weighs in for 4+ weeks; we publish how well the
  estimate predicted the following weeks' trend change, whatever the result. Fixtures cover:
  no data, starting estimate only, blend at `w = 0.5`, partial days, a missing week, a holiday
  spike, guardrail clamps, under-18 and low BMI.
