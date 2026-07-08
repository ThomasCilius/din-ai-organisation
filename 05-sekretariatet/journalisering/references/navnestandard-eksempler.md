# Navnestandard - regler og eksempelsamling

Indhold:

1. [Standarden i detaljer](#standarden-i-detaljer)
2. [Eksempelsamling: før → efter](#eksempelsamling-foer--efter)
3. [Grænsetilfælde](#graensetilfaelde)

## Standarden i detaljer

Format: `ÅÅÅÅ-MM-DD_modpart_emne_vX.endelse`

**Dato (ÅÅÅÅ-MM-DD):**

- Dokumentets EGEN dato: kontraktens underskriftsdato, fakturadatoen, brevdatoen, referatets mødedato - aldrig dags dato, aldrig scanningsdatoen.
- ISO-formatet (år-måned-dag) er ikke pynt: det får filerne til at sortere sig selv kronologisk i enhver filbrowser.
- Findes ingen dato i dokumentet: brug filens oprettelsesdato og markér rækken [ANTAGELSE] i planen.
- Dokumenter der dækker en periode (årsrapport, kontoudtog): brug periodens slutdato eller blot året (`2026_NovoLog_aarsaftale.pdf`) - vælg én praksis og skriv den i journaliseringsloggen.

**Modpart:**

- Ét kanonisk navn pr. modpart - byg registeret af `virksomhedsprofil.md` og journaliseringsloggen og genbrug det: "NovoLog", aldrig skiftevis "Novolog", "NL" og "Novo Logistik ApS".
- Kort form uden selskabsbetegnelse (ApS, A/S) - den støjer og ændrer sig ved omdannelser.
- Interne dokumenter uden modpart: brug `intern` eller udelad leddet (`2026-07-01_personalehaandbog_v3.docx`).

**Emne:**

- 1-3 sigende ord med bindestreg imellem: `kontrakt`, `tilbud-lagerflytning`, `ansaettelseskontrakt`.
- Emnet skal kunne genkendes af en kollega om tre år - ikke "diverse", ikke "dok", ikke "vigtigt".
- Status kan indgå som sidste emneord når den er varig: `kontrakt-underskrevet`, `tilbud-accepteret`.

**Version (_vX):**

- Kun når der reelt findes flere versioner - en fil der aldrig får en v2 behøver ingen v1.
- Fortløbende: `_v1`, `_v2`, `_v3`. ALDRIG "final", "endelig", "ny", "rettet", "final2" - de ord lyver altid inden for en uge.
- Den underskrevne/gældende udgave markeres i emnet (`kontrakt-underskrevet_v3`), ikke med et nyt navneformat.

**Tegn og endelser:**

- Ingen mellemrum (brug `_` mellem led og `-` inde i led), ingen specialtegn, ingen æ/ø/å (skriv ae/oe/aa) - navnet skal overleve synkronisering, URL'er og andres systemer.
- Behold den oprindelige filendelse. En scannet kontrakt er `.pdf` - lav aldrig om på formatet under journalisering.

## Eksempelsamling: før → efter

| Før | Efter | Hvad blev rettet |
|---|---|---|
| `Kontrakt endelig FINAL2 (3).docx` | `2026-03-14_NovoLog_kontrakt_v2.docx` | dato, modpart og reel version i stedet for panik-ord |
| `Scan_20260314_113355.pdf` | `2026-03-02_SKAT_afgoerelse-moms.pdf` | åbnet og journaliseret på indholdets dato og afsender - ikke scannerens tidsstempel |
| `tilbud.docx` | `2026-06-20_Byggefirma-Hansen_tilbud-lagerhal_v1.docx` | modpart og emne så filen kan findes fra begge indgange |
| `Faktura 1023.pdf` | `2026-05-31_NovoLog_faktura-1023.pdf` | dato og modpart; fakturanummeret bevares i emnet |
| `RE RE RE aftale.pdf` (gemt mail) | `2026-04-11_Vestjysk-Transport_aftale-prisregulering-mail.pdf` | mailtrådens beslutning journaliseret på seneste dato + `-mail` som kildemarkør |
| `MJ kontrakt ny.docx` | `2026-01-15_Mette-Jensen_ansaettelseskontrakt-underskrevet_v2.docx` | fuldt navn (kanonisk), status i emnet, version |
| `IMG_4club7.jpg` (foto af bilag) | `2026-06-03_Silvan_kvittering-materialer.jpg` | fotoets indhold journaliseret - ikke kameraets filnavn |
| `Referat.docx` | `2026-07-01_intern_referat-ledermoede.docx` | dato og mødetype; `intern` som modpart |
| `police ny 2024(1).pdf` | `2024-09-01_Tryg_police-erhvervsforsikring_v2.pdf` | ikrafttrædelsesdato, selskab, policetype |
| `Ansøgning - Peter.pdf` | `2026-02-10_Rekruttering-lagermedarbejder_ansoegning-Peter-Soerensen.pdf` | runden som kontekst - og filen bliver synlig for GDPR-oprydning |
| `budget sidste version OK.xlsx` | `2026-01-08_intern_budget-2026_v4.xlsx` | version i tal; "OK" og "sidste" ud |
| `dok1 (2).docx` | `_til-afklaring/dok1 (2).docx` + spørgsmål | kan ikke journaliseres uden at indholdet er afklaret - parkeret, ikke gættet |

## Grænsetilfælde

- **Scanninger og fotos:** journaliser ALTID på indholdet, aldrig på enhedens filnavn. Kan indholdet ikke læses (utydelig scanning), → `_til-afklaring/` med spørgsmålet "hvad er dette?".
- **Gemte mails og mailtråde:** navngiv efter beslutningen/emnet og den seneste relevante dato, tilføj `-mail` i emnet så kilden fremgår. Selve mail-arbejdet hører til `indbakke-triage` - her journaliseres kun mails som brugeren har gemt som filer.
- **Versioner vs. dubletter:** samme indhold bit for bit = dublet (→ `_dubletter/`). Næsten samme indhold (rettelser, nyt afsnit) = versioner - begge beholdes og nummereres. Ved tvivl: behandl som versioner, så intet går tabt.
- **Bilag til en kontrakt** (tegninger, tilbudsgrundlag): samme dato og modpart som kontrakten + `bilag` i emnet: `2026-03-14_NovoLog_kontrakt-bilag-A-tegninger.pdf` - så ligger bilagene klistret til kontrakten i sorteringen.
- **Flere modparter i ét dokument** (trepartsaftale): vælg den modpart hvis mappe dokumentet ligger i, og nævn de øvrige i journaliseringsloggen.
- **Meget lange navne:** over ca. 80 tegn klippes emnet - dato, modpart og version må aldrig ofres. Detaljerne hører til inde i dokumentet, ikke i filnavnet.
- **Allerede velnavngivne filer** efter en anden konsekvent standard: lav dem IKKE om enkeltvis - forelæg valget for brugeren (behold gammel standard eller konvertér alt) og skriv beslutningen i journaliseringsloggen. Halvt konverterede mapper er værre end begge standarder.
