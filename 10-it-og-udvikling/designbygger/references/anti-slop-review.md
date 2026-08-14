# Anti-slop-review - auditten på det færdige design

Dette er kvalitetsporten. Den køres to steder:

1. **Før aflevering.** Du har lige bygget fladen. Kør hele listen på dit eget arbejde, ret manglerne, kør igen. Du afleverer først, når scoren er over tærsklen og der er nul røde fund.
2. **AUDIT-MODE.** Fladen findes allerede (side, app, mobilvisning). Samme liste, men nu på fremmed arbejde, med evidens pr. fund og en fix-status.

Auditten er ikke smagsdommeri. Hvert punkt er formuleret, så du kan svare **ja** eller **nej** ved at kigge på skærmen eller måle i browseren. Kan du ikke svare ja/nej, har du ikke auditeret punktet - du har haft en fornemmelse, og den tæller ikke.

Den bærende prøve bag hele dokumentet: **ville en designer på et studie, der lever af sit navn, sætte sit navn på det her?**

## Hvem ejer hvad

Auditten sætter ikke egne tal. Den måler op mod de filer, der ejer emnet, og citerer deres værdier:

| Emne | Ejer | Auditten gør |
|---|---|---|
| Retning, skrifter, farvevalg, spacing-skala, kontrastniveau (AA/AAA) | `designprofil.md` | Tjekker om det byggede følger valget |
| Kontrastgates, målbredde, linjehøjde, typeskala, radieskalaens trin | `designsystem.md` | Citerer tallene, opfinder ingen |
| Varigheder, easing, forsinkelser, reduceret bevægelse | `motion.md` | Måler mod motion-skalaen |
| Koncentriske radier, interaktionstilstande, hit areas, skyggelag, ikonoptik | `polering.md` | Tjekker om reglen er fulgt |
| Skelet, wiring, UX-love omsat til kode, det kanoniske tokennavnesprog | `html-motor.md` | Tjekker om konsekvensen er bygget |
| Tekstens stemme og sprog | `voice-profil.md` | Tjekker om tonen matcher |
| Slop-tells, fladetypens regelsæt, velviljekontoen, målingerne og selve auditten | Denne fil | Ejer dem. Ingen anden fil skal gentage dem |

Er der konflikt mellem et punkt her og en ejerfil: **ejerfilen vinder på valget** (hvilken farve, hvilken varighed, hvilken skrift), **denne fil vinder på udførelsen** (om udførelsen er slap). Er der konflikt mellem to ejerfiler, er det en fejl i pakken, ikke et fund på fladen - skriv det i rapporten som en note, og auditér efter den fil, der ejer emnet i tabellen ovenfor.

---

## 1. Slop-tells

Slop er det trygge gennemsnit: ikke grimt, sjældent forkert, bare intetsigende og udskifteligt. Tellsene nedenfor er de observerbare tegn - ser du en af dem, scorer fladen med høj sandsynlighed lavt på flere punkter i tjeklisten.

| # | Tell | Sådan ser du den | Sådan retter du |
|---|---|---|---|
| T1 | **Centreret hero med gradient-blob** | Overskrift, underrubrik og knap er alle `text-align: center` i én kolonne, med en sløret farveplet eller `radial-gradient` bag | Venstrestil teksten mod samme kant som navigationen, giv overskriften reel størrelse (mindst 2,5x brødtekst), og erstat blobben med noget, der betyder noget: et rigtigt produktbillede, en tegnet figur, et tal, en tekstur |
| T2 | **Uniformt card-grid uden hierarki** | 3 eller 4 kort i samme bredde, samme højde, samme vægt, samme padding, i et `repeat(3, 1fr)` | Giv ét kort forrang (bredere, mørkere, større overskrift), eller skift til en liste, hvis kortene ikke er ligeværdige. Er de faktisk ligeværdige, så gør gridet stramt og fjern kort-rammerne helt |
| T3 | **Ens radier og skygger overalt** | Én `--radius` og én `--shadow` bruges på knap, kort, modal, input og badge | Byg en skala: badge 4 px, knap 8 px, kort 12 px, modal 16 px. Skyggen skal vokse med elevationen, ikke være den samme |
| T4 | **Grå på hvid med én accentfarve** | Baggrund `#fff`, tekst `#333`, alt andet i gråtoner, og præcis én blå eller grøn til knapper og links | Byg mindst tre neutrale niveauer med kulør i (varm eller kold, ikke rent grå), og lad accenten optræde få steder med mening. En sekundær farve til status og fremhævning må gerne findes |
| T5 | **Ubesluttet fontstak** | `font-family: system-ui, -apple-system, sans-serif` uden variation i vægt og størrelse - og uden at `designprofil.md` har valgt det | Sæt profilens skrifter ind med rigtig `@font-face` eller webfont-link, og brug vægtkontrast (400 mod 700, ikke 400 mod 500). Har profilen bevidst valgt en systemstak, er det ikke et fund - men vægt- og størrelseskontrasten skal så bære hierarkiet alene |
| T6 | **Emoji som punkttegn og ikoner** | Emoji i lister, kort og knapper | Brug rigtige ikoner (inline SVG, ensartet stregtykkelse) eller ingen ikoner. Emoji signalerer hastværk og bryder ethvert visuelt system |
| T7 | **Symmetri overalt** | Hver sektion er en centreret kolonne med samme maksimalbredde og samme lodrette padding | Variér: én sektion i fuld bredde, én forskudt, én med billede i venstre kolonne. Skift den lodrette rytme mellem sektionstyper |
| T8 | **Motion uden formål** | Alt fader ind ved scroll, knapper skalerer på hover, tal tæller op uden grund | Behold 1-2 bevægelser, der forklarer noget (overgang, tilstandsskift, fokus). Slet resten |
| T9 | **Ordløs stock-æstetik** | Overskrifter som "Velkommen", "Vores løsninger", "Kom i gang i dag", plus en indledning der roser virksomheden i stedet for at sige, hvad den laver | Skriv det, virksomheden faktisk gør, i det sprog `voice-profil.md` beskriver. Overskriften skal kunne dumpe-testes: kan konkurrentens navn stå der uden ændring, er den tom |
| T10 | **Lige stor typografi hele vejen ned** | Alle overskrifter er 24-32 px, brødtekst 16 px, intet springer ud | Byg en skala med reelle spring (fx 16 / 20 / 28 / 40 / 64) og brug de yderste trin |
| T11 | **Kant-til-kant-fejl** | Indhold flugter ikke: navigationen starter 24 px inde, heroen 48 px, sektionen 32 px | Én container med én venstrekant. Mål det, gæt ikke |
| T12 | **Alt er kort** | Enhver informationstype er pakket i en boks med ramme, radius og skygge | Tekst må gerne stå på baggrunden. Brug kort, når noget faktisk skal være klikbart eller adskilt |
| T13 | **Farvede ikoner i cirkler** | Rundt felt i 10 % accentfarve med et lille ikon i midten, tre gange ved siden af hinanden | Fjern cirklen, eller gør ikonet stort nok til at bære sig selv. Cirkel-ikon-triaden er den mest genkendelige AI-signatur, der findes |
| T14 | **Manglende tilstande** | Ingen hover, ingen fokusring, ingen deaktiveret, ingen indlæsning, ingen fejl | Alle fem tilstande skal findes på alt interaktivt. Se punkt F1-F11 |
| T15 | **Gradientknapper og glød** | `linear-gradient` på hver primærknap, ofte med `box-shadow` i samme farve | Fladt fyld, én accentfarve, tydelig hover og active. Gradient er en beslutning, ikke en default |

Slop-diagnose i én sætning: **kan du udskifte logoet med en konkurrents, uden at noget ser forkert ud, er fladen slop.** Skriv den sætning ned som dit første fund, hvis den er sand.

---

## 2. Fladetypens regelsæt

Afgør typen, før du auditerer. Reglerne herunder er hårde: brydes de, er det et fund, uanset hvor pænt resultatet ser ud.

- **Markedsføringsflade** - forside, landingsside, kampagne, produktside. Brandbåren, ét budskab, konvertering.
- **Brugsflade** - dashboard, formular, administration, værktøj. Opgavebåren, datatæt, gentaget brug.
- **Blandet** - markedsføringsskal med funktionelle sektioner. Auditér hver sektion efter sin egen type, og skriv i rapporten hvilke sektioner der blev vurderet som hvad.

### 2.1 Regler for markedsføringsflader

| Regel | Konkret |
|---|---|
| Heroen går kant til kant | Fuld bredde, ingen indrykket, flisebelagt eller afrundet hero-kasse midt på siden. Baggrunden må gerne stoppe, men den stopper ved skærmkanten |
| Hero-budgettet er lukket | Brand, én overskrift, én støttesætning, én knapgruppe, ét billede. Alt derudover skal ned i næste sektion. Fem elementer, ikke seks |
| Ingen kort i heroen | Et kort må kun stå der, hvis kortet **er** interaktionen (en søgeboks, en beregner, et valg). Dekorative kort i heroen er et fund |
| Ingen flad enkeltfarvet baggrund | Baggrunden skal bære noget: retningsbestemt gradient, foto, tekstur, stor typografi eller en flade der brydes. En helflade i én farve er en ubesluttet baggrund, ikke minimalisme |
| Første skærmfuld er ét billede | Den øverste visning læses som én komposition, ikke som et instrumentbræt af bokse |
| Brandet er den tungeste tekst | Rækkefølgen i vægt: brand, overskrift, brødtekst, knap. Er knappen det tungeste, er hierarkiet vendt om |

### 2.2 Regler for brugsflader

