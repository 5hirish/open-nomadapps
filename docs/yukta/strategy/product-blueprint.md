# Yukta: product blueprint

> **Name: Yukta** (युक्त), chosen 13 November: Sanskrit for "balanced, moderate, regulated", from
> Bhagavad Gita 6.17, which names the same formula this app is built on: moderation in eating,
> activity and sleep. The full meaning is in [naming.md](naming.md). Earlier working names:
> "readiness" (to 12 November), "balance" (12–13 November).

## One line

**No-BS, science-backed healthy living, built on energy balance.** A free iPhone app that works
out what you actually burn from your own weight trend and what you eat, then shows which of the
proven levers (sleep, protein, strength, steps) is making it harder.

Positioning: **the open-source MacroFactor + Athlytic, without the subscription.**

## The core concept

- **Energy balance decides weight change.** A calorie deficit (burning more than you consume) is
  the only thing that causes fat loss.
- **In practice, these decide whether a deficit works and what you lose:**
  - hunger and cravings
  - hormones (insulin, leptin, ghrelin), which no consumer device measures, so we track the
    behaviors that move them instead
  - sleep and stress
  - muscle mass and activity level

Every claim and target is in [science-evidence.md](science-evidence.md), with its strength.

## The one question the app answers

**"Am I on track this week, and which lever is off?"** A weekly view, not daily scores:

```
This week                                   Nov 10–16
Trend weight   −0.4 kg/week   goal −0.5     ● on track
Intake         2,050 kcal/day  target 2,000
Expenditure    ~2,500 kcal/day (2,350–2,650) estimated from your data

Levers
  Sleep      6 h 20 m avg   40 m under target   ← likely making it harder
  Protein    4 of 7 days at target
  Strength   1 session      aim for 2
  Steps      7,900/day      your normal
```

Each lever is one line until you tap it; the detail shows your data and the evidence.

## The problem

- **Calorie apps guess "calories out" from a watch,** which is off by 20–30% or more for every
  brand. The guess sets the target, so the target is wrong from day one.
- **The apps that get this right charge for it.** MacroFactor's adaptive expenditure is $71.99/yr
  ($89.99 with workouts); Google Health Premium's AI coaching is $9.99/month; Athlytic's recovery
  is $29.99/yr.
- **Advice is noisy:** hormone hacks, fat-burning foods, 10,000 steps. People need the few levers
  that are proven, ranked, and tied to their own data.

## Who it's for

| Segment | Today | Why they'd switch |
|---------|-------|-------------------|
| People losing (or gaining) weight who already log food in another app | MyFitnessPal, Fud AI, Cronometer; a static calorie target | A target from their real expenditure, free |
| MacroFactor-curious people who won't pay a subscription | Spreadsheets, Reddit TDEE calculators | Same method, free, open, private |
| Wearable owners who want to know what actually matters | Fitbit / Google Health, Apple Watch, Garmin apps | One weekly answer that ties sleep and training to the scale |

**Primary dogfooder:** Shirish, on iPhone with a Fitbit Air (via Google Health → Apple Health),
logging intake and weighing in manually.

## v1 scope

| In v1 | Why |
|-------|-----|
| **Weight trend** (smoothed; skips missing days) from Apple Health + manual entry | Daily weight is noise |
| **Expenditure estimate** from intake + trend, with a range, updated weekly | The core feature |
| **Targets:** intake for your goal (lose, maintain or gain: all three in v1), protein, updated **once a week on a check-in day you choose** | Turns the estimate into action; weekly keeps it calm |
| **Guardrails:** safe rates, BMR floor, no deficit for under-18s or BMI < 18.5 | Manifesto rule 11 |
| **Quick-add** calories + protein (written to Apple Health) | Works without a food logger |
| **Intake from Apple Health**, any app that writes nutrition | No food database to build |
| **Levers:** sleep, protein days, strength sessions, steps | The modifiers |
| **Optional hunger rating** (1–5), off by default, local only | The hunger lever, with no nagging |
| **"Why" screens** for each lever, citing the evidence | Rule 10 |
| **Widgets** (week status) | Replaces notifications |
| **Explain my week** (on-device AI, off by default, iOS 26+) | Free version of paid AI coaching |
| **Export** JSON / CSV; **hide numbers** mode; tip jar | Rules 7, 11, 1 |

| Not in v1 | Why not (yet) |
|-----------|---------------|
| **Recovery / readiness score** (HRV, resting HR) | v1.1; spec ready in [../engineering/recovery-spec.md](../engineering/recovery-spec.md) |
| Food database, barcode scanning, photo logging | Fud AI and others do it; we read their data |
| Notifications | Rule 4 |
| Watch app, iPad | After v1 |
| Android | After iOS ships; needs `spec/` fixtures |
| Cycle-phase annotations on the weight trend | v1.x; reads Apple Health cycle data |
| Import from MacroFactor / MyFitnessPal exports | Check their export formats first (rule 8) |

