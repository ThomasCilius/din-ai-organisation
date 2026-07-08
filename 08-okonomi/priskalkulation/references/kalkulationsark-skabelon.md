# Skabeloner: kalkulationsark og anbefalingsnotat

Brug PRÆCIS disse to skabeloner. Faste sektioner må ikke udelades - er en sektion tom, skrives "ingen" eller årsagen. Rækkefølgen antagelser → beregning er bevidst: læseren skal møde forudsætningerne før resultatet.

---

## Skabelon 1: kalkulationsark

Filnavn: `kalkulation-[emne]-[aaaa-mm-dd].md` (fx `kalkulation-timepris-2026-07-07.md`)

```markdown
# Kalkulation: [emne]

Dato: [aaaa-mm-dd] · Model: [timepris / kostpris-plus / dækningsbidrag] · Status: KLADDE - beslutningsgrundlag, ikke facit

## 1. Opgave og afgrænsning
[2-3 linjer: hvad kalkuleres, for hvem (B2B/B2C), og hvad er IKKE med]

## 2. Antagelser
[Tabel - HVER række har kilde eller [ANTAGELSE]-markering. Satser markeres "verificér aktuel sats" med kilde]

| # | Antagelse | Værdi | Kilde/markering |
|---|---|---|---|
| A1 | ... | ... | Bruger / regnskab / [ANTAGELSE] / verificér: skat.dk |

## 3. Beregning
[Alle mellemregninger vist trin for trin - ingen tal uden synlig oprindelse i sektion 2]

## 4. Nøgletal
[DB, DG, nulpunktsomsætning, sikkerhedsmargin - med én linjes fortolkning pr. tal]

## 5. Følsomhed
[Firescenarie-tabellen: ±10 % pris og ±10 % volumen + fremhævelse af den hårdeste faktor.
Ved rabat-/prisstigningsovervejelse: tilføj beregningen fra noegletal-og-foelsomhed.md]

## 6. Scenarier
[2-3 prisscenarier med konsekvens for resultat og nulpunkt]

| Scenarie | Pris | Resultat | Nulpunkt | Bemærkning |
|---|---|---|---|---|
| Forsigtig | ... | ... | ... | ... |
| Anbefalet | ... | ... | ... | ... |
| Ambitiøs | ... | ... | ... | ... |

## Antagelser og aabne spoergsmaal (altid med)
[De antagelser der flytter resultatet mest + hvad der skal verificeres før beslutning + ubesvarede interviewspørgsmål]

## Kilder (altid med)
[Brugerens data (hvilke filer/tal), virksomhedsprofil.md, satskilder: skat.dk, borger.dk, virk.dk, atp.dk]
```

---

## Skabelon 2: anbefalingsnotat

Filnavn: `anbefaling-[emne]-[aaaa-mm-dd].md` - maks. 1 side. Notatet skal kunne læses uden kalkulationsarket, men henviser til det.

```markdown
# Anbefaling: [emne]

Dato: [aaaa-mm-dd] · Grundlag: kalkulation-[emne]-[aaaa-mm-dd].md · Status: KLADDE - AI anbefaler, du beslutter

## Anbefaling
[1-2 sætninger: det anbefalede scenarie med prisen - formuleret betinget af antagelserne,
fx "Ved 65 % fakturerbarhed skal timeprisen mindst være X kr. ekskl. moms"]

## Begrundelse
[3-5 punkter: hvorfor dette scenarie - kobling til nulpunkt, sikkerhedsmargin og følsomhed]

## Største usikkerhed
[DEN antagelse der flytter resultatet mest + konkret måde at efterprøve den på]

## Momsformalia
[B2C: kommunikér prisen inkl. moms: X kr. / B2B: angiv ekskl. moms med tydelig markering]

## Naeste skridt
[1-3 handlinger: verificér satser, tæl fakturerbare timer, skriv tilbuddet (skillen tilbud), forbered forhandling (forhandlings-forberedelse)]

## Antagelser og aabne spoergsmaal (altid med)
[Kort liste - fuld tabel i kalkulationsarket]

## Kilder (altid med)
[Som i kalkulationsarket]
```

---

## Kvalitetskrav til begge artefakter

1. Internt regnes ALT ekskl. moms - moms optræder kun i kommunikationslinjen til B2C.
2. Danske talformater: punktum som tusindtalsseparator, komma som decimaltegn (fx 1.263.000 kr. / 12,5 %).
3. Ingen sats står som fakta - altid "verificér aktuel sats" + kilde.
4. Statuslinjen "KLADDE - beslutningsgrundlag, ikke facit" må aldrig fjernes, heller ikke på brugerens opfordring - tilbud til kunden skrives i skillen `tilbud`, ikke her.