| Regel | Konkret |
|---|---|
| Fire zoner, én accent | Organisér i primært arbejdsområde, navigation, sekundær kontekst og præcis én accentfarve. Kan du ikke pege på de fire zoner, er fladen en bunke kasser |
| Ingen kortmosaik | Et dashboard bygget af ens kort er ikke et layout. Byg det som layout: arbejdsområdet stort, konteksten lille, navigationen fast |
| Rolig krom | Undgå tykke rammer, dekorative gradienter og ornamentale ikoner. Strukturen skal bæres af afstand, flade og typografi |
| Brugssprog, ikke stemningssprog | Teksten orienterer, viser status og navngiver handlinger. "Vælg periode", ikke "Din rejse begynder her" |
| Sektionsoverskrifter siger, hvad området er | "Åbne sager", "Abonnementets status", "Valgte nøgletal". Ikke "Overblik" og ikke en tom stribe |
| Tæt, men læsbar | Densitet er et valg efter `designsystem.md`. Tæt layout uden rytme er rod, ikke effektivitet |

### 2.3 Universelle regler

Gælder begge typer:

- **Ét job pr. sektion.** Én sektion har ét formål, én overskrift og én støttende sætning. Har en sektion to formål, er det to sektioner - eller ét formål for meget.
- **Kort skal fortjene deres eksistens.** Er indholdet hverken klikbart eller adskilt fra sine naboer, skal det ikke ligge i en boks.
- **Sletteprøven.** Fjern 30 % af teksten i hovedet. Bliver sektionen bedre, så slet den i virkeligheden og gentag prøven.
- **Farver kommer fra variabler.** Ingen løse hex-koder ude i komponenterne. Reglen ejes af `html-motor.md`; auditten tjekker den under C2.
- **Aldrig lille lavkontrast-tekst.** Brødtekst under 16 px eller under `designsystem.md`s kontrastkrav er ikke et smagsspørgsmål.
- **Aldrig placeholder som eneste label.** Labelen skal være synlig, også når feltet er udfyldt.
- **Overskrifter svæver ikke.** En overskrift skal stå tættere på det, den indleder, end på det, den følger efter.

### 2.4 Hårde afvisninger

Ser du et af disse mønstre, er fladen afvist på det punkt alene. Skriv det som første fund, og lad være med at fortsætte til finpudsning, før det er afklaret med ejeren.

1. Et generisk kortgitter er det første, man møder.
2. Smukt billede, svagt brand - man husker fotoet og ikke hvem det tilhører.
3. Stærk overskrift uden nogen tydelig næste handling.
4. Uroligt billede bag tekst, så teksten kæmper mod motivet i stedet for mod baggrunden.
5. Karrusel uden narrativt formål - indhold gemt bag pile, fordi ingen turde prioritere.
6. Flere sektioner, der gentager den samme stemning uden at tilføje noget.
7. Brugsflade bygget af stablede kort i stedet for et layout.

### 2.5 Lakmusprøverne

Syv spørgsmål, syv ja/nej. Et nej er et fund på klynge G, ikke en note.

1. Er det umiddelbart klart, hvem afsenderen er, allerede i første skærmfuld?
2. Findes der ét visuelt anker, som kompositionen hviler på?
3. Kan man forstå fladen ved kun at læse overskrifterne?
4. Har hver sektion ét job?
5. Er kortene nødvendige - eller kunne indholdet stå frit?
6. Gør bevægelsen hierarkiet eller stemningen tydeligere, i stedet for bare at være der?
7. **Ville designet stadig føles gennemført, hvis alle dekorative skygger blev fjernet?** Er svaret nej, holdes fladen sammen af skygge og ikke af komposition.

---

## 3. Sådan kører du auditten

### 3.1 Vælg omfang først

Skriv omfanget i rapportens hoved. Uden det ved ejeren ikke, hvad scoren dækker.

| Omfang | Dækning | Bruges til |
|---|---|---|
| **Hurtig** | Forsiden plus 1-2 nøglesider. Førstehåndsindtryk, udtræk og hurtig-auditten i afsnit 12 | Første temperaturmåling, meget lidt tid |
| **Standard** | 5-8 flader, alt hvad man kan nå fra forsiden. Fuld tjekliste, tre viewports, 2-3 flows | Standardvalget |
| **Dyb** | 10-15 flader, hvert eneste flow, hele tjeklisten på hver flade | Før lancering eller ved større omlægning |
| **Diff-baseret** | Kun de flader, en gren faktisk rører. Kør `git diff <base>...HEAD --name-only`, oversæt filerne til ruter (skabelon til side, komponent til de sider der bruger den, stylesheet til alt der importerer det), og auditér dem før og efter | Review af en feature-gren |
| **Regression** | Standardomfang, derefter sammenligning mod en gemt baseline efter afsnit 11.2 | Efter en ombygning, eller når nogen påstår, det er blevet bedre |

Findes der en `designprofil.md` eller et tokenkatalog i projektet, læses det først. En afvigelse fra projektets eget nedskrevne system vejer **tungere** end en afvigelse fra en almen regel - virksomheden har truffet valget, og fladen holder det ikke. Findes der ingen, auditér efter denne pakke og tilbyd bagefter at skrive systemet ned ud fra udtrækket i afsnit 4.

### 3.2 Rækkefølgen

Rækkefølgen er ikke valgfri. Måling før mening.

1. **Førstehåndsindtryk, før du måler noget.** Åbn fladen, kig i tre sekunder, og skriv fire linjer ned: hvad fladen kommunikerer, hvad du lægger mærke til, hvilke tre elementer øjet rammer i rækkefølge, og ét ord der opsummerer. Rammer øjet ikke det, designet ville have det til at ramme, lyver hierarkiet, og det er et A-fund. Skriv indtrykket først - efter en time med målinger kan du ikke se fladen med friske øjne igen.
2. **Fladeprøven.** Peg på hvert klart afgrænset område og sig højt, hvad området er til for ("det man kan købe", "det der sker i denne uge", "sådan kommer man i kontakt"). Områder, du ikke kan navngive på to sekunder, er dårligt afgrænsede. Skriv dem ned.
3. **Afgør fladetypen** efter afsnit 2, og noter den i rapportens hoved. På en brugsflade markeres hero-punkterne ikke relevante; til gengæld vejer tilstande (F), tilgængelighed (J) og indholdstæthed tungere.
4. **Åbn fladen.** Har du browserværktøj: åbn den kørende side. Ellers auditér koden og skriv i rapporten: "fund ikke bekræftet på skærm".
5. **Kør udtrækket** i afsnit 4, før du danner dig en mening om systemet. Du auditerer det, der faktisk er renderet, ikke det, koden lover.
6. **Tre viewports, altid.** 375 px (mobil), 768 px (tablet), 1440 px (desktop). Har fladen et komplekst layout, tag også 1920 px. Kig efter vandret scroll og brud.
7. **Mål i stedet for at gætte.** Brug elementinspektion til at aflæse `font-size`, `line-height`, `padding`, `gap`, faktiske farver og beregnet kontrast. Et fund med et tal er et fund; et fund med et adjektiv er en mening.
8. **Klik alt.** Hver knap, hvert link, hvert felt. Tab dig igennem med tastaturet fra top til bund. Tjek konsollen for fejl.
9. **Gå flowene igennem** efter afsnit 5. Statiske tilstande fanger ikke, hvordan produktet føles i brug.
10. **Kør punkterne i rækkefølge** og notér ja / nej / ikke relevant. Ved nej: skriv fundet med det samme i formatet i afsnit 8. Batch ikke fundene til sidst - du glemmer beviset.
11. **Sammenlign fladerne** efter klynge M, når omfanget er mere end én flade.
12. **Beregn score** efter afsnit 7.
13. **Ret det fixbare** efter afsnit 9, og verificér hver rettelse med den samme test, der fandt fejlen.
14. **Aflever rapporten** i formatet i afsnit 11.

**Tidsbudget.** Fuld audit på en enkelt flade: alle 100 punkter. Er der ikke tid, kør **hurtig-auditten** i afsnit 12 (20 punkter) og skriv eksplicit i rapporten, at det var en hurtig audit, samt hvad der ikke blev tjekket. Sig aldrig "gennemgået" om en delvis gennemgang.

---

## 4. Udtræk af det system, der faktisk er bygget

Før du bedømmer noget, trækker du systemet ud af den renderede flade. Formålet er at have tal at auditere mod, i stedet for at gætte ud fra kildekoden - fallback-skrifter, arvede farver og komponentbiblioteker gør, at det byggede sjældent er præcis det, CSS'en siger.

Kør disse i browserkonsollen på den flade, du auditerer. Har du ikke konsol, tælles det samme manuelt fra inspektoren, og du skriver i rapporten, at udtrækket er manuelt.

```js
// Skrifter i brug, sorteret efter hvor mange elementer der bruger dem
Object.entries([...document.querySelectorAll('body *')]
  .reduce((m, e) => { const f = getComputedStyle(e).fontFamily; m[f] = (m[f] || 0) + 1; return m; }, {}))
  .sort((a, b) => b[1] - a[1]);
```

```js
// Farver i brug: tekst, baggrund og kant, med antal forekomster
Object.entries([...document.querySelectorAll('body *')]
  .reduce((m, e) => {
    const s = getComputedStyle(e);
    [s.color, s.backgroundColor, s.borderTopColor].forEach(c => {
      if (c && c !== 'rgba(0, 0, 0, 0)') m[c] = (m[c] || 0) + 1;
    });
    return m;
  }, {}))
  .sort((a, b) => b[1] - a[1]);
```

```js
// Overskriftsskalaen som den faktisk renderes
[...document.querySelectorAll('h1,h2,h3,h4,h5,h6')].map(h => {
  const s = getComputedStyle(h);
  return `${h.tagName}  ${s.fontSize}  vægt ${s.fontWeight}  "${h.textContent.trim().slice(0, 40)}"`;
});
```

