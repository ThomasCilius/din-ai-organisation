# Afvigelsesanalyse - metode, klassifikation og bro-forklaring

Indhold:

1. [Dobbelt væsentlighedstærskel](#1-dobbelt-vaesentlighedstaerskel)
2. [Kroner og procent - altid begge](#2-kroner-og-procent---altid-begge)
3. [Klassifikation: permanent vs. periodeforskydning](#3-klassifikation-permanent-vs-periodeforskydning)
4. [Bro-forklaring med gennemregnet eksempel](#4-bro-forklaring-med-gennemregnet-eksempel)
5. [YTD-disciplin](#5-ytd-disciplin)
6. [Reforecast: forventet årsresultat](#6-reforecast-forventet-aarsresultat)
7. [Typiske faldgruber](#7-typiske-faldgruber)

## 1. Dobbelt væsentlighedstærskel

Kommentér kun afvigelser der overskrider BÅDE en procenttærskel OG en kronetærskel. Begge betingelser skal være opfyldt.

Hvorfor dobbelt? Fordi hver tærskel alene lyver:

- **Procent alene:** et budget på 2.000 kr. til kontorartikler der bliver til 2.900 kr. er +45 % - og fuldstændig ligegyldigt. Rapporten drukner i støj.
- **Kroner alene:** 50.000 kr. lyder af meget, men er 0,8 % på en omsætning på 6 mio. - sandsynligvis normal variation.

Tærsklerne aftales i interviewet eller hentes fra `virksomhedsprofil.md`. Har brugeren ingen holdning, så foreslå et udgangspunkt der passer til virksomhedens størrelse, fx:

| Årsomsætning (ca.) | Procenttærskel | Kronetærskel |
|---|---|---|
| Under 2 mio. kr. | ±10 % | 10.000 kr. |
| 2-10 mio. kr. | ±10 % | 25.000 kr. |
| 10-50 mio. kr. | ±8 % | 75.000 kr. |

Tallene er forslag til samtalen - ikke facit. Få dem bekræftet, og skriv de valgte tærskler i rapportens antagelsessektion, så læseren ved hvad der er filtreret fra.

**Undtagelse:** en afvigelse UNDER tærsklen kommenteres alligevel hvis den er tredje måned i træk i samme retning. Tre små ens afvigelser er én tendens - og tendenser er vigtigere end enkeltmåneder.

## 2. Kroner og procent - altid begge

Hver linje i afvigelsestabellen viser afvigelsen som kroner OG procent:

- Kronerne svarer på: gør det ondt?
- Procenten svarer på: er det ude af proportion?

Fortegnskonvention i rapporten: positiv afvigelse = bedre end budget, negativ = dårligere. Det betyder at LAVERE omkostninger end budget vises som POSITIV afvigelse. Skriv konventionen i tabelhovedet ("+ = bedre end budget"), så læseren aldrig er i tvivl. Bland aldrig konventioner i samme rapport.

## 3. Klassifikation: permanent vs. periodeforskydning

Hver eneste afvigelseskommentar bærer én af to etiketter. Det er den vigtigste controller-dømmekraft i hele rapporten, fordi de to typer kræver helt forskellige reaktioner:

| | Periodeforskydning | Permanent afvigelse |
|---|---|---|
| Hvad er det? | Beløbet kommer/kom bare i en anden måned | Niveauet har ændret sig varigt |
| Eksempler | Faktura rykket til næste måned; forudbetalt forsikring; projekt afsluttet tidligere end budgetteret; ferielukning | Mistet eller vundet kunde; prisstigning fra leverandør; ny medarbejder; huslejestigning; varigt ændret salgsniveau |
| Handling | Ingen - notér hvornår den udligner | Handlingsforslag + indregnes i reforecast |
| Reforecast-effekt | Nul på årsbasis | Fuld effekt for resten af året |

**Afgørelsesspørgsmål** - stil dem i denne rækkefølge:

1. Udligner afvigelsen sig selv inden for 1-2 måneder, uden at nogen gør noget? → periodeforskydning.
2. Skyldes den en konkret engangshændelse der ikke gentager sig (fx en enkeltstående reparation)? → notér som "engangspost" - en underart af periodeforskydning på årsbasis, men den udligner ikke; den forsvinder bare.
3. Vil afvigelsen gentage sig hver måned fremover hvis intet ændres? → permanent.
4. Kan du ikke afgøre det ud fra data og brugerens svar? → skriv "[UAFKLARET: kræver afklaring hos bogholder/ejer]" og klassificér IKKE. En forkert klassifikation er værre end en åben.

**Test på klassifikationen:** hvis alle måneder resten af året rammer budgettet præcist, står afvigelsen der så stadig ved årets udgang? Ja = permanent (eller engangspost). Nej = periodeforskydning.

## 4. Bro-forklaring med gennemregnet eksempel

En bro forklarer totalafvigelsen som en sum af navngivne delposter. Reglen: **delposterne + en eksplicit rest = totalafvigelsen.** Summer broen ikke, mangler der en forklaring - og så skrives DET, i stedet for at en af de kendte poster pustes op.

Gennemregnet eksempel (resultat 80 t.kr. under budget):

| Post | Beløb | Klassifikation | Kilde |
|---|---|---|---|
| Faktura til kunde A rykket til juli | -55 t.kr. | Periodeforskydning | Konto 1010, faktura 2117 |
| Kunde B opsagde aftale pr. 1/5 | -32 t.kr. | Permanent | Konto 1010, kundeliste |
| Lavere fragtomkostninger | +12 t.kr. | Uafklaret - kan være periodeforskydning | Konto 2800 |
| Øvrige poster (rest) | -5 t.kr. | Under væsentlighedstærskel | Diverse |
| **Total afvigelse, resultat** | **-80 t.kr.** | | Resultatopgørelse, række 22 |

Kontrol: -55 - 32 + 12 - 5 = -80. Broen summer.

Skriveform i rapporten: "Resultatet er 80 t.kr. under budget fordi: a) fakturaen til kunde A rykkede til juli (-55 t.kr., periodeforskydning - udlignes i juli), b) kunde B opsagde sin aftale (-32 t.kr., permanent - indregnet i reforecast), c) fragtomkostningerne var lavere end budgetteret (+12 t.kr., uafklaret), d) øvrige poster netto -5 t.kr."

Restposten ("øvrige poster") skal være LILLE i forhold til totalen - som tommelfingerregel under 20 %. Er resten større, har du ikke forklaret afvigelsen, og det skal stå åbent i rapporten.

## 5. YTD-disciplin

Vis altid to kolonnesæt: måneden OG år-til-dato (YTD). Månedstal alene skjuler tendenser i begge retninger:

- En måned kan se fin ud, mens YTD viser at virksomheden gradvist sakker bagud.
- En måned kan se katastrofal ud alene på grund af en periodeforskydning som YTD allerede har udlignet.

YTD-kolonnen er også dér periodeforskydninger afslører sig selv: en ægte forskydning fra sidste måned giver stor månedsafvigelse men lille YTD-afvigelse. Brug det aktivt som kontrol af klassifikationen i afsnit 3.

## 6. Reforecast: forventet årsresultat

Formel: **forventet årsresultat = YTD faktisk + resten af året**.

"Resten af året" er som udgangspunkt budgettet for de resterende måneder - MEN justeret for alle afvigelser klassificeret som permanente:

1. Start med restårets budget.
2. For hver permanent afvigelse: justér de berørte linjer for de resterende måneder (fx mistet kunde B: -32 t.kr. omsætning × antal restmåneder).
3. Vis justeringerne åbent i en lille tabel: restårsbudget → justering pr. permanent afvigelse → justeret restår.
4. Periodeforskydninger justeres IKKE - de udligner sig selv.

**Flagningsregel:** afviger det forventede årsresultat væsentligt fra årsbudgettet (brug samme dobbelte tærskel, målt på årsniveau), skal det stå ØVERST i rapporten - ikke gemt i et bilag. Det er præcis dét banken og ejeren skal reagere på i god tid. Anbefal i så fald at ejeren tager dialogen med banken proaktivt - banker straffer overraskelser, ikke dårlige nyheder.

## 7. Typiske faldgruber

| Faldgrube | Hvorfor den opstår | Modtræk |
|---|---|---|
| Kommentere alle afvigelser | Føles grundigt | Dobbelt tærskel - maks 3-5 kommentarer |
| Procent på småbeløb | Store procenter fanger øjet | Kronetærsklen filtrerer dem fra |
| Bro der ikke summer | Delforklaringer findes én ad gangen | Kontrolsummen i afsnit 4 er obligatorisk |
| Alt klassificeres som forskydning | Det er den behagelige forklaring | Test: står afvigelsen der stadig ved årets udgang? |
| Reforecast = budgettet, altid | Det er mindst arbejde | Permanente afvigelser SKAL slå igennem i restår |
| Sammenligne mod forrige måned i stedet for budget | Data er lettere tilgængelige | Budgettet er målestokken; forrige måned må gerne nævnes som supplement |
| Skjulte skøn ved datahuller | Rapporten "ser færdig ud" | [DATAHUL]-markering - se Jernloven i SKILL.md |
