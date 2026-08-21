#!/usr/bin/env bash
# Bygger alt i releases/:
#   1) <afdeling>.zip            - én zip pr. afdeling (Claude Desktop-upload,
#                                  eller udpakning direkte i ~/.claude/skills/)
#   2) din-ai-organisation.tar.gz - HELE pakken i ét arkiv. Det er den, installeren
#                                  henter fra skills.thomascilius.dk, saa en kursist
#                                  aldrig skal have git, GitHub-konto eller login.
# Koer scriptet efter enhver aendring i skills, hooks eller install.sh - og commit
# releases/ med, ellers henter sitet stadig den gamle version.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
REL="$ROOT/releases"
rm -rf "$REL"
mkdir -p "$REL"
cd "$ROOT"

# 1) Afdelings-zips
for d in [0-9][0-9]-*/; do
  d="${d%/}"
  ( cd "$d" && zip -rqX "$REL/$d.zip" . -x '.DS_Store' -x '*/.DS_Store' )
  n=$(find "$d" -name SKILL.md | wc -l | tr -d ' ')
  printf 'zipped %-26s -> releases/%s.zip (%s skills)\n' "$d" "$d" "$n"
done

# 2) Hele pakken som ét tar.gz. Staging-mappe, saa arkivet altid pakkes ud til
# én mappe med et forudsigeligt navn - og saa releases/, scripts/ og .git aldrig
# ryger med (arkivet ville ellers indeholde sig selv).
STAGE="$(mktemp -d)"
trap 'rm -rf "$STAGE"' EXIT
PKG="$STAGE/din-ai-organisation"
mkdir -p "$PKG"
for d in [0-9][0-9]-*/; do cp -R "${d%/}" "$PKG/"; done
cp -R hooks "$PKG/"
for f in install.sh company-brain-prompt.txt company-brain-bootstrap.md README.md; do
  [ -f "$f" ] && cp "$f" "$PKG/"
done
chmod +x "$PKG/install.sh"
find "$PKG" -name '.DS_Store' -delete
tar -czf "$REL/din-ai-organisation.tar.gz" -C "$STAGE" din-ai-organisation
skills=$(find "$PKG" -name SKILL.md | wc -l | tr -d ' ')
size=$(du -h "$REL/din-ai-organisation.tar.gz" | cut -f1 | tr -d ' ')
printf 'pakket %-26s -> releases/din-ai-organisation.tar.gz (%s skills, %s)\n' "hele pakken" "$skills" "$size"

echo "Faerdig: $(ls "$REL"/*.zip | wc -l | tr -d ' ') afdelings-zips + 1 samlet arkiv i releases/"
