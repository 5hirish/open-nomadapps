#!/bin/bash
# Screenshot a physical iPhone (any open-nomadapps iOS app)
# into a PNG, over WiFi or USB. The phone renders, the Mac only receives the image,
# so it costs no simulator RAM — the point on an 8 GB machine.
#
#   scripts/ios-screenshot.sh out.png [UDID]
#
# Needs pymobiledevice3 (installed: ~/.local/bin) and, for iOS 17+, its tunnel daemon,
# which needs root. An agent can't start it — when this exits 2, ask Shirish to run:
#
#   sudo pymobiledevice3 remote tunneld
#
# and leave that terminal open. pymobiledevice3 can't tap; drive the app yourself
# (devicectl launch, deep links) or ask Shirish to put the screen up.
set -euo pipefail

OUT="${1:?usage: ios-screenshot.sh out.png [UDID]}"
UDID="${2:-}"
TUNNELD="http://127.0.0.1:49151/"

if ! curl -s -m 3 -o /dev/null "$TUNNELD"; then
  echo "pymobiledevice3 tunneld is not running." >&2
  echo "Ask Shirish to run, and keep open:  sudo pymobiledevice3 remote tunneld" >&2
  exit 2
fi

pymobiledevice3 developer dvt screenshot --tunnel "$UDID" "$OUT"
test -s "$OUT" || { echo "No screenshot written — is the phone unlocked and on the same network?" >&2; exit 1; }
echo "$OUT"
