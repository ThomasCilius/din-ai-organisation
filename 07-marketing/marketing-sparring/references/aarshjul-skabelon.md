# Årshjul - proces og skabelon

Indhold:
1. [Hvad årshjulet er og ikke er](#hvad-aarshjulet-er-og-ikke-er)
2. [Byggeproces i fem trin](#byggeproces-i-fem-trin)
3. [Typiske danske sæsonankre](#typiske-danske-saesonankre)
4. [Skabelon for aarshjul-YYYY.md](#skabelon-for-aarshjul-yyyymd)
5. [Vedligehold og versionering](#vedligehold-og-versionering)

## Hvad aarshjulet er og ikke er

Årshjulet er marketingchefens årlige plan: 12 måneder med faste ankre (sæson, messer, lanceringer, højtider) og kampagnevinduer, målt op mod årets mål. Det beslutter HVAD og HVORNÅR på årsniveau. Det er IKKE en indholdsplan - den månedlige nedbrydning i konkrete opslag og udsendelser bor i `content-kalender`, og selve indholdet skrives af produktionsskillsene.

Byg altid fra virkelige begivenheder og virksomhedens egen cyklus - aldrig fra løse "content-idéer". En kalender bygget på idéer kollapser i marts; en kalender bygget på ankre holder, fordi begivenhederne kommer uanset hvad.

## Byggeproces i fem trin

1. **Årets mål:** hent målet fra intaken/prioriteringen (leads, salg, kendskab, fastholdelse) og notér hvordan året skal gøres op. Mangler der mål, er det første leverance - før hjulet.
2. **Ankre:** kortlæg årets faste begivenheder sammen med brugeren: branchens sæson (høj/lav), messer og events, planlagte lanceringer, højtider og ferieperioder. **Gæt aldrig på messenavne eller datoer - spørg, og bed brugeren verificere.** Få ankerlisten godkendt før du bygger videre (hard gate fra SKILL.md).
3. **Kampagnevinduer:** placér 2-4 kampagnevinduer oven på ankrene - fx før højsæson (aktivering) og i lavsæson (brandopbygning, cases, vedligehold af listen). Hvert vindue har ét formål og ét hovedbudskab.
4. **Kadence og kanaler:** fordel de valgte kanaler fra prioriteringen hen over året med den kadence timerne tillader. Lavsæson bruges til det tålmodige arbejde (cases, hjemmesidetekster, listeopbygning); højsæson til aktivering.
5. **Skriv og aflevér:** udfyld skabelonen nedenfor, tjek at intet kvartal er tomt og intet kvartal er overlæsset, og slut med én anbefalet handling (typisk: første skridt i den nærmeste måneds anker).

## Typiske danske saesonankre

Vejledende huskeliste - ALTID valideret mod brugerens branche; slet det irrelevante og tilføj branchens egne ankre (regnskabsår, udbudsrunder, sæsonstart):

| Periode | Typisk anker |
|---|---|
| Januar | Nyt år, nye budgetter; godt vindue for B2B-planlægningsydelser |
| Februar | Vinterferie (uge 7/8) - lav B2C-aktivitet, ok B2B-vindue |
| Marts-april | Påske; forår som sæsonstart for bygge/anlæg, have, event |
| Maj-juni | Spurt før sommerferien: beslutninger lukkes, arrangementer afvikles |
| Juli-primo august | Industriferien (typisk uge 28-31) - lavt blus, godt vindue til forberedelse og cases |
| August-september | Opstart efter ferie: stærkt B2B-vindue; messesæson begynder |
| Oktober | Efterårsferie (uge 42); messer og fagdage fortsætter |
| November | Black Friday (primært B2C); B2B: sidste vindue før årsafslutning |
| December | Jul og årsafslutning: taknemmelighed, opsummering, næste års aftaler |

## Skabelon for aarshjul-YYYY.md

Brug præcis denne struktur i artefaktet `aarshjul-YYYY.md`:

```markdown
# Marketingaarshjul [YYYY] - [virksomhed]
Version: v1 | Dato: [aar-maaned-dag] | Revideres: kvartalsvis

## Aarets maal
[Maalet fra prioriteringen + hvordan aaret goeres op]

## Kvartalsfokus
| Kvartal | Fokus | Begrundelse |
|---|---|---|

## Maanedsoversigt
| Maaned | Anker (saeson/messe/lancering/hoejtid) | Kampagnevindue + formaal | Hovedbudskab | Kanaler | Status |
|---|---|---|---|---|---|

## Kampagnevinduer (2-4)
[Pr. vindue: formaal, maalgruppe, hovedbudskab, kanaler, hvad succes ligner]

## Kobling til drift
[Hvilke maaneder foeder content-kalender foerst; hvornaar maales der med marketing-rapport]

## Antagelser og aabne spoergsmaal (altid med)
## Kilder (altid med)

## Revisionslog
| Dato | Version | Aendring | Hvorfor |
|---|---|---|---|
```

## Vedligehold og versionering

- **Kvartalsvis revision:** hold hjulet op mod seneste `maaned-rapport-*.md`: hvad blev gennemført, hvad flyttes, hvad droppes - og hvorfor. Ændringer skrives i revisionsloggen.
- **Arkivér, overskriv aldrig tavst:** før en større revision gemmes den gamle version (fx `aarshjul-YYYY-v1.md`). Historikken viser hvad der blev planlagt vs. gjort - det er læring, ikke rod.
- **Hjulet er retningen, ikke et fængsel:** opstår en reel mulighed (presseomtale, stor kunde, aflyst messe), justeres hjulet bevidst - med en linje i loggen - i stedet for at blive ignoreret i tavshed.
