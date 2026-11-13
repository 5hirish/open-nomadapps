# Contributing

Thanks for looking. These apps stay small on purpose, so the most useful contributions are
bug reports, accuracy findings (a score that looks wrong on your data), accessibility fixes and
translations.

## Before you open a pull request

1. **Read [MANIFESTO.md](MANIFESTO.md).** A change that breaks a rule there won't be merged,
   however useful it is. The pull request template has the checklist.
2. **Open an issue first for anything bigger than a bug fix**, so we can agree on scope before
   you spend time on it.
3. **No new dependencies without a reason** in the pull request description.
4. **No personal health data in fixtures, screenshots or logs.** Use synthetic data.

## Contributor License Agreement

The apps are AGPL-3.0 and also ship on the App Store, whose terms add restrictions the AGPL
does not allow. To keep that legal, contributors sign a CLA that lets the maintainer distribute
their contribution under other terms as well. The CLA bot is not set up yet, so **external pull
requests can't be merged until it is**. Issues and discussion are welcome now.

## Running an app

Each app has setup steps in its own `CLAUDE.md`, for example
[apps/yukta/ios/CLAUDE.md](apps/yukta/ios/CLAUDE.md).

## Licensing of what you contribute

- `apps/**`: AGPL-3.0 (see [LICENSE](LICENSE)).
- `packages/**` (none yet): MIT, so others can reuse the building blocks.
