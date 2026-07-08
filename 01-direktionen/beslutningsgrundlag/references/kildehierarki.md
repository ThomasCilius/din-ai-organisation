# Kildehierarki for danske SMV-beslutninger

Læs denne fil før første opslag i en research-runde. Den fortæller hvilke danske kilder der findes pr. emne, hvordan et tal bliver VERIFICERET, og hvordan kilder citeres så de kan genfindes.

## Indhold

1. [De tre niveauer](#de-tre-niveauer)
2. [Niveau 1: Primærkilder pr. emne](#niveau-1-primaerkilder-pr-emne)
3. [Niveau 2: Sekundære analyser](#niveau-2-sekundaere-analyser)
4. [Niveau 3: Medier](#niveau-3-medier)
5. [Hvornår er et tal VERIFICERET?](#hvornaar-er-et-tal-verificeret)
6. [Citatformat](#citatformat)
7. [Særligt om CVR-regnskaber](#saerligt-om-cvr-regnskaber)
8. [Satser og lovkrav: slå altid op på ny](#satser-og-lovkrav-slaa-altid-op-paa-ny)

## De tre niveauer

| Niveau | Hvad | Regel |
|---|---|---|
| 1. Primærkilder | Den instans der SELV har produceret tallet | Brug altid hvis muligt |
| 2. Sekundære analyser | Nogen der har bearbejdet primærdata | OK, men markér UBEKRÆFTET indtil primærkilden er set |
| 3. Medier | Nogen der refererer niveau 1 eller 2 | Kun som vejviser - følg henvisningen til bunds |

Grundregel: et tal arver ALDRIG status fra en kilde der selv citerer en anden. "Børsen skriver at Danmarks Statistik siger..." er niveau 3, indtil du selv har set tallet hos Danmarks Statistik.

## Niveau 1: Primærkilder pr. emne

**Marked, branche og samfundsøkonomi**

- Danmarks Statistik / statistikbanken.dk - branchetal, omsætningsindeks, beskæftigelse, forbrug, byggeri, detailhandel. Citér altid med tabelnummer (fx "tabel FIKS44"), så tallet kan genfindes.
- Nationalbanken (nationalbanken.dk) - renter, valutakurser, udlånsstatistik, konjunkturvurderinger.
- Konkurrence- og Forbrugerstyrelsen - markedsanalyser af konkrete brancher.

**Konkurrenter og samarbejdspartnere**

- CVR / datacvr.virk.dk - officielle årsregnskaber, ejerforhold, antal ansatte, stiftelsesår, status (aktiv/under konkurs). Se afsnittet om CVR-regnskaber nedenfor.
- Tinglysning.dk - ejendomshandler og hæftelser, når fast ejendom indgår i beslutningen.

**Love, regler og satser**

- Retsinformation.dk - gældende lovtekst. Citér lov og paragraf, aldrig en gengivelse.
- Skat.dk - skattesatser, moms, fradrag, afskrivningsregler.
- Virk.dk og Erhvervsstyrelsen - registrerings- og indberetningskrav, tilskudsordninger.

**Branchespecifik statistik**

- Brancheorganisationer med egen statistikproduktion: DI, Dansk Erhverv, SMVdanmark, Finans Danmark, HORESTA, TEKNIQ Arbejdsgiverne, Landbrug & Fødevarer m.fl. Bemærk: en brancheorganisation er primærkilde til sin egen medlemsstatistik, men part i sagen når den vurderer politiske rammevilkår - skeln mellem tal og holdning.
- Energistyrelsen, Trafikstyrelsen, Sundhedsdatastyrelsen osv. - sektorstatistik pr. ressort.

**Virksomhedens egne tal**

- Regnskab, bogføring, ordrebog, kundeliste, timeregistrering. Egne tal ER primærkilder og skal bruges før eksterne - citér dem som "eget regnskab 2025" eller "egen ordrebog pr. [dato]". Bed brugeren om filerne frem for at skønne over deres indhold.

**Priser og tilbud**

- Indhentede leverandørtilbud, offentliggjorte prislister, udbudsmaterialer. Et konkret skriftligt tilbud er primærkilde; "det plejer at koste cirka..." er SKØN.

## Niveau 2: Sekundære analyser

Bankers konjunkturanalyser, konsulenthuses brancherapporter, universiteters forskning, EU-statistik formidlet gennem tredjepart. Brugbare til overblik og til at FINDE primærkilder - men tal herfra står som UBEKRÆFTET, indtil den bagvedliggende primærkilde er set. Notér altid hvilken primærkilde analysen selv angiver.

## Niveau 3: Medier

Aviser, fagmedier, nyhedsbreve. Brug dem til at opdage at et tal FINDES - aldrig som belæg. Arbejdsgang: find mediets kildehenvisning, gå til primærkilden, verificér dér. Mangler mediet en kildehenvisning, behandles påstanden som ikke-belagt.

## Hvornår er et tal VERIFICERET?

Et tal må kun markeres VERIFICERET når ALLE tre betingelser er opfyldt:

1. Du har selv set primærkilden i denne session (åbnet siden, læst filen eller fået tallet direkte fra brugerens eget materiale).
2. Du citerer den med navn og tabel/side/paragraf, så en læser kan genfinde tallet.
3. Du har noteret både tallets egen dato (hvilket år/kvartal dækker det?) og din opslagsdato.

Alt andet er UBEKRÆFTET eller SKØN. Særligt: tal fra din egen hukommelse/træningsdata er ALDRIG VERIFICERET - de kan være forældede eller forkerte, og de citeres i så fald som "modellens hukommelse, skal verificeres" under UBEKRÆFTET.

Har du ikke adgang til websøgning: sig det tidligt, markér alle eksterne tal UBEKRÆFTET, og skriv ved hvert tal PRÆCIS hvor brugeren selv kan slå det op ("statistikbanken.dk, søg på [emne]").

## Citatformat

Fast format i faktatabellen og kildelisten:

```
[Kilde], [tabel/side/paragraf], [dato for tallet], hentet [opslagsdato], [link hvis muligt]
```

Eksempler på formen (indholdet er illustrativt):

- Danmarks Statistik, tabel FIKS44, 2025-tal, hentet 2026-07-07, statistikbanken.dk
- Årsrapport 2025 for [Konkurrent ApS], CVR 12345678, hentet via datacvr.virk.dk 2026-07-07
- Eget regnskab, resultatopgørelse 2025, modtaget af bruger 2026-07-07

Regler:

- Opfind aldrig et tabelnummer, en URL eller et CVR-nummer. Kan du ikke genfinde referencen, så skriv kilden uden den manglende detalje og markér tallet UBEKRÆFTET.
- Link til primærkilden, ikke til en artikel om den.
- Én kilde pr. påstand er minimum; modstridende kilder nævnes begge med begge tal.

## Særligt om CVR-regnskaber

CVR er guldgruben til konkurrentanalyse, men læs regnskaberne rigtigt:

- Små virksomheder (regnskabsklasse B) skal typisk IKKE oplyse omsætning. Du ser i stedet bruttofortjeneste, årets resultat, egenkapital og antal ansatte.
- Skal du alligevel vurdere en konkurrents størrelse: brug bruttofortjeneste og antal ansatte som indikatorer, og markér enhver omsætningsvurdering som SKØN med regnestykket vist ("bruttofortjeneste X kr. og Y ansatte indikerer omsætning i størrelsesordenen...").
- Tjek regnskabsåret - mange SMV'er har forskudt regnskabsår, så "seneste regnskab" kan være 18 måneder gammelt. Flag det efter friskhedsreglen.
- Tjek status og noter: "going concern"-forbehold, ny revisor eller stort udbytte lige før salg er signaler i sig selv.

## Satser og lovkrav: slå altid op på ny

Disse forældes og må ALDRIG tages fra hukommelsen eller genbruges fra et tidligere dokument:

| Emne | Slå op på |
|---|---|
| Skattesatser, moms, fradrag, afskrivning | skat.dk |
| Morarente, rykkergebyrer | retsinformation.dk (renteloven) + Nationalbanken (referencesats) |
| Lovkrav og paragraffer | retsinformation.dk (gældende version) |
| Renteniveau, valutakurser | nationalbanken.dk |
| Tilskuds- og støtteordninger | virk.dk / den ansvarlige styrelse |

Skriv aktuel sats ind med opslagsdato - og flag i dokumentet at satsen gælder pr. den dato.
