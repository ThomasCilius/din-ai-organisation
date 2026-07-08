# Forecast-metode: vægtet pipeline med interval

Indhold:

1. [Hvorfor vægtet forecast](#1-hvorfor-vaegtet-forecast)
2. [Standardsandsynligheder pr. fase](#2-standardsandsynligheder-pr-fase)
3. [Kalibrering mod historisk hitrate](#3-kalibrering-mod-historisk-hitrate)
4. [Periodeafgrænsning](#4-periodeafgraensning)
5. [Fra vægtet sum til interval](#5-fra-vaegtet-sum-til-interval)
6. [Store enkeltsager](#6-store-enkeltsager)
7. [Gennemregnet eksempel](#7-gennemregnet-eksempel)
8. [Faldgruber](#8-faldgruber)
9. [Præsentationsregler](#9-praesentationsregler)

## 1. Hvorfor vægtet forecast

Summen af alle åbne sager er ikke et forecast - det er et drømmetal. En pipeline på 2 mio. kr. hvor det meste ligger i tidlige faser, lukker måske 200.000 kr. Vægtning med fasesandsynligheder oversætter "hvad ligger der" til "hvad lukker sandsynligvis", og intervallet oversætter usikkerheden til noget ejeren kan planlægge efter: kan lønningerne betales i lavt-scenariet, og hvad skal der ske for at nå højt?

## 2. Standardsandsynligheder pr. fase

Brug disse når virksomheden ikke har egne, dokumenterede tal - og markér dem da som [ANTAGELSE] i outputtet:

| Fase | Sandsynlighed | Logik |
|---|---|---|
| Emne | 5 % | Identificeret, men ingen gensidig kontakt - næsten alt falder fra her. |
| Dialog | 10 % | Kontakt etableret, behov uafklaret. |
| Møde afholdt | 20 % | Behovet er afdækket ansigt til ansigt - hver femte af disse bliver typisk til noget. |
| Tilbud sendt | 40 % | Kunden har bedt om en pris - reel købsinteresse, men konkurrenter og budgetter fælder stadig flertallet ikke. |
| Forhandling | 70 % | Vilkår diskuteres - nu er det kundens interne proces der er risikoen. |

Sandsynligheden gælder fasen, ikke sagen. Modstå fristelsen til at justere en enkelt sag op "fordi den føles god" - mavefornemmelser er præcis det vægtningen skal beskytte imod. Den eneste tilladte individuelle justering er NED via flag-reglerne i afsnit 5.

## 3. Kalibrering mod historisk hitrate

Standardtallene er branchegængse tommelfingerregler - virksomhedens egne tal er altid bedre. Kalibrér sådan:

1. Find lukkede sager (vundet + tabt) for de seneste 12-24 måneder i salgslisten/CRM-eksporten eller brainen.
2. Beregn pr. fase: af de sager der nåede fasen, hvor stor en andel endte som vundet? Det er fasens reelle sandsynlighed.
3. Kræv mindst 20 lukkede sager pr. fase før du erstatter standardtallet. Under 20 er støj: behold standard, men notér den observerede hitrate som pejlemærke i Antagelser-afsnittet.
4. Skriv de kalibrerede tal ind i outputtet med kilde og beregningsgrundlag ("40 % → 33 %, baseret på 27 afsendte tilbud 2025-2026"). Foreslå brugeren at gemme dem i `virksomhedsprofil.md`, så næste gennemgang starter kalibreret.

Genkalibrér højst kvartalsvis - tal der hopper hver uge, er ikke kalibrering men støj.

## 4. Periodeafgrænsning

Et forecast gælder en periode (typisk indeværende måned eller kvartal - spørg hvis det er uklart):

- Kun sager med forventet lukkedato i perioden indgår i periodens forecast.
- Sager uden forventet lukkedato flages [DATO MANGLER] og indgår kun i højt-scenariet. Foreslå en dato som næste skridt-handling.
- Vis gerne pipelinens totale vægtede værdi ved siden af periodens forecast - men bland aldrig de to tal sammen.

## 5. Fra vægtet sum til interval

Beregn tre tal:

- **Forventet** = summen af beløb × fasesandsynlighed for alle sager i perioden - dog halveres vægten for sager flaget [GÅET I STÅ]. En sag over tærsklen har pr. definition mistet momentum, og momentum er halvdelen af sandsynligheden.
- **Lavt** = kun sager i forhandling samt sager med et dokumenteret mundtligt tilsagn, vægtet som normalt - og stadig uden gået-i-stå-sager. Lavt-scenariet svarer på: "hvad kan vi regne med selv hvis alt andet glipper?"
- **Højt** = alle sager i perioden til fuld fasesandsynlighed, inklusive gået-i-stå-sager og [DATO MANGLER]-sager. Højt-scenariet svarer på: "hvad er muligt hvis hver eneste opfølgning lander?"

Sager flaget [LUK ELLER GENÅBN] (tre opfølgninger uden svar) tæller KUN i højt - de er reelt tabt indtil andet er bevist.

## 6. Store enkeltsager

Udgør én sag over 30 % af det forventede (vægtede) forecast, vises forecastet både med og uden sagen. En vægtet sandsynlighed er et gennemsnit over mange sager - men én stor sag lukker enten helt eller slet ikke, og ejeren skal kunne se hvor meget af forecastet der hviler på ét enkelt ja. Samme logik som koncentrationsrisikoen i sundhedstjekket, bare på forecast-niveau.

## 7. Gennemregnet eksempel

Periode: juli. Fem sager med lukkedato i perioden:

| Sag | Beløb | Fase | Flag | Vægt | Forventet |
|---|---|---|---|---|---|
| Nordjysk Stål | 180.000 | Tilbud sendt | [GÅET I STÅ] | 40 % → 20 % | 36.000 |
| Fjord Logistik | 95.000 | Forhandling | - | 70 % | 66.500 |
| Byens VVS | 45.000 | Tilbud sendt | - | 40 % | 18.000 |
| Grønvang A/S | 320.000 | Møde afholdt | - | 20 % | 64.000 |
| Hedegaard IT | 60.000 | Tilbud sendt | [LUK ELLER GENÅBN] | kun i højt | 0 |

- **Lavt: 66.500 kr.** (kun Fjord Logistik - eneste sag i forhandling uden flag)
- **Forventet: 184.500 kr.** (36.000 + 66.500 + 18.000 + 64.000)
- **Højt: 244.500 kr.** (alle fem til fuld fasevægt: 72.000 + 66.500 + 18.000 + 64.000 + 24.000 - vis altid regnestykket, så det kan efterprøves)

Grønvang udgør 64.000/184.500 = 35 % af forventet → vis også forecastet uden Grønvang: 120.500 kr.

## 8. Faldgruber

- **Happy ears:** sager rykkes frem i fase på fornemmelse ("mødet gik SÅ godt"). Fasehop kræver dokumenteret aktivitet - et nyt møde i kalenderen, et afsendt tilbud, en forhandlingsmail.
- **Sandbagging:** det omvendte - sælgeren holder sikre sager i lave faser for at "overraske positivt". Kalibrering afslører det: hvis vundne sager konsekvent springer faser over, er fasedisciplinen problemet, ikke forecastet.
- **Evighedssager:** sager der har fået deres lukkedato flyttet 3+ gange, behandles som gået i stå uanset aktivitet - flyttede datoer ER manglende momentum.
- **Frisk-data-illusion:** et forecast er kun så godt som salgslistens seneste opdatering. Er listen ældre end 7 dage, så sig det og bed om en opdatering før du regner.

## 9. Præsentationsregler

- Altid tre tal med etiketterne lavt/forventet/højt - aldrig "ca.", aldrig ét tal, heller ikke i en bisætning eller opsummering.
- Vis beregningen som tabel (sag, beløb, fase, vægt, bidrag) - et forecast uden synligt regnestykke kan ikke udfordres, og så er det en påstand, ikke et forecast.
- Skriv med én sætning hvad der adskiller forventet fra højt ("højt kræver at Nordjysk Stål og Hedegaard begge lander efter opfølgning") - det gør intervallet til en handlingsplan i stedet for et vilkår.
- Alle ukalibrerede sandsynligheder markeres [ANTAGELSE] med henvisning til dette dokument.
