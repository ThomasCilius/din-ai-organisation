# Kontomapping - fra dansk økonomisystem-eksport til rapportens fem linjer

Indhold:

1. [Hvad du får som input](#1-hvad-du-faar-som-input)
2. [Eksportformater pr. system](#2-eksportformater-pr-system)
3. [Fortegn og momskonventioner](#3-fortegn-og-momskonventioner)
4. [Standardmapping til rapportens fem linjer](#4-standardmapping-til-rapportens-fem-linjer)
5. [Tvetydige konti - spørg, gæt aldrig](#5-tvetydige-konti---spoerg-gaet-aldrig)
6. [Mapping mellem bogføring og budget](#6-mapping-mellem-bogfoering-og-budget)
7. [Datakvalitetstjek før du bygger tal](#7-datakvalitetstjek-foer-du-bygger-tal)

## 1. Hvad du får som input

To filer, typisk:

- **Faktiske tal:** eksport fra økonomisystemet - i danske SMV'er næsten altid e-conomic, Dinero eller Billy. Brugbare rapporttyper: "resultatopgørelse pr. måned" (bedst), "saldobalance" for perioden (fint), eller rå posteringsliste (kræver aggregering pr. konto først).
- **Budget:** et regneark (Excel/Google Sheets/CSV) med én kolonne pr. måned. Kontonavnene her matcher sjældent bogføringens 1:1 - se afsnit 6.

Bed altid om eksport MED kontonumre, ikke kun kontonavne - numrene gør mappingen entydig og kildereferencerne præcise. Kan brugeren kun levere en PDF, så bed om CSV/Excel i stedet; tal aflæst fra PDF øger fejlrisikoen og gør kildereferencer upræcise.

## 2. Eksportformater pr. system

Fælles for alle tre: eksporterne bygger på en kontoplan inspireret af dansk standardkontoplan, med drift øverst (omsætning → vareforbrug → omkostninger → resultat) og balance nederst. Detaljerne varierer med opsætningen, så læs altid filens faktiske kolonner frem for at antage:

| System | Typisk eksport | Kendetegn |
|---|---|---|
| e-conomic | "Saldobalance" eller "Resultatopgørelse" som CSV/Excel | Kontonumre + kontonavne; sumkonti/overskriftskonti indgår som rækker - PAS PÅ ikke at tælle dem med som posteringer (dobbelttælling) |
| Dinero | "Saldobalance" (Excel) under Rapporter | Færre, bredere standardkonti; ofte færre kontonumre synlige - bed om visning med numre |
| Billy | "Saldobalance"/"Resultatopgørelse" (CSV/Excel) | Engelske interne kontotyper kan optræde i eksporten (revenue/expense); navne kan være brugertilpassede |

Genkender du ikke formatet: vis brugeren de første rækker, som du læser dem, og få bekræftet at du tolker kolonnerne rigtigt, før du fortsætter.

## 3. Fortegn og momskonventioner

- **Fortegn:** i saldobalancer står omsætning ofte med negativt fortegn (kreditsaldo) og omkostninger med positivt. I resultatopgørelses-rapporter er fortegnene typisk "læsevenlige" (omsætning positiv). Afgør konventionen ved at se på en kendt konto (omsætning), og skriv din tolkning i rapportens antagelsessektion.
- **Moms:** driftskonti i eksporten er ekskl. moms - det er også dét budgettet skal være. Ser du tegn på at budgettet er lagt inkl. moms (fx runde "kundepris"-tal), så spørg. Sammenligning af ekskl.- mod inkl.-tal er en klassisk 25 %-fejl.
- **Beløbsformat:** danske eksporter bruger komma som decimalseparator og punktum som tusindtalsseparator. Ved CSV-indlæsning: verificér at 1.234,56 ikke er blevet til 1,23456 eller 123456.

## 4. Standardmapping til rapportens fem linjer

Rapportens fem linjer og hvad der typisk indgår (dansk standardkontoplan-logik - brug som udgangspunkt, ikke facit):

| Rapportlinje | Indgår typisk | Bemærk |
|---|---|---|
| **Omsætning** | Alle salgs-/omsætningskonti (varesalg, ydelser, projektindtægter) | Rabatter og kreditnotaer skal med (som fradrag); "anden indtægt" (fx renteindtægt, offentligt tilskud) holdes udenfor eller vises separat - spørg |
| **Dækningsbidrag** | Omsætning minus variable omkostninger: vareforbrug, materialer, underleverandører, direkte projektomkostninger, fragt af varer | DB = omsætning − variable omkostninger. Findes der ingen DB-linje i kontoplanen, beregner du den - og viser hvilke konti der indgik |
| **Faste omkostninger** | Lokaler/husleje, lønninger (medmindre direkte produktionsløn er mappet som variabel - spørg), administration, IT/software, forsikringer, markedsføring, leasing, biler | Afskrivninger: med under faste omkostninger, men vist som egen underlinje hvis de er væsentlige |
| **Resultat (før skat)** | DB − faste omkostninger − afskrivninger ± finansielle poster | Angiv altid om finansielle poster (renter) er med - og vær konsistent måned for måned |
| **Likviditet (ultimo)** | Ultimosaldo på bankkonti fra balancen eller kontoudtog | KUN ét statustal. Ingen prognose - det er `likviditetsoverblik`s domæne |

## 5. Tvetydige konti - spørg, gæt aldrig

Konti der IKKE kan mappes uden brugerens svar - klassikerne:

| Konto | Tvetydigheden | Spørgsmål til brugeren |
|---|---|---|
| "Konsulenter"/"Fremmed arbejde" | Underleverandør på kundeopgaver (variabel) eller fx revisor/advokat (fast)? | "Er det folk der arbejder på kundeopgaver, eller rådgivere til virksomheden selv?" |
| "Løn" | Direkte produktionsløn (variabel i nogle forretningsmodeller) eller funktionærløn (fast)? | "Skal løn regnes som fast, eller svinger den med produktionen?" |
| "Biler"/"Transport" | Varelevering (variabel) eller firmabiler (fast)? | Multiple choice med begge |
| "Ejerudlæg"/"Mellemregning" | Ofte slet ikke drift | "Skal denne konto overhovedet med i rapporten?" |
| Konti med saldo men intet budget | Nyt aktivitetsområde eller fejlkontering? | Flag som [DATAHUL: intet budget for konto X] |

Reglen fra SKILL.md gælder her med fuld styrke: mappingen vises som komplet tabel og godkendes af brugeren FØR der bygges tal. Svarer brugeren "brug standardmappingen", så følg afsnit 4 og markér hver tvetydig konto som [ANTAGELSE] i rapporten.

## 6. Mapping mellem bogføring og budget

Budgetark og bogføring taler sjældent samme sprog. Typiske forskelle og håndtering:

1. **Forskellig granularitet:** budgettet har "Markedsføring 15.000/md.", bogføringen har fire konti (annoncer, messer, sponsorater, tryksager). → Aggregér bogføringens konti op til budgettets niveau - aldrig omvendt (du kan ikke fordele et budgettal ud på konti uden at digte).
2. **Forskellige navne, samme indhold:** "Husleje" vs. "Lokaleomkostninger". → Map på indhold, vis parret i mappingtabellen.
3. **Poster uden modpart:** budgetlinje uden nogen bogføringskonto (aktivitet ikke startet?) eller konto uden budgetlinje. → Begge vises i afvigelsestabellen med [DATAHUL]-markering; de forsvinder ikke bare.
4. **Årsbudget uden månedsfordeling:** budgettet findes kun som ét årstal pr. linje. → Spørg om fordelingen. Foreslår brugeren "del med 12", så gør det, men markér [ANTAGELSE: årsbudget delt ligeligt - sæsonvariation ikke indregnet] og vær varsom med at kalde månedsafvigelser for reelle.

## 7. Datakvalitetstjek før du bygger tal

Kør disse kontroller på eksporten FØR afvigelsestabellen bygges - fejl her forplanter sig til alt:

- [ ] Perioden i eksporten matcher rapportmåneden (tjek datofelter/rapporthoved - ikke filnavnet).
- [ ] Delkonti summer til sumkonti/totaler i eksporten selv. Gør de ikke: [DATAHUL], og spørg om der er filtreret konti fra i eksporten.
- [ ] Ingen sum-/overskriftsrækker er talt med som data (dobbelttælling - se afsnit 2).
- [ ] Fortegnskonventionen er afgjort og noteret (afsnit 3).
- [ ] Decimal-/tusindtalsseparatorer er indlæst korrekt (stikprøve på 2-3 beløb mod råfilen).
- [ ] Måneden ser "hel" ud: en påfaldende lav omsætning kan betyde at bogføringen ikke er færdig for måneden - spørg, før du rapporterer et drama der bare er manglende bogføring.

Fejler et tjek, og brugeren ikke kan afklare det: rapportér det som [DATAHUL] og fortsæt kun med de dele af rapporten der ikke afhænger af det - eller stop, hvis fundamentet er for hullet. Sig ærligt hvad der er verificeret, og hvad der ikke er.
