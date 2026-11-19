# Competitor review: Gentler Streak

Reviewed 19 November 2026 from its App Store listing (Spanish screenshots, translated), its
developer docs and published reviews. The visual version is the board
[`design/yukta/Research-GentlerStreak.dc.html`](../../../design/yukta/Research-GentlerStreak.dc.html).

**Verdict: it gets the values right and the claims wrong.** Of all competitors it is closest to
Yukta's values (on-device, kind, personal ranges), so it is the one to beat. But its copy praises
and promises more than the data supports, its guidance is paid, it is built around Apple Watch,
and it doesn't touch food or weight.

## Facts

- **Price:** Premium $8.99/month or $59.99/year (free trial), or $179.99 lifetime (developer docs).
  Third-party sites list other prices by region and date.
- **Premium includes:** 10- and 30-day Activity Path views, Go Gentler workout suggestions, full
  wellbeing metrics, full sleep analysis, extended charts, manual workout logging, RPE entry.
- **Privacy:** all training analysis on the device; no cloud storage, accounts, or data shared
  with AI models or ad platforms (developer docs).
- **Platforms:** iPhone and Apple Watch only; no Android version found.
- **Activity Path:** a daily activity range from recent workouts (intensity, duration, frequency),
  recovery, and a manual status (active, on a break, sick, injured). The green band is the target;
  the lower edge signals under-training, the upper edge over-training risk.
- **Awards:** App of the Year and Apple Design Award, per its App Store listing.
- **Known limits:** the developer says sparse heart-rate data makes the path less accurate, and
  added a "What's Activity Path" button because people didn't understand it. A reviewer asked for
  workout editing.

## Findings

| # | Screen | Finding | Severity |
|---|--------|---------|----------|
| G1 | Today | Keep: the Activity Path, a range from your own history with your line through it | Keep |
| 1 | Today | Cheerleading as fact: "It probably improved your mood and raised your energy", after every workout | High |
| 2 | Today | The mascot takes about a third of the screen; data sits below the fold | Medium |
| 3 | Today | The guidance itself (Go Gentler, longer views, full sleep) is Premium | Medium |
| G2 | Health | Keep: "Normal" judged against your own range, word plus colour | Keep |
| 4 | Health | A self-reported mood becomes a headline ("You're feeling great today") plus a pep talk; half the screen is a face | Medium |
| G3 | Sleep | Keep: "As usual", "Later than usual" for bedtime and wake time | Keep |
| 5 | Sleep | "Enough restorative sleep for physical recovery and mental clarity" goes beyond what a sensor shows | Medium |
| G4 | Steps | Keep: "More than a typical Sunday", a same-weekday baseline | Keep |
| 6 | Workout | Watch calories shown as burger and fries equivalents: "earn your food" framing | High |
| 7 | Workout | VO₂ max, zones, splits, cadence and power on one screen: a runner's dashboard in a gentle app | Medium |
| 8 | Cross-cutting | "You're perfectly meeting your body's needs" and "You're being productive": false precision and a moral score | High |
| 9 | Cross-cutting | Verdicts ("You can take it easy") never name their inputs | Medium |
| 10 | Cross-cutting | Watch-first: weaker results with sparse heart rate, manual logging paid, nothing on food or weight | Medium |

## What Yukta takes, and what it avoids

| Gentler Streak | Yukta |
|----------------|-------|
| **Take:** the Activity Path band (G1) | **Proposed:** a pace band on the weight chart, the range the goal rate allows, with the trend line through it |
| **Take:** "As usual", "later than usual" (G3) | **Proposed:** the bedtime lever's wording ("Bedtime 2 h later than usual") |
| **Take:** "More than a typical Sunday" (G4) | **Proposed:** a same-weekday baseline for the steps lever (energy spec change) |
| **Take:** your normal, word plus colour (G2) | Already in the spec; keep it consistent everywhere |
| **Avoid:** cheerleading and benefits as fact (1, 5, 8) | State what happened and its evidence; no claims about mood, energy or "your body's needs" |
| **Avoid:** food equivalents (6) | Never convert burn into food; never show watch calories as calories out |
| **Avoid:** mascot-first layouts, a runner's dashboard (2, 4, 7) | The answer above the fold, one audience, detail one tap deeper |
| **Avoid:** paid guidance and manual logging (3, 10) | Everything free, full value without an Apple Watch |

The three **Proposed** rows are not yet in the specs or the prototype.

## Sources

- gentler.app (could not be loaded from the session that wrote this; content from search results): https://gentler.app/
- What is the Activity Path?: https://docs.gentler.app/understanding-your-activity-path/what-is-the-activity-path
- Premium membership details: https://docs.gentler.app/managing-your-subscription-account/view-your-gentler-streak-premium-membership-details
- Non-recorded steps release: https://docs.gentler.app/release-notes-and-announcements/gentler-streak-adds-non-recorded-steps-tracking-for-a-more-c
- iOS 26 update: https://docs.gentler.app/release-notes-and-announcements/gentler-stories-black-friday-cyber-monday-offers
- App Store listing: https://apps.apple.com/us/app/gentler-streak-fitness-tracker/id1576857102
- Health App Insider review: https://www.healthappinsider.com/en/reviews/gentler-streak-review
- Lifestack review: https://lifestack.ai/blog/gentler-streak
- HRV Zone: https://hrvzone.com/apps/gentler-streak
- Fitcoin, vs Athlytic: https://www.fitcoin.co/articles/gentler-streak-vs-athlytic
- Wellness Project (a competitor) on Android status: https://wellnessproject.ai/gentler-streak-for-android
