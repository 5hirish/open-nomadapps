# Yukta: design brief

The written spec for the Claude Design prototype. Boards will live in `design/yukta/` once the
first canvas is synced. Scope and reasons: [../strategy/product-blueprint.md](../strategy/product-blueprint.md).
Every number's formula: [../engineering/energy-spec.md](../engineering/energy-spec.md). Every
claim's evidence: [../strategy/science-evidence.md](../strategy/science-evidence.md).

## Principles

1. **One weekly answer.** The home screen answers "am I on track, and which lever is off?" above
   the fold. Everything else is one tap deeper.
2. **Show the working.** Every number opens to its inputs and formula, and every lever to its
   evidence.
3. **Ranges, not false precision.** Expenditure always shows a range and whether it is a starting
   estimate or learned from your data.
4. **Calm and kind.** No streaks, badges, confetti, red alarms or modals on launch. No "good" or
   "bad" food, no "cheat days", no guilt. Behind target reads as information, never failure.
5. **Fast input.** Quick-add and weight entry take two taps from the home screen.
6. **Native.** SwiftUI system components, SF Pro, SF Symbols, Swift Charts, Dynamic Type to AX5,
   light and dark, Reduce Motion respected.

## Screens

### 0. Onboarding (four screens, no account)

1. **Promise:** "Free. No account. Nothing leaves your phone." Continue.
2. **Goal:** lose / maintain / gain, then the rate (0.25%, 0.5% default, 0.75%, 1% of body weight
   a week, with kg/lb per week shown). Lose is unavailable under 18 or below BMI 18.5, with a
   kind explanation.
3. **About you:** activity level (four plain choices), the estimate's equation choice if Apple
   Health has no sex set, units.
4. **Health access:** each data type with one line on why it's read, and that entries you make
   are saved to Apple Health. Then lands on This week.

### 1. This week (home)

