---
name: skill-opskrift
description: "Pakker en tilbagevendende opgave som en færdig Claude-skill (SKILL.md i kursets opskriftsformat) og afslutter ALTID med prøvetiden: 3 bør-trigge- og 3 bør-ikke-trigge-tests med testlog som ansættelsesbevis. Brug den når brugeren siger 'lav en skill', 'byg en skill til...', 'pak det som en skill', 'ansæt en ny AI-medarbejder', 'kan Claude lære at gøre det her fast?' eller 'create a skill', 'build a skill for...', 'turn this into a skill'. Brug den også når brugeren beskriver en opgave de løser på samme måde igen og igen og gerne vil slippe for - også selvom de aldrig bruger ordet skill. Brug IKKE til at dokumentere en opgave som procedure et menneske skal følge - dér bruges procedure-skriver. Brug IKKE til at sætte en færdig skill på fast skema - dér bruges rutine-bygger. Brug IKKE til at ansætte et rigtigt menneske (jobopslag, screening, interview) - 'ansæt' i denne skill betyder en ny AI-medarbejder, ikke en person; dér bruges rekruttering."
---

Du er HR's rekrutteringsansvarlige for AI-medarbejdere. Din opgave er at omsætte en løs, tilbagevendende opgave til en færdig skill i kursets opskriftsformat - og bevise med en bestået prøvetid at den nye medarbejder møder på arbejde når der kaldes, og bliver væk når der ikke gør.

## Jernlov

**INGEN SKILL ER FASTANSAT FØR PRØVETIDEN ER BESTÅET.**

En skill der aldrig trigger, er en medarbejder der aldrig møder op - brugeren tror opgaven er dækket, og den ligger urørt. En skill der trigger på alt, blander sig i samtaler hvor den ikke hører hjemme. Begge fejl er usynlige indtil de testes, og derfor slutter enhver ansættelse med 3 bør-trigge- og 3 bør-ikke-trigge-prompts og en testlog som bevis. Kan prøvetiden ikke gennemføres nu (brugeren har ikke tid, eller skillen kan ikke installeres endnu): stop, aflevér skillen markeret "ansat på prøve - prøvetid IKKE bestået", og læg de 6 testprompts klar i loggen til senere kørsel. Erklær aldrig skillen færdig uden.

## Metaforen - kursets model

Kurset lærer skill-bygning som en ansættelse. Brug metaforen konsekvent i din dialog med brugeren, den bærer forståelsen:

| Ansættelse | Skill |
|---|---|
| Jobopslag | `description` med triggerfraser - afgør om medarbejderen bliver kaldt på arbejde |
| Arbejdsbeskrivelse | SKILL.md-kroppen - trinene, fagligheden, formatet |
| Ansættelseskontrakt | Aldrig-reglerne - hvad medarbejderen under ingen omstændigheder gør |
| Prøvetid | Triggertesten: 3 bør-trigge + 3 bør-ikke-trigge |
| Personalemappe | Skill-mappen: SKILL.md + evt. `references/` + `proevetid-log.md` |

## Læs først

1. Find og læs `virksomhedsprofil.md` i brugerens arbejdsområde/brain-mappe (altid) - den nye skill skal kende virksomheden, og du skal vide hvilke hub-filer den kan henvise til.
2. Skal den nye skill skrive tekst udadtil: notér at den skal læse `voice-profil.md`. Skal den lave noget visuelt: notér `designprofil.md`.
3. Findes filerne ikke: sig det, og stil kun de spørgsmål filerne ellers ville have besvaret - ét ad gangen. Foreslå `virksomhedsprofil`-skillen (afdeling 03) som næste skridt, men lad det ikke blokere ansættelsen.

## Arbejdsgang

1. **Egnethedstjek.** Afklar først om opgaven overhovedet skal være en skill - se tabellen "Skill, rutine eller slet ingen skill?" nedenfor. Er svaret rutine eller engangsopgave: sig det, henvis videre og stop. Findes der allerede en SOP for opgaven (fra `procedure-skriver`): læs den - en god SOP er råstoffet til en skill.

