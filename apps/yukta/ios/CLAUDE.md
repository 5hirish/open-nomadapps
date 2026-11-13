# CLAUDE.md: Yukta (iOS)

Guidance for Claude Code when working on the **Yukta** iOS app inside **open-nomadapps**.

> Native iOS Swift app at `apps/yukta/ios/`. Product docs: `docs/yukta/`. The product
> contract: `MANIFESTO.md` at the repo root. The rules for every number:
> `docs/yukta/engineering/energy-spec.md` (v1) and `recovery-spec.md` (v1.1). The evidence for
> every claim: `docs/yukta/strategy/science-evidence.md`.
> **Yukta** (युक्त, "balanced, moderate"; Bhagavad Gita 6.17) is the chosen name, pending
> availability checks. Its meaning is in `docs/yukta/strategy/naming.md`.

## Stack

- **Language**: Swift 5.9 language mode, iOS 17.0+, iPhone (iPad later)
- **Project management**: XcodeGen (`project.yml` → `Yukta.xcodeproj`, gitignored)
- **UI**: SwiftUI, MVVM with `@Observable`, Swift Charts
- **Data**: HealthKit (reads; writes only the user's own quick-adds and weigh-ins), App Group JSON
  cache excluded from backup
- **Widgets**: WidgetKit extension `YuktaWidgets` (not added yet)
- **AI**: Apple Foundation Models on iOS 26+, off by default, behind `InsightProvider`
- **Purchases**: StoreKit 2 consumable tips only
- **Dependencies**: none. No analytics, crash reporting or ad SDKs, ever (manifesto rule 7)

## Commands

```bash
make setup     # install xcodegen, copy xcconfig templates, generate Yukta.xcodeproj
make generate  # regenerate after editing project.yml or adding files
make test-kit  # YuktaKit tests (swift test), no simulator; also runs on Linux CI
make clean

xcodebuild -scheme Yukta -destination 'platform=iOS Simulator,name=iPhone 17' build
```

## Where code goes

```
Yukta/
├── App/            # @main entry, dependency wiring
├── Features/       # one folder per screen: <Name>View.swift + <Name>ViewModel.swift
├── Core/           # Health, Store, Background, Insights, Export, Support (see the blueprint)
├── Design/         # tokens
└── Resources/      # Assets.xcassets, Localizable.xcstrings
YuktaKit/         # every formula and guardrail: no dependencies, every number lives here
```

## Rules

- **Every trend, estimate, target, lever and guardrail comes from YuktaKit.** The app adapts
  HealthKit samples into Kit types and renders results; it never computes them.
- **Guardrails can't be bypassed by the UI**: floor, rate cap, under-18 and BMI rules are Kit
  functions with tests (manifesto rule 11).
- **A formula change starts in the spec**: bump its version, update `YuktaSpec`, regenerate
  `apps/yukta/spec/fixtures/`, then change the code.
- **A new claim or target starts in `science-evidence.md`** with its source and strength (rule 10).
- **Copy:** no "good/bad food", "cheat", "guilt" or medical words; estimates always as ranges.
- **HealthKit can't report read denial.** One empty state covers "denied" and "no data"; never
  nag for permission.
- **No network code in the app** in v1. AI is on-device; tips go through StoreKit.
- **Notifications:** none in v1. Don't request notification permission.
- **No personal data in fixtures, previews, screenshots or logs.** Use `FixtureSource`.
- **Never hand-edit `Yukta.xcodeproj`**, and never put `DEVELOPMENT_TEAM` in `project.yml`
  (public repo); it lives in the gitignored `Configs/*.xcconfig`.
- **Bundle ids follow the nomadapps format:** `com.alleviatelab.<app>` (store build) and
  `com.alleviatelab.<app>.local` with display name "<App> Local" (Debug, installs beside the store
  app). For Yukta: `com.alleviatelab.yukta` and `com.alleviatelab.yukta.local`. Register only after the
  name checks pass; the id is permanent once registered. Unlike pensar, the Release `DEVELOPMENT_TEAM` stays in the
  gitignored xcconfig, because this repo will be public.
- **Dogfood device:** Shirish's iPhone 17 (Apple Intelligence: yes; iOS 27 Core Advanced model: no).

## Before the first TestFlight build

Work through [docs/portfolio/engineering/ios-release-checklist.md](../../../docs/portfolio/engineering/ios-release-checklist.md).
