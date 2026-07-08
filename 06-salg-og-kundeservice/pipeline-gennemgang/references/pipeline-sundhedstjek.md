# Pipeline-sundhedstjek: tærskler, balance og tabsmønstre

Indhold:

1. [Gået-i-stå-tærskler og kalibrering](#1-gaaet-i-staa-taerskler-og-kalibrering)
2. [Tre-opfølgninger-reglen: luk eller genåbn](#2-tre-opfoelgninger-reglen-luk-eller-genaabn)
3. [Sagsalder mod salgscyklus](#3-sagsalder-mod-salgscyklus)
4. [Koncentrationsrisiko](#4-koncentrationsrisiko)
5. [Balance mellem top og bund](#5-balance-mellem-top-og-bund)
6. [Tabt-sag-disciplin og mønsteranalyse](#6-tabt-sag-disciplin-og-moensteranalyse)
7. [Sund pipeline-tjekliste](#7-sund-pipeline-tjekliste)

## 1. Gået-i-stå-tærskler og kalibrering

Standardtærsklerne (dage uden aktivitet) står i SKILL.md: emne 30, dialog 30, møde afholdt 21, tilbud sendt 14, forhandling 10. "Aktivitet" betyder en registreret berøring med kunden - møde, opkald, mail fra eller til kunden. Interne noter tæller ikke.

Tærsklerne er sat efter en typisk B2B-salgscyklus på 2-3 måneder. Kalibrér dem sådan:

- Salgscyklus under 1 måned (fx standardydelser, småordrer): halvér tærsklerne.
- Salgscyklus over 6 måneder (fx udbud, store anlæg): fordobl tærsklerne for de tidlige faser - men behold 14 dage efter afsendt tilbud. Et tilbud har en acceptfrist, og fristen er den samme uanset branche: stilhed omkring fristen kræver handling.
- Kunden har selv meldt en beslutningsdato ("vi beslutter efter sommerferien"): sagen er ikke gået i stå før datoen er passeret - men den SKAL have et næste skridt dateret lige efter ("ring 11/8").

Skriv de kalibrerede tærskler i `virksomhedsprofil.md`, så de holder på tværs af uger. Uden dokumenteret kalibrering gælder standard - flag aldrig efter fornemmelse, hverken mildere eller strengere.

## 2. Tre-opfølgninger-reglen: luk eller genåbn

Efter tre opfølgninger uden reelt svar er den fjerde opfølgning ikke vedholdenhed - det er selvbedrag, og sagen blokerer både forecastet og sælgerens opmærksomhed. Indstil til én af to beslutninger:

- **Luk:** sagen markeres tabt med tabsårsagskategori (oftest "timing" eller "intet reelt behov"). Ingen bitterhed - en lukket sag kan genåbnes den dag kunden vender tilbage.
- **Genåbn:** sagen får en NY vinkel (nyt beslutningsled, ændret omfang, ny anledning hos kunden) og én sidste frist. Genåbn uden ny vinkel er bare opfølgning nummer fire med et pænere navn.

Beslutningen er menneskets. Din opgave er at gøre den umulig at overse: flaget [LUK ELLER GENÅBN] står øverst i Flags-afsnittet, og sagen tæller kun i forecastets højt-scenarie.

Tæl kun reelle opfølgninger: en berøring hvor kunden blev bedt om at forholde sig til noget. "God sommer"-mails tæller ikke.

## 3. Sagsalder mod salgscyklus

Sagsalder = dage siden sagen kom ind i sin nuværende fase (ikke siden oprettelse). Sammenlign mod virksomhedens normale salgscyklus:

- Find normalcyklussen i `virksomhedsprofil.md` eller ved at spørge: "Hvor lang tid går der typisk fra første møde til underskrift?" Findes hverken data eller svar: brug 90 dage som B2B-standard, markeret [ANTAGELSE].
- En sag der har brugt mere end halvdelen af normalcyklussen i ÉN fase, flages - selv hvis den har haft aktivitet. Aktivitet uden fasefremdrift er ofte høflig kundetræghed: kunden svarer pænt, men køber ikke.
- Vis gennemsnitlig sagsalder pr. fase i statusoversigten når pipelinen har over 10 sager - stigende gennemsnitsalder uge for uge er det tidligste tørkesignal der findes.

## 4. Koncentrationsrisiko

- **Kundekoncentration:** udgør én kunde over 30 % af den samlede pipelineværdi, flages det eksplicit. Ejeren skal vide at kvartalet står og falder med ét ja - og beslutte om der skal sættes ekstra emnearbejde i gang som modvægt.
- **Fasekoncentration:** ligger over 60 % af værdien i én enkelt fase, nævnes det - en pipeline hvor alt ligger i "tilbud sendt", er reelt et venteværelse, og ugens handlinger skal så handle om at skabe bevægelse frem for at skabe nyt.
- Koncentration er ikke i sig selv en fejl (en lille SMV kan sagtens have én stor sag) - men den skal være SET og sagt højt, ikke gemt i et gennemsnit.

## 5. Balance mellem top og bund

Pipelinen skal fødes i toppen mens den lukker i bunden. Tommelfingerregler (markér som [ANTAGELSE] hvis de ikke er kalibreret mod virksomhedens hitrate):

- Med en hitrate på 20-30 % fra møde til vundet skal der groft regnet 4-5 nye kvalificerede emner ind pr. ønsket vundet sag.
- **Tom top = tørke om én salgscyklus.** Ingen nye emner i denne uge er ikke en krise - ingen nye emner tre uger i træk er en forudsigelig omsætningspause om typisk 3 måneder, og den skal navngives i gennemgangen med dato ("fortsætter tilgangen som nu, er der hul i oktober").
- Sammenlign altid med forrige gennemgang: antal nye emner ind, antal sager lukket (vundet/tabt), nettobevægelse pr. fase. Bevægelsen ER sundhedstegnet - en pipeline med samme 12 sager i samme faser tre uger i træk er ikke stabil, den er død.
- Anbefal `kundeemner` som konkret handling når toppen er tynd - det er kædens designede svar på tørkesignalet.

## 6. Tabt-sag-disciplin og mønsteranalyse

Hver tabt sag registreres med præcis én af fem kategorier (fri tekst kun som supplement):

| Kategori | Definition | Typisk mønster-modtræk |
|---|---|---|
| Pris | Kunden valgte at købe, men billigere hos anden leverandør - eller fandt prisen for høj i forhold til værdien | Gennemgå prissætning og værdiargumentation (`priskalkulation` i Økonomi); tjek om tilbuddene kvantificerer værdi |
| Timing | Reelt behov, men udskudt - budget, sæson, interne prioriteter | Sæt genåbningsdato i stedet for at jagte; kontakt tidligere i kundens budgetår |
| Konkurrent | Kunden valgte en anden løsning på samme behov | Afdæk hvad konkurrenten vandt på (pris/produkt/relation) - spørg kunden, gæt ikke |
| Intet reelt behov | Sagen skulle aldrig have været i pipelinen - behovet var antaget, ikke afdækket | Skærp kvalificeringen: hvilke spørgsmål blev ikke stillet før tilbuddet? (`moedeforberedelse`) |
| Internt stop | Kundens projekt døde internt - beslutningstager forsvandt, omorganisering, fusion | Afdæk beslutningskæden tidligere; hav altid mere end ét kontaktled i større sager |

Kvartalsanalysen er hele pointen med disciplinen: tæl kategorierne op over de seneste 12 uger, og navngiv det største mønster med anbefalet modtræk. Én tabt sag på pris er et vilkår - seks ud af ti er et prissætnings- eller målgruppeproblem, og det er en ledelsesbeslutning, ikke en salgsindsats.

## 7. Sund pipeline-tjekliste

Brug som hurtig facitliste i sundhedstjek-trinnet:

- [ ] Alle sager har næste skridt med dato og ejer (jernloven).
- [ ] Ingen sag over sin fasetærskel uden flag.
- [ ] Ingen [LUK ELLER GENÅBN]-sag uden en indstilling til beslutning.
- [ ] Ingen kunde over 30 % af pipelineværdien uden eksplicit flag.
- [ ] Nye emner er kommet ind siden sidste gennemgang - eller tørkesignalet er navngivet med dato.
- [ ] Tabte sager siden sidst har alle en kategori.
- [ ] Bevægelser siden sidste uge er vist - ikke kun øjebliksbilledet.
