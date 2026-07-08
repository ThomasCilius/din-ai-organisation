# Interview-guide: spørgsmålsbank til byggebriefen

Fuld spørgsmålsbank til at fylde `byggebrief.md`. Stil ét spørgsmål pr. besked, brug multiple choice hvor du kan, og spring spørgsmål over, som brugerens tidligere svar allerede dækker. Hvert spørgsmål har acceptkriterier ("grav videre indtil du hører") og røde flag ("bor videre"), så du ved, hvornår du må gå videre - og hvornår du ikke må.

## Indhold

1. [Spor-afklaring (altid først)](#1-spor-afklaring-altid-foerst)
2. [Formål](#2-formaal)
3. [Brugere og hyppighed](#3-brugere-og-hyppighed)
4. [Nuværende workaround](#4-nuvaerende-workaround)
5. [Opgaveflows](#5-opgaveflows)
6. [Data ind og ud](#6-data-ind-og-ud)
7. [Færdig-kriterier](#7-faerdig-kriterier)
8. [Afgrænsning og v1](#8-afgraensning-og-v1)
9. [Persondata (GDPR)](#9-persondata-gdpr)
10. [Bestiller-mode (kun ved bestilling)](#10-bestiller-mode-kun-ved-bestilling)

Bærende princip: **workarounden er kravspecifikationen i råform.** Det ark, den mail-tråd eller den papirgang, opgaven løses med i dag, indeholder allerede alle felter, datakolonner og undtagelser, løsningen skal kunne. Bed altid om at se den, og lad den styre halvdelen af dine spørgsmål.

## 1. Spor-afklaring (altid først)

- **Spørg:** "Bygger vi det selv - fx med Claude eller et no-code-værktøj - eller bestiller vi det hos et bureau eller en freelancer?"
- **Grav videre indtil du hører:** et klart valg. Ved "det ved jeg ikke", stil et opklarende: "Har I nogen, der kan vedligeholde det bagefter, eller skal det passe sig selv?"
- **Røde flag:** "vi tager den derfra" - så er sporet ikke afklaret, og bestiller-felterne mangler.

Ved bestiller-spor: spring til afsnit 10 til sidst og udfyld budget, deadline, drift og ejerskab.

## 2. Formål

- **Spørg:** "Hvad er det ene, løsningen skal gøre bedre eller hurtigere - og hvordan mærker I, at det lykkedes?"
- **Grav videre indtil du hører:** en konkret smerte (tid brugt, fejl begået, kunder tabt) og en målbar forbedring.
- **Røde flag:** "effektivisere", "digitalisere", "have styr på det" - abstrakte mål uden en smerte bag. Spørg: "Hvad koster det jer i dag, at I ikke har det?"

Skriv også det ned, løsningen udtrykkeligt IKKE skal - det er halvdelen af et godt formål.

## 3. Brugere og hyppighed

- **Spørg:** "Hvem skal bruge det, hvor tit, og hvor teknisk erfarne er de?"
- **Grav videre indtil du hører:** roller (ikke navne alene), en frekvens (dagligt/ugentligt/pr. sag) og et erfaringsniveau.
- **Røde flag:** "alle" og "hele tiden". Bor: "Hvem rører det oftest? Er der nogen, der kun ser resultatet?"

Skeln mellem dem, der udfører opgaven, og dem, der kun læser output - de har forskellige krav.

## 4. Nuværende workaround

- **Spørg:** "Vis mig, hvordan opgaven løses i dag. Hvilket ark, system eller papir bruger I, og hvad er besværligt ved det?"
- **Grav videre indtil du hører:** værktøjets navn, hvem der rører det, og det præcise trin, der gør ondt.
- **Røde flag:** "det er lidt rodet", "vi vil bare have noget nemmere". Bed om at få selve arket eller et skærmbillede - beskrivelsen er aldrig så præcis som artefaktet.

Gå kolonne for kolonne / trin for trin gennem workarounden. Hver kolonne er et datafelt; hver undtagelse ("undtagen når kunden er offentlig") er en regel, løsningen skal kunne.

## 5. Opgaveflows

- **Spørg:** "Tag mig gennem den vej, en bruger går, fra de starter til de er færdige - trin for trin."
- **Grav videre indtil du hører:** en sekvens af konkrete handlinger med et start- og slutpunkt.
- **Røde flag:** spring i logikken ("og så er den bare klar"). Bor: "Hvad sker der lige før? Hvad hvis noget mangler?"

Spørg altid om afvigelsen: "Hvad gør I, når noget går galt - forkert input, manglende data, en kunde der ikke passer i skabelonen?" Fejlvejen glemmes oftest og koster mest.

## 6. Data ind og ud

- **Spørg:** "Hvilke oplysninger kommer ind i løsningen, hvorfra - og hvad skal komme ud i den anden ende?"
- **Grav videre indtil du hører:** navngivne datakilder (hvilket system, hvilket ark) og et konkret output (en rapport, en mail, en post i et system).
- **Røde flag:** "de relevante data". Bor: "Hvilke felter helt præcist? Kommer de fra ét sted eller flere?"

Fast dansk tjek på data: æ/ø/å i navne, decimalkomma vs. punktum, datoformat dd-mm-åååå, CVR/CPR-formater, tomme felter og dubletter. Skriv det ind, hvis nogen af dem optræder i data.

## 7. Færdig-kriterier

- **Spørg:** "Forestil dig, at det er bygget. Hvad skal du kunne gøre, for at du med sikkerhed kan sige 'den er færdig og virker'?"
- **Grav videre indtil du hører:** en handling, en person kan udføre, med et observerbart resultat.
- **Røde flag:** "at det bare virker", "at det er brugervenligt". Omformulér på stedet: "Så et kriterie kunne være: en ny medarbejder kan oprette en sag på under 2 minutter uden hjælp - passer det?"

Hvert kriterie skal kunne bestås eller dumpes af én person med ét konkret input. Kan det ikke, er det ikke et kriterie endnu - bliv ved.

## 8. Afgrænsning og v1

- **Spørg:** "Hvis vi kun havde tid til det absolut vigtigste, hvad er så det mindste, der stadig løser jeres problem?"
- **Grav videre indtil du hører:** en kort must-liste og villighed til at parkere resten.
- **Røde flag:** "det hele er vigtigt". Kør MoSCoW: "Hvad kan v1 leve uden i to måneder?" Alt der kan vente, ryger på IKKE-med-i-v1.

Skriv fravalgene ned eksplicit. En tom IKKE-med-i-v1-liste betyder næsten altid, at scopet ikke er skåret.

## 9. Persondata (GDPR)

- **Spørg:** "Kommer der personoplysninger ind i løsningen - navne, mails, CPR, kundeoplysninger, medarbejderdata?"
- **Grav videre indtil du hører:** et klart ja/nej og hvilke typer.
- **Røde flag:** "kun almindelige oplysninger". Almindelige personoplysninger er stadig persondata. Ved ja: flag databehandleraftale og dataminimering (se `references/gdpr-og-ejerskab.md`).

## 10. Bestiller-mode (kun ved bestilling)

Udfyld disse felter, når vi bestiller hos et bureau eller en freelancer. De er ikke pynt - de er det, der afgør, om I ejer jeres egen løsning bagefter.

- **Budgetramme:** "Hvad er jeres ramme - fast beløb eller loft på timer?" Grav videre indtil du hører et tal eller et interval.
- **Deadline:** "Hvornår skal v1 være i drift, og er der en hård dato bag (kampagne, sæson, aftale)?"
- **Drift og support:** "Hvem vedligeholder det efter levering - leverandøren mod betaling, jer selv, eller uafklaret?" Uafklaret er et rødt flag, der skal lukkes nu.
- **Ejerskab:** "Hvem ejer koden, dataene og domænet, når det er bygget - står det skriftligt?" Se ejerskabstjeklisten i `references/gdpr-og-ejerskab.md`.

Disse fire felter gør briefen til en kravspec, et bureau kan byde på uden at gætte - og gør, at I ikke betaler for at blive låst inde.
