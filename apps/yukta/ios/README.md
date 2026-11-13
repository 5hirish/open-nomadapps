# Yukta (iOS)

## First-time setup (Mac, Xcode 26)

```bash
make setup                       # installs XcodeGen, copies config templates, generates the project
# set DEVELOPMENT_TEAM in Configs/Debug.xcconfig (gitignored)
open Yukta.xcodeproj
```

## Day-to-day

```bash
make generate   # after editing project.yml or adding files
make test-kit   # scoring engine tests, no simulator
make clean
```

Architecture and build order: [docs/yukta/engineering/engineering-blueprint.md](../../../docs/yukta/engineering/engineering-blueprint.md).