## Data reality (verified November 2026)

- **Fitbit Air on iPhone** syncs steps, sleep stages, workouts, heart rate and blood oxygen to
  Apple Health through Google Health (two-way since 5.05, August 2026), **not HRV**. Fine for v1;
  it is why recovery moved to v1.1.
- **Intake** reaches Apple Health from loggers that write dietary energy and protein (Fud AI
  syncs nutrition to Apple Health; check others per app).
- **Weight** reaches Apple Health from smart scales or manual entry. The estimate needs about 4+
  weigh-ins a week to be useful.

## Success metrics (self-promotion; revisit after launch)

| Metric | 90 days after launch | Source |
|--------|----------------------|--------|
| GitHub stars | 250 | GitHub |
| App Store downloads | 1,000 | App Store Connect |
| Rating | 4.5+ with 20+ ratings | App Store Connect |
| External contributors | 3 merged PRs (after the CLA bot exists) | GitHub |
| Public write-ups by Shirish | 4 (build log, "your watch is wrong about calories", launch, retrospective) | Blog / X / LinkedIn |
| Estimate sanity | Shirish's 4+ week comparison of predicted vs actual trend change, published whatever it shows | Dogfood log |

Targets are guesses for direction (Fud AI has 526 stars, openGym 21.1k), not forecasts.

## Risks

| Risk | Mitigation |
|------|------------|
| Eating-disorder harm | Guardrails in code, no streaks, no moralising copy, hide-numbers mode, support link |
| Half-logged days make the deficit look huge | Partial-day detection (energy spec §4) |
| Too few weigh-ins | Range widens; "needs more data" state |
| People read the estimate as exact | Always a range, plus "how this is calculated" |
| Water-weight swings (salt, carbs, menstrual cycle) | Trend smoothing; cycle annotations later |
| App Review scrutiny of weight-loss and health claims | Wellness language, evidence register, guardrails |
| Scope creep into a four-pillar bloat app | One weekly screen; each lever is one line until tapped |

## Decisions log (this app)

| Date | Decision |
|------|----------|
| 12 Nov 2026 | Scope widened from a readiness score to energy-balance-based holistic health |
| 12 Nov 2026 | v1 = energy balance (weight trend + expenditure + levers); recovery score = v1.1 |
| 12 Nov 2026 | Intake from Apple Health + quick-add; no food database |
| 12 Nov 2026 | Weight from Apple Health + manual entry |
| 12 Nov 2026 | Don't trust wearable "calories burned"; estimate expenditure from intake and weight trend |
| 12 Nov 2026 | Don't track or claim hormones; track the behaviors that move them |
| 13 Nov 2026 | All three goal modes in v1: lose, maintain, gain |
| 13 Nov 2026 | Targets update once a week on a check-in day the user picks, not continuously |
| 13 Nov 2026 | Optional hunger rating (1–5) ships in v1, off by default |
| 13 Nov 2026 | Name: **Yukta** (Bhagavad Gita 6.17), chosen over "Amruta" (see naming.md); pending App Store, trademark and domain checks |
| 13 Nov 2026 | Bundle ids follow the nomadapps format: `com.alleviatelab.<app>` for the store build, `com.alleviatelab.<app>.local` ("<App> Local") for Debug. Registered once the store name exists |
| 13 Nov 2026 | Calorie floor approved: never target below max(estimated BMR, 1,200 kcal) |
| 13 Nov 2026 | Shirish's phone is an iPhone 17: supports Apple Intelligence, so on-device AI can be dogfooded. Target the standard on-device model, not iOS 27's "Core Advanced" model (needs 12 GB: iPhone Air, 17 Pro) |

## Open questions

1. **Name checks for Yukta:** App Store availability, trademarks (India, US, EU), domains.
2. **Free only, or a one-time store price** (portfolio strategy, Still open). Not decided yet.

## Sources

See [science-evidence.md](science-evidence.md) for the health claims. Market facts:

- MacroFactor pricing: https://apppricinglab.com/app/apple/1553503471, https://help.macrofactorapp.com/en/articles/393-how-macrofactor-subscriptions-and-bundles-work
- Google Health Premium and Fitbit Air: https://store.google.com/us/product/google_fitbit_air, https://www.techlicious.com/blog/google-fitbit-air-whoop-alternative/
- Athlytic: https://www.apppricinglab.com/app/apple/1543571755
- Fitbit Air → Apple Health, no HRV: https://www.macrumors.com/2026/08/03/fitbit-apple-health-syncing/
