# De tre kalkulationsmodeller - formler og gennemregnede eksempler

Indhold:

1. [Modelvalg - hurtigt overblik](#1-modelvalg---hurtigt-overblik)
2. [Timepriskalkulation](#2-timepriskalkulation)
3. [Kostpris-plus](#3-kostpris-plus)
4. [Dækningsbidragsmodellen](#4-daekningsbidragsmodellen)
5. [Sociale omkostninger - komponenterne](#5-sociale-omkostninger---komponenterne)
6. [Fakturerbarhed - realistiske intervaller](#6-fakturerbarhed---realistiske-intervaller)
7. [Typiske fejl på tværs af modellerne](#7-typiske-fejl-paa-tvaers-af-modellerne)

Alle beløb i eksemplerne er opdigtede og ekskl. moms medmindre andet er angivet. Alle satser (feriepenge, pension, ATP, barsel.dk) er cirkatal til illustration - verificér aktuel sats før brug (borger.dk, virk.dk, atp.dk, skat.dk).

---

## 1. Modelvalg - hurtigt overblik

| Situation | Model | Hvorfor |
|---|---|---|
| "Hvad skal min timepris være?" | Timepris | Prisen skal dække hele årets økonomi via de timer der reelt kan faktureres |
| "Hvad skal jeg byde på den her opgave?" | Kostpris-plus | Opgaven har konkrete materialer og timer der kan kalkuleres bottom-up |
| "Tjener vi penge på det her produkt?" | Dækningsbidrag | Ved volumen er spørgsmålet hvad hver solgt enhed bidrager med |
| "Skal vi hæve/sænke prisen?" | Dækningsbidrag + følsomhed | Se `noegletal-og-foelsomhed.md` |

Modellerne udelukker ikke hinanden: en håndværker bruger timepriskalkulationen til at fastsætte sin timesats og kostpris-plus til det enkelte tilbud, hvor timesatsen indgår.

---

## 2. Timepriskalkulation

### Formel

```
Timepris = (årsløn × social faktor + andel af faste omkostninger + målresultat)
           ÷ fakturerbare timer pr. år
```

- **Årsløn**: bruttoløn - for ejeren: markedslønnen for det arbejde ejeren udfører.
- **Social faktor**: typisk 1,25-1,4 (se afsnit 5).
- **Andel af faste omkostninger**: den del af virksomhedens faste omkostninger som denne person/rolle skal bære. Én person: det hele. Flere: fordel efter fakturerbare timer eller efter aftalt nøgle.
- **Målresultat**: det overskud virksomheden skal levere oven på lønnen (buffer, investeringer, forrentning af risiko). Sæt det eksplicit - "0 kr." er også en beslutning, og den skal stå synligt.
- **Fakturerbare timer**: se afsnit 6 - ALDRIG det samlede antal arbejdstimer.

### Gennemregnet eksempel: enkeltmandskonsulent

Antagelser (vises altid i eget afsnit i kalkulationsarket):

| Antagelse | Værdi | Kilde |
|---|---|---|
| Ønsket årsløn (brutto, markedsniveau) | 600.000 kr. | Bruger |
| Social faktor | 1,30 | Tommelfingerregel - verificér satser |
| Faste omkostninger pr. år (kontor, software, forsikring, revisor, bil, markedsføring) | 130.000 kr. | Seneste resultatopgørelse |
| Målresultat (buffer/overskud) | 70.000 kr. | Bruger |
| Arbejdstimer pr. år (37 t × 52 uger − ferie/helligdage/sygdom) | ca. 1.650 t | Standardskøn |
| Fakturerbarhed | 65 % | [ANTAGELSE] - bør tælles fra timedata |

Beregning:

```
Lønomkostning:        600.000 × 1,30            = 780.000 kr.
Samlet krav:          780.000 + 130.000 + 70.000 = 980.000 kr.
Fakturerbare timer:   1.650 × 0,65               = ca. 1.070 t
Timepris (minimum):   980.000 ÷ 1.070            = ca. 915 kr./t ekskl. moms
```

### Den naive kalkulation - til kontrast

```
600.000 ÷ 1.924 timer (37 × 52) = 312 kr./t
```

Samme person, samme løn - men uden sociale omkostninger, uden faste omkostninger, uden resultat og med 100 % fakturerbarhed. Den naive timepris er en FAKTOR 3 for lav. Det er derfor korrektionerne ikke er pedanteri: hver udeladt korrektion flytter prisen 20-40 %.

### Følsomhed på fakturerbarheden (vis altid ved timepris)

| Fakturerbarhed | Timer | Minimumtimepris |
|---|---|---|
| 55 % | ca. 908 t | ca. 1.080 kr. |
| 65 % | ca. 1.070 t | ca. 915 kr. |
| 75 % | ca. 1.238 t | ca. 790 kr. |

---

## 3. Kostpris-plus

### Formel

```
Tilbudspris = (materialer inkl. spild + direkte løntimer × kostpris pr. time)
              × (1 + overheadtillæg) × (1 + avance)
```

- **Materialer inkl. spild**: indkøbspris + realistisk spildprocent (branchen kender sin egen - spørg; 3-10 % er almindeligt).
- **Kostpris pr. time**: timeløn × social faktor - IKKE salgstimeprisen. Bruges salgstimeprisen her, bliver avancen lagt på to gange.
- **Overheadtillæg**: dækker faste omkostninger. Beregnes fra regnskabet: faste omkostninger ÷ direkte omkostninger (sidste år). Har virksomheden ikke tallet: markér som [ANTAGELSE] og foreslå 10-20 % som startpunkt.
- **Avance**: virksomhedens fortjeneste og risikodækning. Sættes bevidst og vises separat - den er forhandlingsrummet.

### Gennemregnet eksempel: tømrertilbud på badeværelsesrenovering

| Post | Beregning | Beløb |
|---|---|---|
| Materialer | 42.000 + 5 % spild | 44.100 kr. |
| Direkte løn | 80 t × (220 kr. × 1,32) | 23.230 kr. |
| Direkte omkostninger i alt | | 67.330 kr. |
| Overheadtillæg 15 % | 67.330 × 0,15 | 10.100 kr. |
| Kostpris | | 77.430 kr. |
| Avance 20 % | 77.430 × 0,20 | 15.490 kr. |
| **Tilbudspris ekskl. moms** | | **ca. 92.900 kr.** |
| Tilbudspris inkl. moms (B2C - privat kunde!) | × 1,25 (verificér momssats, skat.dk) | ca. 116.150 kr. |

Bemærk: er kunden privat, SKAL kommunikationen til kunden være inkl. moms - se "Dansk prisformalia" i SKILL.md.

### Kontrolspørgsmål ved kostpris-plus

1. Er timetallet realistisk - inkl. opstart, kørsel, oprydning og uforudset (erfaringstal: +10-20 % på det første skøn)?
2. Er der poster uden for materialer og timer: stillads, leje, bortskaffelse, parkering, underleverandører?
3. Dækker avancen risikoen - fast pris på usikker opgave kræver højere avance end regningsarbejde?

---

## 4. Dækningsbidragsmodellen

### Formler

```
Dækningsbidrag (DB) pr. enhed = salgspris − variable omkostninger pr. enhed
Dækningsgrad (DG)             = DB ÷ salgspris
Nulpunktsomsætning            = faste omkostninger ÷ DG
Nulpunkt i styk               = faste omkostninger ÷ DB pr. enhed
```

Variable omkostninger er ALT der følger med hvert salg: vareforbrug, fragt ind og ud, emballage, betalingsgebyrer, provision, returomkostninger (gennemsnit). Den klassiske fejl er kun at medregne vareforbruget.

### Gennemregnet eksempel: webshopprodukt (B2C)

| Post | Beløb |
|---|---|
| Salgspris inkl. moms (kundens pris) | 499,00 kr. |
| Salgspris ekskl. moms (÷ 1,25 - verificér momssats) | 399,20 kr. |
| Vareforbrug | −180,00 kr. |
| Fragt (gennemsnit ind + ud, inkl. returandel) | −52,00 kr. |
| Emballage | −8,00 kr. |
| Betalingsgebyr (ca. 1,5 % af pris) | −6,00 kr. |
| **DB pr. stk.** | **153,20 kr.** |
| **DG** | **ca. 38 %** |

Faste omkostninger 480.000 kr./år:

```
Nulpunktsomsætning: 480.000 ÷ 0,38 = ca. 1.263.000 kr. ekskl. moms
Nulpunkt i styk:    480.000 ÷ 153,20 = ca. 3.133 stk./år (ca. 260 stk./md.)
```

Konklusionen i anbefalingsnotatet kobler altid tallet til virkeligheden: "I solgte 190 stk./md. sidste kvartal - med nuværende pris og omkostninger er I under nulpunktet. Løsningsrummet er pris op, variable omkostninger ned eller volumen op - se følsomhedsafsnittet."

---

## 5. Sociale omkostninger - komponenterne

Oven på bruttolønnen betaler arbejdsgiveren typisk (alle satser SKAL verificeres - de ændrer sig):

| Komponent | Cirkaniveau (illustration) | Verificér på |
|---|---|---|
| Feriepenge/ferietillæg | ~12,5 % | borger.dk (ferieloven) |
| Pension, arbejdsgiverandel | 8-12 % (overenskomst-/aftaleafhængigt) | egen overenskomst/aftale |
| ATP | fast kronebeløb pr. md. | atp.dk |
| Barsel.dk-bidrag | fast årligt beløb pr. medarbejder | virk.dk |
| Lovpligtige forsikringer (arbejdsskade m.m.) | varierer med branche | forsikringsselskab |
| Andet: kurser, værnemidler, personalegoder, sygdom | virksomhedsspecifikt | eget regnskab |

Sum: typisk **1,25-1,4 × bruttoløn** - håndværk og produktion ofte i den høje ende (forsikring, udstyr), kontorfag i den lave. Brug 1,3 som startpunkt hvis intet bedre kendes, og markér det [ANTAGELSE].

AM-bidrag (8 % - verificér, skat.dk) trækkes af medarbejderens løn og er IKKE en arbejdsgiveromkostning - men når ejeren regner på sin egen disponible indkomst, skal det med i det regnestykke.

---

## 6. Fakturerbarhed - realistiske intervaller

Fakturerbarhed = fakturerbare timer ÷ tilstedeværelsestimer. Resten er ikke spild - det er salg, tilbudsskrivning, administration, bogholderi, transport, efteruddannelse og tomgang mellem opgaver. Det arbejde skal laves; det kan bare ikke faktureres.

| Situation | Typisk fakturerbarhed |
|---|---|
| Solokonsulent/rådgiver (skal selv sælge og administrere) | 55-65 % |
| Konsulent i mindre firma med pipeline | 65-75 % |
| Håndværker på regningsarbejde med fuld ordrebog | 70-80 % |
| Nystartet uden fast kundebase | 40-55 % |

Regler:

1. Regn aldrig med over 75 % uden dokumentation fra faktura- eller timedata.
2. Siger brugeren et højere tal: bed om dokumentation ("hvor mange timer fakturerede du sidste kvartal, og hvor mange arbejdede du?"). Kan de dokumentere det: brug deres tal og notér kilden.
3. Vis altid timeprisen ved 2-3 fakturerbarhedsniveauer (som i afsnit 2) - det er den antagelse der flytter prisen mest.

---

## 7. Typiske fejl på tværs af modellerne

1. **Salgstimepris brugt som kostpris** i kostpris-plus → dobbelt avance, urealistisk højt tilbud, tabte ordrer.
2. **Kun vareforbrug som variabel omkostning** → DB ser 10-20 procentpoint bedre ud end virkeligheden.
3. **Faste omkostninger glemt helt** ("dem betaler firmaet jo") → priser der dækker lønnen men ikke huslejen.
4. **Spild og uforudset udeladt** → hvert projekt ender 5-15 % dyrere end kalkuleret.
5. **Moms blandet ind i kalkulationen** → regn ALTID internt ekskl. moms; moms lægges kun på i kommunikationen til B2C-kunder.
6. **Konkurrentens pris som facit** ("de tager 650, så det gør jeg også") → konkurrentens omkostningsstruktur er ukendt; brug markedsprisen som referencepunkt i scenarierne, aldrig som erstatning for kalkulationen.
