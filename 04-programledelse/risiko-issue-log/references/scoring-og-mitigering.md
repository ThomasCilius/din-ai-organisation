# Scoring (3x3) og de fire mitigeringsstrategier

## 3x3-matrixen

Score = sandsynlighed (1-3) x konsekvens (1-3). Heltal, ingen decimaler, ingen procenter. 3x3 er nok i en SMV - en 5x5 med decimaler giver falsk præcision og bruges alligevel aldrig; det er teater.

**Sandsynlighed** (inden for projektets levetid):

| S | Forankring |
|---|------------|
| 1 | Usandsynlig - vil overraske hvis den indtræffer |
| 2 | Kan ske - er set før i lignende projekter/hos os |
| 3 | Forvent den - indtræffer snarere end ej, hvis intet gøres |

**Konsekvens** - kalibrér RELATIVT til projektet (brug virksomhedsprofil.md og kommissoriet, aldrig absolutte beløb fra hukommelsen):

| K | Forankring |
|---|------------|
| 1 | Mærkbar, men håndteres inden for planen - bufferen holder |
| 2 | Skubber en milepæl eller koster synligt på budgettet |
| 3 | Truer projektets succeskriterier, sluttermin eller økonomi som helhed |

## Hvad scoren bruges til - og ikke til

- Scoren bruges ALENE til at sortere: de 5-10 højeste bliver aktive risici, resten parkeres på watch-listen.
- Watch-listen: typisk score 1-2. Ingen aktiv styring - genvurderes ved hver gennemgang. En parkeret risiko er ikke glemt, den er bevidst nedprioriteret.
- Scoren er ikke en sandhed, den er en sorteringsnøgle. Diskutér aldrig om en risiko "rigtigt" er 4 eller 6 - diskutér om den skal styres aktivt eller ej.
- Score 9 (3x3): indstil ALTID til eskalering til projektejeren nu - ikke ved næste statusmøde.
- Score 6+ uden mulig mitigering: samme - det er en ledelsesbeslutning, ikke en projektlederbeslutning.

## De fire mitigeringsstrategier

Vælg præcis én pr. aktiv risiko. Strategien skriver sig ind i kolonnen "Strategi"; den konkrete handling i "Mitigering / næste handling".

| Strategi | Hvad den gør | Vælg den når | Eksempel |
|----------|--------------|---------------|----------|
| **Undgå** | Fjerner årsagen - planen, valget eller metoden ændres, så risikoen ikke kan opstå | Årsagen kan fjernes billigere end konsekvensen koster | Drop den ukendte integration; brug manuel eksport i fase 1 |
| **Reducér** | Sænker sandsynligheden ELLER konsekvensen | Risikoen ikke kan fjernes, men kan gøres mindre eller opdages tidligere | Sidemandsoplæring af nummer to på nøglepersonens opgaver |
| **Overfør** | Flytter den økonomiske konsekvens til en anden - forsikring, kontraktvilkår, bod, fastpris | En anden part er nærmere til at bære eller styre risikoen | Dagbod og delleverance-terminer i leverandørkontrakten |
| **Acceptér** | Et AKTIVT valg om at leve med risikoen | Mitigering koster mere end forventet skade, eller risikoen ligger uden for jeres kontrol | "Valutaudsving på ét indkøb accepteres - beløbet er lille" |

Tre skøn der ofte går galt:

1. **Overførsel fjerner sjældent hele konsekvensen.** En dagbod kompenserer ikke en tabt kunde; en forsikring dækker ikke forsinkelsen. Notér restkonsekvensen.
2. **Acceptér er et aktivt valg, ikke et fravær af handling.** Det noteres altid med begrundelse og genvurderingsdato - ellers er det bare en glemt risiko.
3. **Reducér skal pege på S eller K.** Skriv hvilken af de to handlingen sænker - "vi holder øje" reducerer ingenting.

## Eskaleringsregler

Indstil til eskalering (mennesket eskalerer, loggen indstiller) når:

- en risiko rammer score 9, eller score 6+ uden realistisk mitigering inden for projektlederens mandat
- et issue kræver penge, mandskab eller beslutninger ud over projektets ramme
- et issue rummer muligt kontraktbrud eller tvist - henvis til projektejer OG anbefal juridisk vurdering (`kontrakt-tjek` kan forberede den)
- den samme risiko er hævet ved tre gennemgange i træk uden at mitigeringen har virket - så virker planen ikke, og det er en ledelsesinformation

Formatet for en eskaleringsindstilling: årsag, konsekvens hvis intet gøres, og den ønskede ledelseshandling som ét ja/nej-spørgsmål.
