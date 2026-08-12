---
name: skill-health
description: Strukturelt sundhedstjek af alle skills i ~/.claude/skills - navnefelter, beskrivelser, dubletter og døde referencer
command: true
---

# Skill Health

Kører et strukturelt sundhedstjek af hele skill-porteføljen i `~/.claude/skills`. Motoren ligger i denne fil og kræver kun python3 - ingen eksterne scripts eller måledata.

## Hvad tjekkes

1. **Mangler SKILL.md** - en skill-mappe uden manifest indlæses aldrig.
2. **Frontmatter-navn vs. mappenavn** - et name-felt der peger på en anden skill, er typisk en kopi der aldrig blev færdiggjort.
3. **Manglende description** - uden beskrivelse kan Claude ikke vælge skillen.
4. **Description over 1024 tegn** - harnessets grænse. Hold beskrivelsen kort og læg triggerteksten i sektionen "Hvornår denne skill bruges".
5. **Byte-identiske dubletter** - to mapper med præcis samme SKILL.md betyder at mindst én er en pladsholder med forkert indhold.
6. **Døde referencer** - `references/`-filer som SKILL.md nævner, men som ikke findes. Peger referencen på en anden skills mappe og findes dér, rapporteres den som info, ikke fejl.

## Implementation

Kør motoren:

```bash
python3 - <<'PY'
import hashlib, pathlib, re
from collections import defaultdict

SKILLS = pathlib.Path.home() / ".claude" / "skills"
if not SKILLS.is_dir():
    raise SystemExit("FEJL: " + str(SKILLS) + " findes ikke")

mapper = sorted(p for p in SKILLS.iterdir() if p.is_dir() and not p.name.startswith("."))
mangler_md = []; navnefejl = []; uden_desc = []; lange_desc = []
doede_refs = []; kryds = []
hashes = defaultdict(list)

for d in mapper:
    f = d / "SKILL.md"
    if not f.is_file():
        mangler_md.append(d.name)
        continue
    tekst = f.read_text(encoding="utf-8", errors="replace")
    hashes[hashlib.md5(tekst.encode("utf-8")).hexdigest()].append(d.name)
    nm = re.search(r"^name:\s*['\"]?([A-Za-z0-9._-]+)['\"]?\s*$", tekst, re.M)
    if nm and nm.group(1) != d.name:
        navnefejl.append(d.name + " (frontmatter: " + nm.group(1) + ")")
    dm = re.search(r"^description:\s*(.+)$", tekst, re.M)
    if not dm:
        uden_desc.append(d.name)
    else:
        desc = dm.group(1).strip().strip('"')
        if len(desc) > 1024:
            lange_desc.append(d.name + " (" + str(len(desc)) + " tegn)")
    for ref in sorted(set(re.findall(r"references/[A-Za-z0-9_æøåÆØÅ.-]+\.md", tekst))):
        if (d / ref).is_file():
            continue
        basenavn = ref.split("/")[-1]
        andre = sorted(set(p.parent.parent.name for p in SKILLS.glob("*/references/" + basenavn)))
        if andre:
            kryds.append(d.name + " -> " + ref + " (findes i: " + ", ".join(andre) + ")")
        else:
            doede_refs.append(d.name + " -> " + ref)

dubletter = [" == ".join(sorted(n)) for n in hashes.values() if len(n) > 1]

fund = 0
print("SKILLS I ALT: " + str(len(mapper)))
for titel, linjer in [
    ("Mangler SKILL.md", mangler_md),
    ("Frontmatter-navn matcher ikke mappenavn", navnefejl),
    ("Mangler description", uden_desc),
    ("Description over 1024 tegn (harness-graensen)", lange_desc),
    ("Byte-identiske SKILL.md-dubletter (pladsholder-kopier)", dubletter),
    ("Refererede references-filer der ikke findes nogen steder", doede_refs),
]:
    print("")
    print("-- " + titel + " (" + str(len(linjer)) + "):")
    print("\n".join("   " + l for l in linjer) if linjer else "   ingen")
    fund += len(linjer)

if kryds:
    print("")
    print("-- Info (ikke fejl): kryds-referencer til andre skills (" + str(len(kryds)) + "):")
    print("\n".join("   " + k for k in kryds))

print("")
print("ALT SUNDT: 0 fund." if fund == 0 else "I ALT " + str(fund) + " FUND - se ovenfor.")
PY
```

## What to Do

1. Kør motoren og vis resultatet for brugeren i samme sektioner - fund først, konklusionen til sidst.
2. **0 fund:** sig det i én linje og stop.
3. **Fund i managed skills** (installeret af din-ai-organisation - se `managedSkills` i `~/.claude/din-ai-org/install-state.json`): ret aldrig kun den lokale kopi. Ret kilden i din-ai-organisation-repoet og kør `./install.sh update`, ellers ruller næste opdatering rettelsen tilbage.
4. **Fund i brugerens egne skills:** foreslå den konkrete rettelse (ret name-feltet, tilføj description, opret eller ret referencen) og udfør den efter accept.
5. **Mange dubletter eller navnefejl på én gang** tyder på en fejlkørt batch-proces: undersøg tidsstempler (`stat -f "%Sm %N" <mapper>`) og find kilden, før der rettes.

## Usage

```
/skill-health          # fuldt tjek af ~/.claude/skills
```
