# CSV-format - revisorvenlig bilagsliste

Specifikation for `bilag-[periode].csv`. Formatet matcher det danske revisorer og bogholdere typisk beder om: én række pr. bilag, alle beløb specificeret, og en filreference der matcher den omdøbte fil.

## Kolonner

Præcis disse kolonner, i denne rækkefølge:

| # | Kolonne | Indhold | Eksempel |
|---|---|---|---|
| 1 | dato | Bilagsdato fra bilagets indhold, ÅÅÅÅ-MM-DD | 2026-04-14 |
| 2 | leverandoer | Leverandørens navn som på bilaget | Circle K |
| 3 | tekst | Kort beskrivelse af hvad der er købt | Diesel, varevogn |
| 4 | beloeb_ekskl_moms | Beløb uden moms, DKK | 360,00 |
| 5 | momsbeloeb | Momsbeløbet, DKK | 90,00 |
| 6 | beloeb_inkl_moms | Totalbeløb, DKK | 450,00 |
| 7 | kategori | Én af skillens kategorier | Transport/kørsel |
| 8 | filnavn | Det omdøbte filnavn (nøglen mellem liste og mappe) | 2026-04-14_circle-k_450-00-DKK.pdf |
| 9 | note | Flag og forbehold - tom hvis intet | beregnet moms |

Kolonne 1-8 er kontrakten fra revisorformatet; kolonne 9 er skillens flagkolonne. Har revisoren bedt om et andet format (interviewspørgsmål 3): følg revisorens format og bevar note-kolonnen som den sidste.

## Formateringsregler

- Separator: semikolon (`;`) - dansk Excel åbner semikolonseparerede filer korrekt; kommaseparerede kolliderer med decimalkommaet.
- Decimaltegn: komma (`360,00`) og altid to decimaler. Ingen tusindtalsseparator.
- Tegnsæt: UTF-8. Æ, ø og å er tilladt i kolonnerne leverandoer, tekst, kategori og note - men aldrig i filnavn (se navngivningsreglerne).
- Dato: ÅÅÅÅ-MM-DD, så listen sorterer korrekt som tekst og matcher filnavnene.
- Første linje er kolonneoverskrifterne, præcis som i tabellen ovenfor.
- Rækkefølge: sorteret efter dato, ældste først.

## Eksempel

```csv
dato;leverandoer;tekst;beloeb_ekskl_moms;momsbeloeb;beloeb_inkl_moms;kategori;filnavn;note
2026-04-02;Dinero;Regnskabsprogram april;280,00;70,00;350,00;Software/abonnementer;2026-04-02_dinero_350-00-DKK.pdf;
2026-04-14;Circle K;Diesel varevogn;360,00;90,00;450,00;Transport/kørsel;2026-04-14_circle-k_450-00-DKK.pdf;beregnet moms
2026-04-20;Google Ireland;Google Ads april;1240,00;0,00;1240,00;Markedsføring;2026-04-20_google-ireland_1240-00-DKK.pdf;EU-køb/reverse charge
2026-04-28;Restaurant Noa;Kundemiddag;780,00;195,00;975,00;Repræsentation;2026-04-28_restaurant-noa_975-00-DKK.pdf;25 % momsfradrag
2026-04-30;Ukendt;Ulæselig kassebon;;;;Til manuel gennemgang;2026-04-30_ukendt_ulaeselig.jpg;ulæselig - dato fra brugers oplysning
```

## Særtilfælde

- **Kreditnota:** egen række med negative beløb (`-360,00`) og noten "kreditnota" - den udligner aldrig stille en anden række.
- **Udenlandsk valuta:** står DKK-beløbet på bilaget (fx kortudtog-linje), bruges det. Ellers angives originalbeløb + valuta i tekst-kolonnen, beløbskolonnerne efterlades tomme, og rækken flages "valuta - omregnes af bogholder". Skillen slår aldrig en vekselkurs op fra hukommelsen.
- **Beregnet moms:** viser bilaget kun totalbeløb inkl. dansk moms, beregnes momsen som 20 % af bruttobeløbet - og rækken flages "beregnet moms".
- **Splittet bilag** (fx hotel + restauration): to rækker med samme filnavn og noten "split 1/2" og "split 2/2".
- **Bilag uden moms** (forsikring, gebyrer): momsbeloeb 0,00 og beloeb_ekskl_moms = beloeb_inkl_moms - intet flag nødvendigt.
- **Til manuel gennemgang:** rækken medtages med de felter der KAN aflæses; resten efterlades tomme (aldrig gættet), kategori "Til manuel gennemgang" og en årsag i note.

## Kontrolregler før aflevering

1. Antal rækker (ekskl. overskrift) = antal behandlede bilag, inkl. manuel gennemgang. Splitrækker tæller som ét bilag - afstem mod antal unikke filnavne.
2. Pr. række: beloeb_ekskl_moms + momsbeloeb = beloeb_inkl_moms (tomme felter undtaget).
3. Hvert filnavn i CSV'en findes faktisk i mappestrukturen - og omvendt.
4. Alle flag fra kategoriseringen (EU-køb, beregnet moms, tvivl, split) er landet i note-kolonnen.
5. Summerne (ekskl. moms, momsbeløb, inkl. moms) gengives i bilagsrapportens overblik - regn dem ud fra CSV'en, aldrig fra hukommelsen.
