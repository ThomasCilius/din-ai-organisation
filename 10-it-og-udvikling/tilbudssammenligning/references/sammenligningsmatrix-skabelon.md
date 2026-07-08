# Sammenligningsmatrix - skabelon, udfyldning og eksempel

Målestokken er altid `byggebrief.md`. Matrixen gør tilbuddene sammenlignelige ved at tvinge hvert tilbud igennem de samme dimensioner - så et lavt tal ikke kan skjule et manglende vilkår.

## Indhold
1. Den faste matrix (8 dimensioner)
2. Sådan udfyldes hver celle
3. Spørgsmålsliste før valg
4. Udfyldt eksempel (2 tilbud)
5. Fra matrix til anbefaling

## 1. Den faste matrix

Én kolonne pr. tilbud, én række pr. dimension. Mindst disse 8:

| Dimension | Hvad du leder efter |
|---|---|
| Pris og prisform | Samlet beløb + fast/time. Ved time: er der loft og afrapportering? |
| Scope-match mod briefen | Hvor mange af briefens færdig-kriterier er dækket / delvist / ikke dækket |
| Eksplicit IKKE med | Hvad står der sort på hvidt at tilbuddet ikke omfatter |
| Drift, support, vedligehold | Hvad sker efter levering - pris, responstid, hvad er inkluderet |
| Ejerskab | Kode, data, domæne, hosting-konti - hvem ejer hvad efter levering |
| Exit og overdragelse | Hvordan kommer I videre uden leverandøren - adgange, kildekode, dokumentation |
| Databehandleraftale | Kun hvis der behandles persondata: tilbudt eller ej (GDPR art. 28) |
| Referencer og udførende | Referencer fra lignende opgaver; udføres af senior/junior/underleverandør |

Tilføj dimensioner briefen kræver (fx integration til bestemt system, mobilkrav, tilgængelighed) - men fjern aldrig nogen af de 8.

## 2. Sådan udfyldes hver celle

Marker hver celle med én status + en kort note. Aldrig bare et flueben:

- `dækket` - tilbuddet svarer klart og fuldt på dimensionen. Note: hvordan.
- `delvist` - delvist svar eller forbehold. Note: hvad mangler.
- `mangler` - dimensionen er slet ikke nævnt. Note: dette er et hul, ikke et nul.
- `uklart` - nævnt, men tvetydigt. Note: hvad skal afklares (bliver et åbent spørgsmål).

**"Mangler" er farligere end "delvist".** Det tilbud der tier om drift, ejerskab eller exit, er ofte det der bliver dyrest bagefter. Et manglende svar tæller aldrig som et grønt flueben.

Scope-match kvantificeres: tæl briefens færdig-kriterier og skriv "7 af 10 dækket, 2 delvist, 1 mangler" frem for "dækker det meste".

## 3. Spørgsmålsliste før valg

Stil dem hvor tilbuddet ikke selv svarer - de fire mest værdifulde:

1. **Referencer:** Kan I give to referencer fra lignende opgaver, vi må ringe til?
2. **Udførende:** Hvem laver konkret arbejdet - senior, junior eller underleverandør? Prisen kan dække en senior, mens en junior udfører.
3. **Ændringer efter levering:** Hvad koster en ændring efter go-live - timepris, minimumsgebyr, responstid?
4. **Ophør:** Hvis samarbejdet stopper - hvem har så koden, data, domænet og adgangene, og hvad koster overdragelsen?

Svarene skrives ind i matrixen eller som åbne spørgsmål i outputtet. Ingen af de fire må stå ubesvaret i en endelig anbefaling.

## 4. Udfyldt eksempel (2 tilbud)

Brief: bookingløsning, behandler kundedata (navn, e-mail, telefon). 10 færdig-kriterier.

| Dimension | Tilbud A (Bureau X) | Tilbud B (Freelancer Y) |
|---|---|---|
| Pris og prisform | 45.000 kr. fast | 62.000 kr. fast |
| Scope-match | delvist - 6/10 dækket, 3 delvist, 1 mangler | dækket - 9/10 dækket, 1 delvist |
| Eksplicit IKKE med | uklart - ikke oplyst | dækket - liste med 4 fravalg |
| Drift/support | mangler - ikke nævnt | dækket - 12 mdr., 2 t./md. inkl. |
| Ejerskab | uklart - "vi hoster det" | dækket - kunde ejer kode + domæne |
| Exit/overdragelse | mangler | delvist - kildekode udleveres, ej dok. |
| Databehandleraftale | mangler (blokerende) | dækket - DPA vedlagt |
| Referencer/udførende | uklart | dækket - 2 referencer, senior udfører |

Læsning: A er 17.000 kr. billigere, men billig fordi drift, ejerskab, exit og databehandleraftale er udeladt. Manglende DPA er blokerende, da der behandles persondata. B dækker mere for pengene målt mod briefen.

## 5. Fra matrix til anbefaling

- Læs kolonnerne lodret: hvor mange `dækket` mod `mangler`/`uklart` pr. tilbud.
- Vægt blokerende flag tungest - et blokerende flag slår en lavere pris.
- Gør billigste tilbuds fravalg synligt: hvorfor er det billigt?
- Skriv én anbefaling med forbehold, ikke en rangliste uden årsag: "gå videre med B under forbehold af [åbent punkt]".
- Prisrimelighed vurderes mod scope og aktuelt dansk marked (slås op) - aldrig som isoleret tal.
