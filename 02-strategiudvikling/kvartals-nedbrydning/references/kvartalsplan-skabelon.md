# Kvartalsplan - skabelon og udfyldt eksempel

Dybdemateriale til `kvartals-nedbrydning`. Læs denne fil hver gang en kvartalsplan skal skrives - skabelonen herunder er den obligatoriske struktur for `kvartalsplan-Q[x]-[aar].md`.

## Indhold

1. [Én-sides-disciplinen](#1-en-sides-disciplinen)
2. [Skabelonen (blank)](#2-skabelonen-blank)
3. [Feltregler](#3-feltregler)
4. [Udfyldt eksempel](#4-udfyldt-eksempel)

## 1. Én-sides-disciplinen

Planen skal kunne læses på 2 minutter og hænges op ved kaffemaskinen. Fylder den mere end én side, er den ikke en kvartalsplan men et dokument ingen åbner igen. Konkrete grænser:

- Max 5 mål i tabellen. Overskud ryger under Parkeret.
- Max 3 milepæle pr. mål - milepæle er kontrolpunkter, ikke en projektplan. Kræver et mål mere detaljeret planlægning, hører den detaljering hjemme i `projekt-kickoff`, ikke her.
- Én linje pr. videreført/droppet/parkeret punkt.
- Ingen indledning, ingen baggrundsafsnit, ingen metodebeskrivelse.

## 2. Skabelonen (blank)

```markdown
# Kvartalsplan Q[x] [år] - [virksomhed]

Status: KLADDE - afventer ejerlederens godkendelse. Version: [aar-md-dag].
Bygger på: strategiplan.md ([versionsdato]) + strategi-status-Q[x-1].md ([dato]).

## Kvartalets mål (max 5)

| # | Mål | Ejer | Battle | Færdig når | Deadline | Første handling (inden 14 dage) |
|---|-----|------|--------|------------|----------|--------------------------------|
| 1 |     |      |        |            |          |                                |

## Milepæle og afhængigheder

- **Mål 1:** [milepæl + dato] → [milepæl + dato]. [Evt. EKSTERN: leverandør/myndighed/sæson + hvad der gøres hvis den glipper.]

## Videreført og droppet fra sidste kvartal

- VIDEREFØRT: [mål] - [én linjes begrundelse].
- DROPPET: [mål] - [én linjes begrundelse].

## Parkeret - bevidst fravalgt dette kvartal

- [idé/mål] - genbesøges 1. uge i Q[x+1].

## Antagelser og åbne spørgsmål (altid med)

- [ANTAGELSE: ...] / [ÅBENT: ...]

## Grundlag og kilder (altid med)

- Data: [hvilke filer/tal planen bygger på].
- Mavefornemmelse: [hvilke vurderinger der IKKE bygger på data].
```

## 3. Feltregler

| Felt | Regel |
|---|---|
| Mål | Én sætning, resultat frem for aktivitet. |
| Ejer | Ét navn, ét menneske - max 2 mål pr. ejer. Uspurgt ejer markeres [ANTAGELSE]. |
| Battle | Battlets navn ordret fra `strategiplan.md` - eller "DRIFTSØNSKE, ikke strategi" / "[UBEKRÆFTET BATTLE]". |
| Færdig når | Observerbart: se, tælle eller åbne. Baseline med hvis målet er et tal. |
| Deadline | Dato inden for kvartalet - ikke "ultimo kvartalet". |
| Første handling | Konkret handling + dato inden 14 dage fra godkendelse. |
| Milepæle | Max 3 pr. mål. EKSTERN-afhængigheder navngives (hvem, hvad, hvornår). |
| Videreført/droppet | Hvert uafsluttet mål fra sidste kvartal optræder præcis én gang - aldrig udeladt. |
| Parkeret | Fravalg gøres synlige så de kan genbesøges - en tom Parkeret-sektion efter en prioriteringsdiskussion er et rødt flag. |

Flag der kan optræde i planen (skriv dem ordret så de er lette at finde):

- `FLAG: kræver frigjort tid, ingen aflastning aftalt` - 70 %-reglen er brudt.
- `DRIFTSØNSKE, ikke strategi` - intet battle-ophæng; ejerlederen afgør.
- `[ANTAGELSE: ...]` - udfyldt hul; skal bekræftes ved godkendelsen.
- `EKSTERN: ...` - afhængighed uden for virksomhedens kontrol.

## 4. Udfyldt eksempel

Fiktiv virksomhed: Brandt Maskinservice ApS, 17 ansatte, service og reparation af fødevareproduktionsudstyr. Strategiplanens battles: (A) "Serviceaftaler som fast omsætning", (B) "Lønsomhed før volumen", (C) "Kendt som fødevare-specialist".

```markdown
# Kvartalsplan Q3 2026 - Brandt Maskinservice ApS

Status: KLADDE - afventer ejerlederens godkendelse. Version: 2026-07-06.
Bygger på: strategiplan.md (2025-11-14) + strategi-status-Q2.md (2026-06-26).

## Kvartalets mål (max 5)

| # | Mål | Ejer | Battle | Færdig når | Deadline | Første handling (inden 14 dage) |
|---|-----|------|--------|------------|----------|--------------------------------|
| 1 | 10 serviceaftaler hos eksisterende kunder | Mette | A | 10 underskrevne aftaler (baseline: 3) | 15/9 | Mette ringer til de 20 største kunder inden 12/7 |
| 2 | Ny prisbog godkendt og i brug | Thomas | B | Prisbog godkendt af ledergruppen og gennemgået på personalemøde | 5/9 | Thomas trækker dækningsgrad pr. kundetype inden 14/7 |
| 3 | Servicetekniker ansat | Pia | A | Underskrevet kontrakt, start senest 1/10 | 20/9 | Pia lægger jobopslag op inden 10/7 |

## Milepæle og afhængigheder

- **Mål 1:** 20 kunder kontaktet (25/7) → 5 aftaler (15/8) → 10 aftaler (15/9). Aflastning: Mettes tilbudsopgaver overtages af Henrik i juli-august.
- **Mål 2:** Dækningsgradsanalyse (14/7) → udkast til ledergruppen (15/8) → personalemøde (5/9).
- **Mål 3:** Opslag live (10/7) → samtaler (uge 33-34) → kontrakt (20/9). EKSTERN: kandidatmarkedet - ved 0 kvalificerede ansøgere pr. 15/8 aktiveres rekrutteringsbureau (beslutning hos ejerleder).

## Videreført og droppet fra sidste kvartal

- VIDEREFØRT: Serviceaftale-målet (var 8 i Q2, nåede 3) - Q2 var højsæson; Q3 har reel kapacitet, og målet er hævet til 10 akkumuleret.
- DROPPET: "Ny hjemmeside" - intet battle-ophæng; ejerleder besluttede 26/6 at parkere til Q1 2027.

## Parkeret - bevidst fravalgt dette kvartal

- LinkedIn-synlighed (battle C) - venter til prisbogen er på plads; genbesøges 1. uge i Q4.
- Nyt lagersystem - DRIFTSØNSKE, ikke strategi; ejerleder afgør om det skal have en plads i Q4.

## Antagelser og åbne spørgsmål (altid med)

- [ANTAGELSE: Henrik kan overtage Mettes tilbudsopgaver i juli-august - ikke aftalt endnu.]
- [ÅBENT: skal serviceaftale-prisen følge den nye prisbog (mål 2) eller den gamle? Afklares før 15/8.]

## Grundlag og kilder (altid med)

- Data: strategi-status-Q2.md (målstatus), økonomisystem (baseline 3 aftaler, dækningsgrader).
- Mavefornemmelse: vurderingen af at Q3 har "reel kapacitet" bygger på ejerlederens skøn, ikke på timedata.
```

Bemærk i eksemplet: kun 3 mål (jernloven siger at 3 er bedre end 5), hvert mål sporer til et navngivet battle, battle C hviler bevidst dette kvartal og står under Parkeret, videreførelsen er begrundet, den eksterne afhængighed har en aftalt reaktion, og skellet mellem data og mavefornemmelse er eksplicit.
