# design/

Claude Design canvases, organised per app: the visual counterpart to `docs/`.

`docs/<app>/design/` holds **written** design specs (prose: flows, rules, rationale).
`design/<app>/` holds the **rendered** artboards those specs describe: `.dc.html` files
authored in [Claude Design](https://claude.ai/design) and synced back here so they live next to
the code and move with it in git. Same convention as the `nomadapps` repo.

## Layout

```
design/
├── README.md              # this file: the convention
└── <app>/                 # one folder per app, created when that app gets its first canvas
    ├── README.md          # what the boards are, the project link, and where their data lives
    ├── canvas.json        # artboard layout: file, title, x/y/w/h
    ├── <Name>.dc.html     # one self-contained artboard per screen or scene
    ├── support.js         # dc-runtime, generated, never hand-edit
    ├── handoff/           # tokens.json + the designer's handoff notes, if exported
    └── screenshots/       # baseline PNGs the native app is compared against
```

Per-app folders are created on demand. An app with no canvas yet has no folder; don't scaffold
empty ones. The first canvas for **Yukta** starts from the prompt in
[docs/yukta/design/design-brief.md](../docs/yukta/design/design-brief.md).

## Conventions

- **One `.dc.html` per board.** Self-contained and openable straight in a browser over HTTP.
- **`canvas.json` owns layout**, not the boards. It lists each artboard's `file`, `title` and
  `x`/`y`/`w`/`h`. Titles carry ordering (`0 · …`, `1 · …`).
- **Every board's README records provenance**: the Claude Design project link, the date last
  pulled, which assets are passed in rather than committed, and which file is the source of
  truth for any numbers shown. Never edit a number on a board that comes from a fixture; change
  the fixture.
- **Fixture data only.** Boards show synthetic health data, never Shirish's or anyone's real
  export. This repo is public.
- **Don't hand-edit a synced board** unless you are pushing the change back. The canvas in
  Claude Design is upstream; local edits drift silently otherwise.

## Syncing

Pull and push happen through the `DesignSync` tool, driven by the `/design-sync` skill.

It needs a one-time authorization: run **`/design-login`** once from an interactive Claude Code
session on this machine. Headless, SDK and non-interactive runs then reuse it. Without it,
`DesignSync` fails immediately and no import is possible.

Claude Code cloud sessions block unpkg.com, which the dc-runtime loads React and Babel from.
If a screenshot harness is added, vendor those files next to it the way `nomadapps` does for
pensar.

## Agents

When doing visual or UX work on an app:

1. Read `MANIFESTO.md`, then `docs/<app>/design/` for the written spec and constraints.
2. Read `design/<app>/README.md` and `canvas.json` for what's actually been drawn.
3. Open the relevant `.dc.html` to see the intended result before changing UI code.

Keep this folder current. If a canvas changes upstream, re-sync it rather than letting the code
and the boards disagree.
