# Vagtplan og rutinelog - formater

Læs denne fil når du opretter eller opdaterer `rutiner/vagtplan.md`, og når du skriver logformatet i `rutiner/rutinelog.md`. De to filer er vagtplanens to halvdele: vagtplanen viser hvem der arbejder hvornår (planen), rutineloggen viser hvad de faktisk lavede (beviset). Uden begge kan spørgsmålet "kørte den?" ikke besvares.

## Indhold

1. [Mappestruktur](#mappestruktur)
2. [Vagtplanen - den samlede oversigt](#vagtplanen)
3. [Sådan markeres nedlagte rutiner](#nedlagte-rutiner)
4. [Rutineloggen - beviset](#rutineloggen)
5. [Statuskoder](#statuskoder)
6. [Hyppige fejl](#hyppige-fejl)

## Mappestruktur

Alt bor i mappen `rutiner/` i brugerens arbejdsområde, så vagtplanen aldrig spredes:

```
rutiner/
  vagtplan.md              <- den samlede oversigt (denne fils første halvdel)
  rutinelog.md             <- én linje pr. kørsel (denne fils anden halvdel)
  rutine-[navn].md         <- én fil pr. rutine (format: rutine-skabelon.md)
  artefakter/
    [artefakt]-[åååå-mm-dd].md   <- rutinernes output, dateret så kørsler kan skelnes
```

En rutine skriver KUN til `rutiner/artefakter/` og tilføjer én linje til `rutinelog.md`. Den rører aldrig kilder uden for sine input.

## Vagtplanen

`rutiner/vagtplan.md` er brugerens overblik: én tabel hvor hver aktiv rutine har præcis én linje. Metaforen er en vagtplan for AI-medarbejderne - man skal kunne læse på tværs og se hvem der arbejder hvornår, og hvem der læser resultatet. Format:

```markdown
# Vagtplan - AI-medarbejdernes arbejdsplan

Sidst opdateret: [åååå-mm-dd]

## Aktive rutiner

| Rutine | Trigger | Udfører (skill) | Bevis-artefakt | Læser | Oprettet |
|---|---|---|---|---|---|
| mail-morgen | Hverdage 06:30 | `mail-i-min-stil` | mails-[dato].md | Thomas | 2026-07-01 |
| natportner | Alle dage 02:00 | `natportner` | natportner-[dato].md | Thomas | 2026-07-03 |
| ugestatus | Fredage 11:00 | `ugestatus` | ugestatus-[år-uge].md | Thomas | 2026-07-04 |
| mandagsbrief | Mandage 06:00 | `ugestatus` + kalender | brief-[dato].md | Thomas | 2026-07-04 |

## Nedlagte rutiner

| Rutine | Nedlagt | Begrundelse |
|---|---|---|
| daglig-salgsrapport | 2026-06-30 | Ulæst i en måned (Nedlukningsreglen); afløst af ugentlig pipeline-gennemgang |
```

Regler for tabellen:
- **Én linje pr. rutine.** Bliver oversigten uoverskuelig, er det et signal om for mange rutiner - ikke om at slå linjer sammen.
- **Læser-kolonnen må aldrig være tom.** En rutine uden navngiven læser er støj fra dag ét og skal ikke på planen.
- **Tjek for overlap hver gang du tilføjer:** to rutiner med samme artefakt og samme læser er formentlig én rutine. Nævn det for brugeren.
- **Læg ikke to tunge rutiner på samme landingstidspunkt.** Fordel dem, ellers bliver den ene ikke læst (se `kadence-katalog.md`).

## Nedlagte rutiner

Nedlukningsreglen: en rutine hvis bevis-artefakt ingen har læst i en måned, foreslås nedlagt. Beslutningen er brugerens - du foreslår, spørger én gang og respekterer svaret.

Når en rutine nedlægges, **slettes den aldrig** - den flyttes fra "Aktive rutiner" til "Nedlagte rutiner" med dato og begrundelse. Historikken er værdifuld: den viser hvad der er prøvet, og hvorfor det blev droppet, så den samme døde rutine ikke genopstår tre måneder senere. Selve `rutine-[navn].md`-filen kan blive liggende med et "NEDLAGT [dato]"-mærke øverst, eller flyttes til `rutiner/nedlagte/` hvis brugeren vil rydde op - men kun efter plan og godkendelse.

## Rutineloggen

`rutiner/rutinelog.md` er beviset. Én linje pr. kørsel, nyeste nederst, fast fem-felts format adskilt med lodret streg:

```
[åååå-mm-dd] | [rutine] | [status] | [artefakt-sti] | [afvigelser eller "ingen"]
```

Eksempel:

```
2026-07-06 | mandagsbrief | OK        | rutiner/artefakter/brief-2026-07-06.md      | ingen
2026-07-07 | mail-morgen  | OK        | rutiner/artefakter/mails-2026-07-07.md      | ingen
2026-07-07 | natportner   | OK        | rutiner/artefakter/natportner-2026-07-07.md | ingen nye filer
2026-07-08 | mail-morgen  | AFVIGELSE | rutiner/artefakter/mails-2026-07-08.md      | 1 mail eskaleret: mulig personsag
2026-07-09 | ugestatus    | FEJL      | -                                           | input-mappe tom, kunne ikke skrive status
```

Ufravigelige regler for loggen:
- **En kørsel uden logbogslinje har ikke fundet sted** - uanset hvad der ellers blev lavet. Loggen er det eneste bevis.
- **Tomgang logges også.** "Intet at gøre" er et resultat: status `OK`, og afvigelses-feltet bærer noten "ingen nye emner" (eller "ingen nye filer", "ingen nye ansøgninger"). Tavshed og nedbrud må aldrig ligne hinanden i loggen.
- **Afvigelser beskrives med én konkret linje** - "1 mail eskaleret: mulig personsag", aldrig bare "der var problemer". Læseren skal kunne handle på linjen alene.
- **Artefakt-stien er den fulde sti.** Fejler kørslen så der ikke blev noget artefakt, skrives `-` og årsagen står i afvigelses-feltet.

## Statuskoder

Tre koder dækker alt. Hold dig til dem, så loggen kan skimmes lodret:

| Kode | Betydning | Handling |
|---|---|---|
| `OK` | Rutinen kørte og efterlod sit artefakt som forventet - også ved tomgang (så står "ingen nye emner" i afvigelses-feltet, og artefaktet skrives med "intet nyt") | Ingen |
| `AFVIGELSE` | Rutinen kørte, men ramte sin eskaleringsregel og stoppede eller flagede noget | Læseren tjekker den flagede linje |
| `FEJL` | Rutinen kunne ikke gennemføres (manglende input, teknisk fejl) | Ret årsagen; efter 2 fejlforsøg lægges problemet frem for brugeren |

Eskalering logges som `AFVIGELSE` med en konkret note - den er ikke en fejl, men et bevidst stop-og-spørg. En rutine der ofte står `AFVIGELSE` af samme grund, er en kandidat til at få eskaleringsreglen skærpet eller opgaven flyttet til mennesket.

## Hyppige fejl

| Fejl | Konsekvens | Ret til |
|---|---|---|
| Kørsel uden logbogslinje | "Kørte den?" har intet svar | Altid én linje pr. kørsel, også ved tomgang |
| Tomgang logget som ingenting | Tavshed og nedbrud ligner hinanden | Status `OK` + noten "ingen nye emner" + artefakt med "intet nyt" |
| Afvigelse skrevet som "problemer" | Læseren kan ikke handle på linjen | Én konkret sætning: hvad, hvor, hvorfor |
| Nedlagt rutine slettet helt | Den døde rutine genopstår senere | Flyt til "Nedlagte rutiner" med dato + begrundelse |
| To rutiner, samme artefakt + læser | Dobbeltarbejde og forvirring om hvad der gælder | Slå sammen til én rutine, eller nævn overlappet for brugeren |
| Tom læser-kolonne i vagtplanen | Rutinen er støj fra dag ét | Navngiv læseren, ellers opret ikke rutinen |
