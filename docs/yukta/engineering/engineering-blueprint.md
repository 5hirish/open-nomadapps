# Yukta: engineering blueprint

iOS first, native SwiftUI, zero third-party dependencies. The rules every number follows are in
[energy-spec.md](energy-spec.md) (v1) and [recovery-spec.md](recovery-spec.md) (v1.1). Repo-wide
rules: [../../portfolio/engineering/conventions.md](../../portfolio/engineering/conventions.md).

## Targets and platforms

| Target | Type | Notes |
|--------|------|-------|
| `Yukta` | iOS app | iOS 17.0+, iPhone first. Foundation Models features behind `#available(iOS 26, *)` |
| `YuktaWidgets` | WidgetKit extension | Added with the widget work; reads the shared cache through an App Group |
| `YuktaKit` | Swift package (local) | Every formula and guardrail. No dependencies; `swift test` on macOS and Linux |

Tooling: Xcode 26, XcodeGen (`project.yml`), Swift 5.9 language mode to match the private repo's
apps (move to Swift 6 strict concurrency once the code settles).

## Architecture

```
HealthKit ──► HealthDataSource ──► DayInputsBuilder ──► YuktaKit ──────────────► DailyRecordStore ──► This week / charts / widgets
 (system)     (protocol: HealthKit     (samples →          (trend, expenditure,        (App Group JSON,
              or Fixture impl)          DayInputs)          targets, guardrails,        excluded from backup)
                                                            levers, recovery v1.1)
Quick-add / Weigh in ──► HealthKit writes (dietary energy, protein, body mass) ──► read back like any other source
```

- **`HealthDataSource` protocol** with `HealthKitSource` (real) and `FixtureSource` (Debug
  previews, screenshots and UI tests, loading the same JSON as `spec/fixtures/`).
- **YuktaKit owns every number and every guardrail.** The app never computes a target, trend,
  estimate or lever status itself. Guardrails (floor, rate cap, under-18, BMI) are Kit functions
  with tests, so the UI can't bypass them.
- **The app's own entries go to HealthKit**, then come back through the same read path as Fud AI's
  or MyFitnessPal's. One code path, and the user's data is portable.
- **`DailyRecordStore`** caches one record per day (inputs, outputs, spec versions). Disposable,
  rebuilt from HealthKit, `isExcludedFromBackup = true`. Hunger ratings are the one thing only
  the app holds; they live in the same store and are included in exports.

```
Yukta/
├── App/            # @main, dependency wiring
├── Features/
│   ├── Onboarding/   # 4 screens
│   ├── Week/         # This week (home)
│   ├── QuickAdd/     # kcal + protein, hunger
│   ├── WeighIn/
│   ├── Weight/       # trend chart
│   ├── Energy/       # expenditure chart
│   ├── Levers/       # one detail view per lever, with evidence
│   └── Settings/     # goal, profile, data, display, AI, export, support, help, about
├── Core/
│   ├── Health/       # HealthDataSource, HealthKitSource, FixtureSource, DayInputsBuilder, writers
│   ├── Store/        # DailyRecordStore (App Group)
│   ├── Background/   # observer queries, background delivery, widget reloads
│   ├── Insights/     # InsightProvider: Off (default) + FoundationModels
│   ├── Export/       # JSON / CSV
│   └── Support/      # StoreKit 2 tip jar
├── Design/         # tokens
└── Resources/      # assets, Localizable.xcstrings
```

## HealthKit

**Read (v1):**

| Data | Identifier | Used for |
|------|------------|----------|
| Body mass | `HKQuantityTypeIdentifier.bodyMass` | Weight trend, expenditure |
| Dietary energy | `.dietaryEnergyConsumed` | Intake |
| Dietary protein | `.dietaryProtein` | Protein lever, target |
| Sleep | `HKCategoryTypeIdentifier.sleepAnalysis` | Sleep lever |
| Steps | `.stepCount` | Steps lever |
| Workouts | `HKObjectType.workoutType()` | Strength sessions |
| Height | `.height` | BMR, BMI guardrail, protein reference weight |
| Date of birth, biological sex | `HKCharacteristicTypeIdentifier.dateOfBirth`, `.biologicalSex` | BMR equation, under-18 guardrail |

