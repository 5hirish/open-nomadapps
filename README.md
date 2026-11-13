# open-nomadapps

Simple apps that do one job well. Free, open source, and yours.

No subscriptions, no ads, no account, no tracking, no hype. Your data stays on your phone. AI is
optional, runs on your device, and can be switched off for good. Read the
[manifesto](MANIFESTO.md): every feature is checked against it.

## Apps

| App | What it does | Platforms | Status |
|-----|--------------|-----------|--------|
| **[Yukta](docs/yukta/strategy/naming.md)** (युक्त, "balanced") | Science-backed energy balance: your real expenditure from your own weight trend and intake, plus the levers that make a deficit work (sleep, protein, strength, steps) | iOS first, Android later | Spec and prototype |

> *Yukta* (युक्त): balanced, moderate. From Bhagavad Gītā 6.17: "For one who is moderate in eating
> and recreation, measured in effort, and regulated in sleep and waking, yoga becomes the remover
> of sorrow." [Why this name](docs/yukta/strategy/naming.md)

Every decision so far is indexed in [docs/README.md](docs/README.md).

## Structure

```
apps/        # One folder per app: ios/, android/ (later) and spec/ (shared scoring rules + fixtures)
docs/        # Product docs per app: strategy, design, engineering, gtm
design/      # Claude Design canvases per app (.dc.html), created with an app's first canvas
scripts/     # Repo-wide helper scripts
```

## Getting started

Each app has its own `CLAUDE.md` with setup instructions. See `apps/<app>/`.

**Yukta** (iOS, needs a Mac with Xcode 26):

```bash
cd apps/yukta/ios && make setup
```

## Support the project

Everything here is free. If an app helps you, you can say thanks through
[GitHub Sponsors](https://github.com/sponsors/5hirish). Donations never unlock features.

## License

Apps are [AGPL-3.0](LICENSE). Shared building blocks under `packages/` (none yet) will be
MIT. See [CONTRIBUTING.md](CONTRIBUTING.md) before opening a pull request.

Made by [Shirish Kadam](https://github.com/5hirish).