```js
// Klikflader under 44 px - listen bliver til F8-fund
[...document.querySelectorAll('a,button,input,select,textarea,[role="button"],[tabindex]')]
  .map(e => ({ e, r: e.getBoundingClientRect() }))
  .filter(({ r }) => r.width > 0 && (r.width < 44 || r.height < 44))
  .map(({ e, r }) => `${e.tagName} ${Math.round(r.width)}x${Math.round(r.height)} · ${(e.textContent || '').trim().slice(0, 30)}`);
```

```js
// Synlige ord i alt - nævneren i happy talk-andelen under I10
document.body.innerText.trim().split(/\s+/).filter(Boolean).length;

// Er reduceret bevægelse slået til i den browser, du tester i?
window.matchMedia('(prefers-reduced-motion: reduce)').matches;
```

Skriv resultatet op som **det faktisk byggede system** og hold det op mod profilen:

| Udtræk | Tærskel, der udløser et fund |
|---|---|
| Skriftfamilier | Over 2 familier (eller over det, `designprofil.md` har valgt). Er den mest brugte familie en ren systemstak, som profilen ikke har valgt, er det T5 |
| Farvepalet | **Over 12 unikke ikke-grå farver** er et C-fund: paletten er vokset af sig selv. Notér også, om de neutrale er varme, kolde eller blandede - blandede er altid et fund |
| Semantiske farver | Status skal følge konventionen: grøn betyder gennemført, rød betyder fejl, gul eller ravgul betyder advarsel. Er rød brugt til fremhævning eller grøn til en neutral handling, lyver farven. Tokennavnene (`--ok`, `--warn`, `--danger`) ejes af `designsystem.md` |
| Overskriftsskala | Spring i niveauer (h1 direkte til h3), to niveauer i næsten samme størrelse, eller størrelser uden for skalaen |
| Klikflader | Hvert element på listen er et F8-fund. Er der over 5, er det ét fund med forekomster, ikke fem fund |
| Afstande | Stikprøve på 10 `padding`- og `gap`-værdier. Værdier uden for spacing-skalaen er D1-fund |

Findes der ingen nedskrevet profil, tilbyd at gemme udtrækket som projektets designsystem - så har næste audit noget at måle mod.

---

## 5. Flowgennemgang og velviljekontoen

Statiske skærmbilleder viser, om fladen ser rigtig ud. Flowene viser, om den føles rigtig. Vælg **2-3 nøgleflows** - dem forretningen lever af: find en ydelse og tag kontakt, opret noget, gennemfør et køb, log ind og løs den hyppigste opgave.

Gå hvert flow igennem i browseren som en bruger og bedøm fire ting:

| Hvad du bedømmer | Spørgsmålet | Fundet, hvis |
|---|---|---|
| **Responsfornemmelse** | Sker der noget synligt inden for 100 ms, når jeg klikker? | Knappen står død, mens noget arbejder i baggrunden |
| **Overgangskvalitet** | Er skiftet mellem trin bevidst, eller hopper indholdet? | Indhold skifter uden overgang, eller overgangen er en generisk fade uden retning |
| **Kvittering** | Kan jeg se, at handlingen lykkedes eller fejlede - uden at gætte? | Ingen kvittering, eller en kvittering der forsvinder, før man kan nå at læse den |
| **Valideringstiming** | Kommer fejlen på det rigtige tidspunkt og det rigtige sted? | Fejl vises, mens man stadig skriver, eller først efter afsendelse, eller kun samlet øverst |

Skriv gennemgangen i første person og navngiv elementerne: "Jeg klikker på Send. Knappen ser ud, som før jeg klikkede. Efter to sekunder skifter hele siden, og jeg lander øverst uden at kunne se, om beskeden gik igennem." Den slags noter kan rettes. "Flowet føles klodset" kan ikke.

### 5.1 Velviljekontoen

Brugeren møder op med tålmodighed på kontoen. Hver forhindring hæver på den, hver imødekommelse sætter ind. `html-motor.md` afsnit 5 ejer, hvordan man **bygger** efter kontoen; her måler du, hvad der faktisk står på den.

Start på **70**. Bogfør hvert træk, mens du går flowet igennem.

| Hævninger | Vægt |
|---|---|
| Det, brugeren kom efter, er gemt: pris, kontaktoplysninger, fragt eller leveringstid | **-15** |
| Interstitial, splash, tvungen rundvisning eller overlay før første skærmfuld er læst | **-15** |
| Formatstraf: gyldigt input afvises, fordi det er skrevet på en anden måde (mellemrum i telefonnummer, store bogstaver i mail) | **-10** |
| Unødige felter: der spørges om oplysninger, som opgaven ikke kræver | **-10** |
| Sjusket udseende: skæve kanter, brudt layout, blandede skrifter, pladsholdertekst | **-10** |
| Et valg, der kræver, at brugeren tænker sig om, før hun tør klikke | **-5** pr. valg |

| Indsættelser | Vægt |
|---|---|
| Fejl, man kan komme sig over: teksten siger, hvad man gør nu, og det man skrev er bevaret | **+10** |
| Åbenhed om pris, omfang og begrænsninger, uden at man skal spørge | **+5** |
| Sparede trin: direkte link, fornuftigt forvalg, autoudfyldelse | **+5** pr. trin |
| Der undskyldes, når noget går galt på husets side | **+5** |

Bogfør som en løbende opgørelse, ikke som ét tal til sidst:

```
VELVILJEKONTO   start 70
  Forside            70 → 75   +5  prisinterval står i sektionen "Priser"
  Kontaktside        75 → 60  -15  telefonnummer kræver formularudfyldelse
  Formular           60 → 50  -10  CVR afvises, når det skrives med mellemrum
  Kvittering         50 → 55   +5  bekræftelse med sagsnummer og svartid
  SLUT: 55/100 - trænger til arbejde
```

Bånd: **under 30** er kritisk gæld i brugsoplevelsen, **30-60** trænger til arbejde, **over 60** er sundt.

Tallet er en vurdering, ikke en måling. Værdien ligger i de navngivne hævninger: hver af dem skal blive til et fund med sted, bevis og rettelse. Rapportér aldrig kontoen alene - den uden fundene er en karakter uden begrundelse.

---

## 6. Tjeklisten - 100 punkter

Svar pr. punkt. **Ja = 1 point. Nej = 0 point.** Punkter markeret **[RØD]** er dræbere: ét nej dér lægger loft over karakteren uanset scoren (se afsnit 7.2). Punkter markeret **[E/T]** gælder kun, hvis fladen har den type element. Er den ikke til stede, markerer du punktet **ikke relevant** - det tæller hverken som opnået eller tabt, og det trækkes ud af nævneren i scoren. Antallet af ikke-relevante punkter skal stå i rapportens hoved.

### A. Hierarki og fokus (7 point)

- **A1.** Kan du på under 2 sekunder pege på det ene element, øjet skal ramme først?
- **A2.** Er der reel størrelseskontrast mellem primær overskrift og brødtekst - mindst faktor 2,5 på desktop?
- **A3.** Er der præcis ét primært handlingselement i det synlige område ved indlæsning (ikke to lige tunge knapper)?
- **A4.** Skiller den primære knap sig visuelt ud fra sekundære (fyld mod ramme, ikke bare en anden farve)?
- **A5.** Er sektionsoverskrifter tydeligt underordnet sidens hovedoverskrift og tydeligt overordnet brødteksten?
- **A6.** Er der noget på fladen, der bevidst er nedtonet (mindre, lysere, mindre mættet), så noget andet kan træde frem?
- **A7.** Er rækkefølgen fra top til bund den rækkefølge, brugeren faktisk skal læse i - uden at øjet skal springe tilbage?

### B. Typografi (9 point)

- **B1.** Bruges der maks. 2 skriftfamilier på hele fladen (som profilen kræver)?
- **B2.** Er profilens skrifter faktisk indlæst - og ikke faldet tilbage til systemskrift? (Tjek beregnet `font-family` i udtrækket i afsnit 4, ikke CSS-kilden. Har profilen bevidst valgt en systemstak, er punktet ja.)
- **B3.** Er skriftstørrelserne hentet fra en defineret skala med reelle spring, ikke tilfældige tal som 17, 19 og 23 px?
- **B4.** Ligger brødtekstens målbredde inden for `designsystem.md`s krav (62-72 tegn, ingress ned til 50-58, over 90 tegn er altid en fejl)?
- **B5.** Ligger `line-height` på brødtekst inden for `designsystem.md`s krav (1,55-1,65)?
- **B6.** Er `line-height` på store overskrifter strammet til 1,0-1,2 (ikke arvet fra brødteksten)?
- **B7.** Har display-tekst over ca. 40 px negativ `letter-spacing` (typisk -0,01em til -0,03em)?
- **B8.** Bruges vægt aktivt som hierarki (fx 400 mod 700), i stedet for at alt ligger på 400-500?
- **B9.** Er mikrotypografien i orden - ingen forkerte orddelinger, intet enkeltord alene på sidste linje i en overskrift, og ingen overskrift brudt midt i en fast vending?

**Mikrotypografi, der tæller under B9:** danske anførselstegn frem for lige tommetegn, ægte ellipsetegn (`…`) frem for tre punktummer, `font-variant-numeric: tabular-nums` i talkolonner så cifrene flugter, ingen `letter-spacing` på løbende småtekst, og `text-wrap: balance` på flerlinjede overskrifter. Ét af disse er ikke ét fund hver - de samles i ét B9-fund med forekomsterne listet.

### C. Farve (9 point)

