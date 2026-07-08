# Screening og struktureret interview

Læs denne fil når der skal screenes ansøgninger eller bygges interviewguide. De to hænger sammen: begge udspringer af must-kravene fra den godkendte kravprofil, og begge producerer dokumentation der beskytter virksomheden ved en eventuel klage.

## 1. Screeningsmatrix

Princip: kandidater vurderes mod must-krav i et ark - aldrig på mavefornemmelse. Matrixen tvinger sammenligning på samme kriterier, og den er samtidig virksomhedens dokumentation for at afslag byggede på saglige krav (jf. den delte bevisbyrde, lovtjek-rekruttering.md afsnit 1).

Regler:

1. Kolonnerne er must-kravene fra den godkendte kravprofil - ORDRET. Nye kriterier må ikke opfindes undervejs; opstår et nyt sagligt krav, opdatér kravprofilen først og scor alle kandidater om.
2. Score pr. krav: 0 = opfylder ikke, 1 = delvist/uklart, 2 = opfylder klart.
3. Hver score kræver evidens: et citat eller en konkret henvisning til ansøgning/CV ("3 år som bogholder hos X, e-conomic nævnt"). En score uden evidens er en mavefornemmelse i forklædning.
4. Ingen fri "helhedsindtryk"-kolonne. Noter må gerne samles i en kommentarcelle, men beslutningen om samtale træffes på must-krav-scorerne.
5. Kandidater med 0 på et must-krav går til afslag - det er hele pointen med must-krav. Gør det ondt at afslå dem, er kravet måske ikke et must: flag det og foreslå at revidere kravprofilen.
6. Skriv kun ting du kan stå ved over for kandidaten - matrixen er en personoplysning med indsigtsret (GDPR).

Skabelon:

```markdown
# Screeningsmatrix - [stilling]
Kravprofil godkendt: [dato]. Skala: 0 = opfylder ikke, 1 = delvist, 2 = klart.

| Kandidat | [Must-krav 1] | Evidens | [Must-krav 2] | Evidens | [Must-krav 3] | Evidens | Sum | Indstilling |
|---|---|---|---|---|---|---|---|---|
| [Navn] | 2 | "[citat fra CV]" | 1 | "[citat]" | 2 | "[citat]" | 5 | Samtale |
| [Navn] | 0 | "[ikke nævnt i CV]" | 2 | "[citat]" | 2 | "[citat]" | 4 | Afslag (must-krav 1) |

Nice-to-have noteres kun som skillelinje mellem kandidater med samme must-sum.
```

## 2. Hvorfor struktureret interview

Det ustrukturerede "lad os tage en snak"-interview er en af de dårligste udvælgelsesmetoder der findes: det måler mest af alt hvor godt interviewer og kandidat spejler hinanden. Metaanalyser af udvælgelsesmetoder (Schmidt & Hunter-traditionen) placerer strukturerede interviews blandt de bedste prædiktorer for jobpræstation - netop fordi strukturen fjerner støjen.

Struktureret betyder tre ting:

1. **Samme spørgeramme til alle kandidater** - ellers kan svarene ikke sammenlignes, og forskelsbehandling kan ikke afvises.
2. **Spørgsmålene er afledt af must-kravene** - hvert must-krav får mindst én STAR-blok.
3. **Scoring straks efter samtalen** - hver interviewer udfylder sit scoringsark for sig, FØR interviewerne taler sammen. Ellers ankrer den mest talende kollega alles vurdering.

## 3. STAR-spørgsmål

STAR = Situation, Task, Action, Result. Princippet: fortidig konkret adfærd forudsiger fremtidig adfærd bedre end hypotetiske svar ("hvad ville du gøre hvis ...") og selvbeskrivelser ("jeg er meget struktureret").

Sådan afledes et STAR-spørgsmål af et must-krav:

- Must-krav: "Kan drive kundeprojekter selvstændigt fra start til slut."
- Hovedspørgsmål: "Fortæl om et konkret projekt du selv har drevet fra start til aflevering."
- Opfølgning (bor efter alle fire led):
  - Situation: "Hvad var udgangspunktet, og hvem var kunden?"
  - Task: "Hvad var præcis dit ansvar - hvor gik grænsen til andres?"
  - Action: "Hvad gjorde DU konkret da [nævnt forhindring] opstod?"
  - Result: "Hvad blev resultatet - og hvordan ved du det?"

Røde flag i svar (bor videre eller notér lav score):
- "vi"-svar uden noget "jeg" - hvad gjorde kandidaten selv?
- hypotetiske svar på et erfaringsspørgsmål ("jeg ville nok ...")
- polerede svar uden tal, navne eller modgang - alle ægte projekter har friktion; spørg "hvad gik galt undervejs?"

## 4. Scoringsark

Skala 1-5 pr. kompetence, med forankring så tallene betyder det samme for alle interviewere:

- 1 = ingen evidens for kompetencen, eller modstridende evidens
- 3 = konkret eksempel, men med væsentlig støtte fra andre / begrænset omfang
- 5 = flere konkrete eksempler med selvstændigt ansvar og dokumenterbart resultat

(2 og 4 er mellempositioner.) Definér gerne 1/3/5-ankre pr. kompetence i guiden.

Regler:
- Udfyldes straks efter samtalen, individuelt, før fælles snak.
- Ingen score uden nedskrevet evidens fra samtalen.
- Beskyttede kriterier (alder, familiesituation, helbred osv. - jf. lovtjek-rekruttering.md) må ALDRIG optræde i noter eller vægtning, heller ikke hvis kandidaten selv bragte dem op.

## 5. Interviewguide-skabelon

```markdown
# Interviewguide - [stilling]
Samme guide bruges til ALLE kandidater. Interviewere: [navne].
Påmindelse: ingen spørgsmål om graviditet, alder, religion, etnicitet,
fagforening eller helbred - se references/lovtjek-rekruttering.md afsnit 5.

## Rammesætning (5 min)
Velkomst, plan for samtalen, hvem der tager noter.

## Kandidatens motivation (5-10 min)
- Hvad fik dig til at søge netop denne stilling?
- Hvad ved du om os - og hvad vil du gerne vide?

## STAR-blok pr. must-krav (10 min pr. blok)
### [Must-krav 1]
Hovedspørgsmål: [afledt STAR-spørgsmål]
Opfølgning: S: ... / T: ... / A: ... / R: ...
Scoringsankre: 1 = [...] / 3 = [...] / 5 = [...]

### [Must-krav 2]
[samme format]

## Praktik og vilkår (5 min)
Opstart, timetal, løn(ramme), evt. konkrete jobrelevante funktionskrav
[kun hvis sagligt begrundet - flag jf. helbredsoplysningsloven].

## Kandidatens spørgsmål + proces (5-10 min)
Hvornår og hvordan kandidaten får svar. Referencetjek nævnes KUN med
kandidatens samtykke.

## Scoringsark (udfyldes straks efter, individuelt)
| Kompetence (= must-krav) | Score 1-5 | Evidens fra samtalen |
|---|---|---|
| [Must-krav 1] | | |
| [Must-krav 2] | | |
Samlet indstilling: gå videre / afslag / afklar [hvad] først.
```
