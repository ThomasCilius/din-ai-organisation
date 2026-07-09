# Din AI-organisation

En kurateret pakke på **66 Agent Skills** til Claude, bygget til kurset "Claude Desktop 0-100". Du bygger din egen AI-organisation efter et klassisk dansk organisationsdiagram: hver afdeling er et hold AI-medarbejdere, og hver skill er én afgrænset, tilbagevendende opgave, som er valideret mod virkelige danske jobfunktioner i en SMV.

Pakken er bevidst modulær. Anthropic anbefaler et loft på cirka 20-50 aktive skills, og 66 er over det med vilje - derfor installerer du kernen plus de afdelinger, der matcher din rolle (typisk 25-35 aktive skills), ikke hele pakken på én gang.

## Organisationsdiagrammet

```
                              DIREKTIONEN
                  01 Direktionen - beslutninger & kontrakter (6)
                       02 Strategiudvikling (5)
                                  |
          +-----------------------+-----------------------+
    STAB: Viden & Data      STAB: Programledelse          |
    03 (6) "hjernen"        04 (6) "styringsrygraden"     |
          |                                               |
   +--------------+-------------+------------+-------------+--------------+
Sekretariatet   Salg &      Marketing    Økonomi        HR        IT & Udvikling
  05 (7)     Kundeservice     07 (9)       08 (5)      09 (7)         10 (10)
                06 (5)
```

Kernen er **03 Viden & Data** (den ejer virksomhedens hub-filer) og **01 Direktionen**. Alt andet bygger ovenpå.

## Afdelinger og skill-indeks

### 01 - Direktionen: beslutninger & kontrakter

| Skill | Formål |
|-------|--------|
| `ide-stresstest` | Presser en "skal jeg...?"-beslutning med forcing questions og slutter med én klar anbefaling og næste skridt. |
| `second-opinion` | Kritisk gennemgang af egne udkast før afsendelse - send / send ikke / send efter rettelser, med citat. |
| `kontrakt-tjek` | Gennemgår modpartens kontrakter før underskrift, flager risici med klausulcitat og siger hvornår advokaten skal ind. |
| `beslutningsgrundlag` | Bygger et skriftligt, kildebelagt beslutningsgrundlag eller business case til store beslutninger. |
| `bestyrelsespakke` | Udkast til bestyrelsesmateriale, bankpræsentation eller ledelsesrapport ud fra virksomhedens egne tal. |
| `forhandlings-forberedelse` | Forbereder en konkret forhandling med BATNA, smertegrænse, aftalezone og indrømmelsesplan i ét forhandlingsark. |

### 02 - Strategiudvikling

| Skill | Formål |
|-------|--------|
| `strategidag-forberedelse` | Forbereder og refererer årets strategidag: dagsorden, situationsbillede og 3-5 skarpe strategiske spørgsmål. |
| `etsides-strategiplan` | Kondenserer strategien til én læsbar side plus en medarbejderversion i klart sprog. |
| `konkurrent-radar` | Vedligeholder et stående konkurrentkort og skriver kvartalsvis delta-rapport med "hvad betyder det for os". |
| `kvartals-nedbrydning` | Nedbryder strategien til 3-5 kvartalsmål med navngivne ejere og "færdig når"-kriterier. |
| `strategi-tjek` | Kvartalsvis grøn/gul/rød-opfølgning på kvartalsmålene - fungerer også som bestyrelsesside. |

### 03 - Stab: Viden & Data (kerne)

| Skill | Formål |
|-------|--------|
| `virksomhedsprofil` | Opretter og vedligeholder `virksomhedsprofil.md` - nav-filen med stamdata, som alle andre skills læser først. |
| `videnfil-interview` | Interviewer brugeren og destillerer tavs viden til en videnfil på maks. 10 linjer. |
| `natportner` | Rydder op i brain-mappens inbox, arkiverer noter i de rigtige videnfiler og skriver en natterapport. |
| `brain-tjek` | Dokumentreview af brain-mappen: finder forældet, modstridende, dubleret og kildeløs viden. |
| `gdpr-fortegnelse` | Udkaster og vedligeholder artikel 30-fortegnelse, sletteliste og databehandleroversigt via interview. |
| `vidensarkitektur` | Bestemmer hvor ny viden hører hjemme, holder én kanonisk plads pr. fakta og skriver atomiske, forbundne noter i hjernens lagdelte hierarki. |