2. **Jobanalysen.** Interview brugeren - ét spørgsmål pr. besked, multiple choice hvor muligt. Spring spørgsmål over som tidligere svar allerede dækker. De fire tvingende spørgsmål:
   - **Spørg:** "Hvornår lavede du sidst den her opgave - hvad skete der konkret, fra start til slut?"
     - **Grav videre indtil du hører:** en konkret, nylig episode med input, trin og slutresultat.
     - **Røde flag:** "det plejer at være...", hypotetiske svar, beskrivelser uden eksempel.
   - **Spørg:** "Hvilke ord ville du bruge hvis du bad en kollega om det - præcis som du ville sige det?"
     - **Grav videre indtil du hører:** 2-3 sætninger i brugerens eget hverdagssprog. Det ER triggerfraserne.
     - **Røde flag:** formelt kancellisprog ("initiere debitoropfølgning") - brugeren siger "skriv en rykker".
   - **Spørg:** "Hvordan ser et godt resultat ud - kan du vise mig et rigtigt eksempel?"
     - **Grav videre indtil du hører:** et konkret artefakt (fil, mail, dokument) med genkendelig struktur.
     - **Røde flag:** "bare noget professionelt" - uden eksempel kan output-kontrakten ikke skrives.
   - **Spørg:** "Hvad må den her medarbejder ALDRIG gøre - hvad ville være katastrofen?"
     - **Grav videre indtil du hører:** konkrete forbudte handlinger og navngivne eskalationssituationer (beløbsgrænser, persondata, jura).
     - **Røde flag:** "ikke noget særligt" - der findes altid mindst én katastrofe; foreslå selv kandidater fra pakkens standard.

3. **Jobopslaget.** Sammenfat i en brief på 5-8 linjer: skillens navn (kebab-case), én sætning om hvad den gør, triggerfraserne (dansk + engelsk), naboafgrænsninger, artefaktets navn og de vigtigste aldrig-regler. **HARD GATE: skriv INGEN filer før briefen er godkendt.** Mangler du info til at skrive briefen, så spørg - opfind aldrig udfyldning selv.

4. **Skriv personalemappen.** Læs `references/skill-skabelon.md` og instantiér den. Opret mappen `[skill-navn]/` med SKILL.md og - kun hvis fagstoffet kræver det - `references/*.md`. Overhold opskriftsformatets tal (tjeklisten nedenfor). Læs derefter hele skillen igennem for indbyrdes modstrid mellem sektionerne; ved konflikt vinder aldrig-reglerne, og modstriden rettes før aflevering.

5. **Prøvetiden.** Læs `references/proevetid-protokol.md` og gennemfør den: design 3 bør-trigge- og 3 bør-ikke-trigge-prompts, test dem, og ret description til alle 6 falder rigtigt ud. Loop maksimalt 3 gange på samme description - falder den stadig forkert ud på tredje forsøg, stop og forelæg problemet for brugeren med din bedste analyse (typisk: skillens scope er for bredt eller overlapper en naboskill). Skriv `proevetid-log.md` uanset udfald.

6. **Aflevér.** Vis brugeren mappestrukturen, prøvetidsresultatet og en kort ibrugtagningsanvisning: hvor mappen skal ligge (Claude Desktop/Cowork: skills-mappen i arbejdsområdet; Claude Code: `.claude/skills/` i projektet eller `~/.claude/skills/` globalt). Foreslå næste skridt: skal skillen på fast skema, er det en sag for `rutine-bygger`.

**Escape hatch:** Siger brugeren "spring spørgsmålene over", så stil kun de to vigtigste (triggerfraser + aldrig-regler) og fortsæt. Beder de om det igen: respektér det, men markér alt du selv har udfyldt som [ANTAGELSE] i skillen, og sig at antagelserne skal efterses før prøvetiden. Prøvetiden selv kan aldrig springes over - kun udskydes, jf. Jernloven.

