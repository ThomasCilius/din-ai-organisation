# Mappetaksonomi - fuld reference

Indhold:

1. [Grundprincipper](#grundprincipper)
2. [De seks hovedmapper i detaljer](#de-seks-hovedmapper-i-detaljer)
3. [Specialmapper](#specialmapper)
4. [Placeringstabel: dokumenttype → mappe](#placeringstabel-dokumenttype--mappe)
5. [Grænsetilfælde og tie-breakere](#graensetilfaelde-og-tie-breakere)
6. [Branchetilpasninger](#branchetilpasninger)

## Grundprincipper

- **Maks 3 niveauer:** hovedmappe / underopdeling / fil. Navnestandarden (dato, modpart, emne i filnavnet) gør dybere mapper overflødige - filerne sorterer og filtrerer sig selv.
- **Hellere god navngivning end dybe mapper.** Fristes du til at oprette niveau 4, er det næsten altid fordi filnavnene er for dårlige - ret navnene i stedet.
- **Én fil, ét sted.** Ingen kopier "for en sikkerheds skyld" i flere mapper - det skaber versionstvivl. Skal et dokument kunne findes fra to indgange, ligger filen ét sted og stien noteres i journaliseringsloggen.
- **Strukturen følger virksomheden, ikke omvendt.** `virksomhedsprofil.md` og en eksisterende, fungerende struktur overtrumfer altid standarden her. Det vigtige er ikke HVILKEN regel der vælges, men at den samme regel bruges hver gang - og at valget står i journaliseringsloggen.
- **Mappenavne uden æ/ø/å og mellemrum** (skriv ae/oe/aa, brug bindestreg) - strukturen skal overleve synkronisering, links og eksterne systemer.

## De seks hovedmapper i detaljer

### Kunder/

- **Underopdeling:** én mappe pr. kunde, navngivet som i modpartsregisteret (`Kunder/NovoLog/`).
- **Indhold:** tilbud, ordrebekræftelser, kundekontrakter, projektaftaler, væsentlig korrespondance gemt som fil, reklamationssager.
- **Hører IKKE til her:** fakturaer og betalinger (→ `Oekonomi/`), leads uden aftale endnu (vent med mappen til der er en aftale eller et tilbud).
- Kunder med mange sager kan få niveau 3 pr. sag/projekt: `Kunder/NovoLog/2026-lagerflytning/`.

### Leverandoerer/

- **Underopdeling:** én mappe pr. leverandør.
- **Indhold:** leverandøraftaler, prislister, SLA'er, databehandleraftaler, opsigelser og korrespondance om vilkår.
- **Hører IKKE til her:** leverandørfakturaer (→ `Oekonomi/` - de er regnskabsmateriale).

### Oekonomi/

- **Underopdeling:** én mappe pr. regnskabsår (`Oekonomi/2026/`), evt. niveau 3 pr. type (`Bilag/`, `Kontoudtog/`, `Moms/`, `Aarsrapport/`).
- **Indhold:** alt regnskabsmateriale - bilag, fakturaer (ud og ind), kontoudtog, momsindberetninger, årsrapporter, budgetter.
- Årsopdelingen matcher opbevaringspligten (5 år fra regnskabsårets udløb, bogføringsloven - slå den aktuelle regel op på retsinformation.dk): når et år må slettes, er det én mappe der udpeges som slettekandidat - ikke tusind spredte filer.
- **Grænseflade:** klargøring af bilag til bogholderen er `bilagsrydning`s opgave (Økonomi-afdelingen) - journalisering arkiverer kun.

### HR-og-personale/

- **Underopdeling:** én mappe pr. medarbejder (`HR-og-personale/Mette-Jensen/`) plus `Rekruttering/` og `Politikker/`.
- **Indhold:** ansættelseskontrakter, tillæg, MUS-notater, opsigelser; i `Rekruttering/`: jobopslag og ansøgninger pr. runde.
- **OBS persondata:** hele denne gren indeholder persondata - læs `opbevaringspligter-og-gdpr.md` før noget her udpeges som slettekandidat, og flag følsomme oplysninger (helbred, fravær) til ejeren i stedet for at behandle dem videre.
- Adgangen til denne mappe bør være begrænset - står den på et åbent fællesdrev, nævn det som anbefaling i loggen (opsætning af adgange er `adgangsstyring`s område, IT og udvikling).

### Kontrakter-og-aftaler/

- **Underopdeling:** pr. aftaletype (`Leje/`, `Bank/`, `Forsikring/`, `Licenser-og-abonnementer/`).
- **Indhold:** aftaler UDEN naturlig modpartsmappe - lejekontrakt, bankaftaler, leasing, softwarelicenser.
- **Vigtigste regel:** kunde- og leverandørkontrakter ligger hos modparten, IKKE her - se tie-breakerne nedenfor.

### Myndigheder-og-forsikring/

- **Underopdeling:** pr. myndighed/selskab (`SKAT/`, `Kommune/`, `Erhvervsstyrelsen/`, `Forsikring-[selskab]/`).
- **Indhold:** afgørelser, tilladelser, registreringsbeviser, policer, skadesager, brevpost fra Digital Post gemt som PDF.
- Myndighedspost gemmes som udgangspunkt i hele sagens levetid - udpeg aldrig myndighedspost som slettekandidat uden regelopslag og ejerens accept.

## Specialmapper

| Mappe | Formål | Regel |
|---|---|---|
| `_til-afklaring/` | tvivlstilfælde parkeret med et konkret spørgsmål pr. fil | tømmes af et menneske - Claude foreslår, brugeren beslutter |
| `_dubletter/` | overflødige identiske kopier | flyttes hertil i planen, slettes ALDRIG af Claude |

Underscoren holder mapperne øverst i sorteringen og signalerer "midlertidig - skal tømmes". Vokser `_til-afklaring/` sig stor, er det et tegn på at en placeringsregel mangler - foreslå reglen, skriv den i loggen og tøm mappen med brugeren.

## Placeringstabel: dokumenttype → mappe

| Dokumenttype | Placering |
|---|---|
| Tilbud til kunde | `Kunder/[kunde]/` |
| Ordrebekræftelse | `Kunder/[kunde]/` |
| Kundekontrakt | `Kunder/[kunde]/` |
| Leverandøraftale / databehandleraftale | `Leverandoerer/[leverandoer]/` |
| Faktura (udgående og indgående) | `Oekonomi/[aar]/` |
| Kontoudtog, momsindberetning | `Oekonomi/[aar]/` |
| Årsrapport, budget | `Oekonomi/[aar]/` |
| Ansættelseskontrakt, tillæg, opsigelse | `HR-og-personale/[medarbejder]/` |
| Jobansøgninger (aktive runder) | `HR-og-personale/Rekruttering/[runde]/` |
| Personalehåndbog, politikker | `HR-og-personale/Politikker/` |
| Lejekontrakt, bankaftale, licens | `Kontrakter-og-aftaler/[type]/` |
| Forsikringspolice, skadesag | `Myndigheder-og-forsikring/Forsikring-[selskab]/` |
| Brev/afgørelse fra SKAT, kommune, Erhvervsstyrelsen | `Myndigheder-og-forsikring/[myndighed]/` |
| Mødereferater (interne) | dér hvor virksomheden har dem - typisk brain-mappen; ellers foreslå `Internt/Referater/` og notér valget i loggen |

Mangler en dokumenttype i tabellen, afgør placeringen efter tie-breakerne nedenfor - og tilføj den valgte regel til journaliseringsloggen, så tabellen reelt vokser hos brugeren.

## Grænsetilfælde og tie-breakere

Afgør placering i denne rækkefølge og skriv valget i loggen:

1. **Er der et pengespor?** Bilag, fakturaer og alt bogholderen skal bruge → `Oekonomi/[aar]/`, uanset modpart. Regnskabsmateriale samles ét sted af hensyn til opbevaringspligten.
2. **Er der en navngiven modpart med egen mappe?** → modpartens mappe (`Kunder/` eller `Leverandoerer/`). En kundekontrakt ligger hos kunden - dér leder man først.
3. **Er det persondata om en medarbejder?** → `HR-og-personale/[medarbejder]/`, også når dokumentet også handler om andet.
4. **Er afsenderen en myndighed, bank eller forsikring?** → `Myndigheder-og-forsikring/`.
5. **Stadig tvivl?** → `_til-afklaring/` med et konkret spørgsmål - aldrig et gæt.

Typiske tvivlstilfælde:

- **Underskrevet kundekontrakt** - hos kunden (regel 2). `Kontrakter-og-aftaler/` er kun for aftaler uden modpartsmappe.
- **Faktura fra leverandør** - `Oekonomi/[aar]/` (regel 1 slår regel 2): den er regnskabsmateriale før den er leverandørkorrespondance.
- **Ansættelseskontrakt** - `HR-og-personale/[medarbejder]/` (regel 3). Lønbilag derimod → `Oekonomi/` (regel 1).
- **Forsikringssag om en firmabil efter et kundeuheld** - `Myndigheder-og-forsikring/Forsikring-[selskab]/` (regel 4); notér krydsreference til kundemappen i loggen.

## Branchetilpasninger

Standarden tilpasses branchen i `virksomhedsprofil.md` - typiske varianter:

- **Håndværk/entreprise:** `Sager/[sag]/` erstatter eller supplerer `Kunder/` - sagen (adressen/projektet) er den naturlige indgang, ikke kundenavnet.
- **Konsulent/bureau:** `Kunder/[kunde]/[projekt]/` med projektniveauet som niveau 3.
- **Detail/webshop:** kundemapper giver sjældent mening ved mange små kunder - `Kunder/` bruges kun til B2B-aftaler, resten ligger i systemerne (webshop, regnskabsprogram), ikke på drevet.
- **Udlejning/ejendom:** `Ejendomme/[adresse]/` som ekstra hovedmappe.

Uanset variant gælder de samme regler: maks 3 niveauer, én fil ét sted, valg dokumenteret i journaliseringsloggen.
