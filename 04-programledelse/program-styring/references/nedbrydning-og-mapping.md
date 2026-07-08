# Nedbrydning og mapping - fra initiativ til strømme til skills

Sådan brydes et initiativ ned i arbejdsstrømme, hvordan hver strøm mappes til den afdeling og den konkrete skill der løser den, hvordan den kritiske vej lægges i letvægtsform, og hvordan overleveringerne kontraktbindes.

## Indhold

1. [Fra initiativ til strømme](#1-fra-initiativ-til-stroemme)
2. [Mapping-tabel: strøm til skill](#2-mapping-tabel-stroem-til-skill)
3. [Reglen om ejerskab](#3-reglen-om-ejerskab)
4. [Kritisk vej i letvægtsform](#4-kritisk-vej-i-letvaegtsform)
5. [Handoff-kontrakten](#5-handoff-kontrakten)
6. [Gennemført eksempel](#6-gennemfoert-eksempel)

## 1. Fra initiativ til strømme

En arbejdsstrøm er en sammenhængende del af initiativet, der:

- kan afleveres som ét navngivet artefakt (ikke bare "arbejde med marketing"),
- har én navngiven ejer,
- og løses af én afdeling med én skill.

Typisk 3-7 strømme. Færre, og det er nok et projekt (se `program-vs-projekt-vs-portefolje.md`). Flere end 8, og nogle af dem er delopgaver, der hører under en strøm - fold dem sammen, indtil hver strøm har et klart artefakt og en klar ejer.

Test hver kandidat: "Kan jeg pege på det ene dokument, denne strøm afleverer, og den ene person der ejer det?" Kan du ikke, er strømmen for løst afgrænset.

## 2. Mapping-tabel: strøm til skill

Slå strøm-typen op og peg strømmen på den rette skill. Tabellen dækker de hyppigste strømme i et SMV-program; findes strøm-typen ikke, så vælg den skill hvis formål ligger tættest (se pakkens README-indeks).

| Strøm-type | Afdeling | Skill(s) der bruges |
|---|---|---|
| Gå videre? / business case | 01 | `ide-stresstest`, `beslutningsgrundlag` |
| Kontrakt eller forhandling med modpart | 01 | `kontrakt-tjek`, `forhandlings-forberedelse` |
| Strategisk kobling og kvartalsmål | 02 | `etsides-strategiplan`, `kvartals-nedbrydning` |
| Konkurrentbillede | 02 | `konkurrent-radar` |
| Stamdata og videngrundlag | 03 | `virksomhedsprofil`, `videnfil-interview` |
| Persondata / GDPR | 03 | `gdpr-fortegnelse` |
| Delprojekt der selv er et projekt | 04 | `projekt-kickoff` (+ `risiko-issue-log`) |
| Prissætning og dækningsbidrag | 08 | `priskalkulation` |
| Likviditet og budget | 08 | `likviditetsoverblik`, `budgetopfoelgning` |
| Tilbud og salgsmateriale | 06 | `tilbud` |
| Kundeemner og pipeline | 06 | `kundeemner`, `pipeline-gennemgang` |
| Tone og stemme (hub) | 07 | `toneprofil` |
| Lancering, kampagne, indhold | 07 | `content-kalender`, `linkedin-opslag`, `nyhedsbrev`, `kundecase` |
| Presse | 07 | `pressemeddelelse` |
| Designretning (hub) | 10 | `designretning`, `designvarianter` |
| Byg af noget digitalt | 10 | `byggebrief` -> `plan-tjek` -> byg -> `klar-tjek` |
| Leverandørvalg | 10 | `tilbudssammenligning`, `plan-tjek` |
| Adgange og IT-onboarding | 10 | `adgangsstyring` |
| Sikkerhed | 10 | `sikkerhedstjek` |
| Procedurer og oplæring | 09 | `procedure-skriver`, `rutine-bygger` |
| Rekruttering og bemanding | 09 | `rekruttering`, `onboarding-offboarding` |
| Personalepolitik | 09 | `personalepolitik` |
| Møder, referater, opfølgning | 05 | `moedeforberedelse`, `referat`, `opfoelgningsliste` |

Hub-strømme først: hvis programmet mangler `virksomhedsprofil.md`, `voice-profil.md` eller `designprofil.md`, og en strøm har brug for den, så læg strømmen der etablerer hub-filen tidligt i den kritiske vej - ellers gætter resten af strømmene.

## 3. Reglen om ejerskab

**En strøm har en navngiven ejer, ikke en afdeling.** "Marketing tager lanceringen" kan ikke stå til ansvar for en milepæl - det kan Mette. En afdeling er et sted at slå op, hvilken skill der bruges; ejerskabet er altid et navn. Mangler navnet: [AFKLARES], og spørg.

Programejeren (ét navn) ejer helheden og er den, der godkender program-briefen. Strøm-ejerne ejer hver sin del. I en lille SMV kan samme person eje flere strømme - men det skal stå som et navn pr. strøm, så en overtegnet nøgleperson bliver synlig med det samme.

## 4. Kritisk vej i letvægtsform

Ingen Gantt-diagrammer. Den kritiske vej er blot den kæde af strømme, hvor hver enkelt skal vente på den forrige - den kæde bestemmer den tidligste mulige slutdato.

Sådan finder du den:

1. Skriv for hver strøm, hvilke andre strømme den venter på (dens forudsætninger).
2. Følg den længste ubrudte kæde af "venter på" fra start til mål. Det er den kritiske vej.
3. Strømme uden for kæden kan køre parallelt - de er ikke kritiske, så længe de er færdige, før kæden når dem.

Konsekvens for styringen: forsinkes en strøm PÅ den kritiske vej, skubbes hele programmet. Forsinkes en strøm uden for, sker der intet - endnu. Marker de kritiske strømme i oversigten, så en travl ejerleder ved, hvor en forsinkelse faktisk gør ondt.

Tværgående milepæle er de punkter, hvor flere strømme skal være i mål samtidig (fx "alt klar til go-live"). Det er de farligste punkter i et program - marker dem særskilt.

## 5. Handoff-kontrakten

En overlevering er kun styret, når tre ting er aftalt på forhånd:

1. **Artefakt** - det navngivne dokument, der afleveres (`priskalkulation-abonnement.md`), ikke "prisen".
2. **Acceptkriterium** - hvornår det er godt nok til at bygge videre på ("dækningsbidrag mindst 40 %, godkendt af ejerleder").
3. **Modtager** - den navngivne strøm/ejer, der bruger artefaktet som input.

Dette er pakkens artefakt-kæde i praksis: den ene skills output er den næstes input. Uden acceptkriterium bliver overleveringen en diskussion i stedet for et klik - modtageren ved ikke, om input er klar til brug. Skriv en handoff-kontrakt for hver pil mellem to strømme.

## 6. Gennemført eksempel

Initiativ: **"Lancer et abonnement som ny ydelse."** Mål: 30 abonnenter på 6 måneder (understøtter strategimålet "tilbagevendende omsætning").

| # | Strøm | Afdeling | Skill | Ejer | Input | Output | Venter på | Milepæl |
|---|---|---|---|---|---|---|---|---|
| 1 | Beslutning + business case | 01 | `beslutningsgrundlag` | Ejerleder | virksomhedsprofil | `beslutningsgrundlag-abonnement.md` | - | Go besluttet |
| 2 | Prissætning | 08 | `priskalkulation` | Karin | strøm 1 | `priskalkulation-abonnement.md` | 1 | Pris godkendt |
| 3 | Vilkår og jura | 01 | `kontrakt-tjek` | Ejerleder | strøm 2 | `abonnementsvilkaar.md` | 2 | Vilkår klar |
| 4 | Byg selvbetjening | 10 | `byggebrief`->`klar-tjek` | Jens | strøm 2, 3 | leveret system | 2, 3 | Godkendt UAT |
| 5 | Salgsmateriale | 06 | `tilbud` | Jens | strøm 2, 3 | `tilbud-abonnement.md` | 2, 3 | Materiale klar |
| 6 | Lancering | 07 | `content-kalender`, `pressemeddelelse` | Mette | strøm 4, 5 | lanceringsplan + udkast | 4, 5 | Lanceret |

Kritisk vej: 1 -> 2 -> 3 -> 4 -> 6 (byg-strømmen er den længste kæde; salgsmateriale kører parallelt med byg og er ikke kritisk). Tværgående milepæl: strøm 4 og 5 skal begge være færdige, før strøm 6 kan lanceres - marker det.

Handoff-kontrakter (uddrag):

- Strøm 2 -> 4: `priskalkulation-abonnement.md`, acceptkriterium "endelig listepris låst", modtager Jens (byg-strømmen bygger prisen ind i selvbetjeningen).
- Strøm 4 + 5 -> 6: leveret system (godkendt via `klar-tjek`) og `tilbud-abonnement.md`, acceptkriterium "begge godkendt af ejerleder", modtager Mette.

Bemærk: strøm 4 er selv et helt projekt - den får sit eget kommissorium via `projekt-kickoff`. Program-styring dirigerer på tværs; kickoff sætter byg-projektet op indeni.
