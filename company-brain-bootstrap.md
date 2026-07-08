# Trin 0 - Byg din company brain

> Fundamentet under hele AI-organisationen. Byg **hjernen** først - så læser alle skills fra den.

En AI-organisation uden en hjerne svarer i blinde. Denne ene prompt bygger et komplet **company brain** i Claude Desktop (Cowork): en markdown-wiki på din egen maskine, som Claude selv vedligeholder og gør klogere for hver samtale - forbundet til dine kilder (mail, Notion, Slack, Office, mapper) og holdt i live af automation.

## Sådan bruger du den

1. Åbn en **ny Cowork-samtale** i Claude Desktop med adgang til en **tom mappe** (fx `company-brain/`).
2. Kopiér **hele** prompten fra [`company-brain-prompt.txt`](company-brain-prompt.txt) ind - eller brug kopiér-knappen på [skills.thomascilius.dk](https://skills.thomascilius.dk/#brain).
3. Claude interviewer dig og bygger hjernen fase for fase (0-6).
4. Medbring **3-5 dokumenter** til seedingen (fase 4) - en tom hjerne giver tomme svar.

## Hjernen og skill-pakken - to lag, ét system

- **Hjernen er fundamentet** (viden). **Skill-pakken er medarbejderne** (arbejdet). Byg hjernen → installér skills → skillene arbejder oven på hjernen.
- Pakkens hub-filer bor i hjernen: `virksomhedsprofil.md` og `voice-profil.md` hører til under `identity/`, `designprofil.md` under `methods/`. Alle skills læser dem derfra - hjernen er "brain-mappen", skillene refererer til.
- Skillenes aldrig-regler og hjernens fredningsregler er samme princip: altid kladde, aldrig stiltiende overskrivning, destillat frem for rå dumps, mennesket beslutter.

## Kilderne bag designet

- **gbrain (Garry Tan):** "kompileret sandhed + append-only log" pr. side, stub-sider der opgraderes ved gentagen omtale, gap-analyse i svar, seed fra dag ét.
- **Scout (Agno):** navigation frem for søgning (ingen vektordatabase - læs filerne); wiki bygges som biprodukt af arbejdet.
- **Karpathy:** arbejdsreglerne - antagelser højt, simplest muligt, kirurgiske ændringer, verificérbare mål.
- **Vectorize-reviewet:** uden vedligehold kompounder fejl i stedet for værdi → lint er ikke valgfrit.
- **Egen model:** inbox-gaten for automatiske skrivninger, flag modsigelser, aldrig stiltiende overskrivning, ingen git til kursister.

## Facilitator-noter (til underviseren)

- **Status/Log-skabelonen er hele maskinen.** Det er gbrains "compiled truth + timeline": hjernen kan lære hurtigt (append til Log koster intet) uden at rådne (Status ændres kun ved sikkerhed, lint konsoliderer). Forklar den før alt andet.
- **Femmapper-skellet** undervises som "ud mod kunden vs. ind mod maskinrummet" - `methods/` er det, kunderne mærker; `operations/` er det, der holder butikken kørende. Uden den forklaring misfiler kursisterne.
- **Seed er obligatorisk, ikke valgfri.** En tom hjerne giver tomme svar, og kursisten konkluderer "det virker ikke" inden ugen er omme. Sørg for at alle har 3-5 dokumenter med til seedingen.
- **Compound-loopet har tre lag:** luk-ritualet (bevidst læring), natlig høst → `inbox/` (sikkerhedsnet for glemte sessioner), ugentlig lint (konsolidering + oprydning). Automatikken skriver aldrig direkte i de permanente sider - samme gate-princip som i skill-pakken.
- **Gap-noten er den skjulte adfærdsændring.** Når svar slutter med "det her ved hjernen ikke", begynder kursisten af sig selv at fodre den. Det er dét, der gør systemet selvforstærkende.
- **Kilde-fasen er valgfri - og skal blive ved med at være det.** Connectors forbindes af kursisten selv (OAuth i Indstillinger → Connectors); Claude kan kun guide og verificere. M365-connectoren kræver business-tenant og admin-samtykke; private @outlook.com/@hotmail.com kan ikke forbindes. Grundreglen "destillat, aldrig rå dumps" er både privatliv og kvalitet: hjernen skal ikke være en kopi af indbakken.
- **Ingen git-sync til kursister.** Det er det avancerede lag; nævn det kun for dem, der spørger og forstår tokens/scope.

## Ændringer fra v1

`raw/`-wiki-skellet er erstattet af `inbox/` + Status/Log-skabelonen (samme beskyttelse, mindre ceremoni). Tre mapper er blevet til fem (`identity/` og `operations/` kom til). Nyt: stub-regel, kildestempling, gap-analyse, luk-ritual, natlig høst og ugentlig lint som scheduled tasks, `KOMMANDOER.md`, valgfri persona - og fase 3: forbind kilder (mail, Notion, Slack, Office, mapper) med destillat-reglen og "hent nyt om [X]"-kommandoen.

---

Den kanoniske prompt ligger i [`company-brain-prompt.txt`](company-brain-prompt.txt). Når du retter den, så kør `scripts/gen_site.py` og `git push` - så opdaterer kopiér-knappen på siden sig selv.
