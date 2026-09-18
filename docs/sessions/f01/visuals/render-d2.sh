#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC="$ROOT/sources"
OUT="$ROOT/d2-rendered"
mkdir -p "$OUT"
if ! command -v d2 >/dev/null 2>&1; then
  echo "D2 CLI is required."
  echo "Install: curl -fsSL https://d2lang.com/install.sh | sh -s --"
  exit 1
fi
for file in "$SRC"/*.d2; do
  name="$(basename "$file" .d2)"
  d2 --layout=dagre "$file" "$OUT/$name.svg"
done
