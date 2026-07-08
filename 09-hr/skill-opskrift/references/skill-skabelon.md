# Skill-skabelon - kursets opskriftsformat

Læs denne fil når du skal skrive en ny skill (arbejdsgangens trin 4). Skabelonen instantieres - kopiér skelettet og udfyld; slet sektioner der ikke passer til opgaven, men aldrig aldrig-reglerne, outputkontrakten eller "Læs først".

## Indhold

1. [Navneregler](#navneregler)
2. [Skelettet](#skelettet)
3. [Hvornår bruges hvilken byggeklods](#hvornaar-bruges-hvilken-byggeklods)
4. [Hvornår skal noget i references/](#hvornaar-skal-noget-i-references)
5. [Gennemarbejdet eksempel: leverandoerklage](#gennemarbejdet-eksempel-leverandoerklage)

## Navneregler

- Navnet er noget brugeren ville sige højt: `rykker-runde`, ikke `debitor-modul-v2`.
- Kun a-z, 0-9 og bindestreger. Æ/ø/å translittereres: `proevetid`, `moedeforberedelse`, `aarsafslutning`.
- Max 64 tegn. Mappenavn og `name`-feltet skal være identiske - ellers indlæses skillen ikke.

## Skelettet

```markdown
---
name: [mappenavnet praecist]
description: "[Hvad skillen gør, tredje person, én sætning]. Brug den når brugeren siger '[DA-fraser]' eller '[EN-fraser]'. Brug den også når [bredere situation - vær pågående i formuleringen]. Brug IKKE til [naboområde] - dér bruges [naboskill]."
---

Du er [rollesætning - fagligt, konkret]. Din opgave er [én sætning].

## Jernlov
[KUN hvis skillen har ÉN katastrofal fejlmode. Én sætning i fed + 1-2 sætninger
om hvad der konkret går galt når den brydes. Mere end én jernlov udvander alle.]

## Læs først
1. Find og læs `virksomhedsprofil.md` i brugerens arbejdsområde/brain-mappe (altid).
2. [Skrivende skill:] Læs også `voice-profil.md`. [Visuel skill:] Læs også `designprofil.md`.
3. Findes filerne ikke: sig det, og stil kun de spørgsmål filerne ellers ville
   have besvaret - ét ad gangen.

## Arbejdsgang
1. **Interview.** Ét spørgsmål pr. besked, multiple choice hvor muligt.
   Spring spørgsmål over som tidligere svar dækker.
2. **Brief.** Sammenfat i 5-8 linjer. **HARD GATE: producér INTET før briefen
   er godkendt.** Mangler du info til briefen: stop og spørg.
3. **Producér.** [Kerneopgaven. Læs `references/[emne].md` når (betingelse).]
4. **Tjek - ret - gentag.** Gennemgå udkastet mod tjeklisten, ret alle fund,
   gentag til nul fund - dog max 3 runder på samme problem, derefter forelæg
   det for brugeren.
5. **Aflevér.** [Artefaktet + forslag til næste skridt.]

**Escape hatch:** Siger brugeren "spring spørgsmålene over", så stil kun de 2
vigtigste. Beder de igen: respektér det, markér huller som [ANTAGELSE].

## [Fagsektion - opgavens viden]
[Korte regler og tjeklister her. Dybt stof i references/ med "læs når..."-linje.]
[Tal-regel: aldrig satser/gebyrer/frister i teksten - skriv "slå aktuel sats
op på [kilde]".]

## Aldrig-regler
1. Aflevér altid som kladde - send, slet eller bogfør aldrig noget selv.
2. Lav en plan og få den godkendt før enhver filhandling.
3. Citér kilden for ethvert faktuelt eller juridisk udsagn.
4. AI anbefaler - mennesket beslutter. Ved [navngivne triggere: beløb over X,
   persondata, tvist, opsigelse]: stop og henvis til [ejer/revisor/jurist].
5. [Opgavens egne regler - max 6 i alt.]

## Output
Skriv altid til én navngiven fil: `[artefakt-navn med udfyldningsfelter].md`.
Fast struktur - brug præcis denne skabelon:
[# Titel + de faste overskrifter + altid: "## Antagelser og aabne spoergsmaal"
og "## Kilder"]

## Relaterede skills
- For [naboopgave], brug `[naboskill]` - denne skill dækker kun [afgrænsning].
```

## Hvornår bruges hvilken byggeklods

| Byggeklods | Brug når | Drop når |
|---|---|---|
| Jernlov | Én katastrofal fejlmode (sende uden godkendelse, slette data) | Fejlene er mange og små - så bærer tjeklisten |
| Tvingende interviewspørgsmål med "grav videre indtil du hører" | Brugerens første svar typisk er poleret og vagt | Input er allerede struktureret (en fil, et ark) |
| SKIDT/GODT-kontrastpar | Tone eller kvalitet ER pointen (tekster udadtil) | Output er mekanisk (tjeklister, beregninger) |
| Hard gate + escape hatch | Billig godkendelse forhindrer dyrt omarbejde | Opgaven er så lille at gaten koster mere end den redder |
| Afkrydsningstjekliste gengivet i svaret | Reglerne er verificerbare punkt for punkt | Kvaliteten er skøn, ikke kontrol |
| Undskyldning-vs-virkelighed-tabel | Stor fristelse til at springe et dyrt trin over | Alle andre tilfælde - tabellen er stærk krydderi, ikke basiskost |

## Hvornår skal noget i references/

SKILL.md indlæses hver gang skillen trigger; `references/*.md` kun når skillen selv beslutter at læse dem. Derfor:

- **I SKILL.md:** arbejdsgang, aldrig-regler, korte tjeklister (under ca. 15 punkter), outputkontrakt.
- **I references/:** lovtjeklister, lange skabeloner, eksempelsamlinger, protokolbeskrivelser - alt der kun bruges i bestemte situationer.
- Én mappe, ét niveau, beskrivende filnavne (`afslagsbreve-eksempler.md`, ikke `bilag2.md`).
- Filer over 100 linjer får indholdsfortegnelse.
- Hver fil SKAL nævnes i SKILL.md-kroppen med en betingelse: "Læs `references/X.md` når [situation]". En references-fil ingen henviser til, bliver aldrig læst.

## Gennemarbejdet eksempel: leverandoerklage

Komprimeret men komplet - sådan ser en færdig lille skill ud (ingen references/ nødvendig, fagstoffet er kort):

```markdown
---
name: leverandoerklage
description: "Skriver en saglig klage eller reklamation til en leverandør over forsinkelse, fejlleverance eller kvalitetssvigt. Brug den når brugeren siger 'skriv en klage til leverandøren', 'varerne er ikke kommet', 'det de leverede er i stykker', 'vi vil have prisnedslag' eller 'write a complaint to our supplier'. Brug den også når brugeren er frustreret over en leverandør og vil have det ned på skrift. Brug IKKE til klager FRA kunder - dér bruges kundesvar."
---

Du er en erfaren dansk indkøbsansvarlig der skriver klager som får resultater
uden at brænde broer. Din opgave er at skrive en reklamation der dokumenterer,
kræver og bevarer relationen.

## Læs først
1. Find og læs `virksomhedsprofil.md` (altid) og `voice-profil.md` (klagen er
   tekst udadtil).
2. Findes de ikke: sig det, og spørg kun om virksomhedens navn, branche og
   tone - ét ad gangen.

## Arbejdsgang
1. **Interview.** Ét spørgsmål ad gangen: Hvad blev aftalt (ordre, dato, pris)?
   Hvad skete der i stedet? Hvad vil I opnå (omlevering, prisnedslag, ophævelse)?
   Grav videre indtil du har datoer og beløb - "de plejer at levere dårligt" er
   ikke en klage, det er en stemning.
2. **Brief.** 5 linjer: aftalt, sket, krav, tone, deadline. **HARD GATE:
   skriv intet før briefen er godkendt.** Mangler du fakta: spørg.
3. **Skriv klagen:** fakta først (aftalt vs. leveret, med datoer), derefter
   konsekvensen for jer, derefter det konkrete krav med svarfrist. Saglig og
   venlig - vred tekst svækker kravet.
4. **Tjek:** alle påstande har dato/bilag; kravet er ét og konkret; frist er
   realistisk (typisk 8-14 dage); tonen består "kan vi stadig handle sammen
   bagefter?"-testen.
5. **Aflevér** som udkast med forslag til forsendelse og opfølgningsdato.

## Aldrig-regler
1. Aflevér altid som kladde - send aldrig selv.
2. Truslen om ophævelse eller advokat kun hvis brugeren eksplicit beder om det -
   og flag da at købelovens regler om reklamation bør vendes med en rådgiver;
   citér aldrig lovtekst efter hukommelsen, henvis til retsinformation.dk.
3. Opfind aldrig datoer, beløb eller aftalevilkår - mangler de: spørg.
4. AI anbefaler - mennesket beslutter: ved tvist over 50.000 kr. eller
   kontraktophævelse henvises til jurist før afsendelse.

## Output
Skriv altid til: `klage-[leverandoer]-[aar-md-dag].md`
# Reklamation: [leverandør] - [emne]
## Sagsfremstilling (aftalt vs. leveret, med datoer)
## Vores krav og frist
## Antagelser og aabne spoergsmaal (altid med)
## Kilder (altid med)

## Relaterede skills
- For klager fra jeres egne kunder, brug `kundesvar`.
- For at vurdere om kontrakten holder, brug `kontrakt-tjek`.
```

Bemærk hvad eksemplet gør rigtigt: description i brugerens hverdagssprog med negativ afgrænsning; hard gate med spørg-udvej; ingen hardcodet lovtekst; navngivet artefakt med faste overskrifter; eskalationstrigger med beløbsgrænse. Det er de fem ting flest nye skills mangler.
