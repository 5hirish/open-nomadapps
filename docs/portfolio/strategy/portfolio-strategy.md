# open-nomadapps: portfolio strategy

The decisions made while planning the repo, 25 October to 13 November 2026, in the order they
were made. Sources are at the end. App-level decisions for **Yukta** are in
[../../yukta/strategy/product-blueprint.md](../../yukta/strategy/product-blueprint.md).

## Why this exists

- **Goal:** fun, a hobby, and promoting Shirish's product and engineering work in public.
  Revenue is not a goal.
- **Product motive:** simple alternatives to paid apps. No bloat, no upsells, no add-on
  features: pure value. Privacy built in, on-device where possible, open and transparent.
- **Content motive:** no-BS, science-backed, simple and proven ways of living healthily.
- **Relationship to `nomadapps`:** that repo holds the paid, closed apps (maxaura, pensar,
  habitpond). This one is free and AGPL. Nothing moves between them without a decision.

## Values (the short list behind MANIFESTO.md)

Shirish's words, from the planning conversation:

- No subscription needed. No account, no ads.
- No paywall (donations welcome).
- No AI required: AI can be disabled completely.
- No gimmicks, tricky UX, paywalls or subscriptions.
- No annoying notifications.
- Open source. Keep your data.
- Just pure value.
- No-BS, science-backed, simple and proven.

Inspired by the values of Fud AI ("No subscription needed, no account, no ads, open source,
bring your own AI, keep your data") and openGym.

## What "success" means here

Self-promotion, not money:

| Signal | Where it comes from |
|--------|---------------------|
| GitHub stars, forks, external contributors | GitHub |
| Downloads, ratings, retention | App Store Connect and Play Console analytics (no SDK in the app) |
| Launch reach | Show HN, Product Hunt, Reddit threads, posts on X and LinkedIn |
| Public write-ups | Build-in-public posts, decision records in `docs/` |

The showcase is the product judgment as much as the code: the manifesto, a public roadmap,
decision records and "how it was built with Claude Code" posts.

## Decisions

| # | Decision | Why | Alternatives rejected |
|---|----------|-----|-----------------------|
| 1 | **Repo name `open-nomadapps`** | Continuity with Shirish's existing work | A separate brand ("Plain …"); still possible per app |
| 2 | **No ads** | Ad SDKs mean App Tracking Transparency prompts, a "Data used to track you" privacy label and an F-Droid anti-feature flag. US banner eCPMs of roughly $0.30 to $2 make the revenue trivial anyway | Banner or interstitial ads |
| 3 | **No subscriptions, ever** | Fud AI added, removed and re-added a paid tier across four releases; each change costs trust | A hosted-AI subscription later |
| 4 | **Not about money** | Fun, hobby, self-promotion | Revenue targets |
| 5 | **AI runs on the device only, off by default, and can be off for good.** We keep the bet on local models even though it's early | Zero running cost, nothing leaves the phone. Apple Foundation Models needs iPhone 15 Pro or later; Gemini Nano's Prompt API is alpha on a list of flagships. So every feature works without AI | Bring-your-own-key as the main path (could return as an option, never required); a hosted AI tier |
| 6 | **Native apps: SwiftUI on iOS, Kotlin + Compose on Android**, agreeing through a shared `spec/` with golden fixtures | Health apps live in the parts that need native code anyway (background health reads, widgets). openGym's single React + Capacitor codebase still needed hand-written Swift and Java for HealthKit, Health Connect, widgets and watches | One Capacitor codebase (openGym's model); Kotlin Multiplatform |
| 7 | **iOS first**, Android later | Shirish's phone; release tooling already exists from nomadapps | Both at launch |
| 8 | **License: AGPL-3.0 for apps, MIT for shared packages, plus a CLA** | AGPL stops closed, ad-filled copies; the CLA keeps the right to ship on the App Store (openGym does the same). MIT packages are free for anyone to reuse | MIT everywhere (Fud AI); MPL-2.0 |
| 9 | **First app: health.** First framed as a readiness/recovery score, then widened (12 November) to **holistic, science-backed healthy living built on energy balance**: calorie deficit plus the levers that decide whether it works (hunger, sleep and stress, muscle mass and activity) | Replaces paid apps directly (MacroFactor's adaptive expenditure, Athlytic, Google Health Premium's AI coaching), uses the same health APIs on both platforms, and complements openGym and Fud AI | Expense tracker; gym logger; calorie tracker with a food database |
| 10 | **Energy balance is v1; the readiness/recovery score is v1.1** | Energy balance needs intake, weight and sleep, which Shirish's setup provides. His Fitbit Air sends no HRV to Apple Health on iPhone, so recovery would be weakest for the dogfooder | Recovery first |
| 11 | **Food intake: read from Apple Health plus a quick-add box.** No food database | Food logging is the hardest, most bloated part, and Fud AI (open source) and others already write nutrition to Apple Health | Building our own logger with barcodes |
| 12 | **Weight: Apple Health plus manual entry** | Works with any smart scale and with none | Scale integrations |
| 13 | **Notifications off by default; v1 ships none** | "No annoying notifications." Widgets carry the value | A morning notification |
| 14 | **Money: free, plus an optional tip jar in Settings and GitHub Sponsors** | Downloads matter more than revenue | Paid upfront (cuts installs); a one-time unlock (a paywall) |
| 15 | **Brainstorm first, then a public repo.** Planning was staged in the private nomadapps repo (13 November), then moved here the same day as **public from the first commit**, so the history is part of the build-in-public story | Shirish's call | A private repo until launch |
| 16 | **Bundle ids use the nomadapps format** (`com.alleviatelab.<app>`, `.local` for Debug), signing identity kept out of git | Consistency with the paid apps and the same Apple team | A personal prefix |
| 17 | **The first app is named Yukta** (युक्त, "balanced, moderate"), from Bhagavad Gita 6.17 | The verse names the app's formula (moderation in eating, activity, sleep) and fits "evidence, not hype"; see `docs/yukta/strategy/naming.md` | "Amruta" (means immortality: a promise the app won't make; crowded name) |

