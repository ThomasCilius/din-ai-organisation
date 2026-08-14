#!/usr/bin/env bash
# ro5-lookup.sh - slå ét eller flere ord op i Retskrivningsordbogen (RO5-COR).
# Autoritativ ordformliste fra Dansk Sprognævn (CC0). Kolonner i CSV (tab-separeret):
#   1 COR-id | 2 lemma | 3 glosse | 4 gram.beskr. | 5 ordform | 6 normering (N/K/U)
#
# Brug:  ro5-lookup.sh <ord> [ord2 ...]
# Match er eksakt på ordform (kolonne 5), case-insensitivt.
# Exit 0 hvis ALLE ord blev fundet, 1 hvis mindst ét manglede, 2 ved fejl.

set -euo pipefail
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Datafilen følger ikke med pakken (31 MB). Led tre steder, i denne rækkefølge.
find_csv() {
  [[ -n "${RO5_CSV:-}" && -f "${RO5_CSV}" ]] && { echo "$RO5_CSV"; return 0; }
  [[ -f "$HERE/RO5-COR.csv" ]] && { echo "$HERE/RO5-COR.csv"; return 0; }
  [[ -f "$HOME/.claude/reference/RO5-til-LLM/RO5-COR.csv" ]] && {
    echo "$HOME/.claude/reference/RO5-til-LLM/RO5-COR.csv"; return 0; }
  return 1
}

if [[ $# -eq 0 ]]; then
  echo "brug: ro5-lookup.sh <ord> [ord2 ...]" >&2
  exit 2
fi

if ! CSV="$(find_csv)"; then
  cat >&2 <<'EOF'
FEJL: finder ikke RO5-COR.csv.

Datafilen (31 MB) følger ikke med skill-pakken. Hent den gratis hos Dansk
Sprognævn (CC0) og læg den ét af disse steder:

  1. stien i miljøvariablen $RO5_CSV
  2. denne skills references/-mappe
  3. ~/.claude/reference/RO5-til-LLM/RO5-COR.csv

Se references/om-ro5-data.md for hvor filen hentes.

Uden datafilen kan korrekturen stadig køre på retskrivningsreglerne.md plus
almindelig sprogkundskab - den er bare ikke maskinelt verificeret.
EOF
  exit 2
fi

missing=0
for word in "$@"; do
  echo "== $word =="
  hits="$(awk -F'\t' -v w="$word" 'tolower($5)==tolower(w){
    printf "  ordform=%s  lemma=%s  gram=%s  norm=%s\n", $5, $2, $4, $6
  }' "$CSV")"
  if [[ -z "$hits" ]]; then
    echo "  IKKE FUNDET i RO5 (kan være sammensætning, egennavn eller stavefejl - vurder efter reglerne)"
    missing=1
  else
    echo "$hits"
  fi
done

exit $missing