- **Status line:** trend rate vs goal with *On track / Ahead / Behind* (word plus colour).
- **Check-in:** "Targets update Sunday" (the user's check-in day). On check-in day the home
  screen shows what changed and why in one line ("Target 2,000 → 1,950: you burned a little less
  than estimated"). No notification.
- **Intake vs target**, **expenditure with range** and a tag: "Starting estimate" or "Learned from
  your data".
- **Levers:** sleep, protein, strength, steps, one line each, off levers first with a short reason.
- **Quick-add** and **Weigh in** buttons, always visible.
- **Explain my week** card, only when AI is on and available.
- **States to draw:** first day (starting estimate only); learning (day 9: "5 more logged days to
  learn your numbers"); learned, on track; behind with sleep off; partly logged days present;
  hide-numbers mode; no intake source and no quick-adds yet; no weigh-ins this week.

### 2. Quick-add (sheet)

- Two fields: kcal, protein (g); number keypad up first; optional label; date defaults to today
  with "yesterday" one tap away. Save writes to Apple Health.
- Below: today's entries with their source app ("Fud AI", "MyFitnessPal", "Yukta") so double
  logging is visible; swipe to delete our own entries.
- "Mark today complete" toggle.
- Optional hunger rating (1–5) row, only if turned on in Settings (off by default; in v1).

### 3. Weigh in (sheet)

- One field, prefilled with the last value, kg or lb. Save writes to Apple Health.
- "4 of 7 days weighed this week" helper line.

### 4. Weight

- Chart: raw weigh-ins as dots, trend as a line; 4 weeks / 3 months / 1 year.
- Trend rate per week and total change since start.

### 5. Energy

- Expenditure over time with its range band; intake bars per day with partly logged days greyed
  and labelled.
- "How this is calculated" in plain language: intake minus what the scale says you stored.

### 6. Lever detail (one per lever)

- The lever's 4-week chart against its target.
- **Why it matters:** two or three sentences with the finding, the study and its strength
  ("Moderate: a small trial"), linking to the evidence register.
- For sleep with hunger ratings: hunger after short vs normal nights (descriptive).

### 7. Settings

- **Goal:** mode, rate, check-in day.
- **Profile:** activity level, equation, units, sleep target, protein target override.
- **Data:** sources found, partly-logged threshold explanation, delete cached data.
- **Display:** hide numbers.
- **AI:** off by default; toggle only when the device supports it ("Runs on your iPhone. Nothing
  is sent anywhere.").
- **Hunger rating:** off by default.
- **Export:** JSON or CSV.
- **Support:** tip jar (three consumable amounts), GitHub Sponsors, "Rate on the App Store".
- **Help:** a link to eating-disorder support resources.
- **About:** the name: Bhagavad Gītā 6.17 in Devanāgarī and transliteration, its translation and a
  link to `naming.md` (no religious imagery); open source, AGPL, version, repo, privacy policy,
  evidence register.
- No notifications section in v1.

### Widgets

- **Small:** status word + trend rate.
- **Medium:** status + intake vs target + the top off lever.
- **Lock Screen:** circular (status), rectangular (intake left today).
- Hide-numbers and learning variants for each.

## Copy rules

- Plain words: "what you burn" before "expenditure"; "your trend" before "EMA".
- Never medical, never moralising. Say "behind your goal", not "failed"; "eat", not "cheat".
- Numbers carry units and comparisons: "2,050 kcal a day, 50 over target".
- Missing data is never the user's fault: "No weigh-ins this week yet."
- Hormones only appear in "why" text, as what sleep and protein affect, never as something we
  measure.

## Claude Design prompt (start the canvas with this)

```
Design an iPhone app called "Yukta" (Sanskrit for "balanced, moderate"): a free, open-source, privacy-first,
science-backed energy balance app. It estimates what you actually burn from your own weight
trend and food intake (read from Apple Health or quick-added), sets a safe calorie and protein
target, and shows which proven lever (sleep, protein, strength training, steps) is making a
deficit harder.

Values: no account, no subscription, no ads, no notifications, no streaks or gamification, no
"good/bad food" language. Calm, honest, evidence-based. Every number can be opened to see why.
Estimates are always shown as ranges.

Make an interactive prototype in an iPhone 17 frame, light and dark, using native iOS patterns:
SF Pro, SF Symbols, large titles, inset grouped lists, Swift Charts style.

Screens:
0. Onboarding, 4 steps: promise; goal (lose / maintain / gain + rate as % of body weight per
   week); about you (activity level, units); Health access list.
1. This week (home): status (On track / Ahead / Behind) with trend rate vs goal; intake vs
   target; expenditure with range and "Starting estimate" or "Learned from your data"; levers
   list (sleep, protein, strength, steps) with off levers first; Quick-add and Weigh in buttons;
   optional "Explain my week" AI card.
2. Quick-add sheet: kcal + protein keypad, optional label, today/yesterday, today's entries with
   source app, "mark today complete", optional hunger 1-5.
3. Weigh in sheet: one field, "4 of 7 days weighed this week".
4. Weight: dots for weigh-ins, trend line, 4w / 3m / 1y.
5. Energy: expenditure with range band, daily intake bars, partly logged days greyed.
6. Lever detail: 4-week chart vs target, "Why it matters" with the study and evidence strength.
7. Settings: goal, profile, data, hide numbers, AI (off), hunger rating (off), export, support
   (tip jar, Sponsors, rate), help (eating-disorder resources), about.
8. Widgets: small, medium, Lock Screen circular and rectangular.

Fixture states to switch between: first day; learning (day 9); learned and on track; behind
with sleep off; partly logged days; hide-numbers mode; no weigh-ins this week. Synthetic data
only. Status uses colour plus a word, never colour alone. Support Dynamic Type.
```

## Accessibility

- Every chart has a VoiceOver summary ("Trend weight, last 4 weeks, down 1.6 kg, about 0.4 kg a
  week").
- Touch targets ≥ 44 pt; contrast AA in both appearances, including status colours.
- Hide-numbers mode doubles as an accessibility and wellbeing feature; it is never buried.
