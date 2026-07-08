# Rapportskabelon: brain-tjek-rapport-[aar-mm-dd].md

Læses når rapporten skal skrives. Brug præcis disse overskrifter. Nedenfor først den tomme skabelon, derefter et udfyldt mini-eksempel der viser tonen og detaljeniveauet.

## Tom skabelon

```markdown
# Brain-tjek [aar-mm-dd] - [let/fuld kørsel]

## Resumé

[Maks. 5 linjer: X filer gennemgået i Y mapper. Fund: A KRITISK, B HØJ,
C MELLEM, D LAV. Vigtigste fund i én sætning. Anbefalet første handling.]

## Fund (prioriteret)

### KRITISK

1. **[kategori] - [filnavn]**
   - Belæg: "[ordret citat]" ([fil], [dato]) vs. "[ordret citat]" ([fil], [dato])
   - Foreslået handling: [én konkret handling]
   - [Evt.: Kræver afklaring: [det konkrete spørgsmål til ejeren]]

### HØJ

[samme format]

### MELLEM

[samme format]

### LAV

[samme format - må gerne bunkes: "5 filer mangler metadata-blok: a.md, b.md, ..."]

## Kendte og afviste fund fra tidligere kørsler

- [fund] - afvist [dato] / kendt siden [dato], afventer [hvad]

## Filer uden fund

[Kort liste eller optælling pr. mappe - så ejeren ved de ER gennemgået.]

## Udført efter godkendelse

[Udfyldes efter godkendelse og udførelse. Pr. handling: hvad blev gjort,
verificeret ja/nej. Tom indtil da: "Afventer godkendelse."]

## Næste kørsel

Anbefalet: [let/fuld] kørsel ca. [dato]. [Én linjes begrundelse.]
```

## Udfyldt mini-eksempel

```markdown
# Brain-tjek 2026-07-07 - let kørsel

## Resumé

23 filer gennemgået i 4 mapper. Fund: 1 KRITISK, 2 HØJ, 3 MELLEM, 4 LAV.
Vigtigste fund: timeprisen er forskellig i prisliste.md og
virksomhedsprofil.md - tilbud kan være sendt med forkert pris.
Anbefalet første handling: godkend fund 1, så prisen er entydig igen.

## Fund (prioriteret)

### KRITISK

1. **Modstridende - salg/prisliste.md**
   - Belæg: "timepris 950 kr." (salg/prisliste.md, revideret 2025-01-10)
     vs. "timepris 1.100 kr." (virksomhedsprofil.md, revideret 2026-05-02)
   - Foreslået handling: ret prisliste.md til 1.100 kr. (profilen er
     autoritativ) og opdatér revisionsdatoen.

### HØJ

2. **Forældet - drift/lønkørsel.md**
   - Belæg: "Susanne godkender lønkørslen inden d. 25." - virksomhedsprofil.md
     angiver at Susanne er fratrådt 2026-03-31.
   - Foreslået handling: bekræft ny godkender hos ejeren og opdatér filen.
   - Kræver afklaring: hvem har overtaget løngodkendelsen?

3. **Forældet - oekonomi/rykkerprocedure.md**
   - Belæg: "rykkergebyr 100 kr." uden kilde eller dato.
   - Foreslået handling: slå aktuelt maksimalt rykkergebyr op (renteloven -
     se fx erhvervsstyrelsen.dk eller spørg revisor) og indsæt med kilde og
     dato. Beløbet må ikke opdateres fra hukommelsen.

### MELLEM

4. **Forældreløs - kunder/onboarding-nye-kunder.md**
   - Belæg: ingen metadata-blok - hverken kilde, dato eller status.
   - Foreslået handling: spørg den der ejer kundeonboarding, og tilføj
     metadata - eller genindsaml via videnfil-interview.

[fund 5-6 i samme format]

### LAV

7. **Skabelon-uensartet - 4 filer** (moede-rutine.md, ferieplan.md,
   it-leverandoerer.md, kaffeaftale.md)
   - Belæg: metadata-blok mangler status-felt.
   - Foreslået handling: tilføj "Status: gældende" - kan godkendes samlet.

## Kendte og afviste fund fra tidligere kørsler

- Dublet: to filer om kørselsgodtgørelse - afvist 2026-06-02 (ejeren vil
  beholde begge; salgs- og driftsvinkel).

## Filer uden fund

12 filer uden fund: hele mappen /marketing (5), /hr (4), samt
telefonpolitik.md, gaveregler.md, wifi-gaester.md.

## Udført efter godkendelse

Afventer godkendelse.

## Næste kørsel

Anbefalet: fuld kørsel ca. 2026-10-01 (seneste fulde kørsel var 2026-04-03;
kvartalskadencen rammer oktober).
```

## Formkrav

- Én linjes begrundelse pr. fund - rapporten skal kunne skimmes på 2 minutter.
- Ordrette citater med filnavn og dato ved ALLE konflikter - ejeren skal kunne dømme uden at åbne filerne.
- "Kræver afklaring"-linjer formuleres som konkrete spørgsmål, ikke som forbehold.
- LAV-fund må bunkes; KRITISK-fund må aldrig bunkes.
- Rapporten dateres pr. kørsel og overskriver aldrig en tidligere rapport.
