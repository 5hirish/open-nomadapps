# Yukta: launch plan

The goal is reach and reputation, not revenue (see
[../../portfolio/strategy/portfolio-strategy.md](../../portfolio/strategy/portfolio-strategy.md)).
The story people share: **your watch is wrong about calories. A free, open-source app that works
out what you really burn from your own scale and food log, and tells you which proven lever is
off. No subscription, no account, nothing leaves your phone.**

## Messaging

- **Headline (placeholder until the store name exists):** What you really burn, from your own data.
- **Subhead:** Free, open-source, science-backed energy balance for iPhone. No account, no
  subscription, no hype.
- **Proof points:**
  - Wrist wearables misjudge calories burned by 20–30% or more; this app doesn't use that number.
  - Every recommendation cites its study and how strong the evidence is.
  - Works with the food logger and scale you already use, through Apple Health.
  - Zero dependencies, zero analytics, AI on the device and off by default.
- **Avoid:** medical claims, before/after body photos, "lose X kg in Y weeks", attacking
  competitors by name in the listing.

## App Store listing

- **Category:** Health & Fitness.
- **Screenshots** (real app, fixture data): This week; expenditure with range ("learned from your
  data"); lever detail with the evidence; quick-add; privacy ("Data Not Collected").
- **Description** leads with the three promises (free, evidence-based, private), then features,
  then the guardrails.
- **Keywords** to research before submission (calorie deficit, TDEE, macro, weight trend,
  MacroFactor alternative, Fitbit, Apple Health); check them with App Store search.

## Phases

### Before launch (build in public)

- Repo public once the manifesto and evidence register are in, so the history is part of the story.
- One short post a week (X and LinkedIn): a decision, a Claude Design screen, a piece of evidence
  ("why we ignore your watch's calories").
- Public TestFlight once This week works on real data; collect 12+ testers for Android later.

### Launch week

| Channel | Angle | Notes |
|---------|-------|-------|
| Show HN | "Open-source, evidence-cited energy balance for iPhone (a free MacroFactor-style estimate)" | Link the repo; be in the comments all day |
| Product Hunt | Free alternative to paid calorie coaches | Different day from Show HN |
| r/QuantifiedSelf | The method and the 4-week validation on real data | Follow self-promotion rules |
| r/loseit, r/fitness | Only where rules allow app posts; lead with the evidence write-up, not the app | Check rules first |
| r/fitbit | Fitbit Air on iPhone: what you can and can't get through Apple Health | Check rules |
| r/iOSProgramming | Zero dependencies, HealthKit read/write, Foundation Models, guardrails as tested code | Engineering story |
| LinkedIn | The PM story: manifesto, evidence register, building with Claude Code | Shirish's audience |

### After launch

- Publish the dogfood validation (estimate vs actual trend), good or bad.
- Monthly GitHub Releases notes.
- v1.1 launch beat: the recovery pillar.
- Retrospective at 90 days against the product blueprint's metrics.

## Assets checklist

- [ ] Store name and icon
- [ ] Landing page (GitHub Pages) with the privacy policy and the evidence register
- [ ] 5 screenshots per device size from fixture scenes
- [ ] 20-second recording: This week, quick-add, lever detail
- [ ] README hero image
- [ ] Show HN / Product Hunt drafts
- [ ] "Your watch is wrong about calories" explainer post