### 04 - Stab: Programledelse (PMO)

| Skill | Formål |
|-------|--------|
| `projekt-kickoff` | Omsætter en go-beslutning til et 1-2 siders projektkommissorium plus en milepælsplan. |
| `portefolje-status` | Samler status fra alle projekter til én trafiklys-porteføljerapport til ledelsen. |
| `risiko-issue-log` | Opretter og ajourfører projektets risikolog (3x3), issue-liste og fælles beslutningslog. |
| `projekt-prioritering` | Prioriteringsoplæg for hele porteføljen: fortsæt / pausér / stop målt mod reel kapacitet. |
| `projekt-lukning` | Lukker projekter ordentligt: afslutningstjekliste, evaluering mod succeskriterier og læringer. |
| `program-styring` | Nedbryder ét stort, tværgående initiativ i arbejdsstrømme, mapper hver strøm til afdeling og skill, og styrer overleveringerne mod ét fælles mål. |

### 05 - Sekretariatet

| Skill | Formål |
|-------|--------|
| `mail-i-min-stil` | Skriver mailudkast i ejerens egen tone på hele svartypologien - altid som kladde. |
| `indbakke-triage` | Prioriteret morgenoverblik over indbakken (Handl nu / Lav udkast / Kan vente / Til orientering). |
| `referat` | Forvandler mødenoter eller transskript til professionelt referat med beslutninger og aktioner. |
| `moedeforberedelse` | Étsides mødebriefing plus dagsordenudkast, med frisk dansk CVR-research på eksterne parter. |
| `ugestatus` | Ugens statusrapport i firefelts-format med trafiklys - kunde- eller intern teamversion. |
| `opfoelgningsliste` | Samler alle åbne aktioner til én liste (hvem/hvad/deadline/kilde) og skriver påmindelses-udkast. |
| `journalisering` | Journaliserer dokumenter efter fast navnestandard og mappetaksonomi - plan før én fil røres. |

### 06 - Salg & Kundeservice

| Skill | Formål |
|-------|--------|
| `tilbud` | Skriver bindende danske tilbud efter kort interview - acceptfrist, forbehold, moms og følgemail. |
| `kundeemner` | Researcher og scorer B2B-kundeemner 1-10 mod idealkundeprofilen, med kilde og samtaleåbner. |
| `pipeline-gennemgang` | Kører det ugentlige pipelinemøde, flager sager i stå og bygger et realistisk interval-forecast. |
| `kundesvar` | Svarudkast på svære kundehenvendelser (klager, reklamationer, afslag) med styr på købeloven. |
| `kundegennemgang` | Forbereder statusmøde med eksisterende kunde: mersalg (whitespace), churn-signaler og genforhandling. |

### 07 - Marketing & Kommunikation

| Skill | Formål |
|-------|--------|
| `toneprofil` | Udleder virksomhedens tone og skriver hub-filen `voice-profil.md`, som alle skrivende skills læser. |
| `linkedin-opslag` | Skriver LinkedIn-opslag ud fra noget konkret der er sket - én pointe og 2-3 hook-varianter. |
| `nyhedsbrev` | Skriver nyhedsbreve til permission-listen med emnelinjeforslag og én klar CTA - altid som kladde. |
| `marketing-sparring` | Prioriterer marketingtiltag efter effekt/indsats og bygger eller reviderer marketingårshjulet. |
| `content-kalender` | Bygger en månedlig content-kalender med genbrugskaskade på tværs af kanaler. |
| `kundecase` | Skaber dokumenterede kundecases med interviewguide, citatliste og indbygget samtykketrin. |
| `marketing-rapport` | Månedlig marketingrapport ud fra egne tal (GA4, Meta, LinkedIn) med indsigter og anbefalinger. |
| `pressemeddelelse` | Skriver pressemeddelelse med reel nyhedsvinkel plus pitch-mail og forslag til relevante medier. |
| `menneskeliggoer` | Fjerner AI-præget fra en tekst: skærer floskler, oppustet vigtighed, reklamesprog og fyld væk og giver teksten stemme igen. |

### 08 - Økonomi