- **C1.** Følger fordelingen profilens 60-30-10, så accentfarven fylder tydeligt under 10 % af fladen?
- **C2.** Er samtlige farver i markup'et hentet fra CSS-variabler - nul løse hex-koder ude i komponenterne?
- **C3.** Har de neutrale toner kulør (varm eller kold), i stedet for at være rene gråtoner mellem `#000` og `#fff`?
- **C4.** Findes der mindst tre adskillelige overfladeniveauer (fx sidebaggrund, kortbaggrund, hævet element)?
- **C5.** Bærer farve betydning et sted (status, kategori, fare), og ikke kun dekoration?
- **C6.** Er accentfarven fri for at blive brugt på ikke-klikbare elementer, så farven fortsat betyder "handling"?
- **C7. [RØD]** Er `designsystem.md`s kontrastkrav opfyldt, målt mod den faktiske baggrund: brødtekst og al tekst under 24 px mindst 4,5:1, stor tekst mindst 3:1, og betydningsbærende kanter og fokusring mindst 3:1?
- **C8. [E/T]** Er den mørke variant gennemført - ikke en halv, hvor nogle sektioner glemmer at skifte?
- **C9.** Holder paletten sig under 12 unikke ikke-grå farver i udtrækket, og følger statusfarverne konventionen (grøn = gennemført, rød = fejl, gul eller ravgul = advarsel), så ingen af dem er brugt dekorativt?

**Til C8, når fladen har mørk visning:** overflader adskilles med lysere lag, ikke ved at invertere lysheden; brødtekst er brækket hvid, ikke ren hvid; accenten er dæmpet nogle procent i forhold til den lyse visning; og `color-scheme` er sat, så browserens egne kontroller følger med. Kontrasten i C7 skal måles i begge visninger.

### D. Rum og rytme (7 point)

- **D1.** Kommer alle afstande fra profilens spacing-skala - nul tal uden for skalaen?
- **D2.** Er den lodrette afstand mellem sektioner tydeligt større end afstanden inden i en sektion (mindst faktor 2)?
- **D3.** Sidder relaterede elementer tættere på hinanden end på urelaterede (nærhedsprincippet holder)?
- **D4.** Flugter alt indhold mod den samme venstrekant hele siden ned - navigation, hero, sektioner, footer?
- **D5.** Er der luft nok omkring det vigtigste element til, at det kan ånde, i stedet for at være pakket ind som alt andet?
- **D6.** Varierer den lodrette rytme mellem sektionstyper, i stedet for at hver sektion har nøjagtig samme `padding-block`?
- **D7.** Er der ingen dobbeltmargin eller uventet dobbelt afstand mellem to naboelementer?

### E. Dybde og overflade (6 point)

- **E1. [E/T]** Består skygger af mindst to lag (en tæt, mørk kontaktskygge plus en blød, spredt), i stedet for én generisk `0 4px 6px rgba(0,0,0,.1)`?
- **E2. [E/T]** Er skyggens retning konsistent på hele fladen (samme lyskilde, altid nedad)?
- **E3.** Findes der en radius-skala, hvor små elementer har mindre radius end store?
- **E4. [E/T]** Er indlejrede radier koncentriske efter `polering.md` §1: **indre radius = ydre radius - padding**, og `0` hvis resultatet bliver negativt? (Kort med 16 px radius og 12 px padding kræver 4 px på det indre element.) Implementeringen med `max()`-værn står i `polering.md` §1 - brug den, skriv ikke en ny.
- **E5.** Skabes dybde med mere end skygge - fx overlap, lagdeling, baggrundskontrast eller kant?
- **E6.** Er rammer og skillelinjer subtile nok til at strukturere uden at trække opmærksomhed (typisk 1 px i lav kontrast, ikke fuld sort)?

### F. Tilstande og interaktion (11 point)

- **F1.** Har alt klikbart en synlig hover-tilstand, der ændrer mere end musemarkøren?
- **F2. [RØD]** Har alt fokuserbart en tydelig fokusmarkering ved tastaturnavigation - mindst 2 px, med offset, og mindst 3:1 kontrast mod baggrunden?
- **F3.** Har knapper og links en active-tilstand, der giver fysisk feedback (nedtryk, mørkere fyld)?
- **F4. [E/T]** Har deaktiverede elementer en tilstand, der både ser deaktiveret ud og faktisk er `disabled` eller `aria-disabled`?
- **F5. [E/T]** Findes der en indlæsningstilstand på alt, der venter på noget (ikke en frossen knap), og har en eventuel skeletonvisning samme form som det indhold, der kommer?
- **F6. [E/T]** Findes der en tom tilstand med tekst, der forklarer, hvad brugeren skal gøre - ikke bare et tomt område?
- **F7. [E/T]** Findes der en fejltilstand på formularer, hvor fejlen står ved feltet, ikke kun i en samlet boks øverst, ikke kun signaleret med rød farve, og med en tekst der siger hvad brugeren skal gøre i stedet for kun hvad der gik galt?
- **F8.** Er alle klikflader mindst 44 x 44 px i faktisk hit area (padding tæller med, den visuelle størrelse behøver ikke ændres)?
- **F9.** Kan man se, hvad der er klikbart, uden at holde musen over det? (Form, placering, farve eller understregning skal bære det - på mobil findes hover ikke.)
- **F10. [E/T]** Har destruktive handlinger (slet, annullér, fjern) enten en bekræftelse eller en fortryd-mulighed?
- **F11.** Er hvert eneste beslutningspunkt et tankeløst klik?

**F11, auditten af tankeløse valg.** Gå hvert beslutningspunkt igennem - knap, link, menupunkt, dropdown, valg i en dialog - og spørg: kan brugeren se, hvad der sker, når hun klikker, uden at overveje det? Kræver valget en overvejelse ("er det den her, jeg skal bruge?", "hvad er forskellen på de to?"), er det et fund med **høj** alvor. To beslutningsregler afgør, hvordan du vægter det:

- **Klik tæller ikke, tænkning gør.** Tre indlysende klik er bedre end ét, man skal tænke over. Flag aldrig "det tager for mange klik", når hvert klik er selvindlysende; flag altid et enkelt klik, brugeren tøver ved.
- **Klarhed slår konsistens.** Gør en lille afvigelse fra systemet valget markant tydeligere, er afvigelsen rigtig. Flag den ikke som inkonsistens. Byggereglen bag står i `html-motor.md` afsnit 5; her er konsekvensen, at et konsistensfund aldrig må trumfe et klarhedsfund.

Minimumsopsætning, der lukker F1-F3 og F8, med tokens fra `designsystem.md` og `motion.md`:

```css
.btn {
  min-block-size: 44px;
  padding-inline: 20px;
  transition:
    background-color var(--tid-mikro) var(--ease-begge),
    transform var(--tid-hurtig) var(--ease-begge);
}
.btn:hover  { background-color: var(--accent-hover); }
.btn:active {
  transform: translateY(1px);
  transition-duration: var(--tid-mikro);
}
.btn:focus-visible {
  outline: 2px solid var(--focus-ring);
  outline-offset: 2px;
}
```

`--tid-mikro`, `--tid-hurtig` og `--ease-begge` defineres i `motion.md` afsnit 2. `--accent-hover` og `--focus-ring` defineres i `designsystem.md` afsnit 7 (i motorens navnesprog: `--farve-accent-hover` og `--farve-fokus`, se `html-motor.md` afsnit 3). Bruger fladen andre navne, er det navnene i dens eget tokenkatalog, der gælder - men de skal findes. En `var()` uden dækning er et rødt F2-fund, ikke en detalje.

### G. Komposition og layout (9 point)

- **G1.** Er der mindst ét bevidst brud på gridet (asymmetri, forskydning, overlap, element i fuld bredde), der gør fladen genkendelig?
- **G2.** Er kortkolonner IKKE bare `repeat(3, 1fr)` med identisk indhold i alle tre?
- **G3.** Har fladen en fokal komposition - noget stort og noget småt - i stedet for at alt ligger i mellemstørrelsen?
- **G4.** Er der maks. ét sted, hvor et layoutmønster gentages mere end tre gange i træk uden variation?
- **G5.** Findes der en tydelig sammenhæng mellem indholdstypen og layoutvalget (en tabel som tabel, en historie som tekstflow, en sammenligning side om side)?
- **G6. [E/T]** Er heroen fri for de klassiske slop-signaturer (centreret kolonne + gradient-blob + to lige tunge knapper)?
- **G7.** Er footeren behandlet som en del af designet, ikke som en efterladt liste af links?
- **G8.** Består fladen orienteringstesten nedenfor med **bestået**?
- **G9. [E/T]** Overholder fladen sin types hårde regler fra afsnit 2 - hero-budget og kant-til-kant på markedsføringsflader, zoneopdeling og rolig krom på brugsflader, ét job pr. sektion begge steder - og udløser den ingen af de hårde afvisninger i afsnit 2.4?

**Orienteringstesten.** Brugeren ankommer ofte midt i fladen fra en søgning eller et link, ikke fra forsiden. Dæk alt til undtagen navigationen og svar på seks spørgsmål:

1. Hvis site er det her?
2. Hvilken side står jeg på?
3. Hvad er hovedområderne?
4. Hvilke valg har jeg på netop dette niveau?
5. Hvor i strukturen befinder jeg mig?
6. Hvordan søger jeg?

| Antal klare svar | Resultat |
|---|---|
| Alle relevante | **Bestået** - G8 er ja |
| To eller ét uklart | **Delvist** - G8 er nej |
| Tre eller flere uklare | **Dumpet** - G8 er nej, og fundet får mindst **høj** alvor |

**Et dumpet resultat er altid et højt fund, uanset hvor poleret fladen ellers er.** En smuk side, man ikke kan finde rundt på, er en smuk blindgyde. Har fladen med rette ingen søgefunktion (et site på fem sider), markeres spørgsmål 6 ikke relevant og trækkes ud af nævneren - resten skal stadig besvares. Er navigationen en række ens links uden markering af det aktive punkt, er svaret på spørgsmål 2 nej. Har fladen mere end to niveauer, hører en sti eller en tilsvarende markering med.