**Read (v1.1, recovery):** HRV SDNN, resting heart rate, heart rate, respiratory rate.

**Write (v1):** `.dietaryEnergyConsumed`, `.dietaryProtein`, `.bodyMass`, with metadata marking
the app as the source. That needs `NSHealthUpdateUsageDescription` as well as
`NSHealthShareUsageDescription`.

**Reading:** async query descriptors; first run reads 90 days back; then `HKAnchoredObjectQuery`
anchors per type. Deleted samples (a user removing a Fud AI entry) arrive through the anchor and
are removed from the day's totals.

**Authorization reality:** HealthKit never reveals whether *read* access was denied. Empty means
"denied or no data"; one empty state covers both, and the app never nags.

**Double counting:** sums include every source. The quick-add sheet lists entries with their
source app so the user can see and fix duplicates (we only delete our own).

## Background updates

- `HKObserverQuery` + `enableBackgroundDelivery` on body mass, dietary energy and sleep.
- On wake: rebuild the affected days, recompute, write records, reload widgets.
- Fallback: `BGAppRefreshTask`, plus a rebuild whenever the app comes to the foreground.

## Insights (on-device AI)

- `InsightProvider` protocol; `OffProvider` default; `FoundationModelsProvider` with guided
  generation into a `@Generable` struct, gated on `SystemLanguageModel.default.availability`.
- Input: a `WeekSummary` of derived numbers only (rates, means, off levers, evidence strengths).
  The prompt forbids medical and hormone claims; output is checked against a word list before
  display.
- AI off or unavailable: no card, no toggle.
- **Target the standard on-device model** (any Apple Intelligence iPhone, including Shirish's
  iPhone 17). Don't depend on iOS 27's larger "Core Advanced" model, which reportedly needs 12 GB
  (iPhone Air, 17 Pro and Pro Max).
- **Never use Private Cloud Compute** or any server model: manifesto rule 6 means the request
  stays on the phone. If a feature only works off-device, it doesn't ship.

## Export

- **JSON:** `{ energySpecVersion, recoverySpecVersion, exportedAt, profile, days: [DailyRecord] }`.
- **CSV:** `days.csv` (inputs and outputs per day), `hunger.csv`, zipped, via `ShareLink`.
- Round-trip test: export, import as a fixture, identical records.

## Tip jar

StoreKit 2, three consumables (`tip.small`, `tip.medium`, `tip.large`), Settings › Support only,
a thank-you line after purchase, nothing unlocks.

## Testing

| Layer | How | Where it runs |
|-------|-----|---------------|
| YuktaKit | XCTest + golden fixtures from `spec/fixtures/` (energy and, later, recovery) | Linux CI (`swift` container) and Mac |
| Guardrails | Dedicated tests: floor clamp, rate cap, under-18, BMI < 18.5 | Linux CI |
| DayInputsBuilder | XCTest with synthetic samples through `FixtureSource` | Mac |
| Screens | Debug fixture scenes (`YUKTA_PREVIEW=<scene>`), screenshotted on the phone with `scripts/ios-screenshot.sh` | iPhone |
| HealthKit reads, writes, background | Release build on Shirish's iPhone | iPhone |

## Android (later)

- Kotlin + Compose, Health Connect (nutrition, weight, sleep, steps, exercise sessions). Same
  `spec/fixtures/`.
- Health Connect limits reads to roughly 30 days before the permission grant unless the history
  permission is granted, and background reads need their own permission. Verify when Android
  starts.
- New personal Google Play accounts must run a closed test with at least 12 testers for 14 days
  before production (verify the current rule).

## Build order

1. YuktaKit: trend, regression slope, valid-day rule, BMR, blend, targets, guardrails, levers,
   status; fixtures from a reference script.
2. `FixtureSource` + This week screen (matches the Claude Design board).
3. HealthKit reads + `DayInputsBuilder`; dogfood on the phone.
4. Quick-add and Weigh in with HealthKit writes.
5. Store, background updates, widgets.
6. Weight, Energy and Lever detail screens with the evidence text.
7. Settings: hide numbers, export, tip jar, help, about.
8. Insights (Foundation Models).
9. Release checklist, TestFlight, App Store. Then v1.1: recovery pillar.
