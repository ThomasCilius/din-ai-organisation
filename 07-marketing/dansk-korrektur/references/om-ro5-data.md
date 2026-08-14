# Om RO5-data: hvad følger med, og hvad du selv henter

Skillen `dansk-korrektur` bygger på Retskrivningsordbogen 5 fra Dansk Sprognævn.
Datagrundlaget består af to filer. Den ene følger med pakken, den anden gør ikke.

| Fil | Størrelse | Følger med? |
|-----|-----------|-------------|
| `retskrivningsreglerne.md` | ~210 KB | **Ja** - ligger her i mappen |
| `RO5-COR.csv` (ordformlisten) | ~31 MB, ca. 535.000 ordformer | **Nej** - for stor til et git-repo |

Uden ordformlisten fungerer skillen stadig: den korrekturlæser på reglerne plus
almindelig sprogkundskab. Med listen bliver stavekontrollen maskinelt verificeret
i stedet for skønsbaseret. Forskellen er værd at hente ned, hvis du korrekturlæser
dansk tekst regelmæssigt.

## Sådan henter du ordformlisten

Dansk Sprognævn udgiver en samlet LLM-pakke med begge filer:

```bash
curl -L -o /tmp/ro5.zip https://dsn.dk/wp-content/uploads/2025/12/RO5-til-LLM-171225.zip
unzip -o /tmp/ro5.zip -d /tmp/ro5
```

Læg derefter `RO5-COR.csv` ét af de tre steder, som scripts leder:

```bash
# 1) direkte i denne skills references-mappe (simplest)
cp /tmp/ro5/RO5-COR.csv ~/.claude/skills/dansk-korrektur/references/

# 2) eller en fælles referencemappe, som scripts også kender
mkdir -p ~/.claude/reference/RO5-til-LLM
cp /tmp/ro5/RO5-COR.csv ~/.claude/reference/RO5-til-LLM/

# 3) eller hvor som helst, og peg på den med en miljøvariabel
export RO5_CSV=/sti/til/RO5-COR.csv
```

Tjek at det virker:

```bash
~/.claude/skills/dansk-korrektur/references/ro5-lookup.sh projektmøde
```

Kommer der en linje med `norm=N`, er du kørende.

Er linket forældet, ligger den aktuelle udgave altid via
[ro.dsn.dk](https://ro.dsn.dk/ro-elektronisk-og-som-trykt-bog/) under afsnittet om
sprogmodeller. Rå-datasættet uden LLM-header hedder COR og hentes hos
[ordregister.dk](https://ordregister.dk/).

## Filformat

`RO5-COR.csv` er tab-separeret med denne header:

```
COR-id	lemma	glosse	gram. beskr.	ordform	normeret? (N = normeret, K = korrekt, U = unormeret)
```

Opslag sker på kolonne 5, `ordform`. Normeringen i kolonne 6 læses:
`N` = normeret (anbefalet), `K` = korrekt sideform, `U` = unormeret (undgå).

## Licens og forbehold

Begge filer er stillet til rådighed af Dansk Sprognævn under **CC0** og må deles
frit. `retskrivningsreglerne.md` er derfor inkluderet her uændret.

Dansk Sprognævn understreger selv to ting, og de gælder også for denne skill:

1. Filerne er autogenererede og kan indeholde fejl.
2. Kun Retskrivningsordbogen på [ro.dsn.dk](https://ro.dsn.dk/) og som trykt bog
   er autoritativ. Ved reel tvivl slår du op dér, ikke her.
