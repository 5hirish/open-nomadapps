---
name: manifesto-check
description: >
  Check a feature idea, spec, design board or code change against MANIFESTO.md before it
  ships. Use when planning a feature, reviewing a pull request or diff, writing a spec or
  design brief, adding a dependency, notification, network call, purchase, AI feature or
  onboarding step, or when asked "does this fit the manifesto", "manifesto check",
  "is this a dark pattern". Reports PASS / FAIL per rule with the evidence.
argument-hint: "<feature description | file path | diff | PR>"
---

# Manifesto check

Read `MANIFESTO.md` at the repo root, then the thing under review. For a diff, read every
changed file, not only the summary.

## For each of the eleven rules

Give **PASS**, **FAIL** or **N/A**, with one line of evidence (a file and line, a screen, a
sentence from the spec). Look for these concrete signals:

| Rule | FAIL signals |
|------|--------------|
| 1 No paywall | a feature gated on a purchase, "Pro", "unlock", a trial, a price shown outside Settings › Support |
| 2 No sub/ads/account | StoreKit subscription products, ad SDKs, sign-in, email capture |
| 3 No gimmicks | streaks, badges, confetti for opening the app, countdowns, "Are you sure you want to miss out?", `SKStoreReviewController` / `requestReview`, a modal on launch |
| 4 Quiet | `UNUserNotificationCenter` requests or schedules that aren't behind a per-type opt-in that defaults off |
| 5 AI optional | AI on by default, AI UI visible when disabled or unavailable, a feature that fails without AI |
| 6 AI on device | URLSession / HTTP calls to an AI endpoint, API keys, a hosted-AI dependency |
| 7 Data stays yours | analytics/crash SDKs, any network call with user data, health data in CloudKit/iCloud/UserDefaults sync, a cache that isn't excluded from backup, an export that drops fields |
| 8 Arrive/leave | an export format change that loses data, an import that silently drops rows |
| 9 Open source | a new dependency without a reason, a non-AGPL/MIT-compatible license, vendored code without attribution |
| 10 Evidence | a health claim or target with no source in `docs/<app>/strategy/science-evidence.md`, an estimate shown as an exact number, claims about hormones, metabolism or detox |
| 11 Safe by design | a calorie target below the floor, a loss rate above the cap, deficit options for under-18s or low BMI, words like "cheat", "bad food", "guilt", no way to hide numbers |

## Output

1. A table: rule, verdict, evidence.
2. For every FAIL: the smallest change that turns it into a PASS while keeping the user value.
3. A one-line verdict: **Ships**, **Ships after fixes**, or **Doesn't ship**.

Don't soften a FAIL because the feature is useful. The manifesto exists for exactly that case.
