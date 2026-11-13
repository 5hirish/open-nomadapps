# docs

Every decision behind open-nomadapps, written so a stranger can follow it.

## Where the decisions are

| What | File |
|------|------|
| The values, as rules | [MANIFESTO.md](../MANIFESTO.md) |
| Why the repo exists, every decision so far, what's ruled out, lessons from openGym and Fud AI | [portfolio/strategy/portfolio-strategy.md](portfolio/strategy/portfolio-strategy.md) |
| The first app (**Yukta**): scope, positioning, metrics, risks, open questions | [yukta/strategy/product-blueprint.md](yukta/strategy/product-blueprint.md) |
| The evidence behind every lever and guardrail, with strength ratings | [yukta/strategy/science-evidence.md](yukta/strategy/science-evidence.md) |
| Energy engine: weight trend, expenditure, targets, guardrails, levers | [yukta/engineering/energy-spec.md](yukta/engineering/energy-spec.md) |
| Recovery pillar (v1.1) | [yukta/engineering/recovery-spec.md](yukta/engineering/recovery-spec.md) |
| Screens, copy rules and the Claude Design prompt | [yukta/design/design-brief.md](yukta/design/design-brief.md) |
| Architecture, HealthKit types, build order | [yukta/engineering/engineering-blueprint.md](yukta/engineering/engineering-blueprint.md) |
| The name: what Yukta means, Bhagavad Gita 6.16–6.17, Charaka Samhita | [yukta/strategy/naming.md](yukta/strategy/naming.md) |
| Launch plan | [yukta/gtm/launch-plan.md](yukta/gtm/launch-plan.md) |

## Not verified yet

- The iOS skeleton in `apps/yukta/ios/` has not been built: the session that wrote it had no
  Xcode or Swift toolchain. The first `make setup` and `make test-kit` on a Mac is its first compile.
  The Linux CI job runs the YuktaKit tests only when files under `apps/yukta/` change.
