# Competitor review: Google Health

Reviewed 19 November 2026 from the iPhone app (Premium) and published coverage. Google Health
replaced the Fitbit app on 19 May 2026. The visual version is the board
[`design/yukta/Research-GoogleHealth.dc.html`](../../../design/yukta/Research-GoogleHealth.dc.html).

**Verdict: it shows about twenty numbers and answers no question.** The target user (losing
weight, iPhone, Fitbit Air) wants to know whether they are on track and what to change. The app
never connects weight, intake and expenditure, and it steers people toward its paid AI coach.

## What users say

- **Cluttered and AI-first.** Reviewers call it busier and more cluttered than the Fitbit app;
  much of the home screen is AI commentary, and the biggest button is the coach.
- **Lost features and data.** Badges, Sleep Profile, groups and the community feed were removed.
  Users reported missing HRV, resting heart rate, blood oxygen and skin temperature after 5.12
  (Google confirmed a bug). Tiles are compact and sleep can't be pinned large.
- **The coach is paid and poorly reviewed.** Premium is $9.99/month. Android Authority called the
  paid tier "a net negative"; others report loops and mistakes. iOS reviewers say it's easy to tap
  "Premium" by accident.
- **Split ratings.** About 4.5 on the App Store (mostly years of Fitbit-era ratings) against about
  3.65 on Google Play. Google published a 39-item fix roadmap; version 5.02 was well received,
  with the refrain "nobody wants the AI coach".

## Findings

| # | Screen | Finding | Severity |
|---|--------|---------|----------|
| 1 | Home | Weight, energy burned and intake sit on separate cards and never meet | High |
| 2 | Home | Wrist calorie estimate shown as exact ("3.155 cal", a decimal separator that reads as three calories), labelled "cal", celebrated with "Goal met" | High |
| 3 | Home | "No data" cards with no action | Medium |
| 4 | Home | "Vitals 5 of 5 · In range" takes a large card and never says which five | Medium |
| 5 | Home | "X kg above goal" over a one-dot chart: distance, not trend or rate | Medium |
| 6 | Home | The coach button floats over content on every screen | Medium |
| 7 | Home | The header carries "Premium" instead of navigation | Low |
| 8 | Sleep | "Out of range" verdicts never show the range | High |
| 9 | Sleep | REM judged "above range", something no one can act on, while a short night gets equal weight | High |
| 10 | Sleep | Colour carries meaning differently per card; the same 7-day axis repeats four times | Medium |
| 11 | Sleep quality | Read-only bars with slider thumbs look draggable | Medium |
| 12 | Sleep quality | Four verdicts with no "so what" | Medium |
| 13 | AI narrative | A night under 5 hours is called "solid" because stage percentages look fine | High |
| 14 | AI narrative | Ends with an engagement question instead of advice | Medium |
| 15 | Weekly insight | "Gives your joints maximum time to rebuild", with no evidence | High |
| 16 | Weekly insight | "Poor" in red and "Goal not met" grade the person | Medium |
| 17 | Weekly insight | Two AI entry points ("Reply", "Ask coach") | Medium |
| G1 | Sleep stages | Keep: stage timeline with bed and wake times | Keep |
| G2 | Weekly insight | Keep: a behaviour (late bedtimes over two weeks) and one small change (15 minutes earlier) | Keep |

**Patterns:** built for coach engagement; everything shown, nothing connected; precision theatre
(unreliable numbers look exact, verdicts have no basis); empty states that end the road.

## What Yukta does instead

| Google Health | Yukta |
|---------------|-------|
| Weight, burned and intake apart (1) | One weekly answer: trend rate vs goal, intake vs target, expenditure learned from your own data |
| Watch calories as exact, with badges (2) | No watch "calories burned"; expenditure as a range, in kcal, formatted for the region, never celebrated |
| "No data" dead ends (3) | Every empty state has one action ("No intake yet. Quick add, or connect a food logger.") |
| Verdicts with no range; REM judged (8, 9) | Every verdict shows its target; sleep stages are never graded |
| Bedtime was the best insight (G2) | **Proposed:** add bedtime to the v1 sleep lever (timing, not only hours) |
| Floating coach, two AI entry points, closing questions (6, 14, 17) | AI is one inline card, off by default, never floating, never ending in a question |
| "Poor", "Goal not met", "X kg above goal" (5, 16) | Descriptive words; weight as trend and rate |
| Unsourced claims (15) | Every "Why it matters" claim cites its study and strength |

## Sources

- Google Health Help Center, changes in the app: https://support.google.com/googlehealth/answer/17068213?hl=en
- TechRadar, "unbelievably bad": https://www.techradar.com/health-fitness/fitness-apps/google-health-is-getting-heat-for-being-unbelievably-bad-after-replacing-the-fitbit-app-but-google-says-fixes-are-coming
- TechRadar, 5.02 update: https://techradar.com/health-fitness/fitness-apps/new-google-health-5-02-update-gets-praise-from-fitbit-fans-for-being-solid-work-but-some-still-say-that-nobody-wants-the-ai-coach
- Kotaku: https://kotaku.com/google-fitbit-app-health-new-update-ai-filled-version-and-everybody-is-mad-2000699806
- Android Authority, Premium not worth it: https://www.androidauthority.com/google-health-premium-not-worth-it-3685642/
- Android Authority, missing vitals: https://androidauthority.com/google-health-missing-vitals-fitbit-3733781, https://androidauthority.com/google-confirms-health-missing-vitals-bug-3734221
- 9to5Google, roadmap: https://9to5google.com/2026/05/27/google-health-roadmap-fitbit-backlash/
- PiunikaWeb, backlash: https://piunikaweb.com/2026/05/25/google-health-app-fitbit-backlash-missing-features-ui-changes/
- Shopifreaks, fixes: https://www.shopifreaks.com/google-promises-sweeping-fixes-to-google-health-app-after-flood-of-complaints-from-former-fitbit-users/
- Unstar, review analysis: https://unstar.app/blog/fitbit-app-google-health-switch-sleep-sync-reviews-2026
- Engadget, Fitbit Air review: https://www.engadget.com/2180910/fitbit-air-review-google-health-ai-coach-testing/
- David Imel, Fitbit Air: https://www.davidimel.com/newsletter/the-fitbit-air-is-a-terrible-wonderful-product/
- Wearable calorie accuracy, Germini et al. 2022: https://www.jmir.org/2022/1/e30791

Several articles could not be opened from the session that wrote this; their points come from
search-result excerpts.