### H. Motion (6 point)

- **H1. [RØD] [E/T]** Respekteres `prefers-reduced-motion: reduce` efter reglen i `motion.md` §4 - al ikke-essentiel bevægelse slået fra eller reduceret til opacity, blokken placeret sidst i CSS'en? (Kodeblokken står i `motion.md` §4. Kopiér den derfra, skriv ikke en ny.)
- **H2. [E/T]** Animeres kun `transform`, `opacity`, `filter` og `clip-path` - aldrig `width`, `height`, `top`, `margin` eller `font-size` - og er properties listet enkeltvis frem for `transition: all`?
- **H3. [E/T]** Er varighederne hentet fra `motion.md`s skala (`--tid-mikro` 90 / `--tid-hurtig` 150 / `--tid-basis` 240 / `--tid-rolig` 320 / `--tid-stor` 520 ms) og brugt til det, skalaen siger: farveskift på `--tid-mikro`, hover og fokus på `--tid-hurtig`, dropdown og accordion på `--tid-basis`, modal og sidetransition på `--tid-rolig`, og `--tid-stor` højst ét sted på hele fladen?
- **H4. [E/T]** Bruges easing-tokens fra `motion.md` (`--ease-ind` ved indgang, `--ease-ud` ved udgang, `--ease-begge` ved flytning), i stedet for `linear`, default `ease` eller en løs `cubic-bezier()` skrevet i komponenten?
- **H5. [E/T]** Findes der maks. 2 mindeværdige bevægelser på fladen - og kan du forklare, hvad hver af dem gør for brugeren?
- **H6. [E/T]** Er der ingen indholdstunge elementer, der starter usynlige og kræver JavaScript for at blive synlige (så siden er tom, hvis scriptet fejler)?

### I. Indhold og tekst (11 point)

- **I1.** Kunne overskriften IKKE stå på en konkurrents side uden ændring?
- **I2.** Er der nul pladsholdertekst tilbage (lorem ipsum, "Beskrivelse her", dummy-navne, `href="#"`)?
- **I3.** Matcher tonen den, der står i `voice-profil.md` - ikke generisk marketingsprog, ikke engelsk hvor resten er dansk?
- **I4.** Siger knaptekster, hvad der sker ("Book et møde"), i stedet for "Klik her" eller "Læs mere"?
- **I5.** Er tal, priser, datoer og enheder formateret dansk (1.250 kr., 14. marts, komma som decimaltegn)?
- **I6. [E/T]** Kommer alle ikoner fra ét sæt med samme stregtykkelse, optiske størrelse og hjørnebehandling - ingen blanding af to biblioteker, ingen emoji som ikon?
- **I7. [E/T]** Har hver flade højst ét bærende medie (foto, illustration eller diagram), i stedet for et billede pr. sektion, fordi der var plads?
- **I8. [E/T]** Er billeder og illustrationer fri for klichégrafik - håndtryk, puslespilsbrikker, generiske mødefotos, abstrakte netværkskugler, tilfældig stockfotografi der kunne stå på enhver side?
- **I9.** Kan brugeren finde det, hun kom efter (hvad I laver, hvad det koster, hvordan man kontakter jer), uden at lede, klikke tre gange eller udfylde en formular først?
- **I10.** Ligger andelen af happy talk under 20 % af de synlige ord?
- **I11.** Er fladen fri for forklarende instruktioner om, hvordan man bruger den?

**I10, sådan tæller du happy talk.** Tag ordtallet fra udtrækket i afsnit 4. Gå derefter hver tekstblok igennem og sæt ét af to mærker på den:

- **Nyttigt indhold:** noget brugeren er kommet efter, eller noget hun skal bruge for at handle. Ydelser, priser, vilkår, kontaktoplysninger, konkrete resultater, svar på et spørgsmål.
- **Happy talk:** velkomstafsnit, selvros, indledninger der varmer op til det egentlige, gentagelser af overskriften i brødtekstform, "hos os er ingen opgave for lille". Prøven er hård og simpel: kan du høre "bla bla bla", når du læser den højt, er det happy talk.

Rapportér altid tallet: **"Fladen har 640 synlige ord. 178 (28 %) er happy talk."** Over 20 % er et fund. Over 35 %, eller hvis fladens allerførste afsnit er happy talk, er fundet **højt** - det er den plads, det vigtigste skulle have haft. Rettelsen skrives som konkrete blokke, der skal ud, ikke som "stram teksten".

**I11, sådan finder du instruktioner.** Enhver synlig brugsanvisning på over én sætning ("Udfyld først felterne herunder, klik derefter på Gem, og vent på bekræftelsen") er et fund. Men fundet skrives to steder: **på teksten** og **på den interaktion, teksten dækker over.** Instruktionen er symptomet; interaktionen er sygdommen. Rettelsen er at gøre interaktionen selvforklarende og derefter slette teksten - ikke at gøre teksten kortere.

Til I6-I8: er der leveret aktiver til fladen, gælder kritiktjeklisten i billedprompt-materialet også - auditten dublerer den ikke, den tjekker at den er kørt.

### J. Tilgængelighed (7 point)

- **J1. [RØD]** Er dokumentstrukturen semantisk - én `h1`, korrekt overskriftsrækkefølge uden spring, `nav`, `main` og `footer` på plads?
- **J2.** Har alle billeder `alt` - beskrivende når de bærer information, tomt (`alt=""`) når de er dekoration?
- **J3.** Er tab-rækkefølgen logisk fra top til bund, uden at fokus forsvinder ud i intet?
- **J4. [E/T]** Er der et skip-link eller en anden vej forbi navigationen, når navigationen har mange punkter?
- **J5.** Har alle formularfelter en synlig, tilknyttet `label` (placeholder alene tæller ikke, og labelen skal stadig være synlig, når feltet er udfyldt)?
- **J6.** Er ingen information formidlet med farve alene (fejl, status og kategori har også tekst, ikon eller mønster), og er rød mod grøn aldrig eneste forskel?
- **J7. [E/T]** Fanges fokus korrekt i modaler og overlays, og returneres det til udløseren ved lukning?

### K. Responsivt (8 point)

- **K1. [RØD]** Er der nul vandret scroll ved 375 px?
- **K2.** Er der ingen overlappende eller afskårne elementer ved 375, 768 og 1440 px?
- **K3.** Skalerer typografien meningsfuldt ned (fx via `clamp()`), så en 64 px display ikke fylder tre linjer på mobil?
- **K4.** Er navigationen brugbar på mobil - ikke bare mindre, men reelt tilpasset?
- **K5.** Er der ingen tabel eller bred blok, der sprænger layoutet i stedet for at scrolle inde i sin egen container?
- **K6.** Holder rytmen mellem sektioner på mobil (afstandene skaleres ned, men den relative rytme bevares)?
- **K7.** Er zoom tilladt - ingen `user-scalable=no` og ingen `maximum-scale=1` i viewport-metaen?
- **K8.** Tager fladen højde for hak og hjemknap-indikator på telefoner, så intet indhold og ingen fast placeret knap lander under dem?

**K8, sikre zoner.** Vandret scroll fanges af K1, men en fast bundbjælke, en cookieknap eller en sticky handling kan stadig lande under telefonens hjemknap-indikator eller bag hakket i landskabsvisning. Definér de fire sikre afstande én gang og brug dem på alt, der er fastgjort til en kant:

```css
:root {
  --sikker-top:     env(safe-area-inset-top, 0px);
  --sikker-hoejre:  env(safe-area-inset-right, 0px);
  --sikker-bund:    env(safe-area-inset-bottom, 0px);
  --sikker-venstre: env(safe-area-inset-left, 0px);
}

.bundbjaelke {
  position: fixed;
  inset-inline: 0;
  inset-block-end: 0;
  padding-block-end: calc(var(--space-4) + var(--sikker-bund));
  padding-inline: calc(var(--gutter) + var(--sikker-venstre)) calc(var(--gutter) + var(--sikker-hoejre));
}
```

`--space-4` og `--gutter` defineres i `designsystem.md` afsnit 7. De fire `--sikker-*` defineres her og ejes af denne fil. Test i landskabsvisning på 375 px - det er dér, sidekanterne rammer. Har fladen intet fastgjort til en kant, er punktet ikke relevant.

### L. Performance og teknik (5 point)

- **L1.** Har alle billeder `width` og `height` (eller `aspect-ratio`), så der ikke opstår layoutspring under indlæsning?
- **L2.** Er hero-mediet prioriteret (`fetchpriority="high"`), og er alt under folden `loading="lazy"`?
- **L3.** Er der nul fejl i browserkonsollen ved indlæsning og ved de vigtigste interaktioner?
- **L4.** Er fladen selvstændig som lovet - ingen døde referencer til filer, skrifter eller scripts, der ikke findes?
- **L5.** Er medierne og skrifterne leveret rigtigt - billeder i WebP eller AVIF med fallback, skrifter med `font-display: swap`, forbindelsen til en ekstern skriftkilde åbnet på forhånd med `preconnect`, og den ene kritiske vægt forindlæst, så teksten ikke skifter udseende efter indlæsning?

**L5 i praksis.** Tre ting, der hver især koster synligt:

- **Format.** Et hero-foto i PNG eller ubeskåret JPG er typisk 3-8 gange for tungt. Levér WebP eller AVIF med `<picture>` og en JPG-fallback, og aldrig et kildebillede, der er markant større end den plads, det renderes i.
- **Forbindelse.** Hentes skrifterne fra en anden vært, koster opslag, TLS og forbindelse tid, før den første byte af skriften er på vej. `<link rel="preconnect">` til den vært er én linje. Ligger skrifterne selvhostet, er punktet allerede lukket - det er den bedste løsning.
- **Skriftskift.** `font-display: swap` sikrer, at teksten kan læses med det samme. Men skifter overskriften synligt udseende et sekund efter indlæsning, mangler `<link rel="preload">` på den ene vægt, overskriften bruger. Forindlæs én vægt, ikke fem.

**Måletal til L, når du har værktøjet:** største indholdsvisning (LCP) under **2,0 sekunder** for en webapp og under **1,5 sekunder** for en informationsside, og layoutforskydning (CLS) under **0,1**. Ligger LCP over målet, er det et L2- eller L5-fund med tallet som bevis; over 2,5 sekunder er fundet **højt**. Ligger CLS over 0,1, er det et L1-fund. Tallene er ikke selvstændige punkter - de er beviset under de punkter, de tilhører.

### M. Tværgående sammenhæng (5 point)

Kun relevant, når omfanget er mere end én flade. Er der auditeret én flade, markeres hele klyngen ikke relevant. Metoden er sammenligning: læg skærmbillederne af de auditerede flader ved siden af hinanden, og se på det samme element på tværs, ikke på hver flade for sig.

- **M1. [E/T]** Er navigationen den samme på alle flader - samme punkter, samme rækkefølge, samme placering, og markeres det aktive punkt på samme måde hver gang?
- **M2. [E/T]** Er footeren den samme, med samme indhold og samme afstand til indholdet ovenfor?
- **M3. [E/T]** Er de genbrugte komponenter faktisk genbrugt - er knappen, kortet, feltet og badgen ens fra flade til flade i størrelse, radius, vægt og tilstande?
- **M4. [E/T]** Holder containerbredden, venstrekanten og den lodrette sektionsrytme fra flade til flade?
- **M5. [E/T]** Er tonen den samme hele vejen - ikke en legende forside og en kontoragtig kontaktside?

**Sådan skriver du et M-fund.** En knap, der er stylet på tre måder på tre undersider, er **ét** fund med tre forekomster og med den rigtige variant udpeget: "Primærknap findes i tre varianter (forside 44 px/10 px radius, ydelser 38 px/6 px, kontakt 44 px/999 px). Forsidens variant er den korrekte efter `designsystem.md`; de to andre rettes til den." Et M-fund rammer næsten altid en global komponent og hører derfor i trin 2 i prioriteringen i afsnit 9.

**Sum: 100 point** ved en flade, hvor alt er relevant.

---

## 7. Scoring

### 7.1 Score som procent af det, der faktisk blev testet

Punkter markeret "ikke relevant" **tælles ikke med** - hverken som opnået eller tabt. Ellers ville en statisk enkeltside uden motion, skygger, formular, modal og deaktiverede elementer få over 20 point foræret uden at have gjort noget.

```
relevante point = 100 - antal ikke-relevante punkter
score i procent = opnåede point / relevante point x 100
```

Skriv altid begge tal i rapporten: `66/77 relevante = 86 %`, plus antallet af ikke-relevante punkter og hvilke.

| Score | Karakter | Betydning | Handling |
|---|---|---|---|
| 95-100 % | **A** | Særpræget og gennemført. Det ligner nogen bestemt. | Aflever |
| 88-94 % | **B** | Solidt håndværk med enkelte huller. | Ret de røde og de høje fund, aflever derefter |
| 78-87 % | **C** | Fungerer, men er glemt om ti sekunder. | Ret alt over lav prioritet, kør auditten igen |
| 65-77 % | **D** | Slop med pynt. Rettelser vil være lappearbejde. | Genopbyg komposition og typehierarki, ikke enkeltfix |
| 50-64 % | **E** | Skabelon. | Byg om fra designsystemet |
| Under 50 % | **F** | Retningen er ikke eksekveret. | Tilbage til `designprofil.md` og byg forfra |

**Dækningsgrænse.** Er færre end 55 punkter relevante, er grundlaget for tyndt til en karakter. Rapportér som "delvis audit, X af Y relevante punkter", og skriv hvad der ikke kunne testes. Ligger over en tredjedel af punkterne som ikke-relevante, skriv det som en note - så ved ejeren, at scoren dækker en smal flade.

### 7.2 Røde punkter lægger loft

Ét nej på et **[RØD]**-punkt betyder, at fladen **maksimalt kan få C**, uanset scoren. To eller flere røde nej: **maksimalt D**.

De røde punkter er C7 (kontrast), F2 (fokusmarkering), H1 (reduceret bevægelse), J1 (semantisk struktur) og K1 (vandret scroll på mobil). De er røde, fordi de ikke er smagsspørgsmål: de gør fladen ubrugelig for nogen, og for offentligt rettede løsninger er flere af dem lovkrav. Er H1 markeret ikke relevant, fordi fladen er helt uden bevægelse, tæller det ikke som et rødt nej.

En hård afvisning fra afsnit 2.4 lægger samme loft som et rødt nej. Den er ikke et punkt i tjeklisten, men den afgør, om fladen overhovedet er den rigtige flade.

### 7.3 Afleveringstærskel

Der afleveres, når **alle fire** er opfyldt:

1. Score **≥ 88 %** (karakter A eller B).
2. **Nul** røde nej og nul hårde afvisninger.
3. Velviljekontoen er **over 60**, hvis flows er gået igennem.
4. Fladen består **særpræg-testen**: mindst 4 af de 10 nedenfor er tydeligt til stede.

**Særpræg-testen (mindst 4 skal være ja):**

1. Skalakontrast: noget er markant større end alt andet.
2. Bevidst rytme: afstandene er ikke ens overalt.
3. Dybde eller lagdeling: overlap, forskudte flader, hævede elementer.
4. Typografi med karakter: en skrift, der er valgt, ikke arvet.
5. Farve med betydning: farven fortæller noget, den dekorerer ikke.
6. Designede tilstande: hover, fokus og active føles lavet, ikke arvet.
7. Grid-brud: mindst ét sted, hvor kompositionen bryder rammen med vilje.
8. Tekstur eller atmosfære: korn, mønster, gradient med retning, foto - hvis retningen bærer det.
9. Motion, der forklarer: bevægelsen viser en sammenhæng.
10. Data eller tal behandlet som design, ikke som en tabel, der blev tilovers.

Er scoren over tærsklen, men særpræg-testen giver 3 eller færre, er fladen **teknisk korrekt slop**. Den afleveres ikke. Den skal have et stærkere greb, ikke flere rettelser.

### 7.4 Hvornår bygges der om i stedet for at rettes

Ret, når fundene er lokale: en radius, en kontrast, en manglende tilstand.

**Byg om**, når mindst ét af disse gælder:

- Score under 78 %.
- Klynge A (hierarki) eller klynge G (komposition) scorer under halvdelen af sine relevante point.
- Mere end 6 af de 15 tells i afsnit 1 er til stede.
- Én eller flere hårde afvisninger fra afsnit 2.4 gælder.
- Orienteringstesten er dumpet.
- Rettelserne ville kræve, at du ændrer over halvdelen af markup'ets struktur.

Ombygning betyder: tilbage til `designprofil.md`, vælg greb, byg kompositionen igen. Det er hurtigere end at rette 30 symptomer på ét problem.

---

## 8. Evidenskrav pr. fund

**Et fund uden evidens er en mening. Drop det, eller skaf beviset.**

Hvert fund skal have fem felter. Mangler et felt, er fundet ikke færdigt.

| Felt | Krav |
|---|---|
| **Sted** | Konkret: side, sektion, element, og fil og linje hvis du har kilden. Ikke "flere steder på siden" |
| **Fejl** | Én sætning. Hvad er galt, ikke hvad du synes |
| **Bevis** | Måling, citat fra koden, eller hvad du så ved en konkret handling. Tal slår adjektiver |
| **Rettelse** | Den konkrete ændring. Værdi, ikke retning: "16 px, ikke 15" - ikke "lidt mere luft" |
| **Hvorfor** | Hvad rettelsen gør for brugeren eller for profilen. Én sætning |

Plus **alvor** (kritisk / høj / middel / lav) og **fix-status** (rettet og verificeret / rettet, ikke verificeret / afventer ejerens valg / ikke fixbar her).

### 8.1 Skærmbilledet er obligatorisk

**Hvert fund skal have mindst ét skærmbillede.** Ikke som pynt: uden billedet kan ejeren ikke se, hvad du taler om, og du kan ikke selv se, om rettelsen virkede.

- **Annotér billedet.** Ramme eller pil om det element, fundet handler om. Et fuldskærmsbillede uden markering peger ikke på noget.
- **Vis billederne inline til brugeren**, mens du rapporterer. Et skærmbillede, der kun ligger i en mappe, findes reelt ikke.
- **Interaktive fund kræver to billeder:** før handlingen og efter. "Ingen kvittering efter afsendelse" bevises kun af parret.
- **Hver rettelse kræver et før/efter-par.** Før-billedet tages, inden du ændrer noget - det kan ikke tages bagefter.
- **Ansvarlig navngivning:** `<fundnummer>-<punkt>-<foer|efter>.png`, fx `F03-C7-foer.png`. Så kan parret findes igen ved næste audit.
- Har du ikke browserværktøj og kan ikke tage billeder, skriver du det i rapportens hoved, og alle fund markeres "ikke bekræftet på skærm". Det er en gyldig, men svagere audit - sig det højt frem for at lade som ingenting.

### 8.2 Format

