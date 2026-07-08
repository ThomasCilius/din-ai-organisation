# Værdi/indsats-scoring - 2x2-modellen

Indhold:
1. [Princip](#1-princip)
2. [Værdiscore 1-4](#2-vaerdiscore-1-4)
3. [Indsatsscore 1-4](#3-indsatsscore-1-4)
4. [2x2-matricen og bunkerne](#4-2x2-matricen-og-bunkerne)
5. [Dommerregler ved tvivl](#5-dommerregler-ved-tvivl)
6. [Hvorfor aldrig vægtede kriteriemodeller](#6-hvorfor-aldrig-vaegtede-kriteriemodeller)
7. [Gennemregnet eksempel](#7-gennemregnet-eksempel)

## 1. Princip

Alt scores på REST: restværdi mod restindsats. Hvad projektet oprindelig blev solgt på, og hvad det allerede har kostet, er irrelevant - kun det der er tilbage at hente, holdt op mod det der er tilbage at betale, tæller. Det er sunk cost-værnet i praksis.

To scorer pr. projekt, hver på en skala fra 1 til 4. Skalaen har med vilje ingen midte - Claude og mennesker parkerer ellers alt på 3 af 5.

## 2. Værdiscore 1-4

Værdi = strategisk fit mod virksomhedsprofilens mål + økonomisk effekt. Læs målene i `virksomhedsprofil.md` FØR du scorer - "strategisk vigtigt" uden henvisning til et navngivet mål er en tom påstand.

| Score | Forankring |
|---|---|
| 4 | Understøtter direkte mindst ét af årets strategiske mål OG har målbar økonomisk effekt (nyt salg, sparede timer, fjernet risiko) inden for 12 måneder |
| 3 | Understøtter direkte et strategisk mål ELLER har klar, målbar økonomisk effekt |
| 2 | Indirekte støtte ("gør det nemmere at...") eller effekt der ikke kan sættes tal på |
| 1 | Understøtter ingen af målene; effekten er uklar, udokumenteret eller allerede hentet |

Regler:
- Scor på restværdien: er 80 % af gevinsten allerede realiseret, er restværdien lav - uanset hvor godt projektet var.
- Kræv tal for økonomisk effekt ("flere henvendelser" er score 2; "20 % flere henvendelser målt i CRM inden årets udgang" kan bære 3-4).
- Kan brugeren ikke koble projektet til et mål i virksomhedsprofilen, så spørg én gang - og scor derefter det du hører, ikke det brugeren håber.

## 3. Indsatsscore 1-4

Indsats = restindsats i timer (og kroner, hvis kroner binder hårdest). Skalaen er RELATIV til kvartalets projektkapacitet fra kapacitetsopgørelsen - aldrig absolutte timetal, for 100 timer er stort i en virksomhed med 3 projektfolk og småt i en med 30.

| Score | Restindsats i forhold til kvartalets projektkapacitet |
|---|---|
| 1 | 10 % eller derunder |
| 2 | Over 10 % og til og med 25 % |
| 3 | Over 25 % og til og med 50 % |
| 4 | Over 50 % |

Regler:
- Brug den ressource der binder hårdest: er kassen presset, kan restkroner score højere end resttimer - brug så den højeste af de to.
- Restindsats uden nået slutmilepæl at måle mod ("vi er 90 % færdige") accepteres ikke som lav indsats - spørg efter hvad der konkret mangler, og estimér det.

## 4. 2x2-matricen og bunkerne

|  | Lille indsats (1-2) | Stor indsats (3-4) |
|---|---|---|
| **Høj værdi (3-4)** | **Gør færdig først** - fortsæt, topprioritet | **Store satsninger** - fortsæt kun hvis kapaciteten rækker EFTER "gør færdig først"; ellers pausér med genstartsbetingelse |
| **Lav værdi (1-2)** | **Fyld** - kun hvis der er ledig kapacitet til overs; ellers pausér | **Stopkandidater** - indstil til stop |

Rækkefølgen når kapaciteten fordeles:
1. Bundne projekter (kontrakt/lovkrav) - de skal med, uanset score.
2. Gør færdig først - hurtigst frigjort kapacitet og hurtigste gevinster.
3. Store satsninger - så mange som resterende kapacitet ærligt kan bære, typisk højst 1-2 ad gangen i en SMV.
4. Fyld - kun hvis der stadig er timer tilbage, hvilket der sjældent er.

Når kapaciteten slipper op midt i en bunke: forceret rangering - bed brugeren sætte de resterende projekter i rækkefølge med spørgsmålet "hvis du kun måtte beholde ét af de her to, hvilket?".

## 5. Dommerregler ved tvivl

- **Bundne projekter scores ikke fri:** kontraktlig eller lovpligtig deadline markerer projektet "bundet" og lægger det i fortsæt - men dets resttimer trækkes stadig fra kapaciteten, synligt.
- **Pausér er ikke en blød mellemvej:** et pauset projekt får nul timer og en genstartsbetingelse (dato eller hændelse, fx "når webshoppen er lanceret"). Uden genstartsbetingelse er pausér bare et stop man ikke tør sige højt - sig det så.
- **Et bankende projekt** (nyt, ikke startet) scores som alle andre; dets "restindsats" er hele indsatsen. Kommer det i fortsæt-bunken, SKAL et igangværende projekt vige - det er hele pointen med WIP-begrænsningen.
- **To projekter med samme score:** vælg det der frigør kapacitet hurtigst (færrest resttimer til næste nåede milepæl).
- **Alt lander i høj værdi:** typisk tegn på at scoringen er ankret i håb, ikke i virksomhedsprofilens mål. Gennemgå værdiscorerne igen med målene ved siden af, og kræv at højst halvdelen af projekterne scorer 4.

## 6. Hvorfor aldrig vægtede kriteriemodeller

Modeller med 8-12 vægtede kriterier ("strategisk fit 20 %, innovation 10 %, ...") ser objektive ud, men:
- Diskussionen flytter fra projekterne til vægtene - og vægtene kan altid justeres til at give det svar man ønskede.
- En udenforstående kan ikke efterprøve tallene; en 2x2 med navngivne forankringspunkter kan.
- Præcisionen er falsk: forskellen på 6,8 og 7,1 point betyder intet i en SMV med 5 projekter.

2x2 plus én times ærlig samtale slår regnearket hver gang. Foreslår brugeren en vægtet model, så sig det - én gang - og følg derefter brugerens valg.

## 7. Gennemregnet eksempel

Eksempel A/S, handelsvirksomhed, 22 ansatte. Kvartalskapacitet: 340 projekttimer (fra kapacitetsopgørelsen). Sum af resttimer i porteføljen: 720 timer. Overtegningsfaktor: 720/340 = 2,1 - der SKAL prioriteres.

| Projekt | Ejer | Resttimer | Værdi | Indsats | Felt | Bunke |
|---|---|---|---|---|---|---|
| Webshop-relancering | Mette | 120 (35 %) | 4 (mål: onlinesalg +30 %) | 3 | Stor satsning | Fortsæt |
| ISO 9001-recertificering | Jan | 60 (18 %) | bundet (kundekontrakt kræver certifikat) | 2 | Bundet | Fortsæt |
| Nyt ERP | Thomas | 280 (82 %) | 3 (mål: skalerbar drift) | 4 | Stor satsning | Pausér - genstart når webshop er lanceret |
| Butiksombygning | Mette | 140 (41 %) | 1 (understøtter ingen af årets tre mål) | 3 | Stopkandidat | Stop |
| Ny hjemmesidetekst | Lars | 40 (12 %) | 2 (indirekte støtte til onlinesalg) | 2 | Fyld | Pausér - genstart hvis Q3 viser ledige timer |

Kapacitetsregnskab for fortsæt-bunken: 120 + 60 = 180 timer af 340 - resten er buffer til brandslukning (målt til ca. 30 % sidste kvartal) og til at webshoppen erfaringsmæssigt vokser. Frigjort ved pause/stop: 460 timer, hvoraf de første 120 er øremærket til at gøre webshoppen FÆRDIG i stedet for at alle fem projekter kravler.

Bemærk sunk cost-fælden i eksemplet: ERP-projektet har allerede kostet 350.000 kr. Det tal optræder INGEN steder i indstillingen - kun restindsats (280 timer) mod restværdi (3).