| Skill | Formål |
|-------|--------|
| `bilagsrydning` | Rydder regnskabsbilag før moms: aflæser, omdøber til standard, sorterer og bygger revisor-CSV. |
| `rykker-runde` | Bygger debitoroverblik og lovmedholdelige rykkerkladder efter renteloven - altid som kladder. |
| `likviditetsoverblik` | Bygger et 13-ugers likviditetsoverblik med dansk skattekalender og bufferadvarsler. |
| `budgetopfoelgning` | Sammenholder faktiske tal med budgettet og skriver én-sides afvigelsesrapport med handlingsforslag. |
| `priskalkulation` | Gennemsigtige priskalkulationer: timepris, kostpris-plus, dækningsbidrag, break-even og følsomhed. |

### 09 - HR (People & Culture)

| Skill | Formål |
|-------|--------|
| `procedure-skriver` | Interviewer kronologisk og skriver en opgave som SOP, klar til uddelegering til medarbejder eller AI. |
| `skill-opskrift` | Pakker en tilbagevendende opgave som en færdig Claude-skill og afslutter med prøvetid-tests. |
| `rutine-bygger` | Sætter tilbagevendende rutiner op for AI-medarbejderne med trigger, input, bevis-artefakt og log. |
| `rekruttering` | Dansk rekrutteringsforløb fra kravprofil til afslag - alt tjekket mod forskelsbehandlingsloven. |
| `onboarding-offboarding` | Daterede onboardingplaner (preboarding + 30-60-90) og offboarding-tjeklister. |
| `mus-forberedelse` | Forbereder MUS- og 1:1-samtaler og skriver bagefter referat med udviklingsplan. |
| `personalepolitik` | Skriver og reviderer personalepolitikker og -håndbog med flag hvor dansk lovgivning sætter rammer. |

### 10 - IT & Udvikling

| Skill | Formål |
|-------|--------|
| `designretning` | Fastlægger ÉN sammenhængende designretning og skriver hub-filen `designprofil.md`. |
| `designvarianter` | Genererer 2-3 navngivne designvarianter af samme flade inden for den godkendte designprofil. |
| `designbygger` | Laver selve det færdige, production-grade design som kørende HTML man kan se og deploye. Go-do frem for handoff-brief. |
| `byggebrief` | Skriver en komplet dansk kravspecifikation (`byggebrief.md`) via interview - nul pladsholdere. |
| `plan-tjek` | Ingeniørchef-review af byggeplan eller leverandørforslag før byg: GO / GO-med-ændringer / STOP. |
| `fejldetektiv` | Systematisk fejlfinding for ikke-udviklere plus professionel fejlrapport til leverandøren. |
| `klar-tjek` | Beviskrav-baseret UAT mod `byggebrief.md` med kategoriseret mangelliste før godkendelse og betaling. |
| `tilbudssammenligning` | Sammenligner leverandørtilbud mod byggebriefen og flager danske røde flag (kodeejerskab, exit m.m.). |
| `adgangsstyring` | Vedligeholder `systemoversigt.md` og producerer on-/offboarding-tjeklister og licens-audit. |
| `sikkerhedstjek` | Vurderer phishing-mails og kører kvartalsvist sikkerheds-basistjek plus hændelsesrespons. |

## Installationsmodel (modulær)

Installér i lag frem for alt på én gang.

1. **Kernen først.** Start med **03 Viden & Data** (den ejer hub-filerne, hele organisationen læser) og **01 Direktionen**. Uden kernen mangler de øvrige skills deres fælles kontekst.
2. **Derefter de valgte afdelinger.** Vælg de 3-5 afdelinger, der matcher din rolle - typisk 25-35 aktive skills. Du kan altid tilføje flere senere.

### Installer (anbefalet, Claude Code)

Den reneste vej: en modulær installer, der lægger skills på plads, husker præcis hvad den selv har lagt, og aldrig rører dine egne skills.

```bash
git clone https://github.com/ThomasCilius/din-ai-organisation.git
cd din-ai-organisation
./install.sh                  # operatoer-profil (alle forretnings-skills)
./install.sh udvikler         # + udvikler-lag (staged, taendes senere)
./install.sh update           # hent nyeste + geninstaller (afstemmer alt)
./install.sh status           # hvad er installeret
./install.sh aktiver-udvikler # aktiver det stagede udvikler-lag
./install.sh uninstall        # fjern KUN det, installeren lagde
```