```
[F03] KRITISK  C7 kontrast
Sted:     Forside, hero-underrubrik, .hero p (index.html:48)
Fejl:     Underrubrikken har 2,9:1 mod baggrunden og er ulæselig for
          en del brugere.
Bevis:    Målt #8A8A8A på #F2F2F2 = 2,91:1. Kravet i designsystem.md
          er 4,5:1 for brødtekst. Skærmbillede: F03-C7-foer.png
Rettelse: Sæt farven til var(--text-muted) #5A5A5A = 5,2:1.
Hvorfor:  Under AA er teksten ikke læsbar for svagtseende, og fladen
          er ikke afleveringsklar, før den er over.
Status:   Rettet og verificeret (målt 5,21:1 efter ændring).
          Skærmbillede: F03-C7-efter.png
```

### 8.3 Krav til beviset pr. type fund

- **Farve og kontrast:** aflæst hex på både forgrund og baggrund plus beregnet ratio. Aflæs den *faktiske* baggrund, ikke den du tror ligger bagved.
- **Afstand og størrelse:** målt px-værdi og hvilket trin på skalaen det burde have været.
- **Typografi:** beregnet `font-family`, `font-size` og `line-height` fra udtrækket, ikke fra CSS-kilden (fallback kan være slået til, uden at du ser det).
- **Tilstande:** hvad du gjorde (hover, tab, klik) og hvad der skete - eller ikke skete.
- **Flow og velvilje:** hvilket trin i flowet, hvad du forsøgte, og hvad fladen svarede. Plus vægten fra afsnit 5.1.
- **Responsivt:** viewport-bredden og hvad der brød.
- **Motion:** hvilken property der animeres, og varigheden i ms.
- **Struktur:** citat af markup'et.
- **Tekstmængde:** ordtal, antal happy talk-ord og procenten, plus hvilke blokke der blev talt med.
- **Tværgående:** to eller flere skærmbilleder af det samme element på forskellige flader, med de målte forskelle.
- **Token uden dækning:** citat af den `var()`, der bruges, plus søgning i tokenblokken der viser, at navnet ikke findes.

### 8.4 Når du ikke kan bevise

Skriv det. "Formodning, ikke målt" er en gyldig markering, og fundet får automatisk maksimalt alvor **middel**. Du må aldrig opskrive et ubevist fund til kritisk.

---

## 9. Prioritering og rettelsesløkken

### 9.1 Rækkefølgen

Ret i denne rækkefølge. Reglen findes, fordi en flad fund-liste får folk til at rette det lette først, og det lette flytter mindst.

**Trin 1 - de røde og de hårde afvisninger.** C7, F2, H1, J1, K1 samt alt fra afsnit 2.4. Ingen forhandling, ingen udsættelse.

**Trin 2 - hierarkiet (A), kompositionen (G) og det tværgående (M).** De styrer, hvad alle andre fund er værd. Retter du en radius i et layout, der skal laves om, har du spildt arbejdet. Er der fund i både A/G/M og resten, så ret dem først og kør auditten igen - mange småfund forsvinder af sig selv, når kompositionen og komponenterne bliver rigtige.

**Trin 3 - typografi (B) og rum (D).** De fylder mest af fladen målt i areal og bærer størstedelen af indtrykket "gennemført" eller "hastværk".

**Trin 4 - tilstande (F) og tilgængelighed (J) ud over de røde,** plus de hævninger på velviljekontoen, der kan lukkes i koden.

**Trin 5 - farve (C), dybde (E), motion (H), indhold (I) og responsivt (K) ud over de røde.**

**Trin 6 - performance og teknik (L).**

**Vægtningsregel ved tvivl:** ret det fund, der er synligt for flest brugere på flest flader, før det fund, der kun ses ét sted. En fejl i en global komponent (knap, kort, navigation) slår altid en fejl på en enkelt side.

**Hurtige gevinster.** Udpeg altid de 3-5 fund med højest alvor, der hver kan lukkes på under en halv time, og skriv dem samlet øverst i rapporten. De er det, ejeren gør i dag, hvis han ikke gør andet.

### 9.2 Sådan rettes der

1. **Find kilden.** Søg efter klassenavnet, komponentnavnet eller tokenet. Rør kun de filer, fundet faktisk handler om.
2. **Mindste mulige rettelse.** Den mindste ændring, der lukker fundet. Ikke den pæneste omskrivning, ikke den mest generelle løsning.
3. **CSS før struktur.** Kan fundet lukkes i CSS, gøres det i CSS. En ændring i markup eller komponenttræ har større rækkevidde og er sværere at rulle tilbage, hvis den viser sig forkert. Struktur ændres kun, når fundet ikke kan lukkes uden.
4. **Ingen oprydning undervejs.** Refaktorér ikke koden omkring rettelsen, tilføj ikke funktioner, "forbedr" ikke noget, der ikke er et fund. Ser du noget, skriv det som et nyt fund i stedet.
5. **Er den rigtige tilstand ikke indlysende** - typisk ved hierarki, layout og rytme - så byg den rigtige version som et lille referenceklip først, og ret derefter kilden, indtil den matcher. Det gør forskellen synlig i stedet for teoretisk.
6. **Én commit pr. rettelse.** Aldrig samlede commits. Beskedformat: `style(design): F03 - hero subheading contrast to AA`.
7. **Verificér med den test, der fandt fejlen.** Målte du kontrast, måler du kontrast igen. Tag efter-billedet. Tjek konsollen for nye fejl.

### 9.3 Klassificér hver rettelse

| Status | Betyder |
|---|---|
| **Rettet og verificeret** | Testen er kørt igen, fundet er væk, ingen nye fejl i konsollen |
| **Rettet, ikke verificeret** | Ændringen er lavet, men kunne ikke bekræftes (kræver login, data eller en tilstand du ikke kan fremkalde). Sig hvorfor |
| **Rullet tilbage** | Rettelsen skabte en regression. Rul commit'en tilbage med det samme og markér fundet **udskudt** med noten om, hvad der gik galt |
| **Afventer ejerens valg** | Fundet rører retning, indhold, priser eller løfter. Fremlæg med anbefaling |
| **Ikke fixbar her** | Ligger uden for din adgang: tredjepartswidget, CMS-indhold, hosting |

**Ejerens beslutninger rettes ikke.** Du retter håndværket, ikke forretningen.

### 9.4 Stopregler

**Genkørsel.** Har du rettet 10 fund uden at genkøre auditten, så stop og kør den igen. Rettelser skaber nye fund, og en lang uverificeret rettelseskø er, hvordan en audit ender med at gøre fladen dårligere.

**Risikoregnskab.** Efter hver femte rettelse - og altid efter en tilbagerulning - regner du risikoen op:

```
RISIKO ved at fortsætte
  Start:                                  0 %
  Pr. tilbagerulning:                   +15 %
  Pr. rettelse der kun rører CSS:        +0 %
  Pr. komponent- eller markupfil rørt:    +5 %
  Efter rettelse nr. 10:                  +1 % pr. yderligere rettelse
  Rørt en fil uden relation til fundet:  +20 %
```

**Over 20 %: stop.** Vis, hvad der er rettet indtil nu, og spørg ejeren, om der skal fortsættes. **Hårdt loft: 30 rettelser** i én omgang, uanset hvor mange fund der er tilbage. Resten går i rapporten som udskudt. Grunden er praktisk: en lang rettelsesserie glider stille fra "lukker fund" til "omskriver fladen", og skiftet ses ikke indefra - tallet er der for at fange det udefra.

---

## 10. Hvad du IKKE skal flage

Auditten mister sin værdi i det sekund, den bliver støj. Følgende flages ikke.

**Smagsspørgsmål maskeret som fund**

- "Jeg ville have valgt en anden accentfarve." Profilen har valgt. Farven er ikke et fund, medmindre den fejler kontrast eller bruges uden system.
- "Retningen kunne have været mere moderne." Retningen er besluttet i `designprofil.md`. Auditten tjekker eksekvering, ikke valg.
- "Serif-overskrifter er lidt gammeldags." Ikke et fund.

**Valg, en ejerfil har truffet**

- En systemskrift, når `designprofil.md` bevidst har valgt den. Fundet er den ubesluttede default, ikke det bevidste valg.
- En varighed eller easing, der ligger i `motion.md`s skala, men uden for hvad du selv ville have valgt.
- Et kontrasttal, der opfylder `designsystem.md`, men ikke din personlige smag.

**Bevidste brud på reglerne**

- Et element, der bevidst bryder gridet, spacing-skalaen eller symmetrien for at skabe fokus, er ikke en fejl - det er punkt G1. Flag kun, hvis bruddet ikke virker: hvis det ligner en fejl frem for en beslutning.
- En sektion med markant anderledes rytme end de andre er variation, ikke inkonsistens, hvis den er gennemført.
- En afvigelse fra systemet, der gør et valg markant tydeligere. Klarhed slår konsistens, jf. F11.

**Krav der ikke gælder her**

- Manglende mørk variant, når profilen ikke kræver en.
- Manglende animation, når retningen er stram og statisk.
- Manglende ikoner. Ingen ikoner er et gyldigt valg.
- Manglende brødkrumme, søgefunktion eller andet, der hører til en anden slags produkt.
- Manglende komponenter i et designsystem, når opgaven var én flade.
- Hero-punkterne på en brugsflade uden hero. Markér dem ikke relevante.
- Klynge M på en enkelt flade.

**Teknik uden konsekvens**

- Klassenavne, formatering, indrykning, rækkefølge af CSS-erklæringer.
- CSS, der teoretisk kunne være kortere, når resultatet er identisk.
- Et par kilobytes ekstra i en selvstændig HTML-fil.
- `!important` i en isoleret, selvstændig artefakt.
- At et bibliotek kunne have været brugt i stedet for håndskrevet CSS.

**Ting der allerede er håndteret**

- Et fund, du selv rettede tidligere i samme audit. Læs hele fladen igennem, før du skriver fund.
- Noget, der er dokumenteret som en bevidst afvigelse i `designprofil.md` under antagelser eller do/don't.

