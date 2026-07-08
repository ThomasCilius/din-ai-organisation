# Skabeloner - risikolog og beslutningslog

Indhold:
1. [Regler for brug](#regler-for-brug)
2. [Skabelon: risikolog-[projekt].md](#skabelon-risikolog-projektmd)
3. [Skabelon: beslutningslog.md](#skabelon-beslutningslogmd)

## Regler for brug

- **ID-format:** risici hedder R1, R2...; issues hedder I1, I2...; beslutninger hedder B1, B2... Numre genbruges aldrig, heller ikke efter arkivering.
- **Krydsreference:** når en risiko indtræffer, oprettes et issue med henvisning ("I4 - opstået af R2"), og risikoen flyttes til arkivet med udfaldet noteret.
- **Nyeste øverst** i beslutningsloggen; risikologgen sorteres efter score (højest øverst).
- **Én fælles beslutningslog** for hele virksomheden - projektkolonnen holder styr på hvor beslutningen hører til.
- **Datoformat:** ÅÅÅÅ-MM-DD overalt.
- Udfyld ALLE kolonner. Mangler en oplysning, skriv [AFKLARES] - aldrig et gæt, aldrig en tom celle.

## Skabelon: risikolog-[projekt].md

```markdown
# Risikolog - [projekt]

> Ajourført: [ÅÅÅÅ-MM-DD] af [navn] med AI-assistance (kladde - projektejer godkender).
> Næste gennemgang: [dato for næste statusmøde]

## Aktive risici (top 5-10)

| ID | Risiko (årsag → hændelse → konsekvens) | S | K | Score | Strategi | Mitigering / næste handling | Ejer | Dato |
|----|----------------------------------------|---|---|-------|----------|------------------------------|------|------|
| R1 | Fordi leverandøren er eneleverandør på styringen, kan levering glide, hvilket skubber lanceringen 4+ uger | 2 | 3 | 6 | Reducér | Aftal fast leveringsplan med delleverancer; afklar alternativ leverandør | Mette | 2026-07-20 |
| R2 | Fordi Jens er den eneste der kan konfigurere anlægget, kan sygdom standse installationen, hvilket udløser dagbod | 2 | 3 | 6 | Reducér | Sidemandsoplæring af Karim påbegyndt; opsætning dokumenteres | Thomas | 2026-07-31 |

## Watch-liste

Risici med score 1-2 (eller nedprioriteret af projektejer). Ingen aktiv styring - genvurderes ved hver gennemgang.

| ID | Risiko | S | K | Score | Genvurderes |
|----|--------|---|---|-------|-------------|
| R5 | Fordi lokalerne er lejet, kan opsigelse fra udlejer kræve flytning midt i projektet | 1 | 2 | 2 | [næste gennemgang] |

## Issues

| ID | Issue (hvad er sket) | Opstået | Konsekvens nu | Handleplan | Ansvarlig | Deadline | Status |
|----|----------------------|---------|---------------|------------|-----------|----------|--------|
| I1 | Testmiljøet gik ned under integrationstest (opstået af R3) | 2026-07-02 | Test forsinket 1 uge | Genopret miljø fra backup; testplan komprimeres | Karim | 2026-07-10 | Åben |

## Arkiv - lukkede poster med udfald

| ID | Post | Lukket | Udfald |
|----|------|--------|--------|
| R3 | Fordi testmiljøet deler server med drift, kan spidsbelastning vælte det | 2026-07-02 | Indtraf - blev til I1, kostede 1 uge |
| R4 | Fordi tilbuddet lå 15 % over budget, kunne finansiering falde | 2026-06-15 | Indtraf aldrig - banken godkendte |

## Indstillinger til projektejer (altid med)

- Indstilling: [fx "R1 hæves fra gul til rød og eskaleres - godkender du?"]
- Indstilling: [fx "R4 lukkes som ikke længere aktuel - godkender du?"]

## Antagelser og åbne spørgsmål (altid med)

- [ANTAGELSE/AFKLARES-punkter med hvem der skal svare]

## Kilder (altid med)

- [referat, ugestatus, mail eller samtale-bekræftelse pr. væsentligt udsagn]
```

## Skabelon: beslutningslog.md

```markdown
# Beslutningslog - [virksomhed]

> Fælles log på tværs af projekter. Nyeste øverst. Kladde - hver post kræver kilde eller udtrykkelig bekræftelse.

| Nr. | Dato | Projekt | Beslutning | Hvem besluttede | Grundlag | Fravalgte alternativer | Kilde |
|-----|------|---------|------------|-----------------|----------|------------------------|-------|
| B2 | 2026-07-01 | Ny hjemmeside | CMS bliver [X], ikke [Y] | Thomas (projektejer) | [Y] krævede dyrere hosting og ekstern specialist | [Y] (pris); egen udvikling (tid) | Referat, styregruppemøde 2026-07-01 |
| B1 | 2026-06-12 | Ny hjemmeside | Lancering udskydes fra sep. til nov. | Styregruppen | Indhold ikke klar; hellere færdig end hurtig | Delvis lancering (halvfærdigt indtryk) | Bekræftet af Thomas i samtale 2026-06-12 |
```

Felternes betydning:

- **Beslutning:** selve valget, i én sætning - ikke diskussionen.
- **Hvem besluttede:** navngiven person eller organ. "Vi blev enige" er ikke en beslutningstager.
- **Grundlag:** de 1-2 vigtigste argumenter der afgjorde sagen.
- **Fravalgte alternativer:** hvad blev IKKE valgt, og med den korte grund. Det vigtigste felt - det stopper genforhandlingen om et halvt år.
- **Kilde:** referat med dato, mail, eller "bekræftet af [navn] i samtale [dato]". Uden kilde ingen post - jernloven.
