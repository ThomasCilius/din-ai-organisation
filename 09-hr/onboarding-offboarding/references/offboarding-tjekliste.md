# Offboarding-tjekliste - fra opsigelse til efter fratræden

## Indhold

1. Fase 0: Straks ved opsigelsen
2. Fase 1: Inden sidste arbejdsdag
3. Fase 2: Sidste arbejdsdag
4. Fase 3: Efter fratræden
5. Samlet skabelon
6. Hyppige fejl

Offboarding er tidskritisk i begge ender: varsler og frister løber fra opsigelsesdatoen, og viden forsvinder på sidste arbejdsdag. Byg tjeklisten i fire faser, hver med ansvarlig og frist pr. punkt.

## Fase 0: Straks ved opsigelsen (samme uge)

- [ ] **Afklar situationen:** egen opsigelse, arbejdsgivers opsigelse eller bortvisning? Ved bortvisning, tvist, sygemelding under opsigelse, graviditet/barsel eller tvivl om saglighed: STOP - jurist/arbejdsgiverorganisation ind over før alt andet (se aldrig-reglerne i SKILL.md).
- [ ] **Varsel beregnet og verificeret:** For funktionærer opsagt af arbejdsgiver stiger varslet trinvis med anciennitet (funktionærlovens § 2); ved egen opsigelse er funktionærens varsel som udgangspunkt kortere. Slå den aktuelle varselstrappe op på retsinformation.dk (søg "funktionærloven"), og tjek om kontrakt eller overenskomst forlænger varslet. Varsler løber typisk fra udgangen af den måned opsigelsen er afgivet i - regn datoen ud og skriv "varsel loeber til: [dato] [VERIFICÉR MOD FUNKTIONÆRLOVEN § 2]".
- [ ] **Fritstilling/suspension:** hvis arbejdsgiver overvejer det, er det en juridisk beslutning med lønkonsekvenser - flag til jurist, beslut aldrig i tjeklisten.
- [ ] **Skriftlighed:** bekræft at opsigelsen foreligger/kvitteres skriftligt med dato - selve dokumentet leveres af jurist/arbejdsgiverorganisation, aldrig af denne skill.
- [ ] **Kommunikationsplan:** hvem får det at vide hvornår - teamet før kunderne, kunderne før LinkedIn. Udkast til besked skrives i virksomhedens voice og afleveres som kladde.

## Fase 1: Inden sidste arbejdsdag

- [ ] **Overdragelsesplan:** listen over alt kun den fratrædende kan - opgaver, kunderelationer, systemejerskaber, "hvor ligger tingene". Hver post får en modtager og en overdragelsesdato.
- [ ] **Procedure-skriver på nøgleviden:** for hver opgave der kun sidder i den fratrædendes hoved, kør skillen `procedure-skriver` INDEN sidste dag - en SOP skrevet i fratrædelsesperioden er billig; den samme viden genopfundet bagefter er dyr.
- [ ] **Kunde-/leverandøroverdragelse:** varsling af berørte kunder (udkast, sendes af et menneske), ny kontaktperson udpeget.
- [ ] **Exitsamtale booket:** ikke sidste dags sidste time - læg den 1-2 uger før, så svarene kan følges op. Guide: `exit-interview-guide.md`.
- [ ] **Ferieafklaring:** afholdes restferie i opsigelsesperioden, eller afregnes den? Reglerne for hvornår arbejdsgiver kan varsle ferie afholdt i en opsigelsesperiode afhænger af varslets længde - slå op på borger.dk og lad lønansvarlig afgøre det.

## Fase 2: Sidste arbejdsdag

- [ ] **Udstyrsretur:** pc, telefon, nøgler/adgangskort, betalingskort, [andet fra virksomhedsprofilen] - kvitteres på liste.
- [ ] **Adgangsliste til lukning:** navngivne systemer (mail, fagsystem, fildeling, kodeordshåndtering, betalingsadgange, sociale medier-konti) med lukketidspunkt pr. adgang. Skillen lukker ALDRIG selv - listen er en handleliste til IT/ejer (skillen `adgangsstyring`). Betalingsadgange og administratorrettigheder lukkes på selve dagen; mail håndteres efter GDPR-planen (se `gdpr-ved-fratraeden.md`).
- [ ] **Fælles koder roteres:** alle delte kodeord den fratrædende har kendt, skiftes - også dem "vi stoler jo på hinanden"-logikken ellers ville springe over.
- [ ] **Farvel:** en ordentlig afsked er employer branding - tidligere medarbejdere anbefaler (eller advarer mod) arbejdspladsen i årevis.

## Fase 3: Efter fratræden

- [ ] **Sidste løn og ferieafregning:** tilgodehavende ferie (samtidighedsferie, 2,08 dage pr. måned) afregnes efter ferieloven - typisk som feriegodtgørelse indberettet til FerieKonto. Beregningen laves af lønansvarlig/bogholder; aktuelle regler og satser på borger.dk. Husk feriefridage/6. ferieuge hvis kontrakt/overenskomst giver dem, samt eventuel bonus/provision optjent frem til fratræden.
- [ ] **Mailkonto:** autosvar + lukkeplan efter Datatilsynets retningslinjer - se `gdpr-ved-fratraeden.md`.
- [ ] **Persondata:** sletning/opbevaring efter dokumenterede frister - se `gdpr-ved-fratraeden.md`.
- [ ] **Exitsamtalens mønstre:** læg (anonymiserede) hovedpointer i den samlede exitoversigt - se `exit-interview-guide.md`.
- [ ] **Abonnementer og licenser:** opsig personbundne licenser og fjern personen fra distributionslister, vagtplaner og automatiske rutiner.

## Samlet skabelon

Brug output-strukturen i SKILL.md (## Output). Hvert punkt fra faserne ovenfor indsættes under den rette fase-overskrift med formen:

```
- [ ] [handling] - ansvarlig: [navn] - frist: [dato]
```

## Hyppige fejl

1. Varslet regnes fra opsigelsesdagen i stedet for fra månedens udgang - hele tidslinjen skrider.
2. Adgange lukkes dag 1 efter opsigelsen "for en sikkerheds skyld" - og overdragelsen kvæles. Lukning følger planen, ikke panikken (undtagelse: bortvisning, hvor jurist styrer).
3. Exitsamtalen holdes i døren på vej ud - svarene bliver høflige og ubrugelige.
4. Ferieafregningen glemmes fordi "det klarer lønsystemet vel" - kontrollér at den lønansvarlige har punktet.
5. Delte koder roteres ikke - den hyppigste reelle sikkerhedsbrist efter en fratræden.
