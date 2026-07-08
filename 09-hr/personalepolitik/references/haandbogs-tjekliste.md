# Personalehåndbog: standardindhold og gap-analyse

Bruges når brugeren vil vide hvad der mangler i en hel personalehåndbog (spor "gap-analyse" i arbejdsgangens trin 1). Filen har to dele: en tjekliste over standardindholdet i en dansk SMV-personalehåndbog, og en fast procedure for at sammenholde en eksisterende håndbog med listen. Tjeklisten er et udgangspunkt, ikke et lovkrav om at ALT skal med - en lille virksomhed behøver ikke hver politik. Formålet er at gøre hullerne synlige og prioritere dem, ikke at fylde håndbogen.

## Indhold

1. [Standardindholdet](#1-standardindholdet)
2. [Gap-analyse-proceduren](#2-gap-analyse-proceduren)
3. [Outputformat: gap-analysen](#3-outputformat)

## 1. Standardindholdet

Kolonnen "Skal indeholde" er minimum for at politikken er brugbar. Kolonnen "Lov" markerer om emnet rører lovgivning og derfor skal læses mod `lovrammer.md` og flages - `nej` betyder at det i al væsentlighed er virksomhedens eget valg.

| Politik | Skal indeholde | Lov |
|---|---|---|
| Ferie og fridage | Varsling og planlægning af ferie, hovedferie/restferie, feriefridage/6. ferieuge hvis givet, afspadsering | ja (ferieloven) |
| Sygdom og fravær | Hvordan og hvornår man melder sig syg, raskmelding, sygefraværssamtale, dokumentationskrav | ja (sygedagpengeloven) |
| Barsel og forældreorlov | Varsling, virksomhedens eventuelle løn under barsel, hvem der hjælper med det praktiske | ja (barselsloven - verificér ALTID) |
| Arbejdstid og fleks | Normal arbejdstid, fleks/kernetid, registrering, overarbejde/afspadsering, pauser | ja (arbejdstid kan være væsentligt vilkår) |
| Hjemmearbejde | Hvor mange dage, efter aftale med hvem, udstyr, tilgængelighed, hjemmearbejdspladsens indretning | delvist (kan røre arbejdsmiljø + vilkår) |
| IT- og AI-brug | Godkendte værktøjer, forbud mod fortrolige data i uautoriserede tjenester, ansvar for output, eventuel logning | delvist (GDPR, tavshedspligt) |
| Rusmidler | Alkohol- og rusmiddelregel i arbejdstid og til arrangementer, hvad der sker ved brud, hjælp/handleplan | delvist (kontrol/test kræver hjemmel) |
| Gaver og repræsentation | Beløbsgrænse for gaver man må modtage, hvad der skal afvises/indberettes, repræsentation | nej (virksomhedens eget valg) |
| Tavshedspligt og fortrolighed | Hvad der er fortroligt, at pligten gælder efter fratræden, henvisning til ansættelsesaftalen | delvist (følger af aftale/markedsføringsloven) |
| Arbejdsmiljø og APV | Hvordan APV gennemføres, arbejdsmiljøorganisation hvis relevant, hvem man går til | ja (arbejdsmiljøloven) |
| Adfærd, chikane og ligebehandling | Forventet omgangstone, nultolerance for chikane, hvor man henvender sig, whistleblower hvis 50+ | ja (ligebehandling, arbejdsmiljø) |
| Personalegoder | Konkrete goder virksomheden tilbyder (pension, sundhedsordning, frugt, mv.) og på hvilke betingelser | delvist (kan være vilkår - se lovrammer.md afsnit 4) |

De første ni rækker er kernelisten; de sidste tre er almindeligt forventede i en dansk håndbog og bør nævnes i en gap-analyse, men er ikke obligatoriske for enhver virksomhed.

## 2. Gap-analyse-proceduren

1. **Læs den eksisterende håndbog** som brugeren udpeger - opsøg aldrig selv andre filer.
2. **Kortlæg mod tabellen.** For hver politik i tabellen: findes den, og indeholder den minimumsindholdet i "Skal indeholde"?
3. **Giv hver politik én status:**
   - `findes` - politikken er der og dækker minimum.
   - `mangelfuld` - findes, men mangler et eller flere minimumselementer (nævn hvilke).
   - `mangler` - findes ikke.
   - `foraeldet` - findes, men henviser til gamle regler, hardcodede satser eller en revisionsdato der er overskredet.
4. **Flag lovtunge og foranderlige politikker.** Politikker markeret `ja`/`delvist` i Lov-kolonnen, som har status `mangelfuld` eller `foraeldet`, er højest prioritet - især barsel, ferie og sygefravær, hvor forkert indhold rammer folks planlægning og virksomhedens ansvar.
5. **Prioritér.** Ranger hullerne: (1) lovtunge og forkerte/manglende først, (2) emner med en aktuel udløsende situation, (3) resten. Overvæld ikke brugeren - anbefal de 3-5 vigtigste at skrive først.
6. **Foreslå næste skridt, ikke en bunke.** Tilbyd at skrive den øverste manglende politik nu (som en normal ny politik efter arbejdsgangen), i stedet for at generere alt på én gang.

## 3. Outputformat

Gap-analysen skrives til `gap-analyse-personalehaandbog-[aar-md-dag].md` med denne struktur:

```markdown
# Gap-analyse: personalehåndbog - [dato]

## Overblik
[2-3 linjer: hvad er gennemgået, hvor mange politikker findes, hvor mange huller.]

## Status pr. politik
| Politik | Status | Mangler / bemærkning | Lov | Prioritet |
|---|---|---|---|---|
| Ferie og fridage | findes | - | ja | - |
| Sygdom og fravær | mangelfuld | ingen frist for sygefraværssamtale | ja | 1 |
| ... | ... | ... | ... | ... |

## Anbefalet rækkefølge (de 3-5 vigtigste)
1. [Politik] - [hvorfor først: lovtung + mangelfuld / aktuel situation]
2. ...

## Antagelser og aabne spoergsmaal
[Hvad der ikke kunne vurderes uden mere info.]

---
Denne gap-analyse er et udkast. Politikker der roerer lovgivning skal gennemgaas med jurist
eller arbejdsgiverorganisation foer ikrafttraeden.
```

Gap-analysen er en oversigt, ikke selve politikkerne. Når brugeren vælger hvad der skal skrives, kører du hver politik gennem den normale arbejdsgang med brief-gate og lovtjek - gap-analysen erstatter aldrig den enkelte politiks kvalitetskrav.
