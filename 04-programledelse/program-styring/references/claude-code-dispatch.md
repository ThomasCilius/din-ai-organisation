# Claude Code-dispatch - runbook for avanceret tilstand

Sådan faner du arbejdsstrømmene ud til subagenter i Claude Code, samler deres output, og - lige så vigtigt - hvornår du IKKE gør det. Denne tilstand er avanceret og bruges kun, når bash, subagenter og filsystem er til rådighed.

## Indhold

1. [Hvor kraften kommer fra](#1-hvor-kraften-kommer-fra)
2. [Forudsætninger før dispatch](#2-forudsaetninger-foer-dispatch)
3. [Én subagent pr. strøm](#3-en-subagent-pr-stroem)
4. [Subagent-opgavens faste dele](#4-subagent-opgavens-faste-dele)
5. [Opsamling af output](#5-opsamling-af-output)
6. [Hvornår du IKKE dispatcher](#6-hvornaar-du-ikke-dispatcher)
7. [Scope og tokenforbrug](#7-scope-og-tokenforbrug)

## 1. Hvor kraften kommer fra

Vær ærlig i din kommunikation: kraften i denne tilstand kommer fra Claude Code-harnessen - evnen til at starte subagenter og køre bash - ikke fra skill-formatet. **Skills kalder ikke hinanden.** En skill er en instruktion til dig, ikke et program der kan starte et andet program. Det, du gør her, er at bruge harnessen til at give hver subagent en opgave, hvor du selv har peget den på den rette skill og givet den konteksten.

Lov derfor aldrig brugeren, at "program-styring kører de andre skills". Det, der sker, er: du læser den rette afdelingsskills SKILL.md, sammenstiller en opgave, og lader en subagent udføre den efter den skills anvisninger.

## 2. Forudsætninger før dispatch

Dispatch intet, før alle fire er opfyldt:

1. **Program-briefen er godkendt** (jernloven). Ingen undtagelser.
2. **Partituret er skrevet** - `arbejdsstroem-oversigt.md` findes med ejere, input/output-artefakter og afhængigheder.
3. **Hub-artefakterne findes på disk** - mindst `virksomhedsprofil.md`; dertil `voice-profil.md` og `designprofil.md`, hvis strømmene skriver eller designer noget.
4. **Den rette skill findes** i `.claude/skills/<skill>/` for hver strøm du vil dispatche. Findes den ikke, kan strømmen ikke dispatches - kør den i Desktop-tilstand i stedet, eller bed brugeren installere skillen.

## 3. Én subagent pr. strøm

Dispatch én subagent pr. arbejdsstrøm - aldrig en subagent der skal "klare flere strømme". Én strøm, én skill, én ejer, ét artefakt: det holder opgaven skarp og outputtet muligt at samle.

Respektér afhængighederne fra oversigten:

- Strømme uden afhængighed (og strømme hvis forudsætninger allerede er færdige) kan dispatches parallelt.
- En strøm der venter på en anden, dispatches FØRST når forudsætningens output-artefakt findes og opfylder handoff-kontraktens acceptkriterium. Ellers arbejder subagenten på et halvfærdigt input.
- Følg den kritiske vej: kør den kæde først, så en forsinkelse opdages tidligt.

## 4. Subagent-opgavens faste dele

Subagenter deler ikke hukommelse med dig eller med hinanden. Alt, subagenten skal bruge, skal med i selve opgaven - ellers gætter den. Hver subagent-opgave indeholder præcis disse dele:

1. **Skill-pointer (eksplicit):** "Løs denne opgave ved at følge `.claude/skills/<skill>/SKILL.md` nøjagtigt, inklusive dens references." Peg på ét navn - subagenten skal ikke selv vælge skill.
2. **Strøm-uddraget fra program-briefen:** strømmens mål, ejer, input-artefakt, output-artefakt (præcist filnavn) og acceptkriterium.
3. **Hub-artefakterne som eneste kontekst:** de relevante hub-filer (`virksomhedsprofil.md` m.fl.) og forudsætnings-strømmenes output-artefakter - lagt ind eller peget på med sti. Subagenten har intet andet at gå ud fra.
4. **Grænserne:** "Aflevér [output-artefakt] som kladde. Send intet, betal intet, slet intet, indgå ingen aftale. Er du i tvivl, så stop og rapportér tilbage frem for at gætte."

Skabelon til subagent-opgaven:

```
Du løser arbejdsstrøm [#]: [navn] i programmet [initiativ].
Følg .claude/skills/[skill]/SKILL.md nøjagtigt (inkl. references).

Mål for strømmen: [mål]
Ejer (mennesket bag): [navn]
Input: [artefakt/sti] - din eneste kontekst ud over hub-filerne nedenfor.
Hub-filer: virksomhedsprofil.md [+ voice-profil.md / designprofil.md efter behov]
Forventet output: [præcist filnavn], afleveret som kladde.
Acceptkriterium: [hvornår outputtet er godt nok].

Grænser: Send intet, betal intet, slet intet, indgå ingen aftale.
Aflevér altid som kladde. I tvivl: stop og rapportér, gæt aldrig.
```

## 5. Opsamling af output

Når subagenterne er færdige:

1. Saml hvert output-artefakt og tjek det mod strømmens acceptkriterium - ikke bare "er filen der", men "opfylder den kontrakten". Fejler den, går strømmen tilbage, ikke videre.
2. Opdatér status-kolonnen i `arbejdsstroem-oversigt.md` (i gang -> færdig, eller -> afventer hvis acceptkriteriet ikke er nået).
3. Frigiv de strømme, hvis forudsætning nu er opfyldt - dispatch næste led på den kritiske vej.
4. Fodr programmets samlede tilstand videre: status og tværgående milepæle til `portefolje-status`, tværgående risici og beslutninger til `risiko-issue-log`. Du skriver ikke selv disse logs.

Alt, subagenterne producerer, er kladder til mennesket - præcis som i Desktop-tilstand. Dispatch flytter arbejdet, ikke beslutningsretten.

## 6. Hvornår du IKKE dispatcher

**HARD GATE: dispatch aldrig en strøm, hvis et af dens skridt er irreversibelt.** En subagent skal aldrig kunne sende, betale, slette, indgå kontrakt eller ansætte. Konkret betyder det:

- Strømme, der ender i afsendelse (tilbud til kunde, pressemeddelelse, nyhedsbrev, mail): subagenten skriver kladden, mennesket sender. `tilbud` sendes aldrig af dirigenten - afdelingens egen gate gælder.
- Strømme med betaling eller bindende aftale (leverandørkontrakt, ansættelse): mennesket kører dem. Dirigenten forbereder grundlaget via fx `kontrakt-tjek`, men beslutningen er menneskets.
- Strømme, der sletter eller overskriver data (fx datamigrering, oprydning): kør dem manuelt med mennesket ved roret - en fejl her kan ikke rulles tilbage.
- Strømme, hvor du er i tvivl om et skridt er reversibelt: behandl det som irreversibelt, og lad mennesket køre det.

Disse strømme står stadig i partituret og styres som alle andre - de dispatches bare ikke autonomt. Marker dem i oversigten, så det er tydeligt, hvilke der kører automatisk, og hvilke mennesket selv kører.

## 7. Scope og tokenforbrug

Store initiativer med mange strømme kan æde meget kontekst, hvis du faner det hele ud på én gang. Før du dispatcher bredt:

- **Advar brugeren** om scope og forventet tokenforbrug, når et program har mange strømme eller strømme med store artefakter.
- **Kør den kritiske vej først** frem for alle strømme parallelt - så bruger du kraften der, hvor en forsinkelse faktisk gør ondt, og ser tidligt om programmet holder.
- **Dispatch i bølger** efter afhængighederne i stedet for alt på én gang: det holder både tokenforbruget og antallet af samtidige kladder til gennemgang nede.
- **Stop og spørg**, hvis et program er så stort, at det i sig selv burde prioriteres ned - peg i så fald på `projekt-prioritering` frem for at dispatche et overtegnet program.
