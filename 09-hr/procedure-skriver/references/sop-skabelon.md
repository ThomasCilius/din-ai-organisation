# SOP-skabelon og udfyldt eksempel

Bruges i arbejdsgangens trin 5. Skabelonen er fast: alle sektioner med "(altid med)" skal med i hver SOP - også når indholdet er kort. En genkendelig struktur på tværs af alle virksomhedens SOP'er er halvdelen af værdien: vikaren ved altid hvor faldgruberne står.

## Indhold

1. [Skabelonen](#skabelonen)
2. [Udfyldningsregler](#udfyldningsregler)
3. [Del-SOP'er: hvornår og hvordan](#del-soper-hvornaar-og-hvordan)
4. [Udfyldt eksempel: månedlig fakturering](#udfyldt-eksempel-maanedlig-fakturering)

## Skabelonen

```markdown
# SOP: [Opgavenavn]

## Formål
[1-2 sætninger: hvorfor findes opgaven, og hvad går galt hvis den ikke udføres.]

## Omfang
Dækker: [hvad proceduren omfatter].
Dækker IKKE: [tilgrænsende opgaver - og hvor de er beskrevet, hvis de er].

## Ejer og ansvar
- Ejer: [navn, rolle] - ansvarlig for at proceduren er korrekt og opdateret.
- Udføres af: [navn/rolle - kan være en anden end ejeren].
- Næste revisionsdato: [dato, 6 eller 12 måneder frem].

## Frekvens og trigger
- Frekvens: [dagligt/ugentligt/månedligt/ved hændelse].
- Trigger: [det konkrete, observérbare signal der starter opgaven].

## Forudsætninger
- [Adgang/system 1 - og hvem der giver adgangen]
- [Fil/oplysning 2 - og hvor den ligger]
- [Viden 3 - og hvor den kan læses]

## Trin
1. [Ét verbum, ét navngivet system, ét konkret resultat.]
2. [Trin med beslutningspunkt: "Hvis X: gør A og fortsæt. Hvis ikke X: gør B - fortsæt IKKE."]
3. [Kritisk trin.]
   - Sådan ser godt ud: [konkret eksempel på det korrekte resultat].
4. [SKILL-KANDIDAT: begrundelse i én linje.] [Selve trinnet.]
...

## Hyppige fejl og faldgruber
- **[Fejl 1]:** [symptom] - [håndtering] - [eskalér til [navn] hvis ...].
- **[Fejl 2]:** [symptom] - [håndtering].

## Skill-kandidater
- Trin [n]: [hvorfor egnet - gentaget, regelbaseret, dokumentproducerende]. Næste skridt: skill-opskrift.

## Åbne spørgsmål og antagelser
- [ANTAGELSE] [hvad der er antaget, og hvem der kan bekræfte det].
- [ÅBENT SPØRGSMÅL] [hvad der mangler svar på].

## Revisionslog
| Dato | Version | Ændring | Af |
|---|---|---|---|
| [åååå-mm-dd] | 1.0 | Oprettet (udkast) | [navn + AI-assistent] |
```

## Udfyldningsregler

- **Formål er ikke pynt.** "Fordi vi skal fakturere" er ikke et formål; "sikre at alle projekttimer faktureres senest d. 5., så likviditeten ikke skrider" er. Formålet lader vikaren prioritere rigtigt når noget uventet sker.
- **Omfangets "Dækker IKKE" er obligatorisk.** Den ene linje forhindrer at SOP'en vokser sig formløs ved næste revision, og fortæller vikaren hvornår de er UDEN for proceduren og skal spørge.
- **Trin nummereres fortløbende - ingen underpunkter dybere end ét niveau.** Har et trin brug for underpunkter med egne underpunkter, er det en del-SOP.
- **5-12 trin pr. SOP** er normalområdet. Under 5: overvej om opgaven overhovedet behøver en SOP. Over 12: split i del-SOP'er.
- **Kritiske trin får "sådan ser godt ud".** Kritisk = en fejl her koster penge, kunder, data eller lovbrud. Eksemplet skal være ægte (fra interviewet) med realistiske tal og navne - et abstrakt eksempel kan ikke sammenlignes med skærmen.
- **Satser og frister anvises, aldrig indsættes.** Skriv "slå den aktuelle sats op på skat.dk" - ikke "3,79 kr./km". Undtagelse: virksomhedens EGNE valg (fx "vores betalingsfrist er 14 dage") må gerne stå der, for dem ejer virksomheden selv.
- **Revisionsloggen starter ved version 1.0 med "Oprettet (udkast)".** Hver senere ændring får en linje. En SOP hvis log er tom to år i træk er et rødt flag i sig selv.

## Del-SOP'er: hvornår og hvordan

Split når ét af disse gælder:

- Mere end 12 trin eller mere end 3 sider.
- Flere personer udfører hver sin fase (så får hver fase sin ejer).
- Faserne har forskellig frekvens (fx forberedelse ugentligt, godkendelse månedligt).

Sådan splittes:

- Navngivning: `sop-[opgave]-1-[fase].md`, `sop-[opgave]-2-[fase].md` - nummeret viser rækkefølgen.
- Hver del-SOP er komplet i sig selv (alle skabelonens sektioner) og linker til forgænger og efterfølger under Omfang: "Dækker IKKE: godkendelse - se sop-loenkoersel-2-godkendelse.md".
- Overdragelsespunktet mellem to del-SOP'er beskrives i BEGGE: del 1 slutter med "resultatet ligger i X og [navn] er adviseret", del 2 starter med samme tilstand som forudsætning.

## Udfyldt eksempel: månedlig fakturering

Et komplet, realistisk eksempel fra en lille konsulentvirksomhed - brug det som kalibrering af detaljeniveau, ikke som indhold der kopieres.

```markdown
# SOP: Månedlig fakturering af konsulentprojekter

## Formål
Sikre at alle fakturérbare timer og aftalte projektrater faktureres senest d. 5. i måneden,
så virksomhedens likviditet er forudsigelig og ingen omsætning glemmes.

## Omfang
Dækker: fakturering af timebaserede og fastprisprojekter til eksisterende kunder.
Dækker IKKE: rykkere ved manglende betaling (se sop-rykker-runde.md) og oprettelse af nye
kunder i e-conomic (spørg Mette).

## Ejer og ansvar
- Ejer: Mette Holm, bogholder - ansvarlig for at proceduren er korrekt og opdateret.
- Udføres af: Mette; ved fravær: Thomas (ejer).
- Næste revisionsdato: 2027-01-05.

## Frekvens og trigger
- Frekvens: månedligt.
- Trigger: den 1. hverdag i måneden, når timeregistreringen for forrige måned er lukket
  (mail fra Timelog: "Perioden er lukket").

## Forudsætninger
- Adgang til e-conomic (gives af Mette) og Timelog (gives af Thomas).
- Prislisten i Fælles/Salg/prisliste-aktuel.md - brug ALTID den, aldrig tal fra hukommelsen.
- Ordrebekræftelser i Fælles/Salg/[kundenavn]/.

## Trin
1. Åbn Timelog og træk rapporten "Fakturérbare timer pr. kunde" for forrige måned; gem som
   PDF i Fælles/Bogholderi/[år]/[måned]/.
2. Sammenlign rapportens kundeliste med listen over aktive projekter i Fælles/Salg/aktive-projekter.md.
   Hvis en aktiv kunde mangler i rapporten: stop og spørg projektlederen FØR du fortsætter -
   manglende timer er den hyppigste kilde til glemt omsætning.
3. Opret fakturakladde i e-conomic pr. kunde med linjer fra rapporten.
   - Sådan ser godt ud: kunde "Nordvest VVS ApS", linje 1 "Konsulentbistand marts, 34 timer
     a [sats fra prislisten]", CVR 12345678 (driftsselskabet - IKKE Nordvest Holding ApS).
4. Tjek hver kladde mod ordrebekræftelsen: beløb, CVR og betalingsfrist (vores standard: 14 dage).
   Hvis beløbet afviger fra ordrebekræftelsen: stop, notér afvigelsen og skriv til Thomas -
   send IKKE fakturaen.
5. [SKILL-KANDIDAT: gentaget, regelbaseret tekstproduktion.] Skriv følgemail-udkast pr. faktura
   efter skabelonen i Fælles/Bogholderi/følgemail-skabelon.md.
6. Læg alle kladder til godkendelse hos Thomas senest d. 3.; Thomas godkender og sender.
7. Notér i Fælles/Bogholderi/[år]/[måned]/faktureringslog.md: dato, antal fakturaer, samlet
   beløb, afvigelser.

## Hyppige fejl og faldgruber
- **Faktura sendt til holdingselskab:** symptom: kunden afviser fakturaen eller betaler ikke.
  Håndtering: kreditnota i e-conomic + ny faktura til driftsselskabets CVR. Tjekket i trin 3-4
  findes netop på grund af denne fejl (kostede 3 ugers forsinket betaling i 2025).
- **Timer registreret på forkert projekt:** symptom: en kunde har påfaldende få/mange timer
  ift. sidste måned. Håndtering: spørg konsulenten før fakturering - ret aldrig selv i Timelog.
- **Prisregulering ikke slået igennem:** symptom: satsen i kladden matcher ikke prislisten.
  Håndtering: prislisten vinder altid; eskalér til Thomas hvis ordrebekræftelsen siger andet.

## Skill-kandidater
- Trin 5 (følgemails): gentaget, regelbaseret, dokumentproducerende. Næste skridt: skill-opskrift.

## Åbne spørgsmål og antagelser
- Ingen.

## Revisionslog
| Dato | Version | Ændring | Af |
|---|---|---|---|
| 2026-07-07 | 1.0 | Oprettet (udkast) | Mette + AI-assistent |
```

Bemærk hvad eksemplet gør: hvert trin har ét verbum og navngivne systemer, beslutningspunkterne har begge udfald og et eksplicit "fortsæt IKKE", det kritiske trin har et ægte "sådan ser godt ud", faldgruberne kommer fra virkelige episoder (med årstal), satsen slås op i prislisten i stedet for at stå i dokumentet - og skill-kandidaten er markeret, så broen til skill-opskrift er lagt.
