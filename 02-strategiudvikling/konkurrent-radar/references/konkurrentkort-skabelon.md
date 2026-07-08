# Skabeloner: konkurrentkort.md og radar-Q[x]-[aar].md

Faste skabeloner for radarens to artefakter plus et udfyldt minieksempel. Følg strukturen præcist - faste felter gør kortet sammenligneligt fra kvartal til kvartal.

## Indhold

1. [Skabelon: konkurrentkort.md](#1-skabelon-konkurrentkortmd)
2. [Skabelon: radar-Q[x]-[aar].md](#2-skabelon-radar-qx-aarmd)
3. [Udfyldt minieksempel (én konkurrent)](#3-udfyldt-minieksempel)
4. [Vedligeholdelsesregler](#4-vedligeholdelsesregler)

## 1. Skabelon: konkurrentkort.md

```markdown
# Konkurrentkort - [virksomhedsnavn]

> Version: [aar-md-dag] | Forrige version: [dato] | Næste opdatering: [kvartal]
> Status: KLADDE indtil godkendt af [ejerleder]

## Overblik

| Konkurrent | Position (kort) | Prisleje vs. os | Seneste træk (dato) |
|---|---|---|---|
| [Navn 1] | ... | over/niveau/under/ved ikke | ... |
| [Navn 2] | ... | ... | ... |

## [Konkurrent 1 - navn] (CVR: [nr])

**Fakta** (hvert punkt med kilde + dato):

- **Position/målgruppe:** [hvem sælger de til, med hvilket løfte]
- **Prisleje vs. os:** [over / på niveau / under / ved ikke - beløb kun med kilde]
- **Oplevede styrker:** [fra tabte tilbud, kundeudsagn, anmeldelsesmønstre - med kilde]
- **Oplevede svagheder:** [samme krav]
- **Seneste træk:** [dateret + kildehenvist - kun indeværende/seneste kvartal]
- **Hvor møder vi dem:** [konkrete tabte/vundne tilbud og situationer, cirka-datoer]
- **Nøgletal (proxyer, årsrapport [periode]):** bruttofortjeneste [x] ([udvikling]),
  soliditetsgrad [x %], gns. ansatte [x] ([udvikling]) - klasse B, omsætning ukendt

**Vores læsning** (tolkning - adskilt fra fakta ovenfor):

[2-4 linjer: hvad tror vi de er i gang med, og hvor sikre er vi. Begrundet i fakta.]

### Historik - [Konkurrent 1]

- [aar-md-dag]: [tidligere "seneste træk" flyttes hertil ved hver opdatering]

[... gentag afsnittet pr. konkurrent, 5-8 i alt ...]

## Ved ikke-listen (åbne huller i billedet)

- [felter vi ikke har kunnet dække, og hvorfor]

## Kilder

- [samlet kildeliste med datoer]
```

## 2. Skabelon: radar-Q[x]-[aar].md

```markdown
# Konkurrent-radar Q[x] [aar]

> Dækker: [dato] til [dato] | Bygger på konkurrentkort version [dato]
> Status: KLADDE indtil godkendt

## Ændringer siden sidst

[KUN ændringer. Uændrede konkurrenter: én linje. Fakta med kilde + dato pr. punkt.]

1. **[Konkurrent]:** [ændringen] (kilde, dato)
2. ...

Uændret: [Konkurrent X], [Konkurrent Y] - ingen væsentlige ændringer fundet
([antal] opslag pr. konkurrent).

## Hvad betyder det for os

[Én tolkning pr. ændring, nummereret som ovenfor. Begrundet i fakta - og markeret
som tolkning.]

## Beslutningsspørgsmål til ledelsen

[Kun hvis en ændring kalder på en beslutning. Formuleret som spørgsmål, aldrig
anbefaling. Henvis til `beslutningsgrundlag` for dybdeboring. Kan være tom - skriv
da "Ingen dette kvartal".]

## Ikke undersøgt / ved ikke

[Hvad nåede vi ikke, hvad kunne ikke findes - altid med, også når den er kort.]

## Kilder

[Alle kilder med dato.]
```

## 3. Udfyldt minieksempel

Fiktiv konkurrent i et fiktivt marked - viser detaljeringsgraden og fakta/tolkning-adskillelsen:

```markdown
## Nordjysk Montage ApS (CVR: 12345678)

**Fakta:**

- **Position/målgruppe:** industrimontage for mellemstore produktionsvirksomheder
  i Nord- og Midtjylland; markedsfører sig på hurtig udrykning (egen hjemmeside,
  læst 03-07-2026)
- **Prisleje vs. os:** under - timepris 545 kr. mod vores 625 kr. (deres prisliste,
  03-07-2026)
- **Oplevede styrker:** leveringshastighed - gennemgående tema i 23 Google-
  anmeldelser (læst 03-07-2026); vandt Fjordstaal-opgaven fra os på levering
  (vores tilbudslog, maj 2026)
- **Oplevede svagheder:** dokumentation og efterservice - klagemønster i samme
  anmeldelser; "ved ikke" om det gælder større kontrakter
- **Seneste træk:** 2 montørstillinger + 1 projektleder opslået med base i Randers
  (Jobindex, 14-06-2026 og 21-06-2026)
- **Hvor møder vi dem:** tabt: Fjordstaal (maj 2026); vundet: Dana Hydraulik
  (marts 2026, kunden nævnte deres "rodede tilbud")
- **Nøgletal (proxyer, årsrapport 01-01-2025 til 31-12-2025):** bruttofortjeneste
  6,8 mio. kr. (+12 % mod 2024), soliditetsgrad 41 %, gns. 19 ansatte (+3) -
  klasse B, omsætning ukendt (CVR, offentliggjort 28-05-2026)

**Vores læsning:** De ekspanderer sydpå mod Randers/Aarhus-området - vores
kerneområde - med lav pris og hurtig levering som spyd. Solid økonomi (proxy:
stigende bruttofortjeneste, soliditet 41 %), så det er næppe et desperat træk.
Usikkerhed: vi ved ikke om projektlederstillingen er nyoprettet eller en erstatning.

### Historik - Nordjysk Montage ApS

- 2026-04-07: lancerede fastpris-koncept for serviceaftaler (deres nyhedsside)
- 2026-01-09: ny direktør tiltrådt (CVR-registrering 02-01-2026)
```

## 4. Vedligeholdelsesregler

1. **Historik bevares altid.** Ved hver kvartalsopdatering flyttes det gamle "seneste træk" til konkurrentens historikafsnit med dato. Der slettes aldrig linjer fra historikken.
2. **Ændringer markeres i kladden.** Alt nyt/ændret siden sidste version markeres **[ÆNDRET]** eller **[NYT]** så godkendelsen tager minutter, ikke timer. Markeringerne fjernes først når brugeren har godkendt.
3. **Konkurrenter tilføjes/fjernes kun med begrundelse.** En konkurrent der fjernes fra kortet får en afsluttende historiklinje ("udgået af kortet [dato]: [hvorfor]") - afsnittet arkiveres nederst, det slettes ikke.
4. **Kortet holder sig på 5-8 konkurrenter.** Kandidat nummer 9 kræver at en anden ryger ud - ellers vokser kortet til en rapport ingen vedligeholder.
5. **Version + dato øverst opdateres ved hver godkendt ændring.** Radar-rapporterne (radar-Q[x]-[aar].md) røres aldrig efter godkendelse - de er kvartalets tidsstemplede historik.
