#!/usr/bin/env bash
# Fetch the upstream sources that assemble.py reads, at the pinned commit, into <dir>.
set -euo pipefail
DIR=${1:?usage: fetch_upstream.sh <dir>}
COMMIT=cb781672b399c6badb5c70e3f73056bcb31012b0
TMP=$(mktemp -d)
git clone -q --filter=blob:none --no-checkout https://github.com/mkaratarakis/mathlib4 "$TMP/fork"
git -C "$TMP/fork" sparse-checkout set --no-cone \
  Mathlib/NumberTheory/Transcendental/GelfondSchneider Mathlib/NumberTheory/NumberField/House.lean
git -C "$TMP/fork" checkout -q "$COMMIT"
mkdir -p "$DIR"
cp "$TMP"/fork/Mathlib/NumberTheory/Transcendental/GelfondSchneider/*.lean "$DIR"/
cp "$TMP/fork/Mathlib/NumberTheory/NumberField/House.lean" "$DIR/House_fork.lean"
echo "fetched into $DIR"
