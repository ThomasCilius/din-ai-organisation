# Profil-skabelon: virksomhedsprofil.md

Fuld skabelon med feltvejledning og et udfyldt eksempel. Brug præcis denne sektionsrækkefølge - andre skills navigerer efter den.

## Indhold

1. [Skabelonen (kopiér denne)](#skabelonen-kopier-denne)
2. [Feltvejledning sektion for sektion](#feltvejledning-sektion-for-sektion)
3. [Udfyldt eksempel (uddrag)](#udfyldt-eksempel-uddrag)
4. [Markeringssyntaks](#markeringssyntaks)

## Skabelonen (kopiér denne)

```markdown
# Virksomhedsprofil: [Firmanavn]

> Kanonisk nav-fil for AI-organisationen. Alle skills læser denne fil først.
> Senest gennemgået: [ÅÅÅÅ-MM-DD]. Næste planlagte gennemgang: [kvartal].

## Stamdata

| Felt | Værdi | Kilde |
|---|---|---|
| Juridisk navn | | |
| CVR-nummer | | |
| Virksomhedsform | | |
| Branchekode (NACE) | | |
| Antal ansatte | pr. [dato] | |
| Adresse | | |
| Stiftelsesår | | |
| Hjemmeside | | |
| Ejer/direktør | | |

## Forretningsmodel

[3-8 linjer: hvordan tjenes pengene. Omsætningsfordeling i procent hvis kendt,
prismodel (timepris/fastpris/abonnement), typisk ordrestørrelse, sæsonudsving.]

## Kunder og segmenter

[De 2-4 vigtigste kundetyper med andel af forretningen. OG: hvem siges der nej
til. Navngivne eksempelkunder kun hvis ejeren har godkendt at de nævnes.]

## Produkter og ydelser

[Punktliste: ydelse - én linjes beskrivelse - evt. offentlig listepris pr. [dato].
Kun offentlige priser; enkeltkunders rabatter og vilkår hører IKKE hjemme her.]

## Konkurrenter

[2-5 navngivne konkurrenter + én linje pr. styk om hvad der adskiller os fra dem.
"Vi har ingen konkurrenter" accepteres ikke - så mangler sektionen research.]

## Systemlandskab

| Funktion | System | Bemærkning |
|---|---|---|
| Økonomi/bogføring | | |
| CRM/kundekartotek | | |
| Mail og kalender | | |
| Fildeling/drev | | |
| Fagsystem/drift | | |
| Hjemmeside/CMS | | |

## Nøgleprocesser

[De 3-7 processer forretningen står på, én linje pr. styk: navn - hvad den gør -
hvem der ejer den. Detaljer bor i videnfiler/procedurer, ikke her.]

## Tone og kommunikation

Skrivestil og tone: se `voice-profil.md` [findes / MANGLER - oprettes med
skillen toneprofil]. [Evt. 1-2 linjer: sprog (da/en), formel/uformel, du/De.]

## Antagelser og åbne spørgsmål

[Alle [ANTAGET]-punkter samlet her med begrundelse, så ejeren kan afvikle listen.
Tom sektion = alt er bekræftet. Skriv da: "Ingen åbne antagelser pr. [dato]."]

## Ændringslog

| Dato | Ændring | Godkendt af |
|---|---|---|
| ÅÅÅÅ-MM-DD | Oprettet fra [kilder] | [navn] |
```

## Feltvejledning sektion for sektion

### Stamdata

- Hentes så vidt muligt fra datacvr.virk.dk (se `auto-udkast-kilder.md`). Antal ansatte opgives ofte som interval hos CVR - skriv intervallet og bed ejeren præcisere.
- "Ejer/direktør" er den offentligt registrerede - ikke en organisationsoversigt. Ledelsesstruktur ud over det registrerede kræver ejerens input.

### Forretningsmodel

- Den sektion auto-udkastet rammer dårligst - hjemmesider beskriver ydelser, ikke økonomi. Forvent at interviewe her.
- Procentfordeling af omsætning er guld for alle andre skills (tilbud, marketing, strategi). Accepter et groft skøn fra ejeren, og markér det "pr. [dato], ejers skøn".
- Ingen faktiske regnskabstal uden ejerens udtrykkelige ønske - profilen deles bredt.

### Kunder og segmenter

- Fravalget ("hvem siger vi nej til") er lige så vigtigt som tilvalget - det er dét der forhindrer tilbuds- og marketingskills i at skyde forkert.
- Navngivne kunder kun med ejerens eksplicitte godkendelse i diffen.

### Produkter og ydelser

- Match sektionens sprog til det ejeren faktisk sælger, ikke hjemmesidens marketingsprog. "Digital transformationspartner" er ikke en ydelse; "opsætning af Microsoft 365 for kontorer med 5-50 ansatte" er.
- Priser: kun offentlige listepriser, altid med "pr. [dato]". Findes der ingen offentlig prisliste, skriv "priser efter tilbud" - skriv aldrig interne satser fast i filen.

### Konkurrenter

- Bed om navne. Kategorier ("de store kæder") er et rødt flag - grav videre, jf. interviewguiden.
- "Hvad adskiller os" skal være efterprøvbart: "hurtigere responstid (svar samme dag)" frem for "bedre kvalitet".

### Systemlandskab

- Kun systemnavne og funktion - ALDRIG brugernavne, adgangskoder eller licensvilkår.
- Denne tabel er forudsætningen for at `gdpr-fortegnelse` senere kan finde databehandlerne - vær omhyggelig med at få alle systemer med der rører kunde- eller medarbejderdata.

### Nøgleprocesser

- Én linje pr. proces. Fristelsen er at skrive proceduren her - lad være. Detaljer bor i videnfiler (via `videnfil-interview`) og procedurer (via `procedure-skriver` i HR). Profilen er kortet, ikke terrænet.

### Tone og kommunikation

- Kun en henvisning plus 1-2 rammelinjer. Selve stemmen defineres og vedligeholdes af `toneprofil` i voice-profil.md.

### Antagelser og åbne spørgsmål

- Saml ALLE [ANTAGET]-markeringer her som liste, ud over at de står inline. Ejeren skal kunne afvikle listen top-til-bund uden at lede i hele filen.

### Ændringslog

- Én linje pr. gemning, nyeste nederst. Slettes eller omskrives aldrig. Loggen er dét `brain-tjek` bruger til at vurdere om profilen er forældet.

## Udfyldt eksempel (uddrag)

```markdown
## Forretningsmodel

Vi tjener penge på tre ben: (1) el-installationer for boligforeninger i
Storkøbenhavn, ca. 70 % af omsætningen (pr. 2026-07, ejers skøn), typisk
fastpris pr. projekt; (2) servicekontrakter for ejendomsadministratorer,
ca. 30 %, faktureres kvartalsvist; (3) [ANTAGET: enkelte akutopgaver til
timepris - nævnt på hjemmesiden under "døgnvagt", ikke bekræftet af ejer].
Sæson: stille i juli, travlt september-november.

## Kunder og segmenter

- Boligforeninger, 20-200 lejemål, Storkøbenhavn - primærsegment
- Ejendomsadministratorer (3 faste: [navne godkendt af ejer i diff 2026-07-07])
- Vi siger nej til: private enkeltopgaver under 10.000 kr. og opgaver uden
  for hovedstadsområdet
```

## Markeringssyntaks

| Markering | Betydning | Afvikles ved |
|---|---|---|
| `[ANTAGET: begrundelse]` | Ubekræftet oplysning med kilde/ræsonnement | Ejer bekræfter eller retter i diff |
| `[MANGLER]` | Felt uden data - hverken hentet eller besvaret | Interview eller senere kørsel |
| `pr. [dato]` | Tal med udløbsdato (priser, ansatte, fordeling) | Kvartalsgennemgang / brain-tjek |
| `(kilde: X, dato)` | Auto-hentet faktum med kilde | Står permanent - kilden ER dokumentationen |
