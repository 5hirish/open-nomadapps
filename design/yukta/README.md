# Yukta: design canvas

**Source:** the private "Yukta Prototype" design canvas (owner Shirish Kadam),
<https://claude.ai/artifact/JZAfyqfwzVq3j6rzRRDNf2>. Built from
[docs/yukta/design/design-brief.md](../../docs/yukta/design/design-brief.md) with no design system:
native iOS look, system fonts. **Last pulled:** 19 November 2026.

| File | What it is |
|------|------------|
| `canvas.json` | Layout of the three boards |
| `Main.dc.html` | **Interactive iPhone prototype** (390×844). This week, Quick add, Weigh in, the Sleep lever with its evidence, and About (Bhagavad Gītā 6.17) |
| `Research-GoogleHealth.dc.html` | UX critique of Google Health, the Fitbit app's successor: 5 annotated screens, 17 problems, 2 keepers, what Yukta does instead |
| `Research-GentlerStreak.dc.html` | UX critique of Gentler Streak: 5 annotated screens, 10 problems, 4 keepers, what Yukta takes and avoids |

The written versions of both reviews, with full source links, are in
[docs/yukta/strategy/](../../docs/yukta/strategy/).

## Prototype tweaks

The prototype's Tweaks panel switches:

- **Scenario:** `on-track`, `sleep-off` (behind, sleep off; the default), `learning` (day 9)
- **Hide numbers** mode
- **Dark** mode
- **Hunger rating** (on in the prototype so it can be seen; off by default in the app)

## Provenance and rules

- **All data is synthetic** (about 80 kg, losing 0.5% a week, 2,000 kcal target, 130 g protein).
  The research boards are schematic redraws of competitor screens with personal values replaced
  by placeholders such as `[time]`. No screenshots are committed.
- **The boards need the canvas runtime.** Each `.dc.html` loads `./support.js`, which the design
  canvas serves and this repo does not include, so the files don't render when opened straight
  from disk. Open them through the canvas link above; the files here are the reviewable source.
- **The canvas is upstream.** Don't hand-edit these files without publishing the change back to
  the canvas, or the two drift.
