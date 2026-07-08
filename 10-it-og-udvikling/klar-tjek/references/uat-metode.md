# UAT-metode, danske testdata og edge-cases

Læs denne fil når du tester et færdig-kriterie (trin 3 i arbejdsgangen). Den fortæller HVORDAN du afprøver som en slutbruger, hvilke danske data der vælter leverancer, og hvad der tæller som et bevis.

## Indhold
1. Grundprincippet: test brugerens vej, ikke happy path
2. Bevistyper - hvad tæller
3. Testmønster pr. kriterie (fire trin)
4. Dansk testdata-katalog (kopiér herfra)
5. Edge-case-liste der altid tjekkes
6. Fladetype-specifikke tests
7. Sådan skriver du et fund

## 1. Grundprincippet: test brugerens vej, ikke happy path

"Happy path" er den vej udvikleren selv gik: rigtige data, rigtig rækkefølge, ingen fejl. Den virker altid - det er derfor leverancen blev afleveret. Din værdi ligger i alt det andet:

- Hvad sker der når feltet er tomt?
- Hvad sker der ved forkert format (bogstaver i et beløbsfelt, en dato som 31-02-2026)?
- Hvad sker der når to brugere gør det samme samtidig?
- Hvad sker der på en telefon, ikke kun på en stor skærm?
- Hvad sker der når nettet er langsomt eller falder ud midt i?

Regel: for hvert færdig-kriterie tester du mindst ét **korrekt** input og ét **forkert/tomt** input. En leverance der går ned på en tom formular er ikke klar, uanset hvor pæn happy path er.

## 2. Bevistyper - hvad tæller

Et bevis skal kunne genfindes af en anden person. Accepterede former:

- **Skærmbillede** af resultatet (stærkest - vis både input og output).
- **Konkret output** klippet ind (den genererede tekst, den beregnede sum, den oprettede post).
- **Reproduktionsnote:** "Jeg skrev navnet 'Bjørn Ærø' i navnefeltet, trykte Gem, og posten blev oprettet med korrekt stavning. Set på oversigtssiden."
- **Fejlbevis:** skærmbillede eller ordret fejltekst når noget fejler.

Følgende er IKKE beviser: "det virker", "det så fint ud", "bureauet siger ok", "burde være i orden". Står der ingen bevis, er statussen "ikke testet".

## 3. Testmønster pr. kriterie (fire trin)

For hvert testbart færdig-kriterie fra byggebrief.md:

1. **Læs kriteriet som en handling.** "Kunden kan bestille et tidspunkt" -> handlingen er: gå ind som kunde, vælg et tidspunkt, bekræft, se en bekræftelse.
2. **Udfør handlingen med rigtige danske data** (se katalog nedenfor). Fang beviset.
3. **Udfør handlingen med forkerte/tomme data.** Får brugeren en forståelig fejlbesked, eller går det galt/tavst? Fang beviset.
4. **Skriv status:** bestået (begge dele opfører sig rigtigt), fejlet (med fund), eller ikke testet (med grund). Aldrig tomt.

## 4. Dansk testdata-katalog (kopiér herfra)

Brug altid mindst ét element fra hver relevante kategori. Danske tegn og formater er den hyppigste kilde til fejl i leverancer bygget eller testet på engelske standarddata.

**Navne med æøå og sammensatte navne:**
- Bjørn Ærø-Kjærsgaard
- Åse Ø. Thøgersen
- Søren Nørgaard Ærtebjerg
- navn med apostrof/bindestreg: Anne-Sofie O'Neill

**Beløb (dansk decimalkomma og tusindtalsseparator):**
- 1.234,50 kr.
- 0,05 kr. (afrunding)
- 1.000.000,00 kr. (store tal)
- negativt beløb: -49,95 kr.
- test at systemet ikke gemmer "1,234.50" (engelsk format) forkert

**Datoer (dansk format dd-mm-åååå):**
- 07-07-2026
- 29-02-2028 (skudår - gyldig) vs. 29-02-2027 (ugyldig)
- 31-04-2026 (findes ikke)
- datoer omkring sommertid/vintertid