**Dobbeltfund**

- Ét årsagsfund må kun rapporteres én gang. Et forkert `--radius`-token, der slår igennem 14 steder, er ét fund med 14 forekomster, ikke 14 fund. Skriv "14 forekomster" i sted-feltet. Det samme gælder på tværs af flader: samme komponentfejl på fem sider er ét M-fund.

**Skalaproblemer der ikke findes**

- "Dette skalerer ikke til 50 komponenter", når fladen er én landingsside.
- "Det her ville være svært at vedligeholde i et team", når kunden er en SMV uden designafdeling.

**Tommelfingerregel:** kan du ikke skrive rettelsen som en konkret værdi, og kan du ikke sige, hvad brugeren får ud af den, er det ikke et fund.

---

## 11. Rapportformat

Kort, tabelbaseret, og med tallene først. Ejeren skal kunne læse den på et minut.

```
DESIGN-AUDIT - [flade] - [dato]
Omfang:     Standard (6 flader) | Fladetype: Markedsføringsflade
Testet ved: 375 / 768 / 1440 px. [Levende side | kode]

SCORE: 66/77 relevante = 86 % = C   (loft: C, pga. 1 rødt nej)
Ikke relevant: 23 punkter (E1, E2, E4, F4-F7, F10, H1-H6, I6, I7,
               J4, J7, M1-M5)
Særpræg: 5/10 - består
Velvilje: 55/100 - trænger til arbejde
Røde nej: F2 (fokusmarkering)
Hårde afvisninger: ingen

Klynger (opnået / relevante):
  A 5/7   B 8/9   C 8/9   D 6/7   E 3/3   F 5/6   G 8/9
  H -/0   I 8/9   J 5/5   K 7/8   L 3/5   M -/0

FØRSTEHÅNDSINDTRYK
Fladen kommunikerer solidt håndværk, men uden ejer. Øjet rammer
logoet, derefter et stort billede, derefter først overskriften -
hierarkiet peger ikke på budskabet. Ét ord: pæn.

HURTIGE GEVINSTER (under 30 min. hver)
1. Fokusring på knapper og links (F01)
2. Ret hero-containerens venstrekant til --gutter (F02)
3. Slet velkomstafsnittet over ydelserne (F06)

TOP 3 - det der flytter mest
1. [F01] Ingen fokusmarkering på knapper og links (rød)
2. [F02] Hero og navigation flugter ikke - 24 px forskel
3. [F05] Tre ens kort uden hierarki i "Ydelser"

FUND
Nr    Alvor    Punkt  Sted                  Fejl (kort)                    Status
F01   KRITISK  F2     Globalt, alle knapper Ingen fokusring                Rettet+verificeret
F02   HØJ      D4     Hero mod nav          24 px kantforskel              Rettet+verificeret
F03   HØJ      A2     Hero h1               Kun 1,8x brødtekst             Rettet+verificeret
F04   MIDDEL   E3     Kort og knap          Samme radius overalt           Rettet
F05   MIDDEL   G2     Ydelser-sektion       repeat(3,1fr), intet hierarki  Afventer ejer
F06   HØJ      I10    Forside, indledning   28 % happy talk, 178 ord       Rettet+verificeret

RETTET OG VERIFICERET: 8
AFVENTER EJERENS VALG: 2 (F05 kortprioritering, F09 hero-billede)
IKKE FIXBART HER: 1 (F11 kræver adgang til CMS)
UDSKUDT EFTER TILBAGERULNING: 0

EFTER RETTELSER: 71/77 = 92 % = B, nul røde. Klar til aflevering.
```

### 11.1 Regler for rapporten

- Score **før** og **efter** rettelser, begge som brøk plus procent. Én score alene skjuler, om auditten flyttede noget.
- **Ikke-relevant-linjen er obligatorisk.** Uden den kan ejeren ikke se, hvad scoren dækker.
- Er scoren efter rettelser **lavere** end før, sig det højlydt og øverst: du har brudt noget.
- Fund, der afventer ejeren, skal have din anbefaling med. Ikke "hvad synes du?", men "jeg anbefaler X, fordi Y".
- Ingen ros-afsnit. Rapporten er en liste over det, der skal ske.
- Skærmbillederne vises inline, ikke kun som filnavne.
- Én linje til sidst, der kan klistres ind i en commit eller en besked til ejeren: `Audit fandt 11 fund, lukkede 8. Score 86 % → 92 %, karakter C → B.`

### 11.2 Baseline og regressionstilstand

Gem tallene maskinlæsbart efter hver audit. Uden en baseline kan næste audit kun sige, hvordan fladen er - ikke om den blev bedre.

```json
{
  "dato": "2026-08-14",
  "flade": "https://eksempel.dk",
  "omfang": "standard",
  "fladetype": "markedsfoering",
  "score": { "opnaaet": 66, "relevante": 77, "procent": 86, "karakter": "C" },
  "loft": "C",
  "roede_nej": ["F2"],
  "haarde_afvisninger": [],
  "saerpraeg": 5,
  "velvilje": 55,
  "klynger": {
    "A": [5, 7], "B": [8, 9], "C": [8, 9], "D": [6, 7], "E": [3, 3],
    "F": [5, 6], "G": [8, 9], "H": [0, 0], "I": [8, 9], "J": [5, 5],
    "K": [7, 8], "L": [3, 5], "M": [0, 0]
  },
  "ikke_relevante": ["E1", "E2", "E4", "F4", "F5", "F6", "F7", "F10",
                     "H1", "H2", "H3", "H4", "H5", "H6", "I6", "I7",
                     "J4", "J7", "M1", "M2", "M3", "M4", "M5"],
  "fund": [
    { "id": "F01", "punkt": "F2", "alvor": "kritisk", "titel": "Ingen fokusring", "status": "rettet_verificeret" },
    { "id": "F05", "punkt": "G2", "alvor": "middel", "titel": "Tre ens kort uden hierarki", "status": "afventer_ejer" }
  ]
}
```

Gem filen sammen med skærmbillederne, navngivet efter dato og flade. Kører du **regressionstilstand**, indlæses den forrige baseline efter den fulde audit, og rapporten får et ekstra afsnit:

```
REGRESSION MOD BASELINE 2026-05-02

Klynge   Før      Nu       Ændring
A        4/7      6/7      +2
B        8/9      8/9      0
G        5/9      8/9      +3
K        6/8      5/8      -1   ← forværret
Score    74 %     86 %     +12 procentpoint
Karakter D        C        +1 trin

LUKKET SIDEN SIDST (4): F2 fokusring, D4 venstrekant, A2 skalakontrast, I10 happy talk
STÅR STADIG ÅBNE (2):  G2 kortgitter, E3 radius-skala
NYE FUND (1):          K5 pristabel bryder ved 375 px - kom med den nye prissektion
```

En forværret klynge skrives med markering og forklares. Kommer et nyt fund i en klynge, der før var ren, er det som regel en regression fra sidste rettelsesrunde - undersøg det, før du bare noterer det.

---

## 12. Hurtig-audit (20 punkter)

Kun når der ikke er tid til de 100. Skal altid markeres som hurtig-audit i rapporten.

Alle fem røde: **C7, F2, H1, J1, K1**.

Plus de femten, der oftest afslører slop:

**A1** (ét tydeligt blikfang) · **A2** (størrelseskontrast ≥ 2,5x) · **B2** (rigtige skrifter indlæst) · **B4** (målbredde) · **C1** (accent under 10 %) · **D1** (spacing fra skala) · **D4** (fælles venstrekant) · **E3** (radius-skala) · **F1** (hover findes) · **F8** (44 px hit area) · **F11** (tankeløse valg) · **G6** (heroen er ikke standard-heroen) · **G8** (orienteringstesten) · **I2** (ingen pladsholdertekst) · **K2** (intet brud ved 375, 768 og 1440 px).

Kør altid udtrækket i afsnit 4 med - det tager to minutter og giver halvdelen af punkterne deres tal.

Score hurtig-auditten som **X/20** og omregn ikke til karakter. Skriv i stedet: "hurtig-audit, X/20, fuld audit ikke kørt", og hvilke klynger der ikke blev åbnet.

---

## 13. Selvaudit - de fejl du selv laver

Når du auditerer dit eget nybyggede design, er du partisk. Modvirk det:

1. **Kig på fladen som et billede.** Skru ned til 25 % zoom eller knib øjnene sammen. Kan du stadig se, hvad der er vigtigst? Kan du se en form, eller er det bare grå masse?
2. **Fjern al farve i hovedet.** Holder hierarkiet i gråtoner? Hvis ikke, bæres det af farve alene, og det er skrøbeligt.
3. **Erstat logoet med en konkurrents.** Ser noget forkert ud? Nej = slop.
4. **Tæl dine egne defaults.** Hvor mange værdier i din CSS er 8, 16, 0,5rem, `#fff`, `rgba(0,0,0,.1)` og `ease`? Jo flere, jo mere ubesluttet er fladen.
5. **Slå halvdelen af teksten fra i hovedet.** Bliver fladen skarpere, var teksten fyld. Kør I10 rigtigt, hvis svaret er ja.
6. **Gå dit eget hovedflow igennem** som en fremmed, der har travlt. Hvor tøver du selv? Det sted er et F11-fund.
7. **Find den ene ting, du er stolt af.** Kan du ikke pege på den, findes den ikke, og fladen består ikke særpræg-testen.
8. **Læs teksten højt.** Lyder den som virksomheden eller som en skabelon?

Og den hårde: **tog det dig under fem minutter at bygge sektionen, og traf du ikke ét eneste valg undervejs, er den slop.** Byg den om, før du auditerer den.