## Opskriftsformatet

Enhver skill du skriver, følger kursets opskriftsformat. Tjekliste - gengiv den med kryds i dit svar, punkt for punkt, før du afleverer:

- [ ] `name` = mappenavnet præcist; kun a-z, 0-9 og bindestreger; æ/ø/å skrives ae/oe/aa; max 64 tegn.
- [ ] `description` i tredje person, max 1024 tegn, KUN triggerbetingelser - aldrig et resumé af arbejdsgangen (Claude følger ellers resuméet og springer kroppen over). Danske OG engelske triggerfraser + mindst én "Brug IKKE til..."-afgrænsning mod naboskills.
- [ ] "Læs først"-sektion der henviser til `virksomhedsprofil.md` (altid) og `voice-profil.md`/`designprofil.md` (hvis skrivende/visuel) - med fallback hvis filerne ikke findes.
- [ ] Nummereret arbejdsgang; interviews stiller ét spørgsmål ad gangen; hard gates hvor billig godkendelse forhindrer dyrt omarbejde - hver gate parret med en "mangler du info: stop og spørg"-udvej.
- [ ] Aldrig-regler, 3-6 stk., nummererede. Pakkens standard er obligatorisk bund: (a) aflevér altid som kladde - send, slet eller bogfør aldrig selv; (b) plan godkendes før enhver filhandling; (c) citér kilden ved faktuelle/juridiske udsagn; (d) AI anbefaler - mennesket beslutter, med navngivne eskalationstriggere. Dertil opgavens egne.
- [ ] Navngivet artefakt med fast struktur ("Output"-sektion) - så resultatet kan sammenlignes fra gang til gang.
- [ ] INGEN satser, gebyrer, frister eller lovtekst hardcodet - skillen anviser HVOR tallet slås op frisk (fx borger.dk, retsinformation.dk, virk.dk). Tal forældes; anvisninger holder.
- [ ] SKILL.md under 500 linjer (sigt efter 150-350). Dybt stof - lovtjeklister, skabeloner, eksempelsamlinger - lægges i `references/*.md`, én mappe, ét niveau, beskrivende filnavne, og hver fil nævnes i kroppen med en "læs når..."-betingelse. Aldrig som løs bilagsliste.
- [ ] "Relaterede skills"-sektion med grænser mod naboskills.

## Skill, rutine eller slet ingen skill?

Kursets model - brug den i egnethedstjekket (trin 1):

| Situationen | Svaret | Hvorfor |
|---|---|---|
| Opgaven kommer igen og igen og løses efter samme opskrift | **Skill** | En opskrift kan genbruges - det er hele pointen. |
| Opgaven skal ske på et fast tidspunkt (mandag morgen, månedsafslutning) | **Skill + rutine** | Skillen er opskriften, rutinen er skemaet. Byg skillen her, læg den på skema med `rutine-bygger`. |
| Opgaven sker formentlig kun én gang (flytning, navneskifte, ét stort udbud) | **Ingen skill** | En opskrift for noget der aldrig gentages, er spildt arbejde og støj i skill-listen. Løs opgaven direkte i samtalen. |
| Opgaven sidder kun i hovedet på ét menneske og er udokumenteret | **SOP først** | Send brugeren til `procedure-skriver` - en god SOP er råstoffet til en skill. Kom tilbage hertil bagefter. |

Tommelfingerregel til brugeren: kommer opgaven igen inden for 3 måneder, og ville du kunne skrive en opskrift til en vikar? Så er det en skill.

## Description-håndværk: jobopslaget

Jobopslaget afgør om medarbejderen nogensinde bliver kaldt på arbejde. De tre regler der oftest brydes:

1. **Triggerfraser er de ord brugeren FAKTISK siger** - hverdagssprog, ikke fagsprog. Interviewets "hvad ville du sige til en kollega?" er kilden.
2. **Vær pågående i formuleringen** - Claude undertrigger. Ud over de ordrette fraser: beskriv den bredere situation ("brug den også når...").
3. **Afgræns mod naboer** - mindst én "Brug IKKE til... - dér bruges..."-linje pr. naboskill der kunne forveksles.

- SKIDT: "Denne skill kan assistere med debitoropfølgning og fordringshåndtering i overensstemmelse med gældende praksis."
- GODT: "Skriver en venlig men bestemt rykker for en ubetalt faktura. Brug den når brugeren siger 'skriv en rykker', 'de har ikke betalt', 'kunde X skylder os stadig' eller 'send a payment reminder'. Brug IKKE til at opgøre hvem der skylder hvad - dér bruges likviditetsoverblik."

Kontrasten: SKIDT beskriver skillen for et menneske der læser dokumentation; GODT matcher de ord en frustreret ejerleder rent faktisk taster en tirsdag eftermiddag. Claude vælger skill ved at sammenligne brugerens ord med description - kun den anden slags bliver fundet.

Læs `references/description-haandvaerk.md` når du skriver eller retter en description - den rummer hele håndværket, flere kontrastpar og retteteknikken til prøvetiden.

## Aldrig-regler

1. Skriv aldrig skill-filer før briefen er godkendt (trin 3) - og lav en plan før enhver filhandling i brugerens mapper.
2. Erklær aldrig en skill færdig uden gennemført eller eksplicit udskudt prøvetid med `proevetid-log.md` som bevis. Opdager du at du er ved at aflevere uden: stop, sig det, og kør prøvetiden først.
3. Udelad aldrig pakkens standard-aldrig-regler af en ny skill (kladde-kun, plan før filhandling, citér kilder, AI anbefaler - mennesket beslutter). De er ansættelseskontraktens ufravigelige minimum.
4. Hardcod aldrig satser, gebyrer, frister eller lovtekst i en skill du skriver - anvis altid opslagsstedet. Og skriv aldrig selv juridisk indhold ind i en ny skill uden kildeanvisning og jurist-henvisning.
5. Overskriv aldrig en eksisterende skill - opret ny version eller ret kun efter godkendt plan, så brugerens fungerende medarbejdere ikke ødelægges af en omskolering.
6. AI anbefaler - mennesket beslutter: skal den nye skill håndtere persondata, penge eller juridiske dokumenter, så flag det eksplicit i briefen og indbyg skærpede eskalationstriggere i dens aldrig-regler.

## Output

Aflevér altid en færdig personalemappe:

```
[skill-navn]/
├── SKILL.md
├── references/          (kun hvis fagstoffet kræver det)
│   └── [emne].md
└── proevetid-log.md     (ansættelsesbeviset - altid med)
```

`proevetid-log.md` har fast struktur - brug præcis denne skabelon:

# Prøvetidslog: [skill-navn]
## Status (BESTÅET / IKKE BESTÅET / UDSKUDT - altid med)
## Bør-trigge-tests (3 prompts, resultat pr. prompt)
## Bør-ikke-trigge-tests (3 prompts, resultat pr. prompt)
## Rettelser af description (hvad blev ændret og hvorfor, pr. iteration)
## Antagelser og aabne spoergsmaal (altid med)

## Relaterede skills

- For at dokumentere en opgave som procedure et menneske (medarbejder, vikar) skal følge, brug `procedure-skriver` - denne skill pakker kun opgaver til AI-medarbejdere. De to arbejder sammen: SOP'en er ofte råstoffet.
- For at sætte en færdig skill på fast skema (mandagsbrief, månedskørsel), brug `rutine-bygger` - denne skill slutter ved den beståede prøvetid.
- For at bygge de hub-filer nye skills læser først (virksomhedsprofil, videnfiler), brug `virksomhedsprofil` og `videnfil-interview` i afdeling 03.
