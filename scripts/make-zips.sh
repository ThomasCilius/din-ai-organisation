#!/usr/bin/env bash
# Pakker hver afdeling til releases/<afdeling>.zip.
# Zip-roden indeholder afdelingens skill-mapper direkte (SKILL.md + references/),
# så de kan pakkes ud i ~/.claude/skills/ (Claude Code) eller trækkes ud enkeltvis
# til upload i Claude Desktop.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
REL="$ROOT/releases"
rm -rf "$REL"
mkdir -p "$REL"
cd "$ROOT"
for d in [0-9][0-9]-*/; do
  d="${d%/}"
  ( cd "$d" && zip -rqX "$REL/$d.zip" . -x '.DS_Store' -x '*/.DS_Store' )
  n=$(find "$d" -name SKILL.md | wc -l | tr -d ' ')
  printf 'zipped %-26s -> releases/%s.zip (%s skills)\n' "$d" "$d" "$n"
done
echo "Færdig: $(ls "$REL"/*.zip | wc -l | tr -d ' ') afdelings-zips i releases/"
