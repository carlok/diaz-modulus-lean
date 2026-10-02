#!/usr/bin/env bash
# Save the Prove2Me page of every blueprint node that has none in blueprint/cache/ yet.
#
# Read-only: one GET /theorems/<id> per node, through the p2m.sh client of a Prove2Me
# workspace, which reads its own credentials. Each response is saved to a file first and then
# trimmed of `audits` (reviewer names) and `vote_count` (which changes) before it is kept.
#
# Usage: scripts/fetch_blueprint_cache.sh PROVE2ME_WORKSPACE   (the folder that holds p2m.sh)
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
WS="${1:?usage: $0 PROVE2ME_WORKSPACE (the folder that holds p2m.sh)}"
CACHE="$ROOT/blueprint/cache"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

mkdir -p "$CACHE"
python3 "$ROOT/scripts/gen_blueprint.py" --missing > "$TMP/missing.tsv"
while IFS=$'\t' read -r name id; do
  (cd "$WS" && ./p2m.sh GET "/theorems/$id") > "$TMP/page.json"
  python3 - "$TMP/page.json" "$CACHE/$name.json" "$name" <<'PY'
import json, sys
src, dst, name = sys.argv[1:]
page = json.load(open(src))
if page.get("theorem_name") != name:
    sys.exit(f"{name}: unexpected response, not saved")
for key in ("audits", "vote_count"):
    page.pop(key, None)
with open(dst, "w") as f:
    json.dump(page, f, ensure_ascii=False, indent=1)
    f.write("\n")
print(f"saved {name}")
PY
done < "$TMP/missing.tsv"
