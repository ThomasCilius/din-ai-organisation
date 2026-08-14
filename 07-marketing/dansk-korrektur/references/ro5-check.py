#!/usr/bin/env python3
"""ro5-check.py - find KANDIDATER til stavefejl i en dansk tekst mod RO5-COR.

Bruger den autoritative ordformliste (kolonne 5) fra Retskrivningsordbogen 5
(Dansk Sprognævn, CC0). Tokens der ikke findes i listen rapporteres som
KANDIDATER, ikke som domme. Dansk har produktiv orddannelse (sammensætninger
som "projektmøde", bøjninger, egennavne), så mange gyldige ord står ikke i RO5.
Brug outputtet som en tjekliste, ikke som facit: slå hver kandidat op med
ro5-lookup.sh og vurdér efter retskrivningsreglerne.

Datafilen RO5-COR.csv (31 MB) følger ikke med skill-pakken. Den søges tre
steder i rækkefølge: $RO5_CSV, denne mappe, ~/.claude/reference/RO5-til-LLM/.
Se om-ro5-data.md for hvor filen hentes.

Brug:
    ro5-check.py <fil.txt>        # tjek en fil
    ro5-check.py -                # tjek stdin
    echo "en sætning" | ro5-check.py -
"""
from __future__ import annotations

import os
import re
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
# Ord: danske bogstaver, inkl. bindestreg og apostrof internt.
TOKEN = re.compile(r"[A-Za-zÆØÅæøåÉéÜü]+(?:[-'][A-Za-zÆØÅæøåÉéÜü]+)*")

MISSING_CSV = """FEJL: finder ikke RO5-COR.csv.

Datafilen (31 MB) følger ikke med skill-pakken. Hent den gratis hos Dansk
Sprognævn (CC0) og læg den ét af disse steder:

  1. stien i miljøvariablen $RO5_CSV
  2. denne skills references/-mappe
  3. ~/.claude/reference/RO5-til-LLM/RO5-COR.csv

Se om-ro5-data.md for hvor filen hentes.

Uden datafilen kan korrekturen stadig køre på retskrivningsreglerne.md plus
almindelig sprogkundskab - den er bare ikke maskinelt verificeret."""


def find_csv() -> Path | None:
    env = os.environ.get("RO5_CSV")
    candidates = []
    if env:
        candidates.append(Path(env))
    candidates.append(HERE / "RO5-COR.csv")
    candidates.append(Path.home() / ".claude/reference/RO5-til-LLM/RO5-COR.csv")
    for c in candidates:
        if c.is_file():
            return c
    return None


def load_forms(csv: Path) -> set[str]:
    forms: set[str] = set()
    with csv.open(encoding="utf-8") as f:
        next(f, None)  # header
        for line in f:
            cols = line.rstrip("\n").split("\t")
            if len(cols) >= 5 and cols[4]:
                forms.add(cols[4].lower())
    return forms


def main() -> int:
    if len(sys.argv) != 2:
        print(__doc__)
        return 2

    csv = find_csv()
    if csv is None:
        print(MISSING_CSV, file=sys.stderr)
        return 2

    src = sys.argv[1]
    text = sys.stdin.read() if src == "-" else Path(src).read_text(encoding="utf-8")

    forms = load_forms(csv)

    seen: dict[str, int] = {}
    order: list[str] = []
    for m in TOKEN.finditer(text):
        tok = m.group(0)
        # Enkeltbogstav springes over.
        if len(tok) < 2:
            continue
        low = tok.lower()
        if low in forms:
            continue
        # Sammensætning på bindestreg: OK hvis alle led findes.
        if "-" in low and all(part in forms for part in low.split("-") if part):
            continue
        if low not in seen:
            seen[low] = 0
            order.append(low)
        seen[low] += 1

    if not order:
        print("Ingen kandidater - alle ord findes i RO5 (eller er gyldige bindestregs-sammensætninger).")
        return 0

    print(f"{len(order)} KANDIDAT(er) ikke fundet i RO5 (vurdér manuelt - mange er gyldige sammensætninger/egennavne):\n")
    for tok in order:
        n = seen[tok]
        print(f"  {tok}" + (f"  (x{n})" if n > 1 else ""))
    print("\nSlå op med:  ./ro5-lookup.sh <ord>")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
