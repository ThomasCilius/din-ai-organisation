# Risikoformulering - eksempelsamling

Formlen: **fordi [årsag - et faktum i dag] kan [hændelse - noget konkret der kan indtræffe], hvilket [konsekvens - hvad det koster i tid, penge eller kvalitet]**.

Tre test enhver formulering skal bestå:

1. **Årsagstesten:** står årsagen som et verificerbart faktum i dag ("leverandøren er eneleverandør"), ikke som en frygt ("leverandøren virker usikker")?
2. **Handletesten:** kan en navngiven person gøre noget ved den i morgen? Kan ingen handle på den, er den formuleret for vagt.
3. **Sondringstesten:** står den i fremtidsform? "Er sket" hører til på issue-listen, ikke her.

Skidt/godt-par for de syv hyppigste SMV-risikoområder:

## 1. Nøgleperson

- SKIDT: "Risiko: ressourcer."
- GODT: "Fordi Jens er den eneste der kan konfigurere anlægget, kan sygdom eller opsigelse standse installationen, hvilket skubber idriftsættelsen 4-6 uger og udløser dagbod."
- Peger på mitigering: sidemandsoplæring, dokumentation af opsætningen.

## 2. Leverandør

- SKIDT: "Risiko: leverandøren."
- GODT: "Fordi styringen kun kan leveres af én leverandør, kan en forsinkelse hos dem forsinke hele montagen, hvilket skubber lanceringen mindst en måned."
- Peger på mitigering: delleverancer med faste terminer i kontrakten, afklaring af alternativ leverandør nu.

## 3. Kunde og scope

- SKIDT: "Risiko: kunden ændrer mening."
- GODT: "Fordi kravene til fase 2 ikke er skriftligt godkendt af kunden, kan sene ændringsønsker tvinge omarbejde, hvilket æder bufferen og presser dækningsbidraget."
- Peger på mitigering: skriftlig godkendelse før fase 2, ændringshåndtering med pris pr. ændring.

## 4. IT og teknik

- SKIDT: "Risiko: tekniske problemer."
- GODT: "Fordi det nye system skal udveksle data med økonomisystemet via en integration ingen af os har bygget før, kan integrationen fejle i test, hvilket forsinker go-live og kræver ekstern konsulent."
- Peger på mitigering: byg og test integrationen FØRST (tidlig falsifikation), indhent fast tilbud på konsulentberedskab.

## 5. Økonomi og likviditet

- SKIDT: "Risiko: økonomien."
- GODT: "Fordi projektet forudbetales med kun 20 % og hovedfaktureringen ligger efter levering, kan to måneders forsinkelse presse likviditeten i Q4, hvilket kan tvinge os til at trække på kassekreditten."
- Peger på mitigering: milepælsfakturering, likviditetsvarsel til `likviditetsoverblik`.

## 6. Myndigheder og kontrakt

- SKIDT: "Risiko: godkendelser."
- GODT: "Fordi byggetilladelsen først er søgt i denne måned og kommunens sagsbehandlingstid er ukendt for os, kan godkendelsen komme efter planlagt byggestart, hvilket skubber hele planen dag for dag."
- Peger på mitigering: forhåndsdialog med forvaltningen, plan B for rækkefølgen af arbejder der ikke kræver tilladelsen.

## 7. Kapacitet og drift

- SKIDT: "Risiko: tid / travlhed."
- GODT: "Fordi projektdeltagerne har drift ved siden af og reelt kun har 1-2 dage om ugen til projektet, kan en travl ordreperiode standse fremdriften, hvilket gør milepælen i oktober urealistisk."
- Peger på mitigering: aftalt fast projektdag, eksplicit ledelsesbeslutning om prioritet når driften spidser til.

## Omskrivningsteknik

Når brugeren leverer en vag etiket, så spørg dig frem til de tre led i stedet for at gætte:

- Etiket → årsag: "Hvad er det konkret ved [etiketten] der bekymrer - hvad er faktum i dag?"
- Årsag → hændelse: "Hvad er det værste der realistisk kan ske på grund af det?"
- Hændelse → konsekvens: "Hvad koster det i tid, penge eller kvalitet, hvis det sker?"

Skriv aldrig en risiko ind i loggen før alle tre led er på plads eller markeret [AFKLARES].
