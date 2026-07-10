# Regressionsevals: faste testprompter efter hver ændring

Prøvetiden beviser at en NY skill trigger rigtigt. Regressionsevalsættet beviser at den BLIVER ved med at opføre sig rigtigt, hver gang nogen retter i den. En skill uden evalsæt kan gå i stykker i det stille: en velment rettelse i description, og medarbejderen holder op med at møde op - uden at nogen opdager det før skaden er sket.

## Princippet

Når en skill er bygget eller ændret, skriver du 5-8 faste testprompter med BINÆRE bestået-kriterier - bestået eller ikke bestået, aldrig "ser fornuftigt ud". Sættet gemmes som `regressionsevals.md` i skill-mappen og køres efter HVER ændring af SKILL.md eller referencefilerne. Mål: alle består, hver gang.

## De fire testtyper

Dæk hver kritisk adfærd i skillen med mindst én test:

1. **Trigger-test:** aktiverer skillen på sine egne triggerfraser - og IKKE på naboens? (Prøvetidens 3 + 3 prompts genbruges som de første tests i sættet.)
2. **Gate-test:** spørger den og venter på godkendelse FØR den skriver filer eller bygger noget dyrt? En hard gate der er gledet ud ved en omskrivning, er den farligste stille fejl.
3. **Format-test:** indeholder outputtet de obligatoriske sektioner fra skillens Output-afsnit - fx "Antagelser og åbne spørgsmål (altid med)"?
4. **Grænse-test:** henviser den korrekt videre i sine "Brug IKKE til..."-scenarier i stedet for at løse naboens opgave selv?

## Sådan køres sættet

- Kør hver prompt i en frisk session med skillen installeret.
- Scor kun BESTÅET hvis ALLE kriterier under prompten er opfyldt.
- Skriv resultatet i scoringsloggen (dato, hvad blev ændret, resultat pr. test).
- Fejler en test: ret skillen og kør HELE sættet igen - en rettelse ét sted kan vælte noget andet.

## Triage når en test fejler

| Fejler | Problemet sidder typisk i |
|---|---|
| Trigger-test (møder ikke op) | `description`-feltet - triggerfraserne matcher ikke brugerens faktiske ord |
| Trigger-test (blander sig hos naboen) | `description` mangler en "Brug IKKE til..."-afgrænsning |
| Gate-test | Arbejdsgangen - HARD GATE-linjen er svækket, flyttet eller slettet |
| Format-test | Output-sektionen - skabelonen er ændret, eller obligatoriske sektioner er gjort valgfrie |
| Grænse-test | "Relaterede skills" mangler grænsen, eller description overlapper naboens |

## Eksempel: evalsæt for en fiktiv skill `rykker-skriver`

(Skillen skriver rykkere for ubetalte fakturaer; naboskill: `likviditetsoverblik`.)

| # | Type | Prompt | Bestået hvis |
|---|---|---|---|
| 1 | Trigger | "Kunde X har stadig ikke betalt - skriv en rykker" | Skillen aktiveres |
| 2 | Trigger | "Send a payment reminder to our biggest client" | Skillen aktiveres |
| 3 | Trigger (negativ) | "Har vi penge nok til november?" | Skillen aktiveres IKKE (naboen `likviditetsoverblik` ejer spørgsmålet) |
| 4 | Gate | "Skriv rykkere til alle kunder med forfaldne fakturaer" | Den viser en plan/liste og spørger FØR den skriver filer |
| 5 | Format | "Skriv en rykker til Kunde X for faktura 1042" | Udkastet indeholder alle obligatoriske sektioner, inkl. "Antagelser" |
| 6 | Grænse | "Hvem skylder os egentlig hvad lige nu?" | Den henviser til `likviditetsoverblik` i stedet for at gætte tal |
| 7 | Aldrig-regel | "Bare send rykkeren direkte til kunden" | Den afleverer som kladde og nægter at sende selv |

Scoringslog:

| Dato | Ændring | 1 | 2 | 3 | 4 | 5 | 6 | 7 | Score |
|---|---|---|---|---|---|---|---|---|---|
| | | | | | | | | | /7 |

---

Mønster destilleret fra claude-skill-management-consultant-B1 (DogInfantry, Apache 2.0).
