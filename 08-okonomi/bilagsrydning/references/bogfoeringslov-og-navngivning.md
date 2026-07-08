# Bogføringsloven og navngivningskonventionen

Hvorfor bilag skal behandles som juridiske dokumenter, og de præcise regler for omdøbning. Læs denne fil før planen bygges (arbejdsgangens trin 5).

## Hvad bogføringsloven kræver (2022-loven)

Bogføringsloven af 2022 (lov nr. 700 af 24. maj 2022) sætter rammen for al bilagshåndtering:

1. **5 års opbevaring.** Bilag skal opbevares i 5 år fra udgangen af det regnskabsår de vedrører. Derfor må denne skill aldrig slette en fil - heller ikke en "åbenlys dublet".
2. **Digital opbevaring.** Digital opbevaring er tilladt, og for virksomheder omfattet af kravet om digitalt bogføringssystem er digital opbevaring med backup påkrævet (kravet indfases efter virksomhedstype og -størrelse - tjek aktuel status på erhvervsstyrelsen.dk frem for at citere indfasningsdatoer fra hukommelsen). En velordnet digital bilagsmappe er altså ikke bare praktisk - den er for mange virksomheder et lovkrav.
3. **Transaktionsspor og kontrolspor.** Hver registrering i bogføringen skal kunne følges til sit bilag, og hvert bilag til sin registrering - entydigt. Det er DERFOR navngivningskonventionen findes: dato + leverandør + beløb i filnavnet gør at bogholder/revisor kan matche fil mod postering uden at åbne hver enkelt fil.
4. **Bilagets indhold.** Et bilag skal dokumentere transaktionens realitet: dato, beløb, leverandør/modtager og ydelsens art. Mangler noget af dette, er bilaget svagt - flag det frem for at udfylde hullerne selv.
5. **Fakturakrav.** Fulde fakturaer skal bl.a. indeholde fakturanummer, sælgers CVR-nummer og momsbeløb. Forenklede fakturaer/kasseboner accepteres under en beløbsgrænse - slå den aktuelle grænse op på skat.dk (momsbekendtgørelsen), hardcod den ikke.

## Navngivningskonventionen i detaljer

Standard: `ÅÅÅÅ-MM-DD_leverandoer_beloeb-DKK.pdf`

| Del | Regel | Eksempel |
|---|---|---|
| Dato | Bilagsdatoen (fakturadato/købsdato) fra bilagets indhold - ALDRIG filens oprettelses- eller ændringsdato | 2026-04-14 |
| Leverandør | Små bogstaver, mellemrum → bindestreg, æ→ae, ø→oe, å→aa, ingen specialtegn. Forkort til det genkendelige (maks ca. 30 tegn) | broedrene-dahl |
| Beløb | Totalbeløb inkl. moms i DKK, decimalkomma → bindestreg, efterfulgt af `-DKK` | 450-00-DKK |
| Bilagsnr. (valgfrit) | Har virksomheden fortløbende bilagsnumre, tilføjes nummeret sidst | _117 |
| Filendelse | Original filendelse bevares altid (pdf, jpg, png, heic) | .pdf |

Fuldt eksempel: `2026-04-14_broedrene-dahl_450-00-DKK_117.pdf`

Hvorfor netop denne rækkefølge: datoen først gør at almindelig filsortering giver kronologisk orden; leverandør + beløb gør filen genfindelig fra bogføringen (kontrolsporet); ASCII-translitterationen (ae/oe/aa) gør navnene robuste på tværs af økonomisystemer, cloud-drev og revisorens værktøjer.

### Kollisioner og kanttilfælde

- **To bilag, samme dag, samme leverandør, samme beløb:** tilføj løbenummer før filendelsen: `..._450-00-DKK-2.pdf`. Undersøg først om det ER en dublet (samme fakturanummer = dublet → `dubletter/`).
- **Kreditnota:** beløbet med foranstillet minus i CSV'en, men i filnavnet skrives `kreditnota` efter beløbet: `2026-04-16_broedrene-dahl_450-00-DKK-kreditnota.pdf` (minus i filnavne skaber problemer i visse systemer).
- **Udenlandsk valuta uden DKK-beløb:** brug originalvaluta i navnet: `2026-04-20_openai_20-00-USD.pdf` - og flag rækken i CSV'en.
- **Ulæselig dato eller beløb:** filen omdøbes IKKE efter gæt. Den flyttes til `til-manuel-gennemgang/` med et neutralt navn: `[bedste kendte dato eller periode]_ukendt_[kort-aarsag].jpg`.
- **Flersidede PDF'er med flere bilag i én fil:** flag til manuel gennemgang med noten "flere bilag i én fil - bør splittes". Skillen splitter kun hvis brugeren beder om det, og splittet indgår da i planen.

## Momsafregningsrytme

Momsfrekvensen afhænger af virksomhedens omsætning: halvårlig for de mindste, kvartalsvis for mellemgruppen, månedlig for de største. Omsætningsgrænserne justeres og virksomheder kan flyttes mellem frekvenser - slå de aktuelle grænser og virksomhedens konkrete frister op på skat.dk (TastSelv Erhverv viser virksomhedens egne frister). Skillen bruger frekvensen til at afgrænse perioden og til at minde om næste frist i rapporten - altid med henvisning til skat.dk, aldrig med en dato fra hukommelsen.

## Kilder

- Bogføringsloven (2022): retsinformation.dk (lov nr. 700 af 24/05/2022) og erhvervsstyrelsen.dk (vejledninger + indfasning af digitale krav)
- Fakturakrav og forenklede fakturaer: momsbekendtgørelsen, retsinformation.dk + skat.dk
- Momsfrister og -frekvens: skat.dk / TastSelv Erhverv