**Adresser og postnumre:**
- Rådhuspladsen 1, 1550 København V
- adresse med æøå: Nørrebrogade, Vejlø, Ærøskøbing (postnr. 5970)
- fører 4-cifret postnummer korrekt?

**CVR og CPR (formattjek - brug testnumre, ikke rigtige personers):**
- CVR: 8 cifre (fx 12345678) - test at bogstaver afvises
- CPR: ddmmåå-xxxx - test kun formatvalidering, gem aldrig rigtige CPR-numre i en test uden hjemmel og backup

**Telefon og e-mail:**
- +45 12 34 56 78 / 12345678 (med og uden landekode og mellemrum)
- e-mail med æøå-domæne eller pluspostadresse: test@bjørn.dk, navn+test@firma.dk

**Tekstlængde og specialtegn:**
- meget lang tekst (kopiér en hel paragraf ind i et kort felt)
- emoji og specialtegn: € % & < > " '
- kun mellemrum / kun tal / helt tomt felt

## 5. Edge-case-liste der altid tjekkes

Kør denne liste oven på de kriterie-specifikke tests:

- **Tom tilstand:** hvordan ser en helt tom liste/side ud for en ny bruger? (Ikke en fejlmeddelelse, forhåbentlig.)
- **Fejltilstand:** hvad ser brugeren når noget går galt - en forståelig besked eller en teknisk fejl/blank side?
- **Dubletter:** kan man oprette den samme post to gange? Skal man kunne det?
- **Mobil:** virker det på en telefon (lille skærm, touch)? Kan man ramme knapperne?
- **Tilbage-knap og genindlæsning:** går data tabt hvis man trykker tilbage eller opdaterer siden midtvejs?
- **Rettigheder:** kan en almindelig bruger se/gøre noget kun en administrator burde? (Prøv at tilgå en side man ikke burde.)
- **Store mængder:** hvad sker der med 1.000 rækker i stedet for 3?

## 6. Fladetype-specifikke tests

**Landingsside / hjemmeside:** værdiløfte synligt uden at scrolle, det primære CTA virker og fører det rigtige sted hen, formularer sender OG viser en kvittering, links er ikke døde, siden loader på mobil.

**Dashboard / app / internt system:** tallene stemmer med en manuel kontrolberegning, filtre og sortering giver rigtige resultater, tomme og fejltilstande er håndteret, data kan eksporteres/gemmes, samtidige brugere vælter ikke hinandens data.

**Formular / flow (fx booking, sagsoprettelse):** hele flowet gennemføres ende-til-ende, validering fanger forkerte input FØR indsendelse, kvittering/bekræftelse vises, og data lander det rigtige sted (tjek modtager-siden, ikke kun "tak"-siden).

**Integration / automatisering (Zapier/Make m.m.):** test med en rigtig post at data faktisk flytter sig korrekt mellem systemerne, at felter mapper rigtigt (især danske tegn og datoformater), og hvad der sker når kilden sender noget uventet.

## 7. Sådan skriver du et fund

Et brugbart fund kan læses og reproduceres af leverandøren eller den næste tester uden at spørge dig. Skabelon:

```
Fund [nr.] - [kort titel]
Kategori: blokerende / skal rettes / kan vente
Kriterie: [hvilket færdig-kriterie det rammer]
Sådan genskabes: [skridt for skridt]
Forventet: [hvad byggebrief.md siger skal ske]
Faktisk: [hvad der faktisk skete]
Bevis: [skærmbillede/output]
```

BAD: "Formularen driller nogle gange."
GOD: "Fund 3 - kontaktformular gemmer ikke æøå. Genskabes: skriv 'Bjørn Ærø' i Navn, tryk Send. Forventet: navnet gemmes korrekt (byggebrief kriterie 4). Faktisk: navnet gemmes som 'Bj?rn ?r?'. Bevis: skærmbillede af databasepost. Kategori: skal rettes."

Kontrasten er hele pointen: det vage fund koster en dyr supportrunde på timepris mens leverandøren prøver at gætte hvad du så; det præcise fund kan rettes med det samme.
