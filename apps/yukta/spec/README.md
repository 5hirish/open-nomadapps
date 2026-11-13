# Yukta: shared spec

The contract between the iOS app and the future Android app. They share no code; they share
**the rules** and **the fixtures** in this folder.

- **Rules:**
  - [docs/yukta/engineering/energy-spec.md](../../../docs/yukta/engineering/energy-spec.md) (v1, currently v0.1.0)
  - [docs/yukta/engineering/recovery-spec.md](../../../docs/yukta/engineering/recovery-spec.md) (v1.1, currently v0.1.0)
- **Fixtures:** `fixtures/energy/*.json` and later `fixtures/recovery/*.json`, added with the first
  YuktaKit code. Each file is one scenario: input days and the outputs every implementation
  must produce.

## Energy fixture format

```json
{
  "energySpecVersion": "0.1.0",
  "name": "learned-on-track-lose",
  "description": "21 days of logging, 9 weigh-ins, losing 0.5% a week",
  "profile": { "birthDate": "1990-01-01", "heightCm": 175, "equation": "male",
               "activityFactor": 1.375, "goal": "lose", "ratePctPerWeek": -0.5 },
  "days": [
    { "date": "2026-11-01", "weightKg": 80.4, "intakeKcal": 2100, "proteinG": 120,
      "markedComplete": false, "sleepMin": 410, "steps": 8200, "strengthSessions": 0 }
  ],
  "expected": {
    "date": "2026-11-22",
    "trendKg": 79.6,
    "expenditure": { "kcal": 2510, "low": 2390, "high": 2630, "weightOfData": 1.0 },
    "targets": { "intakeKcal": 2080, "proteinG": 125, "clampedToFloor": false },
    "status": "onTrack",
    "offLevers": ["sleep"],
    "validIntakeDays": 19
  }
}
```

The values above illustrate the shape only; they are not a computed result.

## Rules for fixtures

1. **Expected values come from a reference implementation, not from the app under test.** A
   small script in this folder computes them from the spec; both apps then have to match.
2. **Tolerance:** kcal ±1, kg ±0.01, grams ±1; status, levers, flags and counts exact.
3. **Synthetic data only.** Never commit a real health export, including the maintainer's.
4. **Never edit a fixture to make one platform pass.** Fix the implementation, or change the
   spec, bump its version and regenerate every fixture.

## Energy scenarios to cover first

no data · starting estimate only · blend at w = 0.5 · learned and on track · behind · partly
logged days (below 40% of median) · a day marked complete despite low intake · a missing week ·
a holiday spike · several weigh-ins in one day · floor clamp at the fastest rate · under 18 · BMI
below 18.5 · gain mode · maintain mode · lb units round-trip

## Recovery scenarios (v1.1)

calibrating (night 3 of 7) · high confidence · no HRV (Fitbit Air on iPhone) · low confidence ·
a missing night mid-baseline · sleep crossing midnight · time-zone and daylight-saving changes ·
a nap longer than the main sleep · resting HR from the heart-rate fallback · strain with and
without date of birth
