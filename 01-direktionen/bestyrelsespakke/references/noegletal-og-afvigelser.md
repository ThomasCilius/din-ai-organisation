# Nøgletal og afvigelsesdisciplin

Indhold:
1. [SMV-nøgletalssættet: definitioner og formler](#smv-noegletalssaettet)
2. [Regler for tal i pakken](#regler-for-tal-i-pakken)
3. [Afvigelsesdisciplin: hvad / hvorfor / hvad gør vi](#afvigelsesdisciplin)
4. [SKIDT/GODT: afvigelsesforklaringen](#skidtgodt-afvigelsesforklaringen)

## SMV-noegletalssaettet

De fem faste nøgletal i enhver pakke. Findes et tal ikke i brugerens data, markeres det `[MANGLER]` - beregn aldrig "cirka" ud fra andre tal uden at vise regnestykket og markere resultatet som beregnet.

| Nøgletal | Definition/formel | Hvorfor bestyrelsen ser på det |
|---|---|---|
| **Omsætning** | Nettoomsætning i perioden (ekskl. moms) | Aktivitetsniveauet - toppen af alt andet |
| **Dækningsgrad** | Dækningsbidrag / omsætning × 100, hvor dækningsbidrag = omsætning - variable omkostninger | Om vi tjener penge på det vi sælger - falder den, er væksten måske urentabel |
| **Likviditet** | Likvide beholdninger + uudnyttet, tilsagt kreditramme (ultimo perioden) | Om vi kan betale regningerne - det tal der lukker virksomheder når det svigter |
| **Debitordage** | Tilgodehavender fra salg / omsætning × 365 (for perioden) | Om kunderne finansierer sig hos os - stigende debitordage æder likviditeten |
| **Ordrebeholdning / pipeline** | Kontraherede ordrer i kr. + vægtede pipeline-emner | Det eneste fremadrettede tal i sættet - resten er bakspejl |

Supplerende tal der medtages når de findes og er relevante: resultat før skat, EBITDA (bankpakke), soliditetsgrad (egenkapital / balancesum × 100 - obligatorisk ved §119-tjek og bankpakke), varelager/lagerdage (handels- og produktionsvirksomhed), pengestrøm fra drift.

Brancherne afgør vægtningen: konsulenthuse har ingen ordrebeholdning men en pipeline og en udnyttelsesgrad; produktionsvirksomheder har lagerbinding. Brug virksomhedsprofil.md til at vælge - og spørg hellere end at gætte.

## Regler for tal i pakken

1. **Aldrig et tal uden sammenligning.** Hvert nøgletal vises mod budget OG samme periode sidste år. Et tal uden sammenligning kan hverken være godt eller dårligt - det er bare et tal.
2. **Aldrig et tal uden kilde.** Hver tabel har en kildelinje ("Saldobalance pr. 30/6, udtræk 3/7") eller en henvisning til afsnittet "Datagrundlag og kilder".
3. **Friskhed:** tal ældre end den rapporterede periode flages med deres dato ("likviditet pr. 31/5 - nyere tal forelå ikke"). Præsentér aldrig gamle tal som aktuelle.
4. **Samme definition hver gang.** Skifter definitionen (fx dækningsgrad med/uden direkte lønninger), vises begge tal i overgangsperioden med en note. Stille definitionsskift er den klassiske måde at pynte tal på - og bestyrelser opdager det.
5. **Afrunding:** hele tusinder eller ét decimal på procenter. Falsk præcision ("1.234.567,89 kr.") signalerer at ingen har forholdt sig til tallet.

## Afvigelsesdisciplin

Hver afvigelse over materialitetsgrænsen (aftalt i dispositionen - se SKILL.md trin 4) forklares i præcis tre led:

1. **Hvad:** tal mod tal. "Omsætning 4,1 mio. kr. mod budget 4,8 mio. kr. (-15 %)."
2. **Hvorfor:** den konkrete årsag - navngiven kunde, projekt, hændelse eller antagelse der brast. Ikke "markedet", "konjunkturerne" eller "generel afmatning" uden koblingen til virksomhedens egne tal. Kendes årsagen ikke, så skriv det ærligt: "årsag under afdækning" er en lovlig forklaring, "markedet" er ikke.
3. **Hvad gør vi:** navngiven handling, ansvarlig og deadline - eller den eksplicitte beslutning om ikke at gøre noget ("engangshændelse, ingen handling"). Et håb ("det retter sig i Q3") er ikke en handling.

Positive afvigelser forklares med samme disciplin. "Hvorfor gik det bedre end ventet?" afslører om budgettet var for forsigtigt, om der var en engangsgevinst, eller om noget faktisk virker og skal have flere ressourcer - tre vidt forskellige konklusioner.

## SKIDT/GODT: afvigelsesforklaringen

- SKIDT: "Omsætningen var noget lavere end budgetteret, primært grundet markedssituationen og generel tilbageholdenhed hos kunderne. Vi følger udviklingen tæt."
  (Intet tal, ingen årsag der kan efterprøves, ingen handling - tre tomme led. "Følger udviklingen tæt" er det, man skriver når man ikke ved hvad man vil gøre.)

- GODT: "Omsætning 4,1 mio. kr. mod budget 4,8 mio. kr. (-15 %). Årsag: [kunde X] udskød etape 2 (0,5 mio. kr.) til Q4, og to pipeline-emner budgetteret til juni er endnu ikke lukket (0,2 mio. kr.). Handling: etape 2 er nu kontraheret med opstart 5/10 (ansvarlig: [navn]); de to emner afgøres ifølge kunderne inden 1/8 - status på næste møde."
  (Tal mod tal, navngivne årsager der kan efterprøves, handlinger med ansvarlig og dato. Bestyrelsen kan nu vurdere om -15 % er en forskydning eller et problem - det er hele forskellen.)