### Still open

- **One-time price.** Shirish raised "free or one-time payment". The manifesto says free with
  tips. If a store price is ever wanted, the honest version is paid on the store and free to
  build from source, and it needs a manifesto change first.
- **Name checks** for the first app, Yukta (App Store, trademarks, domains) before registering `com.alleviatelab.yukta`.

## Ruled out for now

- **Expense tracker with Apple Wallet import.** FinanceKit needs an organization developer
  account (Shirish's is individual), covers only Apple Card, Apple Cash and Apple Savings in the
  US plus UK connected accounts, and has no Android equivalent: Google Wallet offers no
  transaction read API. Cashew (open source, GPL-3.0, still active in 2026) already covers manual
  expense tracking.
- **Gym logger and calorie tracker with a food database.** openGym (21.1k stars) and Fud AI (526
  stars) own those; Yukta reads their data through Apple Health instead.

## Lessons taken from the two reference repos

| | openGym | Fud AI |
|---|---|---|
| Shape | One React 19 + Vite + Capacitor codebase; custom Swift/Java plugins for HealthKit, Health Connect, widgets, watch bridge; native watch apps | Two native apps in one repo (SwiftUI, Kotlin + Compose); parity kept by hand, Android sometimes a release behind |
| Paid AI | None: "free and stays free" | Plus (30 AI actions/day) and Pro (60/day) subscriptions plus credit packs; the paid tier was added (v3.4), removed (v4.1, v5.0) and re-added (v7.0) |
| Worth copying | Imports from the paid apps it replaces (Strong, Hevy, FitNotes); modules that switch whole features off; AGPL + CLA; a weekly-ish release cadence, much of it drafted with Claude Code | Clear value lines on the README; on-device fallbacks; a pinned, checksummed local-model catalog shared by both apps (Gemma 4 E2B via LiteRT-LM) |
| Not copying | A server to self-host | A paid hosted-AI tier; a 15-step onboarding |

## Sources

- openGym: https://github.com/DuarteSantos8/openGym (docs/MOBILE.md, docs/AI_COACH.md, docs/APP_STORES.md)
- Fud AI: https://github.com/apoorvdarshan/fud-ai (RELEASE_NOTES.md, local-models/, workers/)
- FinanceKit eligibility: https://atskills.one/dpearson2699/financekit
- Google Wallet transaction history: https://www.droid-life.com/2026/01/13/google-wallet-transaction-history/
- Cashew: https://dev.co/databases/open-source/cashew
- AdMob eCPM ranges: https://www.monetizemore.com/blog/admob-monetization/
- ML Kit GenAI (Gemini Nano) devices: https://developers.google.com/ml-kit/genai
- Apple Foundation Models: https://www.cultofmac.com/news/apple-foundation-models-framework
- GPL and the App Store (VLC history): https://lwn.net/Articles/396535/
