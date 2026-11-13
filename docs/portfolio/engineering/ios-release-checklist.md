# iOS release checklist

Run through this before an app's first TestFlight build and again before App Review. The store
and listing items are carried over from what cost maxaura TestFlight round trips in the private
`nomadapps` repo (October 2026); the HealthKit and open-source items are new for this repo.
Firebase, sign-in and subscription items don't apply here: these apps have no backend, no
account and no subscription.

## 1. HealthKit

- **Entitlements:** `com.apple.developer.healthkit` and, for background updates,
  `com.apple.developer.healthkit.background-delivery`. Enable the HealthKit capability on the
  App ID in the developer portal too.
- **Usage strings say exactly what is read, what is written, and why.** Yukta needs both
  `NSHealthShareUsageDescription` (reads) and `NSHealthUpdateUsageDescription` (it writes the
  user's own quick-adds and weigh-ins).
- **Ask only for the types the app uses.** Each one is listed and explained on the permission
  screen. Reviewers check the list against the features.
- **Reads can't tell "denied" from "no data".** HealthKit hides read authorization status, so
  every empty state must cover both cases without blaming the user.
- **Health data stays out of iCloud** (Guideline 5.1.3), out of advertising, and out of any
  server. The cache is excluded from backups.
- **Wellness, not medicine.** No diagnosis or treatment claims in the app, the listing or the
  screenshots. No "lose X kg in Y weeks", no hormone or metabolism claims.
- **Weight-loss guardrails are live in the Release build**: floor, rate cap, no lose mode under
  18 or below BMI 18.5, hide-numbers mode, support link. Review notes mention them.
- **Every claim in the listing is in the evidence register** (`docs/<app>/strategy/science-evidence.md`).
- **Test on a Release build on a real phone with real data** before calling a HealthKit bug
  fixed: background delivery and authorization behave differently in Debug and the simulator.

## 2. Purchases (tip jar only)

- Tips are **consumable** in-app purchases. No subscriptions, no non-consumables that unlock
  features.
- **The Paid Apps Agreement must be active** for any in-app purchase, even a tip. It covers the
  whole account.
- **StoreKit binds products to the bundle id**, so a Debug build with another bundle id can't buy.
  That's expected.
- **Price each tip in every territory** you sell in; `asc` prices only the base territory unless
  told otherwise. Count the result before submitting.
- Tips must not change what the app does. Review notes say so.

## 3. Privacy

- **App Privacy questionnaire: "Data Not Collected".** It must be published by a person in App
  Store Connect; the API can't read it.
- **Privacy policy URL:** `PRIVACY.md` in this repo (a GitHub URL is accepted). It must mention
  health data.
- **Export compliance:** `ITSAppUsesNonExemptEncryption = NO` in `Info.plist` (no custom
  encryption; HTTPS is exempt and v1 makes no network calls anyway).

## 4. App Store listing and review

- **Screenshots must show the real app** (Guideline 2.3.3), captured from fixture scenes, never
  mockups and never personal data. 1320×2868 uploads as `IPHONE_67`; 2064×2752 as
  `IPAD_PRO_3GEN_129`.
- **Review notes** cover: no account needed; how to see the app with no wearable (the
  starting-estimate and "no data" states, or a demo mode if one exists); that tips unlock nothing;
  that AI is on-device and off by default.
- **The app needs a price, even a free app.** Without a price schedule, "Add for Review" fails
  with "You must choose a price tier". Fix: `asc pricing schedule create --free`.
- **Before submitting,** attach the build, set export compliance and run `asc validate`.

## 5. Open source

- **No signing identity in git:** `DEVELOPMENT_TEAM`, profiles and keys live in gitignored
  xcconfigs. Check `git log -p` for leaks before the repo goes public.
- **The binary matches the source.** Tag the commit each App Store build was archived from
  (`yukta-ios-v1.0-build12`).
- **Third-party notices:** if any dependency or model ships, list it with its license.

## 6. The rule behind all of it

Don't call a TestFlight bug fixed on the strength of CI, the simulator or a Debug build. Show it
working in a Release build on a real phone, or say it's unverified.

## Status

| | Yukta |
|---|---|
| App ID + HealthKit capability | todo |
| Bundle id decided | `com.alleviatelab.yukta` + `.local`; register after the name checks |
| Paid Apps Agreement (for tips) | active since 2026-10-21 per nomadapps |
| Privacy policy published | draft (`PRIVACY.md`) |
| Store listing | todo |
