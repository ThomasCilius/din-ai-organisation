# Skabelon: program-brief.md og arbejdsstroem-oversigt.md

De to faste artefakter plus feltdefinitioner og et udfyldt eksempel. Brug skabelonerne præcis som de står - faste overskrifter og samme tabelkolonner gør programmet muligt at genlæse og statusopdatere gennem hele forløbet.

## Indhold

1. [program-brief.md](#1-program-briefmd)
2. [arbejdsstroem-oversigt.md](#2-arbejdsstroem-oversigtmd)
3. [Feltdefinitioner for oversigten](#3-feltdefinitioner-for-oversigten)
4. [Udfyldt eksempel](#4-udfyldt-eksempel)

## 1. program-brief.md

```markdown
# Program-brief: [initiativ]

Udarbejdet: [dato] | Programejer: [navn] | Kladde - ikke godkendt

## Tilstand
[Desktop eller Claude Code] - [én linje om hvad det betyder for kørslen]

## Mål og strategisk kobling
[Ét mål med retning og tal] - understøtter [navngivet strategisk mål].

## Arbejdsstrømme
1. [Strøm] - ejer: [navn]
2. ...

## Kritisk vej og tværgående milepæle
Kritisk vej: [strøm] -> [strøm] -> ...
Tværgående milepæle: [punkt hvor flere strømme skal være i mål samtidig].

## Handoff-kontrakter
- Strøm [X] -> [Y]: [artefakt], acceptkriterium: [...], modtager: [navn].

## Antagelser og åbne spørgsmål
- [AFKLARES] / [ANTAGELSE] ...
```

## 2. arbejdsstroem-oversigt.md

```markdown
# Arbejdsstrøm-oversigt: [initiativ]

Udarbejdet: [dato] | Kladde

| # | Strøm | Afdeling | Skill der bruges | Ejer (navn) | Input-artefakt | Output-artefakt | Afhængighed | Milepæl | Status |
|---|---|---|---|---|---|---|---|---|---|
| 1 | ... | ... | ... | ... | ... | ... | - | ... | ikke startet |
| 2 | ... | ... | ... | ... | ... | ... | 1 | ... | ikke startet |

Status: ikke startet / i gang / afventer / færdig.
Kritiske strømme (på den kritiske vej) markeres med * efter nummeret.
```

Begge filer er ALTID med. Oversigten er kilden til status; program-briefen er kilden til hvorfor og hvordan.

## 3. Feltdefinitioner for oversigten

| Felt | Indhold | Må ikke indeholde |
|---|---|---|
| # | Løbenummer; * hvis strømmen er på den kritiske vej | - |
| Strøm | Kort navn på den sammenhængende del | Aktiviteter ("arbejde med...") |
| Afdeling | Nummer/navn (01-10) - hvor skillen bor | - |
| Skill der bruges | Den konkrete skill, fx `priskalkulation` | "marketing klarer det" |
| Ejer (navn) | Ét navngivet menneske | Afdelinger, roller uden navn |
| Input-artefakt | Det navngivne dokument strømmen starter fra | "info fra salg" |
| Output-artefakt | Det navngivne dokument strømmen afleverer | Vage leverancer |
| Afhængighed | Numre på strømme denne venter på, eller "-" | "lidt af det hele" |
| Milepæl | Tilstand der kan besvares ja/nej | Procenter, stemninger |
| Status | ikke startet / i gang / afventer / færdig | Procenter, "kører" |

Én linje pr. strøm. Kan noget ikke være i linjen, hører det til i program-briefen.

## 4. Udfyldt eksempel

```markdown
# Arbejdsstrøm-oversigt: Lancer abonnement som ny ydelse

Udarbejdet: 8/7 2026 | Kladde

| # | Strøm | Afdeling | Skill der bruges | Ejer (navn) | Input-artefakt | Output-artefakt | Afhængighed | Milepæl | Status |
|---|---|---|---|---|---|---|---|---|---|
| 1* | Business case | 01 | beslutningsgrundlag | Ejerleder | virksomhedsprofil.md | beslutningsgrundlag-abonnement.md | - | Go besluttet | færdig |
| 2* | Prissætning | 08 | priskalkulation | Karin | strøm 1 | priskalkulation-abonnement.md | 1 | Pris godkendt | i gang |
| 3* | Vilkår og jura | 01 | kontrakt-tjek | Ejerleder | strøm 2 | abonnementsvilkaar.md | 2 | Vilkår klar | ikke startet |
| 4* | Byg selvbetjening | 10 | byggebrief -> klar-tjek | Jens | strøm 2, 3 | leveret system | 2, 3 | Godkendt UAT | ikke startet |
| 5 | Salgsmateriale | 06 | tilbud | Jens | strøm 2, 3 | tilbud-abonnement.md | 2, 3 | Materiale klar | ikke startet |
| 6* | Lancering | 07 | content-kalender, pressemeddelelse | Mette | strøm 4, 5 | lanceringsplan | 4, 5 | Lanceret | ikke startet |
```

Læg mærke til: strøm 5 er ikke kritisk (kører parallelt med byg), strømmene 4 og 5 er begge input til strøm 6 (tværgående milepæl før lancering), hver ejer er et navn, og hvert output er et navngivet artefakt, den næste strøm kan bruge som input.
