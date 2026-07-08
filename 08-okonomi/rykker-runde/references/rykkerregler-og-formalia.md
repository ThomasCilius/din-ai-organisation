# Rykkerregler og formalia - dansk ret i praksis

Opslagsværk for rykker-runde. Reglerne her er strukturen; ALLE beløbssatser slås op ved hver runde - de ændrer sig, og et forældet tal i en rykker er værre end intet tal.

## Indhold

1. [Lovgrundlag og kilder](#1-lovgrundlag-og-kilder)
2. [Rykkergebyr - rentelovens rammer](#2-rykkergebyr---rentelovens-rammer)
3. [Morarente](#3-morarente)
4. [B2B-kompensationsbeløb](#4-b2b-kompensationsbeloeb)
5. [Inkassovarsel](#5-inkassovarsel)
6. [Formkrav pr. rykker - uddybet](#6-formkrav-pr-rykker---uddybet)
7. [Særlige situationer](#7-saerlige-situationer)
8. [B2B vs. B2C - hurtig oversigt](#8-b2b-vs-b2c---hurtig-oversigt)

## 1. Lovgrundlag og kilder

| Emne | Lov | Slå op på |
|---|---|---|
| Rykkergebyr, morarente, B2B-kompensation | Renteloven (lov om renter og andre forhold ved forsinket betaling) | retsinformation.dk (søg "renteloven") |
| Inkassovarsel | Inkassoloven (lov om inkassovirksomhed) | retsinformation.dk (søg "inkassoloven") |
| Aktuel udlånsrente (grundlag for morarente) | - | nationalbanken.dk |
| Forældelse af fakturakrav | Forældelsesloven | retsinformation.dk (søg "forældelsesloven") |

Citér altid hvilken lov et gebyr eller en rente hviler på, når den skrives ind i en kladde - det gør rykkeren troværdig og efterprøvbar.

## 2. Rykkergebyr - rentelovens rammer

De fire rammer der ALTID skal være overholdt før et gebyr skrives ind:

1. **Kravet skal være forfaldent.** Et gebyr på en faktura der endnu ikke er forfalden, er ugyldigt. Tjek forfaldsdatoen mod dags dato.
2. **Maks. 3 rykkere med gebyr pr. krav.** Rykker nummer 4 og frem må gerne sendes, men uden gebyr. Tæl KUN rykkere hvor der faktisk blev opkrævet gebyr.
3. **Gebyrloft pr. rykker.** Renteloven sætter et maksimum pr. rykkerskrivelse (historisk 100 kr., men slå den aktuelle sats op på retsinformation.dk før hver runde). Gebyret er momsfrit.
4. **Minimum 10 dages mellemrum** mellem rykkere med gebyr. Send rykker 2 på dag 9, og gebyret bortfalder. Regn fra afsendelsesdatoen for den forrige rykker.

Praktiske noter:

- Gebyr er en RET, ikke en pligt. Til nøglekunder kan det være god forretning at droppe gebyret på rykker 1 - anbefal det hvor relationen vejer tungere end rykkergebyret.
- Der kan derudover opkræves et fast inkassogebyr ved overdragelse til inkasso (egeninkasso/fremmedinkasso har forskellige regler) - det ligger UDEN FOR denne skill; henvis til inkassofirma eller advokat.
- Har brugeren allerede sendt rykkere uden at overholde reglerne (fx for højt gebyr), så skriv næste kladde korrekt og notér problemet under "Antagelser og åbne spørgsmål" - forsøg aldrig at "reparere" et ulovligt gebyr ved at gentage det.

## 3. Morarente

- **Satsen:** Nationalbankens udlånsrente + 8 procentpoint (rentelovens standardsats). Udlånsrenten ændrer sig - slå den aktuelle op på nationalbanken.dk ved hver runde, og skriv opslagsdatoen i outputtets kildesektion.
- **Hvornår løber renten fra:**
  - Er forfaldsdagen aftalt på forhånd (fx "netto 14 dage" på fakturaen): fra forfaldsdagen.
  - Er der ingen aftalt forfaldsdag: fra 30 dage efter at der er fremsat anmodning om betaling.
  - Over for forbrugere (B2C) gælder skærpede oplysningskrav før rente kan kræves - varsl renten tydeligt i rykker 2 og henvis til renteloven.
- **I praksis for SMV'er:** Mange vælger kun at beregne morarente ved større krav eller fra rykker 2/3, fordi renteberegning på småbeløb støjer mere end den gavner. Anbefal: varsl renten i rykker 2 ("fra [dato] påløber morarente efter renteloven"), beregn den konkret i rykker 3.
- **Beregning:** hovedstol × årlig rentesats × (dage i restance / 365). Vis beregningen i kladden, så kunden kan efterprøve den.
- Højere rente end lovens sats kræver aftale (B2B) og er stort set udelukket over for forbrugere - hold dig til lovens sats medmindre kontrakten siger andet (og henvis da til `kontrakt-tjek`).

## 4. B2B-kompensationsbeløb

Kun ved erhvervskunder og offentlige myndigheder - ALDRIG over for forbrugere:

- Ved forsinket betaling kan der opkræves et **fast kompensationsbeløb pr. faktura** til dækning af inddrivelsesomkostninger. Satsen reguleres - slå den aktuelle op på retsinformation.dk (den har historisk ligget omkring 310 kr., men verificér ALTID før den skrives ind).
- Beløbet kan opkræves **uden forudgående rykker** og **oven i** rykkergebyrer og morarente - men kun ÉN gang pr. forsinket faktura.
- Det kan ikke fraviges ved aftale til skade for kreditor i B2B-forhold.
- Praktisk dømmekraft: kompensationsbeløbet er lovligt fra dag ét, men at smide det på en nøglekundes første forsinkelse er relationsmæssigt tonedøvt. Anbefal det fra rykker 2 eller ved gentagne forsinkelser - og notér valget i planen.

## 5. Inkassovarsel

Lovpligtigt FØR et krav må overdrages til inkasso (inkassoloven, § 10). Uden gyldigt varsel kan inkassofirmaet ikke lovligt behandle sagen, og skyldner kan afvise omkostningerne.

Varslet skal:

1. Være **skriftligt** (brev eller e-mail).
2. Give en betalingsfrist på **mindst 10 dage** fra afsendelsen.
3. Angive **tydeligt** at kravet overdrages til inkasso, hvis der ikke betales inden fristen - og at det påfører skyldner yderligere omkostninger.
4. Specificere kravet: hovedstol, gebyrer og renter hver for sig (samme formkrav som rykkere).

Praktisk standard: kombinér inkassovarslet med rykker 3, så trappen slutter med ét dokument der både rykker og varsler. Skabelon i `rykker-skabeloner.md`, afsnit 5.

Efter fristens udløb: anbefal ejeren at vælge mellem inkassofirma, advokat eller forenklet inkassoproces (betalingspåkrav via retten ved ukomplicerede krav). Selve overdragelsen er ejerens handling - aldrig skillens.

## 6. Formkrav pr. rykker - uddybet

Hvert punkt med begrundelsen, så du kan forklare den hvis brugeren vil skære hjørner:

| Punkt | Hvorfor |
|---|---|
| Fakturanummer + fakturadato | Kunden skal kunne finde fakturaen på 10 sekunder - ellers ringer de eller ignorerer |
| Forfaldsdato | Dokumenterer at kravet er forfaldent = at gebyret er gyldigt |
| Hovedstol | Adskilt fra gebyrer, så beløbet kan afstemmes mod fakturaen |
| Gebyrer/renter/kompensation specificeret hver for sig | Klumpes de sammen, kan kunden bestride det hele; specificeret kan de kun bestride enkeltposter |
| Nyt samlet beløb + konkret frist (dato) | "Snarest" er ikke en frist; uden dato kan næste rykkers 10-dages-mellemrum ikke dokumenteres |
| Betalingsoplysninger | Enhver friktion udskyder betalingen; gør det umuligt at betale forkert |
| Trin-specifikke krav (rentevarsel/inkassovarsel) | Se afsnit 3 og 5 |

## 7. Særlige situationer

- **Bestridt krav:** Rykkerforløbet STOPPER for den debitor. Notér på opfølgningslisten som "BESTRIDT - flaget til ejer". Tvisten håndteres af ejeren, evt. med `kontrakt-tjek` og advokat. En rykker på et bestridt krav kan bruges imod kreditor og eskalerer konflikten.
- **Betalingsaftale/afdragsordning:** Overholdes aftalen, sættes rykkerforløbet på pause - en rykker til en kunde der afdrager efter aftale, er en fejl. Misligholdes aftalen, genoptages trappen fra det trin den stod på, med henvisning til den brudte aftale. Kort bekræftelsesskabelon i `rykker-skabeloner.md`, afsnit 6.
- **Forældelse:** Almindelige fakturakrav forældes som udgangspunkt efter **3 år** fra forfald (forældelsesloven - verificér ved tvivl). VIGTIGT: rykkere afbryder IKKE forældelsen - kun skyldners skriftlige erkendelse af gælden eller retslige skridt gør. Flag alle krav ældre end 2,5 år med "NÆRMER SIG FORÆLDELSE - eskalér til ejer/advokat NU".
- **Konkurs, rekonstruktion eller betalingsstandsning:** Stop alle rykkere til den debitor øjeblikkeligt og flag til ejeren - kravet skal i stedet anmeldes i boet (advokatopgave).
- **Kunden er død eller virksomheden ophørt:** Stop, flag til ejeren, henvis til advokat/inkasso.

## 8. B2B vs. B2C - hurtig oversigt

| | B2B (erhverv) | B2C (forbruger) |
|---|---|---|
| Rykkergebyr (maks. 3, loft, 10 dage) | Ja | Ja |
| Fast kompensationsbeløb | Ja - slå sats op | NEJ - aldrig |
| Morarente | Lovens sats eller aftalt | Lovens sats, skærpede oplysningskrav |
| Inkassovarsel før inkasso | Ja | Ja |
| Tone | Professionel, må være direkte | Ekstra saglig - forbrugerklager er dyre i omdømme |

Ved tvivl om en kunde er erhverv eller forbruger: spørg brugeren, og vælg B2C-reglerne (de strengeste) indtil svaret foreligger.
