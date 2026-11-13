# Yukta: recovery spec v0.1.0 (the v1.1 recovery pillar)

> Written first as the scoring spec for a standalone readiness app (11 November 2026). When the
> scope widened to energy balance, it became the **recovery** pillar of balance, planned for v1.1.
> The energy engine is in [energy-spec.md](energy-spec.md).

**Status: draft, unvalidated.** These are design choices to start from, not a validated model.
Validation (below) decides whether they stay. This is a wellness estimate, not a medical
measurement, and the app must never present it as one.

Both the iOS and the future Android app implement this document. Golden fixtures in
`apps/yukta/spec/fixtures/` pin the results; see `apps/yukta/spec/README.md`.

## 1. The day and its sleep window

- **Day D** is a calendar day in the phone's current time zone. Its score describes the
  morning of D.
- **Sleep window for D:** take all sleep-analysis samples with an *asleep* value (core, deep,
  REM, unspecified). Merge samples whose gap is under 60 minutes into sessions. The window is
  the **longest session that ends between 03:00 and 15:00 on D**. Naps (other sessions) are
  ignored in v0.
- No window → every sleep-derived signal for D is missing.

## 2. Signals for day D

| Signal | Unit | How it's derived | Direction |
|--------|------|------------------|-----------|
| `hrv` | ms | Mean of HRV (SDNN) samples that start inside the sleep window | higher is better |
| `rhr` | bpm | The resting-heart-rate sample dated D if one exists; otherwise the lowest 30-minute rolling mean of heart-rate samples inside the window, if the window has at least 20 samples | lower is better |
| `resp` | breaths/min | Mean respiratory-rate samples inside the window | only *higher* than normal counts |
| `sleepMin` | minutes | Total asleep minutes inside the window | see §4 |
| `sleepMid` | minutes | Midpoint of the window, as minutes since 18:00 on D−1 (avoids the midnight wrap) | closer to normal is better |

A signal with no data is **missing**, never zero.

## 3. Your normal (baseline)

For each signal, the baseline uses that signal's values on days D−28 … D−1 (today excluded).

- **Baselined** when at least **7** of those days have a value.
- `m` = median of the values.
- `s` = max(1.4826 × MAD, floor), where MAD is the median absolute deviation from `m`.
  Floors stop a very steady signal from turning tiny changes into large swings:

| Signal | Floor |
|--------|-------|
| `hrv` | 3 ms |
| `rhr` | 1.5 bpm |
| `resp` | 0.3 breaths/min |
| `sleepMid` | 20 min |

- `z` = (today − `m`) / `s`, clamped to [−3, 3].
- "Normal range" shown in the app = `m` ± `s`.

## 4. Component scores (0–100)

| Component | Needs | Score |
|-----------|-------|-------|
| **HRV** | `hrv` present and baselined | clamp(70 + 15 × z, 0, 100) |
| **Resting HR** | `rhr` present and baselined | clamp(70 − 15 × z, 0, 100) |
| **Respiratory rate** | `resp` present and baselined | clamp(100 − 50 × max(0, z − 1), 0, 100): full marks up to 1 deviation above normal, 0 at 3 |
| **Sleep** | `sleepMin` present | 0.75 × duration + 0.25 × timing; if `sleepMid` isn't baselined, duration only |

- **Duration** = clamp(100 × `sleepMin` / target, 0, 100). Target = the user's setting if set,
  else the median of `sleepMin` over D−28 … D−1 if at least 7 days exist, else 480 minutes.
- **Timing** = clamp(100 − (|`sleepMid` − `m`| − 30) × 100 / 120, 0, 100): full marks within
  30 minutes of your usual midpoint, 0 at 150 minutes away.

With HRV and resting HR, a perfectly normal day scores 70, and two deviations in the good
direction score 100.

## 5. Readiness

Weights:

| Component | Weight |
|-----------|--------|
| HRV | 0.40 |
| Resting HR | 0.25 |
| Sleep | 0.25 |
| Respiratory rate | 0.10 |

**Readiness** = Σ(weight × score) / Σ(weight), over the components that are available. Missing
components drop out and the rest are re-weighted. Round half away from zero to an integer, once,
at the end.

A score is produced only when **at least two components are available and one of them is HRV or
Resting HR.** Otherwise the day is *calibrating* (fewer than 7 baseline days) or *no data*.

**Bands** (always shown as a word plus colour):

| Score | Band |
|-------|------|
| 70–100 | Ready |
| 50–69 | Steady |
| 0–49 | Take it easy |

## 6. Confidence

| Level | Rule |
|-------|------|
| **High** | HRV, Resting HR and Sleep available, and both HRV and Resting HR baselines have at least 14 days |
| **Medium** | A score exists and the available weights sum to at least 0.5, but it isn't High (for example: no HRV, as with a Fitbit Air on iPhone) |
| **Low** | A score exists but the available weights sum to less than 0.5 |

The chip's explanation names the missing signals: "Based on resting heart rate and sleep. No HRV
from your device."

## 7. Reasons

For each available component: **impact** = (weight ÷ Σ available weights) × (score − reference),
where the reference is 70 for HRV and Resting HR and 100 for Sleep and Respiratory rate.

Show up to **three reasons**, largest |impact| first, skipping any with |impact| < 2 points. If
none are left: "Everything is close to your normal." Templates:

- HRV / Resting HR / Respiratory rate: "{Signal} {value} {unit}, {abs delta} {above|below} your normal"
- Sleep duration: "Slept {h m}, {abs delta} {over|under} your target"
- Sleep timing: "Went to sleep {abs delta} {earlier|later} than usual"

## 8. Strain (previous day)

- **Max heart rate** = 208 − 0.7 × age (Tanaka), using date of birth from Apple Health; a manual
  value in Settings overrides it. Without either, strain is unavailable.
- **Zones** by % of max: Z1 50–60, Z2 60–70, Z3 70–80, Z4 80–90, Z5 ≥ 90.
- Each heart-rate sample counts for the time until the next sample, capped at 5 minutes.
- **Strain** = Σ minutes in zone × zone number (1–5), the Edwards training-impulse method.
- Shown as points plus a comparison with the 28-day median. No 0–21 scale.

## 9. Versioning

- This document carries a semantic version. Any change to a formula, constant or rule bumps it
  and regenerates the fixtures.
- Exports and fixtures record the spec version that produced each value.

## 10. Validation plan

1. **Fixtures first:** hand-built edge cases (calibrating, no HRV, missing nights, time-zone
   change, midnight-spanning sleep, DST) with expected outputs computed by a reference script,
   not by the app under test.
2. **Dogfood:** 30+ days of Shirish's Fitbit Air data, compared daily with Google Health's own
   readiness score. Report the rank correlation publicly, whatever it is, and adjust weights only
   through a spec version bump.
3. **Apple Watch coverage:** synthetic and volunteer-contributed (anonymised, consented) data,
   since Shirish no longer wears one.
