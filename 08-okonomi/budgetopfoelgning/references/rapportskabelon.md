# Rapportskabelon - én-sides ledelsesrapport + afvigelsestabel

Indhold:

1. [Principper](#1-principper)
2. [Skabelonen (kopiér denne)](#2-skabelonen-kopier-denne)
3. [Feltbeskrivelser](#3-feltbeskrivelser)
4. [Udfyldt eksempel](#4-udfyldt-eksempel)
5. [Deling med direktionen](#5-deling-med-direktionen)

## 1. Principper

- **Samme skabelon hver måned.** Værdien af månedsrapporten ligger i sammenligneligheden: når strukturen er identisk, kan ejeren og banken følge tallene over tid uden at lede. Flyt aldrig sektioner rundt, omdøb dem ikke, og tilføj ikke nye uden brugerens eksplicitte ønske.
- **Én side betyder én side.** Side 1 er hele rapporten: overblik, kommentarer, reforecast, handlinger. Afvigelsestabellen, antagelser og kilder er bilag. Kan noget ikke være der, er det ikke vigtigt nok - eller kommentarerne er for lange.
- **Beløb i t.kr.** (tusinde kroner) i rapporten, fulde kroner i bilagstabellen. Skriv enheden i hver tabels hoved.
- **Fortegnskonvention:** + = bedre end budget (gælder også omkostninger: lavere forbrug end budget = +). Skriv konventionen under overbliktabellen.

## 2. Skabelonen (kopiér denne)

```markdown
# Månedsrapport [måned år] - [virksomhedsnavn]

> Status: KLADDE til gennemsyn. Modtager: [ledelse/bank/bestyrelse]. Udarbejdet [dato].
> [KUN hvis reforecast afviger væsentligt fra årsbudget: ⚠ Forventet årsresultat afviger [X] t.kr. fra årsbudgettet - se afsnittet Forventet årsresultat.]

## Overblik

| Linje (t.kr.) | Budget md. | Faktisk md. | Afv. kr. | Afv. % | Budget YTD | Faktisk YTD | Afv. kr. | Afv. % |
|---|---|---|---|---|---|---|---|---|
| Omsætning | | | | | | | | |
| Dækningsbidrag | | | | | | | | |
| Faste omkostninger | | | | | | | | |
| Resultat (før skat) | | | | | | | | |
| Likviditet (ultimo) | | | | | - | - | - | - |

_+ = bedre end budget. Beløb i t.kr. Kilder pr. tal: se afvigelsestabellen (bilag)._

## Afvigelseskommentarer

1. **[Linje]: [afvigelse i t.kr. og %]** - [årsag med beløb]. _Klassifikation: [permanent/periodeforskydning/uafklaret]._ [Kilde]
2. ...
[3-5 kommentarer. Kun afvigelser over væsentlighedstærsklen: ±[X] % OG [Y] kr.]

## Forventet årsresultat

- Årsbudget: [ ] t.kr.
- Forventet årsresultat (YTD faktisk + justeret restår): [ ] t.kr.
- Afvigelse: [ ] t.kr. - [inden for/UD OVER] væsentlighedstærsklen.
- Justeringer af restår: [liste pr. permanent afvigelse med beløb, eller "ingen"].

## Handlingsforslag

1. [Konkret handling] - ansvarlig: [navn/rolle], senest: [tidspunkt].
[1-3 forslag. Kun handlinger der følger af permanente afvigelser eller flag i rapporten.]

---

## Bilag A: Afvigelsestabel

| Rapportlinje | Konto/kilde | Budget md. | Faktisk md. | Afv. kr. | Afv. % | Budget YTD | Faktisk YTD | Afv. kr. | Afv. % |
|---|---|---|---|---|---|---|---|---|---|
[Alle rapportlinjer med underliggende konti. Kildekolonnen er obligatorisk: fil, fane/række eller kontonummer.]

## Antagelser og aabne spoergsmaal

- Væsentlighedstærskel anvendt: ±[X] % OG [Y] kr. [kilde: virksomhedsprofil/aftalt i denne session]
- [Alle [ANTAGELSE]- og [DATAHUL]-markeringer samlet her, én pr. linje.]

## Kilder

- Faktiske tal: [filnavn], eksporteret [dato] fra [økonomisystem], [fane/rapporttype].
- Budget: [filnavn], version/dato.
```

## 3. Feltbeskrivelser

| Felt | Regler |
|---|---|
| Statuslinjen | Altid med, altid "KLADDE" - skillen sender aldrig selv. Advarselslinjen om reforecast medtages KUN når flagningsreglen udløses (se afvigelsesanalyse.md, afsnit 6) - en advarsel der altid står der, læses aldrig. |
| Overblik | Præcis de fem linjer, i den rækkefølge. Likviditet er ultimosaldo fra bankafstemning/kontoudtog - kun ét tal, ingen prognose (prognoser hører til i skillen `likviditetsoverblik`). Findes der ikke et likviditetstal i data: [DATAHUL], ikke et skøn. |
| Afvigelseskommentarer | 3-5 stk. Hver kommentar: beløb + procent, årsag med beløb, klassifikation, kildereference. Skriv efter skidt/godt-eksemplet i SKILL.md. |
| Forventet årsresultat | Formlen og justeringslogikken står i afvigelsesanalyse.md, afsnit 6. Justeringstabellen vises selv når justeringen er nul ("ingen") - fraværet af justeringer er også information. |
| Handlingsforslag | Maks 3. Hvert forslag har en ansvarlig og en frist - et forslag uden begge dele er en hensigt, ikke en handling. Foreslå kun handlinger inden for det rapporten viser; strategiske beslutninger hører til hos ledelsen. |
| Afvigelsestabel | Fuld detaljering med underkonti. Det er her kildekravet fra Jernloven indfries række for række. |
| Antagelser | Tom sektion findes ikke - som minimum står væsentlighedstærsklen her. |

## 4. Udfyldt eksempel

Anonymiseret eksempel på side 1 (bilag udeladt her). Brug det til at ramme detaljeringsgrad og tone - ikke til at kopiere tal:

```markdown
# Månedsrapport juni 2026 - Håndværk ApS

> Status: KLADDE til gennemsyn. Modtager: ledelse + bank. Udarbejdet 7. juli 2026.

## Overblik

| Linje (t.kr.) | Budget md. | Faktisk md. | Afv. kr. | Afv. % | Budget YTD | Faktisk YTD | Afv. kr. | Afv. % |
|---|---|---|---|---|---|---|---|---|
| Omsætning | 820 | 708 | -112 | -14 % | 4.750 | 4.655 | -95 | -2 % |
| Dækningsbidrag | 385 | 322 | -63 | -16 % | 2.230 | 2.176 | -54 | -2 % |
| Faste omkostninger | 265 | 271 | -6 | -2 % | 1.590 | 1.601 | -11 | -1 % |
| Resultat (før skat) | 120 | 51 | -69 | -58 % | 640 | 575 | -65 | -10 % |
| Likviditet (ultimo) | 450 | 512 | +62 | +14 % | - | - | - | - |

_+ = bedre end budget. Beløb i t.kr._

## Afvigelseskommentarer

1. **Omsætning: -112 t.kr. (-14 %)** - fakturaen på etape 2 til Kunde A (80 t.kr.) rykkede til juli, da aflevering blev forsinket en uge. _Klassifikation: periodeforskydning - udlignes i juli._ (Konto 1010, faktura 2117)
2. **Omsætning: heraf -32 t.kr.** - serviceaftalen med Kunde B opsagt pr. 1/5; juni er anden måned uden aftalen. _Klassifikation: permanent - indregnet i reforecast._ (Konto 1020, kundeliste)
3. **Dækningsbidrag: -63 t.kr. (-16 %)** - følger omsætningsafvigelsen; dækningsgraden er 45,5 % mod budgetteret 47,0 %, primært materialeprisstigning på 9 t.kr. hos [leverandør]. _Klassifikation: uafklaret - [UAFKLARET: er prisstigningen varig? Afklares med leverandør]._ (Konto 2010)

## Forventet årsresultat

- Årsbudget: 1.310 t.kr.
- Forventet årsresultat: 1.216 t.kr. (YTD 575 + justeret restår 641)
- Afvigelse: -94 t.kr. - inden for væsentlighedstærsklen på årsniveau (±10 % og 150 t.kr.).
- Justeringer af restår: Kunde B-opsigelse -16 t.kr./md. i 6 måneder = -96 t.kr. (DB-effekt).

## Handlingsforslag

1. Afklar med [leverandør] om materialeprisstigningen er varig - ansvarlig: indkøb/ejer, senest: 15. juli.
2. Erstatningssalg for Kunde B: kontakt de to varmeste emner fra pipelinen - ansvarlig: ejer, senest: udgangen af juli.
```

Bemærk hvad eksemplet gør: hver kommentar har beløb, kilde og klassifikation; broen for omsætningen summer (80 + 32 = 112); YTD-kolonnen viser at juni-dramaet er lille på årsbasis; det uafklarede punkt står åbent i stedet for at blive gættet.

## 5. Deling med direktionen

Grænsen mod `bestyrelsespakke` (01-direktionen): **økonomi leverer tallene, direktionen fortællingen.** Skal der laves bestyrelsesmateriale, genbruges denne rapports overbliktabel og afvigelsestabel som talgrundlag - byg aldrig et separat, konkurrerende talsæt. Peg brugeren på `bestyrelsespakke` og aflevér denne rapport som input til den.
