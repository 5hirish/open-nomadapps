# open-nomadapps manifesto

Simple apps that do one job well. Free, open source, and yours.

## The rules

1. **Free. No paywall, ever.** Every feature works without paying. Donations are welcome
   and live in one place (Settings › Support), never in a prompt.
2. **No subscriptions, no ads, no account.** Nothing to sign up for, nothing to cancel.
3. **No gimmicks.** No streak guilt, no fake urgency, no confirm-shaming, no review nags,
   no badges for opening the app, no dark patterns. If a pattern exists to drive
   engagement rather than deliver value, it does not ship.
4. **Quiet by default.** No notifications unless you turn them on, one type at a time.
   Widgets do the work.
5. **AI is optional, and it can be off for good.** Every app is fully useful with AI
   disabled. With AI off, no AI UI shows and no AI request leaves the device.
6. **AI runs on your device.** AI features use the model on your phone. If another way in
   is ever added (your own API key, a hosted option), it is optional, it is never a
   subscription, and it is never the only way to reach a feature.
7. **Your data stays yours.** It lives on your device and in your phone's health store.
   No telemetry, no analytics SDKs, no tracking. Export everything in open formats
   (JSON/CSV), anytime.
8. **Easy to arrive, easy to leave.** Import from the paid apps we replace, and write what
   you enter back to the platform store so other apps can use it. Exports are complete.
9. **Open source.** Apps are AGPL-3.0; shared building blocks are MIT. The roadmap and the
   decisions behind it are public.
10. **Evidence, not hype.** Every recommendation is simple, proven and cited, with how strong
    the evidence is. We don't measure or claim what consumer devices can't (no "hormone
    balancing", no "metabolism boosting"). Estimates are shown as ranges, never as exact.
11. **Safe by design.** Health guidance has guardrails built in (safe rates, floors, no
    deficits for minors), no moralising language about food or bodies, and a way to hide the
    numbers. Wellness, never diagnosis.

## How we use this

Every feature request and pull request is checked against these rules. A feature that
breaks one does not ship, however useful it looks. The pull request template has the
checklist, and the `manifesto-check` skill in `.claude/skills/` runs the same review.