- **Profiler.** `operatoer` (standard) · `udvikler` (lægger dev-laget i staging) · `hele-organisationen`. Ét valg ved install, ikke to produkter.
- **Idempotent opgradering.** `./install.sh update` henter nyeste version (git pull) og geninstallerer den profil, du kører, og **afstemmer alt**: nye skills/agenter/commands/rules/hooks kommer ind, udgåede fjernes, din brain-sti bevares, og intet af dit eget røres. Så ruller du dine egne ændringer ud på din eksisterende installation med én kommando.
- **Install-state.** Alt noteres som `managed` i `~/.claude/din-ai-org/install-state.json`. Din memory, dine regler og dine egne skills står urørt.
- **Udvikler-lag efter behov.** Vælger du `operatoer`, ligger dev-laget klar i `udvikler-lager/` og tændes senere med `aktiver-udvikler` uden download - hvis du begynder at kode mere.
- **Ren afinstallation.** `uninstall` fjerner kun det, installeren lagde.
- **Hooks-lag (levende hjerne).** Installeren wirer merge-sikkert syv hooks ind i `settings.json`: **brain-inject** (ambient genkaldelse), **kontinuitet** (session-save/load, "hvor vi slap"), **notify**, **connector-vagt** (`mcp-health`, opdager tabt login på Notion/Gmail/Shopify m.m.), **brain-guard** (beskytter hjernens kernefiler) og **rules-index** (dev-lagets kodestandarder). `uninstall` fjerner kun vores, aldrig dine andre hooks. Kræver Node. Sæt brain-stien med `DIN_AI_BRAIN=~/company-brain ./install.sh`. Aktiverer du udvikler-laget, wires desuden fire **dev-workflow-hooks** (format-on-save, typecheck, console-advarsel, commit-gate).

> På plads nu: hele pakken. Modulær installer (profiler, install-state, idempotent opgradering, ren afinstallation), 7 kerne-hooks + 4 dev-workflow-hooks (format/typecheck/console/commit-gate), de danske indholds-skills (`vidensarkitektur`, `menneskeliggoer`), og dev-laget med **68 skills + 35 agenter + 37 commands + 89 rules** (kurateret ECC-subset under MIT, se `dev-tier/`). Udvikler-pariteten mod ECC er dermed lukket. Næste: migrationen (swap ECC ud).

### Claude Desktop

Skills uploades pr. stk. som en zip-fil under **Settings > Capabilities > Skills**. Zip den enkelte skill-mappe (mappen med `SKILL.md` og dens `references/`), og upload zippen. Gentag for hver skill i de afdelinger, du har valgt.

### Claude Code

**Nemmest - lad Claude Code installere.** Indsæt denne ene linje i Claude Code:

```
Installer Claude Agent Skills fra dette repo i min skills-mappe: https://github.com/ThomasCilius/din-ai-organisation - klon repoet, vis mig de 10 afdelinger, og kopiér de skill-mapper jeg vælger ind i ~/.claude/skills/ (foreslå kernen først: 03-viden-og-data + 01-direktionen).
```

**Eller manuelt.** Klon repoet og kopiér skill-mapperne direkte ind i skills-stien:

```
git clone https://github.com/ThomasCilius/din-ai-organisation.git
mkdir -p ~/.claude/skills
cp -r din-ai-organisation/03-viden-og-data/*  ~/.claude/skills/
cp -r din-ai-organisation/01-direktionen/*    ~/.claude/skills/
```

- Globalt for alle projekter: `~/.claude/skills/`
- Kun for ét projekt: projektets `.claude/skills/`

Hver skill-mappe (fx `virksomhedsprofil/`) lægges som en undermappe med sin `SKILL.md` og `references/` intakt.

### Download pr. afdeling (zip)

