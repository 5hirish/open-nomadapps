# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this monorepo.

**open-nomadapps** is the free, open-source sibling of the private `nomadapps` repo (paid apps).
It exists for fun, as a hobby, and to show Shirish's product and engineering work in public.
Revenue is not a goal. Read [MANIFESTO.md](MANIFESTO.md) before any product, design or code
change: a change that breaks a rule there does not ship.

## Development Progress

| App | Priority | Status | Platforms | Published |
|-----|----------|--------|-----------|-----------|
| **Yukta** (folder `yukta`) | P0 | Spec + Claude Design prototype | iOS first, Android later | None |

### App Identification Rules

1. **Explicit mention**: app name or platform in the prompt → use that app.
2. **Tech signal**: calories, energy balance, weight trend, expenditure/TDEE, protein, HealthKit,
   Health Connect, sleep, HRV, recovery, readiness, wearable, Fitbit, Apple Watch → **Yukta**.
3. **Only one app exists today**, so with no signal assume **Yukta**.
4. **The paid apps (maxaura, pensar, habitpond) live in the private `nomadapps` repo.** Never
   copy their code, prompts, assets or docs here without Shirish saying so: this repo is public
   and AGPL.
5. **Still unsure** → ask before continuing.

## Monorepo Structure

```
open-nomadapps/
├── MANIFESTO.md                # the rules every change is checked against
├── docs/                       # Product docs organized by app and discipline
│   ├── <app-name>/
│   │   ├── strategy/           # Product intent, positioning, scope, metrics
│   │   ├── design/             # Written UX spec: flows, states, copy rules
│   │   ├── engineering/        # Architecture, data, algorithms
│   │   └── gtm/                # Launch, listing, community
│   └── portfolio/              # Cross-app strategy and engineering conventions
├── design/                     # Claude Design canvases per app (.dc.html artboards)
│   └── <app-name>/             # created when an app gets its first canvas
├── apps/
│   └── <app-name>/
│       ├── ios/                # SwiftUI app (XcodeGen) + <App>Kit domain package
│       ├── android/            # Kotlin + Compose app, added after iOS ships
│       └── spec/               # platform-neutral rules + golden fixtures both apps must pass
└── scripts/                    # Repo-wide helper scripts
```

> Each app is self-contained. There is no monorepo build tooling. iOS and Android are
> separate native apps that agree through `spec/`, not through shared code.

## Apps at a Glance

| App | Stack | Per-app CLAUDE.md |
|-----|-------|-------------------|
| **Yukta** | iOS Swift + SwiftUI + HealthKit + WidgetKit, zero third-party dependencies | `apps/yukta/ios/CLAUDE.md` |

## Non-negotiables (from the manifesto, in engineering terms)

- **No analytics, crash-reporting or ad SDKs.** App Store Connect and Play Console analytics are
  the only product data. Do not add PostHog, Mixpanel, Firebase, Sentry or similar.
- **No accounts and no backend.** Nothing the app needs runs on a server we operate.
- **No network calls with AI off.** AI is on-device (Apple Foundation Models on iOS 26+), off
  by default, and hidden entirely when off or unavailable.
- **Notifications are off by default**, opt-in per type, and v1 ships none.
- **Every feature works without AI and without paying.** Tips are a Settings row and nothing else.
- **Every health claim, target and formula cites its evidence** in `docs/<app>/strategy/science-evidence.md`
  (manifesto rule 10). Estimates are shown as ranges. Never claim hormone, metabolism or detox effects.
- **Guardrails are code, not copy** (rule 11): calorie floors, loss-rate caps and the no-deficit rules for
  minors and low BMI live in the Kit and are tested.
- **Health data never goes to iCloud or any server.** Cached values are derived from the health
  store, disposable, and excluded from backups.
- **Prefer zero dependencies.** A new package needs a reason in the PR description.

## Documentation Lookup (Planning / Inference)

When asked to plan features, infer product requirements, or make strategy/design/engineering
decisions, consult in this order:

1. `MANIFESTO.md`: what may not ship, whatever the request
2. `docs/<target-app>/strategy/`: product intent and priorities
3. `docs/<target-app>/design/`: UX behaviour and interaction constraints (written spec)
4. `design/<target-app>/`: the rendered artboards that spec describes (`.dc.html`); read
   its `README.md` and `canvas.json` first, then open the relevant board before changing UI
5. `docs/<target-app>/engineering/`: technical constraints and implementation details
6. `docs/<target-app>/gtm/`: audience, positioning, launch and messaging context

For cross-app decisions, use `docs/portfolio/`.

If app-specific docs are missing, state assumptions explicitly and prefer existing code
conventions in `apps/<target-app>/`.

### Design canvases

`docs/<app>/design/` is the written spec; `design/<app>/` holds the Claude Design artboards
it describes. See `design/README.md` for the convention. Syncing runs through the
`DesignSync` tool via `/design-sync`, which needs `/design-login` run once from an
interactive session on this machine.

## Commands by Stack

### iOS Swift app (Yukta): run from apps/yukta/ios/

```bash
make setup         # First-time: install xcodegen, copy config templates, generate project
make generate      # Regenerate Yukta.xcodeproj from project.yml
make test-kit      # Domain + scoring tests (YuktaKit), no simulator; also runs on Linux
make clean         # Remove DerivedData and .build
```

> **Never hand-edit `Yukta.xcodeproj`.** It is generated by XcodeGen from `project.yml`.

## Shipping an iOS app

Before any app's first TestFlight build and again before App Review, go through
[docs/portfolio/engineering/ios-release-checklist.md](docs/portfolio/engineering/ios-release-checklist.md).
A TestFlight bug is fixed only once a Release build on a real phone shows it working.
CI, the simulator and Debug builds don't prove it.

## Seeing the iOS apps (screenshots for UI work)

Shirish's MacBook has **8 GB RAM**, so the default is the **physical iPhone**, not the
simulator.

- **Screenshot:** `scripts/ios-screenshot.sh out.png` (pymobiledevice3, WiFi or USB).
- **It needs a root daemon an agent can't start.** If the script exits 2, *stop and ask
  Shirish* to run `sudo pymobiledevice3 remote tunneld` and keep it open. Don't fall back
  to booting a simulator silently.
- **Fixture screens:** apps render any screen from fixture data in Debug builds (no Health
  permission needed), so a screenshot never depends on whose data is on the phone.
- **Compare against the design:** prototype PNGs live in `design/<app>/screenshots/`.
- **Simulator only when a flow must be driven end to end**, with Xcode closed. Expect ~1.5–2 GB.

## Environment Configuration

Each app manages its own config. Nothing in this repo is secret, but signing identity is
personal, so it stays out of git:

| App | Config mechanism |
|-----|-----------------|
| Yukta | `apps/yukta/ios/Configs/Debug.xcconfig` / `Release.xcconfig` (from templates, gitignored). `DEVELOPMENT_TEAM` goes there, never in `project.yml` |

## Open-source hygiene

- **Never commit** a Team ID, provisioning profile, `.p8`/`.p12`, App Store Connect key or any
  personal health export. Fixtures are synthetic or explicitly consented and anonymised.
- **Public by default:** decisions go in `docs/`, not in chat. Write them so a stranger can follow.
- **Contributions need the CLA** (see `CONTRIBUTING.md`) so the apps can ship on the App Store
  under AGPL.

## Adding a New App

1. Write `docs/<app>/strategy/product-blueprint.md` and check it against the manifesto.
2. Prototype in Claude Design; sync into `design/<app>/`.
3. Scaffold `apps/<app>/ios/` with XcodeGen (`project.yml`) and an `<App>Kit` package for the
   domain, copying `apps/yukta/ios/` conventions. Add `apps/<app>/spec/` if Android follows.
4. Add a row to the tables in this file and in `README.md`.

@ASC.md
