# Rapport-skabelon: portefoljestatus-[aar-maaned].md

Den faste skabelon for porteføljerapporten plus et fuldt udfyldt eksempel. Brug skabelonen præcis som den står - faste overskrifter gør rapporterne sammenlignelige måned for måned, og det er dér mønstrene viser sig (samme projekt gult tre måneder i træk, samme leverandør bag to røde).

## Indhold

1. [Skabelonen](#1-skabelonen)
2. [Feltdefinitioner](#2-feltdefinitioner)
3. [Udfyldt eksempel](#3-udfyldt-eksempel)
4. [Formuleringsregler pr. felt](#4-formuleringsregler-pr-felt)

## 1. Skabelonen

```markdown
# Porteføljestatus - [måned år]

Udarbejdet: [dato] | Til: [ledelsesmøde/bestyrelse/bank] | Kladde - ikke sendt

## Overblik

| Projekt | Ejer | Farve | Seneste nåede milepæl | Næste milepæl + dato | Top-risiko | Beslutningsbehov |
|---|---|---|---|---|---|---|
| ... | ... | ... | ... | ... | ... | ... |

## Beslutningsbehov

1. [Ja/nej-spørgsmål]? (Beslutter: [rolle]. Frist: [dato]. Ved nej/udskydelse: [konsekvens].)
2. ...

## Farveskift siden sidst

- **[Projekt]: [gammel farve]→[ny farve].** Årsag: [konkret hændelse]. Konsekvens: [effekt på tid/økonomi/leverancer]. Ønsket handling: [hvad ledelsen skal gøre].

## Projekter med manglende status

- **[Projekt]** - seneste kendte data: [hvad + dato]. Indstilling: [ansvarlig statusgiver/paus/tag op i projekt-prioritering].

## Antagelser og åbne spørgsmål

- [ANTAGELSE] ...
- ...

## Kilder

- [Projekt]: [ugestatus-fil + dato / risikolog + dato / brugerens svar + dato]
```

Sektionerne Overblik, Beslutningsbehov, Antagelser og åbne spørgsmål samt Kilder er ALTID med. Farveskift og Projekter med manglende status medtages når de er relevante - og udelades de, skriv én linje om hvorfor ("ingen farveskift siden sidst").

## 2. Feltdefinitioner

| Felt | Indhold | Må ikke indeholde |
|---|---|---|
| Projekt | Projektets navn, kort | Beskrivelser |
| Ejer | Én navngiven person (projektejer eller projektleder) | Roller uden navn ("teamet", "IT") |
| Farve | GRØN, GUL, RØD eller STATUS MANGLER | Mellemfarver ("gul/grøn"), pile, smileys |
| Seneste nåede milepæl | Tilstand + dato ("betalingsmodul testet, 12/6") | Procenter, aktiviteter, stemninger |
| Næste milepæl + dato | Tilstand + planlagt dato | "Snarest", kvartalsangivelser uden dato |
| Top-risiko | ÉN risiko i årsag→konsekvens-form, den vigtigste | Risikolister (resten står i risikologgen) |
| Beslutningsbehov | Ja/nej-spørgsmål med frist, eller "-" | "Bør overvejes", orienteringspunkter |

Én linje pr. projekt - kan noget ikke være i linjen, hører det til i bilagssektionerne eller i projektets egne dokumenter. Overblikstabellen skal kunne læses på under to minutter.

## 3. Udfyldt eksempel

Fiktivt eksempel - en SMV med fire projekter i juli:

```markdown
# Porteføljestatus - juli 2026

Udarbejdet: 7/7 2026 | Til: ledelsesmødet 14/7 | Kladde - ikke sendt

## Overblik

| Projekt | Ejer | Farve | Seneste nåede milepæl | Næste milepæl + dato | Top-risiko | Beslutningsbehov |
|---|---|---|---|---|---|---|
| Webshop 2.0 | Mette | GUL | Betalingsmodul testet (12/6) | Go-live (15/8) | Fragtintegration afventer leverandørens API-adgang - go-live kan glide | Se pkt. 1 |
| ISO 9001 | Karin | GRØN | Procedurehåndbog godkendt (26/6) | Intern audit gennemført (20/8) | Auditkonsulent kun ledig i uge 34 | - |
| Ny CNC-maskine | Jens | RØD | Leverandørkontrakt underskrevet (2/5) | Maskine installeret (var: 1/7) | Levering udskudt uden ny bekræftet dato - ordrer i august er truet | Se pkt. 2 |
| Nyt CRM | (ingen) | STATUS MANGLER | Leverandør valgt (14/4) | Ukendt | Ingen har givet status i to måneder | Se pkt. 3 |

## Beslutningsbehov

1. Godkendes 25.000 kr. til ekstern hjælp til fragtintegrationen på Webshop 2.0 inden 15/7? (Beslutter: ejerleder. Ved nej: go-live glider til oktober og efterårskampagnen må aflyses.)
2. Skal vi kræve dagbod jf. kontraktens pkt. 8 over for maskinleverandøren, eller acceptere ny leveringsdato mod kompensation? (Beslutter: ejerleder. Frist: 18/7, inden ordrebekræftelser for august.)
3. Skal Nyt CRM have en navngiven ejer og statusgiver, eller sættes projektet på pause til efter Webshop 2.0? (Beslutter: ledelsesmødet 14/7.)

## Farveskift siden sidst

- **Ny CNC-maskine: GUL→RØD.** Årsag: leverandøren udskød levering 24/6 uden ny bekræftet dato. Konsekvens: installation glider forbi 1/7-milepælen, og augustordrer på den nye linje er truet. Ønsket handling: beslutning om dagbod eller ny dato (pkt. 2).

## Projekter med manglende status

- **Nyt CRM** - seneste kendte data: leverandør valgt 14/4 (ugestatus uge 16). Ingen ugestatus eller svar siden. Indstilling: navngiv ejer eller tag projektet op i projekt-prioritering (pkt. 3).

## Antagelser og åbne spørgsmål

- [ANTAGELSE] ISO 9001-budgettet er uændret - ingen økonomidata i ugestatusserne siden maj.
- Åbent: er auditkonsulenten bekræftet til uge 34, eller kun forespurgt?

## Kilder

- Webshop 2.0: ugestatus uge 27 (3/7) + risikolog-webshop.md (30/6).
- ISO 9001: ugestatus uge 27 (4/7).
- Ny CNC-maskine: brugerens svar i vandmelon-interview (7/7) + beslutningslog.md (24/6).
- Nyt CRM: ugestatus uge 16 (14/4) - intet nyere fundet.
```

Læg mærke til: den røde har et beslutningsbehov med frist, "status mangler" er selv blevet et beslutningspunkt, ingen procenter optræder nogen steder, og hver linje kan handles på uden opfølgende spørgsmål.

## 4. Formuleringsregler pr. felt

- **Milepæle skrives som tilstande, ikke aktiviteter:** "kontrakt underskrevet", ikke "arbejder med kontrakten". En tilstand er enten nået eller ikke nået - det er dét der gør farven verificerbar.
- **Top-risiko i årsag→konsekvens-form:** "fragtintegration afventer leverandørens API-adgang - go-live kan glide". Vage etiketter ("tidsplan", "ressourcer") siger intet. Kun ÉN risiko pr. linje - den vigtigste; resten hører hjemme i projektets risikolog.
- **Beslutningsbehov peger fremad:** hvad skal ledelsen GØRE, med frist og konsekvens ved udskydelse. Orienteringer ("til info: ...") er ikke beslutningsbehov og hører ikke hjemme i kolonnen.
- **Tonen er nøgtern:** ingen udråbstegn, ingen "desværre", ingen "heldigvis". Rapporten dokumenterer - den sælger ikke. Skal rapporten til bank eller bestyrelse, styrer voice-profil.md formuleringerne, men aldrig farverne.
- **Datoer altid med:** en milepæl uden dato kan ikke verificeres, og en frist uden dato kan ikke overholdes.