Vil du hente en hel afdeling på én gang, ligger færdige zips i [`releases/`](releases) - eller brug **⬇ Zip**-knappen ved hver afdeling på [skills.thomascilius.dk](https://skills.thomascilius.dk/). Hver zip har afdelingens skill-mapper i roden:

- **Claude Code:** pak ud direkte i `~/.claude/skills/` (fx `unzip 03-viden-og-data.zip -d ~/.claude/skills/`).
- **Claude Desktop:** pak ud, og upload de enkelte skill-mapper hver for sig (Desktop tager én skill ad gangen).

Zips regenereres med `scripts/make-zips.sh` efter ændringer i skills.

## Konventioner

Alle 66 skills følger den samme opskrift, så de opfører sig ens uanset afdeling.

- **Danske skill-navne** - "noget du selv ville sige højt". Navnefeltet tillader kun a-z, tal og bindestreg, så æ/ø/å translittereres til ae/oe/aa: `moedeforberedelse`, `opfoelgningsliste`, `budgetopfoelgning`.
- **Tosprogede triggere** - hver `description` indeholder ordrette triggersætninger på både dansk og engelsk ("skriv et tilbud" / "write a proposal"), skrevet pushy fordi Claude har tendens til at undertrigge.
- **Aldrig-regler** er en fast del af formatet: skills leverer altid en kladde; sender, sletter og bogfører aldrig selv; laver en plan før den rører filer; citerer kilden; og AI anbefaler - mennesket beslutter. Følsomt arbejde har navngivne eskalationstriggere (advokat, revisor, jurist).
- **Hub-filer (hub-and-spoke).** Konteksten gives ÉN gang og genbruges af alle skills:
  - `virksomhedsprofil.md` - ejes af `virksomhedsprofil` (03). Alle skills læser den først.
  - `voice-profil.md` - ejes af `toneprofil` (07). Alle skrivende skills læser den.
  - `designprofil.md` - ejes af `designretning` (10). Alle visuelle leverancer læser den.
- **Artefakt-kæder.** Hver skill efterlader et navngivet artefakt, som den næste skill i kæden læser:
  - **Strategi-årshjulet:** `konkurrent-radar` -> `strategidag-forberedelse` -> `etsides-strategiplan` -> `kvartals-nedbrydning` -> `strategi-tjek` -> (næste års strategidag)
  - **Byggerejsen:** `ide-stresstest` -> `designretning` -> `designvarianter` -> `byggebrief` -> `plan-tjek` -> byg -> `fejldetektiv` -> `klar-tjek` -> `procedure-skriver`
  - **Projektlivscyklus:** `ide-stresstest` / `beslutningsgrundlag` -> `projekt-kickoff` -> `risiko-issue-log` -> `portefolje-status` -> `projekt-prioritering` -> `projekt-lukning`
  - **Salgsflow:** `kundeemner` -> `moedeforberedelse` (salgstilstand) -> `tilbud` -> `pipeline-gennemgang` -> `kundegennemgang`

På tværs af kæderne er `program-styring` (04) dirigenten for store, tværgående initiativer: den nedbryder ét initiativ i arbejdsstrømme og mapper hver strøm til den skill der løser den. Den virker dual-mode - Desktop-dirigeret (mennesket åbner hver afdelingsskill i rækkefølge) eller Claude Code-subagent-dispatch (én subagent pr. strøm) - og leverer status videre til `portefolje-status` og `risiko-issue-log`.

Pakken bygger desuden ovenpå Claudes indbyggede dokumentskills (pptx, pdf, docx, xlsx) via `designprofil.md` og duplikerer dem ikke.

## Kom godt i gang

**Trin 0 - byg din company brain.** Fundamentet under det hele: en levende markdown-vidensbase på din egen maskine, som Claude selv vedligeholder. Åbn en ny Cowork-samtale med adgang til en tom mappe (fx `company-brain/`) og kopiér [`company-brain-prompt.txt`](company-brain-prompt.txt) ind - eller brug kopiér-knappen på [skills.thomascilius.dk](https://skills.thomascilius.dk/#brain). Se guiden og facilitator-noterne i [`company-brain-bootstrap.md`](company-brain-bootstrap.md). Hjernen er fundamentet, skill-pakken er medarbejderne der arbejder oven på den.

**Har du allerede en hjerne?** Findes `00-index.md` i mappen, er Trin 0 gjort. Spring bygningen over og installér skills oven på den - `virksomhedsprofil` opdaterer så bare din eksisterende `identity/virksomhedsprofil.md`, den bygger ikke en ny hjerne.

Derefter:

1. **Kør `virksomhedsprofil` først.** Den opretter (eller opdaterer) `identity/virksomhedsprofil.md` - den fælles nav-fil, alle andre skills læser før de arbejder. Har Trin 0 allerede bygget den, opdaterer skillen den bare. Uden den gætter resten af organisationen om, hvem du er.
2. **Kør derefter `toneprofil`** (07) for at skrive `voice-profil.md`, hvis du vil have skrivende skills til at ramme din stemme, og `designretning` (10) for `designprofil.md`, hvis du skal lave visuelle leverancer.
3. **Vælg dine afdelinger** ud fra din rolle, og installér dem oven på kernen.

Én gang investeret kontekst, genbrugt af hele organisationen.
