# Motion-systemet

Denne fil afgør, om der overhovedet skal være bevægelse et givet sted, hvor
lang den er, hvilken kurve den følger, og hvordan den implementeres, så den ikke
hakker og ikke gør folk dårlige. `designprofil.md` bestemmer retning, typografi,
farver og spacing. Den bestemmer ikke timing. Det gør denne fil.

**Ejerskab og forrang.** Motion-tokens defineres kun her. Findes der tilsvarende
varigheds-, easing- eller forsinkelsestokens i andre referencer, slettes de dér.
Denne fil ejer også varighedsbåndene, som auditten måler op imod: 90-260 ms til
mikrointeraktioner, 250-520 ms til større overgange. Blokken for
`prefers-reduced-motion` i afsnit 4 er ligeledes originalen; andre filer henviser
til den i stedet for at gentage den.

**Afhængigheder.** Farvetokens (fx `--farve-fokus`, `--farve-flade-daempet`)
kommer fra token-blokken i `html-motor.md`. Struktur, markup og JavaScript-wiring
til komponenter som modal ejes også af `html-motor.md`. Denne fil beskriver kun
bevægelsen.

Udgangspunktet er ren CSS og maks. 15 linjer JavaScript pr. mønster. Ingen
animationsbiblioteker, ingen build-step, intet framework. Skal der bygges ind i
et eksisterende produkt, gælder afsnit 6 i stedet.

---

## 1. Beslutningstræ: skal der motion her?

**Udgangspunktet er nej.** Bevægelse er en omkostning: den koster tid for brugeren,
CPU på telefonen og opmærksomhed, som skulle være gået til indholdet. Den skal
tjene sig ind.

Kør hvert enkelt sted, du overvejer motion, gennem dette træ. Stop ved første nej.

```
1. Ændrer noget sig på skærmen uden at brugeren selv flyttede blikket dertil?
   NEJ  -> ingen motion. Statisk er rigtigt.
   JA   -> videre

2. Hvilken slags ændring er det?
   a) Feedback på noget brugeren lige gjorde (klik, fokus, indsendelse)  -> JA, motion
   b) Noget kommer ind eller ud (modal, toast, dropdown, panel)          -> JA, motion
   c) Noget flytter sig, men er stadig det samme objekt (sortering,
      åbn/luk, sidetransition)                                           -> JA, motion
   d) Systemet arbejder og brugeren venter (loading, upload)             -> JA, motion
   e) Ingen af delene: det ser bare sjovt ud                             -> NEJ

3. Kan brugeren nå at opfatte den? Under 80 ms opfattes ikke som bevægelse,
   kun som et hop. Over 500 ms i almindelig UI opfattes som langsomt software.
   Kan bevægelsen ikke ligge i 90-400 ms og stadig give mening -> drop den.

4. Sker det mere end 3 gange på samme skærm i samme session?
   JA -> skær varigheden til den korteste værdi i tabellen, eller fjern den.
   Bevægelse, man ser 30 gange om dagen, skal være næsten usynlig.

5. Er der allerede motion inden for 200 px og 300 ms af dette?
   JA -> vælg ét af dem. To samtidige bevægelser konkurrerer og ingen af dem læses.

6. Er der plads i budgettet i afsnit 7? Tæl, hvor mange elementer der allerede
   animerer samtidigt i samme viewport.
   NEJ -> animér containeren i stedet for børnene, eller drop denne.
```

### Motion skal svare på ét af fire spørgsmål

| Spørgsmål | Hvad motion gør | Eksempel |
|---|---|---|
| Hvor kom det fra? | Retning | Panelet glider ind fra højre, så man ved, hvor det bor |
| Hvad hører sammen? | Sammenhæng | Rækken folder sig ud fra den knap, man trykkede på |
| Virkede mit klik? | Feedback | Knappen synker 1 px og retter sig op igen |
| Arbejder systemet? | Status | Skeleton pulserer, mens data hentes |

Kan du ikke sætte din animation i én af de fire kasser, er den dekoration. Slet den.

### Responsivitet slår blødhed

En animation må aldrig forsinke brugerens næste handling. Kan knappen ikke trykkes
igen, mens udgangsanimationen kører, eller venter et menupunkt på, at en fade er
færdig, er animationen forkert - også selvom den kører i 60 billeder i sekundet.
Test det: klik to gange hurtigt efter hinanden alle steder med motion.

### Automatisk nej

Disse skal aldrig findes, uanset hvor godt det ser ud i et enkeltstående eksempel:

- Tekst, der animerer bogstav for bogstav, i andet end ét enkelt hero-moment.
- Tal, der tæller op, medmindre tallet er selve pointen på siden.
- Parallax på brødtekst eller på noget, man skal læse mens det bevæger sig.
- Hover-effekter, der flytter elementet ud af sin plads og får naboer til at rykke.
- Karruseller, der kører af sig selv uden pauseknap (bryder WCAG 2.2.2).
- Noget der blinker mere end 3 gange i sekundet (bryder WCAG 2.3.1, epilepsirisiko).
- Loading-animation på noget, der er færdigt på under 200 ms. Den gør ventetiden
  længere, ikke kortere.
- Uendelige animationer, der ikke fortæller om en tilstand. En puls, mens der
  hentes data, er i orden. En logo-loop, der bare kører, er det ikke.

---

## 2. Motion-tokens

Læg dem i `:root` sammen med resten af dine variabler. Alle varigheder herunder
er de faktiske tal, ikke forslag. Navnemønsteret er `--kategori-rolle`, samme som
i resten af pakken.

```css
:root {
  /* Varigheder */
  --tid-mikro:   90ms;   /* farveskift, ikon-swap, understregning */
  --tid-hurtig:  150ms;  /* hover, fokusring, tooltip, checkbox */
  --tid-basis:   240ms;  /* dropdown, accordion, kort der folder ud */
  --tid-rolig:   320ms;  /* modal, drawer, toast, sidetransition */
  --tid-fjeder:  420ms;  /* KUN sammen med en fjederkurve, se nedenfor */
  --tid-stor:    520ms;  /* ét hero-moment pr. side, intet andet */

  /* Easing */
  --ease-ind:    cubic-bezier(0.00, 0.00, 0.20, 1.00); /* kommer ind: bremser op */
  --ease-ud:     cubic-bezier(0.40, 0.00, 1.00, 1.00); /* går ud: sætter i gang */
  --ease-begge:  cubic-bezier(0.40, 0.00, 0.20, 1.00); /* flytter sig, bliver */
  --ease-skarp:  cubic-bezier(0.20, 0.00, 0.00, 1.00); /* præcis, teknisk */
  --ease-blod:   cubic-bezier(0.34, 1.30, 0.64, 1.00); /* let overshoot, se regel */

  /* Forsinkelser */
  --forsinkelse-stagger: 55ms;   /* mellem elementer i en liste */
  --forsinkelse-svar:    0ms;    /* feedback på klik: ALTID nul */
  --forsinkelse-tooltip: 400ms;  /* før tooltip vises ved hover */
  --forsinkelse-toast:   4000ms; /* før toast forsvinder af sig selv */

  /* Afstande: bevægelse skal være kort */
  --flyt-lille:  4px;   /* feedback, hover-løft */
  --flyt-mellem: 12px;  /* indgang af element */
  --flyt-stor:   24px;  /* panel, modal */
}
```

### Hvilken varighed hører til hvad

| Token | Bruges til | Bruges aldrig til |
|---|---|---|
| `--tid-mikro` 90ms | baggrundsfarve, tekstfarve, kantfarve, opacity på ikon | noget der flytter sig over mere end 4 px |
| `--tid-hurtig` 150ms | hover-løft, fokusring, checkbox/toggle, tooltip ind | modal, sidetransition |
| `--tid-basis` 240ms | dropdown, accordion, tab-skift, filterresultater | knapfeedback (for langsomt) |
| `--tid-rolig` 320ms | modal ind, drawer, toast, sidetransition | hover (klodset) |
| `--tid-fjeder` 420ms | bekræftende småbevægelser med fjederkurve | alt med en almindelig cubic-bezier |
| `--tid-stor` 520ms | ét moment pr. side: hero-afsløring eller den ene signaturbevægelse | alt der gentages |

De to yderpunkter er bevidste. 90 ms er rigtigt til rene farveskift, hvor intet
flytter sig, og 520 ms er kun tilladt ét sted pr. side. Godkendte bånd er derfor
90-260 ms for mikrointeraktioner og 250-520 ms for større overgange.

**Ud er hurtigere end ind.** Når noget forsvinder, skal brugeren ikke vente på
det. Regn med 70-80 % af ind-varigheden: modal ind 320 ms, modal ud 240 ms.

### Easing-regler

- **Kommer ind på skærmen:** `--ease-ind`. Starter hurtigt, bremser op. Føles som
  noget, der lander.
- **Forlader skærmen:** `--ease-ud`. Starter roligt, accelererer væk. Føles som
  noget, der er væk, før det er færdigt.
- **Flytter sig og bliver:** `--ease-begge`.
- **`linear` er kun til:** spinners, progressbarer, scroll-drevne animationer og
  rene opacity-crossfades. Alt andet med `linear` føles mekanisk.
- **`--ease-blod` (overshoot):** højst ét sted i hele fladen, og kun på noget under
  40 px, der bekræfter en handling (fx et flueben eller et hjerte). Overshoot på
  et helt panel ser billigt ud.
- **`ease`, `ease-in-out` og `ease-out` som nøgleord:** brug dem ikke. Browserens
  standard er en generisk kurve, og hele pointen med tokens er, at bevægelsen
  ligner jeres.
- **`transition: all`:** aldrig. Navngiv de egenskaber, der skal animere. `all`
  animerer også det, du ikke havde tænkt på, og det er typisk en layout-egenskab.

### Fjederkurver i ren CSS

En cubic-bezier har fire kontrolpunkter og kan derfor kun svinge over målet én
gang. En rigtig fjeder svinger flere gange med aftagende udsving, og det er dét,
der får en bevægelse til at føles fysisk i stedet for tegnet. `linear()` med mange
knæk gengiver fjederkurven punkt for punkt, uden bibliotek og uden JavaScript.

Læg disse to i `:root` sammen med resten af easing-tokens. To er nok. Flere
fjedre i samme flade opløser fornemmelsen af, at bevægelsen kommer fra ét system.

```css
:root {
  /* Kvik fjeder: cirka 6 % oversving, falder hurtigt til ro.
     Til knapper, chips, toggles, badges. */
  --ease-fjeder-kvik: linear(
    0, 0.121 3.2%, 0.457 8.5%, 0.834 14.6%, 1.019 19.2%,
    1.061 23.4%, 1.037 30.1%, 0.996 42.3%, 1.002 55.8%, 1
  );

  /* Rolig fjeder: cirka 9 % oversving, to synlige udsving.
     Til kort, popovers, paneler under 320 px. */
  --ease-fjeder-rolig: linear(
    0, 0.063 3.4%, 0.242 7.1%, 0.681 14.2%, 0.913 18.7%,
    1.045 23.8%, 1.088 28.9%, 1.060 36.5%, 0.990 48.6%,
    1.005 62.1%, 1
  );
}
```

Brug dem sådan her. Fallback-linjen står først, så browsere uden `linear()`
kasserer den ugyldige anden linje og beholder den gyldige første. Uden den linje
falder browseren tilbage til nøgleordet `ease`, og så ligner bevægelsen ingenting
i systemet.

```css
.chip {
  transition: transform var(--tid-basis) var(--ease-begge);
  transition: transform var(--tid-fjeder) var(--ease-fjeder-kvik);
}
```

Regler for fjedre:

- **Kun på `transform`.** En fjeder på `opacity` giver en synlig blinken, fordi
  værdien går over 1 og bliver klippet. En fjeder på en farve giver et fejlagtigt
  farveudsving.
- **Kun sammen med `--tid-fjeder`.** En fjederkurve på 150 ms når ikke at svinge
  og ser bare ud som et hak. En fjederkurve på 520 ms ser slap ud.
- **Kun på elementer under cirka 320 px.** Jo større flade, jo mere ser
  oversvinget ud som en fejl i layoutet.
- **Aldrig på noget, der lige er blevet indsat i layoutet ved siden af andet
  indhold.** Oversvinget kan få elementet til at overlappe naboen i et par
  frames.
- **Én fjeder pr. komponentfamilie.** Alle knapper deler kurve, alle kort deler
  kurve. Blandes de, føles fladen som to produkter.
- `--ease-blod` og fjederkurverne er alternativer til hinanden, ikke supplementer.
  Vælg fjeder, hvis fladens signatur er fysisk og legende; vælg `--ease-blod`,
  hvis du kun skal bruge ét enkelt bekræftende nik.

---

## 3. Hvad må animeres

| Egenskab | Må animeres | Hvorfor |
|---|---|---|
| `transform` (translate, scale, rotate) | JA | Kører på compositoren, rører hverken layout eller maling |
| `opacity` | JA | Samme, ren compositor-egenskab |
| `clip-path` | JA, med måde | Males om, men billigt på små flader. Ikke på fuldskærm |
| `filter: blur()` | Kun i korte, små doser | Dyr maling. Aldrig over 8 px blur, aldrig på fuldskærmselement |
| `grid-template-rows` (`0fr` -> `1fr`) | JA, til udfoldning | Udløser layout i det foldede element, men er den eneste korrekte vej til ukendt højde. Se 5.7 |
| `background-color`, `color`, `border-color` | JA | Kun maling, ikke layout. Hold varigheden på `--tid-mikro` |
| `box-shadow` | Undgå at animere direkte | Males om hver frame. Brug i stedet et pseudoelement med skygge og animér dets `opacity` |
| `width`, `height` | **ALDRIG** | Udløser layout på hele siden hver eneste frame |
| `max-height` | Kun med målt værdi, som nødløsning | Se 5.7. Aldrig med et gættet stort tal |
| `top`, `left`, `right`, `bottom` | **ALDRIG** | Samme: layout hver frame. Brug `translate` |
| `margin`, `padding` | **ALDRIG** | Samme: skubber alt omkring sig og genberegner layout |
| `font-size`, `line-height`, `letter-spacing` | **ALDRIG** | Tvinger tekstombrydning hver frame. Det er det dyreste, man kan gøre |
| `border-width` | **ALDRIG** | Ændrer elementets størrelse, altså layout. Brug `outline` eller et skyggelag |

Ved 60 billeder i sekundet har browseren 16,7 ms pr. frame. `transform` og
`opacity` kan klares på GPU'en; layout-egenskaberne tvinger en genberegning af
hele siden inden for de 16,7 ms, og det er præcis dér, hakket kommer fra.

**Erstatningstabel:**

| Vil du | Gør ikke | Gør i stedet |
|---|---|---|
| Fold et panel ud | `height: 0 -> auto` | `grid-template-rows: 0fr -> 1fr` (se mønster 5.7) |
| Flyt et element | `left: 0 -> 40px` | `transform: translateX(40px)` |
| Gør en knap større ved hover | `padding` eller `font-size` | `transform: scale(1.03)` |
| Lav en tykkere kant ved fokus | `border-width` | `outline` med `outline-offset`, eller `box-shadow: 0 0 0 3px` |
| Løft et kort med skygge | animér `box-shadow` | pseudoelement med skyggen, animér `opacity` |
| Vis fremdrift under scroll | scroll-lytter der sætter `width` | `animation-timeline` på `transform: scaleX()` (se 5.9) |

---

## 4. prefers-reduced-motion er en hård regel

Cirka en ud af tyve har en vestibulær lidelse, hvor storskala-bevægelse udløser
kvalme og svimmelhed. Indstillingen findes i både iOS, Android, macOS og Windows,
og den er brugerens eksplicitte besked om, at bevægelse gør dem dårlige. Den
ignoreres aldrig, heller ikke fordi animationen er pæn.

### Sådan implementeres den, så den faktisk virker

Læg dette blok **sidst** i din CSS, efter alt andet. Dette er originalen; andre
referencer i pakken henviser hertil i stedet for at gentage den.

```css
@media (prefers-reduced-motion: reduce) {
  *,
  *::before,
  *::after {
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
    scroll-behavior: auto !important;
  }
}
```

**Hvorfor 0,01 ms og ikke `animation: none`?** Fordi `none` dræber
`animationend`- og `transitionend`-hændelser. Kode, der venter på dem for at
fjerne en modal fra DOM'en, hænger så for evigt, og brugeren står med en side,
der ikke kan lukkes. Med 0,01 ms fyrer hændelsen stadig, bare med det samme.
Slutresultatet er identisk på skærmen.

**Hvad blokket ikke rammer.** `*` matcher ikke pseudoelementerne fra View
Transitions og heller ikke scroll-drevne tidslinjer. De skal have deres egne
blokke, og de står i 5.5 og 5.9. Det er den hyppigste måde at tro, man er dækket,
uden at være det.

### Hvad skal der så ske i stedet for bevægelsen

Reduceret motion betyder ikke ingen feedback. Det betyder ingen **bevægelse**.
Erstat med det, der ikke flytter noget. Fallbacken må gerne være en ren
opacity-fade, men den skal ligge på højst 200 ms, og den må ikke rykke layoutet.

| Normal motion | Ved reduceret motion |
|---|---|
| Element glider ind fra siden | Ren opacity-crossfade, 90 ms, ingen flytning |
| Modal skalerer op fra 0,98 | Modalen er der bare, med en kort fade på baggrundsoverlayet |
| Toast glider ind nedefra | Toast fader ind på plads |
| Hover-løft med translateY | Baggrundsfarve eller kantfarve skifter |
| Stagger på liste | Hele listen vises samtidigt |
| Sidetransition | Ingen transition, direkte skift |
| Fjederkurve på knap | Almindeligt farveskift, ingen transform |
| Scroll-drevet fremdrift | Statisk visning af sluttilstanden |
| Blød scroll (`scroll-behavior: smooth`) | `auto`, altså hop direkte |

Vil du bevare en fade i stedet for at nulstille alt, så skriv den eksplicit
efter det globale blok:

```css
@media (prefers-reduced-motion: reduce) {
  .afsloer {
    transform: none !important;
    transition: opacity 90ms linear !important;
  }
}
```

### Aldrig med JavaScript alene

Test aldrig kun `window.matchMedia('(prefers-reduced-motion: reduce)')` i JS og
tro, at du er dækket. Skriv altid CSS-blokket. JS-testen er kun til at slå
kanvas-animationer og videoafspilning fra, altså det CSS ikke kan nå.

---

## 5. Færdige mønstre

Kopiér direkte. Alle bruger tokens fra afsnit 2.

### 5.0 Starttilstande, der overlever at JavaScript udebliver

Alle mønstre herunder bygger på den samme regel, og den er vigtigere end nogen
enkelt animation:

> **Starttilstanden i CSS skal være identisk med den tilstand, serveren
> udleverer.** Indhold, der sendes synligt fra serveren, må aldrig stå med
> `opacity: 0` i stylesheetet i håb om, at JavaScript senere retter op på det.

Bryder man reglen, får man en af tre fejl, og de rammer alle rigtige brugere:

| Situation | Hvad brugeren oplever |
|---|---|
| JavaScript når aldrig frem (netværksfejl, blokeret script, gammel browser) | Siden er permanent tom. Indholdet ligger i DOM'en, men er usynligt |
| JavaScript kommer sent på en langsom forbindelse | Brugeren stirrer på et tomt felt i flere sekunder, før noget dukker op |
| Serveren sender synligt, klienten hydrerer med skjult | Indholdet blinker: synligt, væk, synligt igen |

**Løsningen er tilvalg i stedet for fravalg.** Standardtilstanden er synlig og
korrekt. Først når JavaScript beviser, at det kører, bevæbnes den skjulte
starttilstand:

```css
/* Standard: synlig. Rigtigt uden JavaScript, rigtigt uden CSS-animationer. */
.afsloer { opacity: 1; transform: none; }

/* Kun når JS har meldt sig, må noget være skjult. */
.js-motion .afsloer:not(.er-vist) {
  opacity: 0;
  transform: translateY(var(--flyt-mellem));
}
```

Klassen sættes af en enkelt linje, der skal ligge i `<head>` **før** stylesheetet
indlæses. Ligger den senere, når browseren at male den synlige tilstand først, og
så blinker indholdet væk igen.

```html
<head>
  <script>document.documentElement.classList.add('js-motion');</script>
  <link rel="stylesheet" href="/style.css">
</head>
```

Tre følgeregler:

- **Ingen `defer` eller `async` på den linje.** Den skal køre synkront, inden
  første maling.
- **Er scriptet blokeret af en CSP, skal `.js-motion` ikke sættes fra en ekstern
  fil i stedet.** Så er den korrekte adfærd, at intet skjules. Tilføj scriptets
  hash til CSP'en, eller drop afsløringsmønsteret på den flade.
- **Elementer over folden bevæbnes aldrig.** De skal være der ved første maling,
  punktum. Afsløring hører til det, man scroller ned til.

Samme regel gælder i et framework: den værdi, komponenten starter med på
klienten, skal være den værdi, serveren allerede har renderet. Indgangsanimationen
udskydes til efter montering. Se afsnit 6.

### 5.1 Indgang og afsløring ved scroll

Bygger direkte på 5.0. Den skjulte tilstand findes kun bag `.js-motion`.

```css
.afsloer {
  transition:
    opacity var(--tid-basis) var(--ease-ind),
    transform var(--tid-basis) var(--ease-ind);
}
.js-motion .afsloer:not(.er-vist) {
  opacity: 0;
  transform: translateY(var(--flyt-mellem));
}
```

```html
<script>
const io = new IntersectionObserver((poster) => {
  for (const post of poster) {
    if (!post.isIntersecting) continue;
    post.target.classList.add('er-vist');
    io.unobserve(post.target);            // kør én gang, aldrig frem og tilbage
  }
}, { rootMargin: '0px 0px -12% 0px', threshold: 0.1 });
document.querySelectorAll('.afsloer').forEach(el => io.observe(el));
</script>
```

Regler: afslør én gang, aldrig igen når man scroller tilbage op. Brug det ikke på
elementer over folden, de skal bare være der. Brug det ikke på hver eneste sektion,
kun der hvor der reelt kommer noget nyt. Fjern altid observeren for et element,
der er afsløret eller taget ud af DOM'en, så der ikke ligger lyttere tilbage.

### 5.2 Stagger over en liste

Samme vagt som 5.0: uden JavaScript, og før listen er markeret synlig, står
elementerne der helt almindeligt. Animationen forstærker kun.

```css
/* Standardtilstand: listen er synlig. Ingen animation, ingen skjult starttilstand. */

.js-motion .liste.er-vist > * {
  animation: traed-ind var(--tid-basis) var(--ease-ind) both;
  animation-delay: calc(var(--i) * var(--forsinkelse-stagger));
}

@keyframes traed-ind {
  from { opacity: 0; transform: translateY(var(--flyt-mellem)); }
  to   { opacity: 1; transform: none; }
}
```

```html
<ul class="liste">
  <li style="--i:0">...</li>
  <li style="--i:1">...</li>
  <li style="--i:2">...</li>
</ul>
```

`.er-vist` sættes på selve `<ul>`-elementet af den samme IntersectionObserver som
i 5.1. Skal listen animere med det samme ved sideindlæsning, sættes klassen bare
i det samme inline-script, der sætter `.js-motion`.

#### Sådan regnes forsinkelsen ud

Der er tre tal i spil, og de hænger sammen:

```
trin        = forsinkelse mellem to naboer            (--forsinkelse-stagger)
sidste start = (antal synlige trin - 1) x trin
samlet tid   = sidste start + varighed pr. element    (--tid-basis)
```

**De to lofter, der ikke må brydes:**

1. **Maks. 8 trin.** Element nummer 9 og fremefter får samme forsinkelse som
   nummer 8 og kommer altså sammen med det.
2. **Maks. 400 ms samlet forsinkelse**, altså `sidste start` <= 400 ms. Med
   varigheden oveni lander hele listen inden for cirka 640 ms, og det er grænsen
   for, hvad der stadig føles som én bevægelse frem for en kø.

Har du flere elementer, end de to lofter tillader, skæres trinnet ned i stedet for
at fjerne elementer:

```
trin = mindste værdi af (55 ms) og (400 ms / (antal trin - 1))
```

| Antal elementer | Antal trin der stagges | Trin | Sidste start | Samlet med 240 ms |
|---|---|---|---|---|
| 3 | 3 | 55 ms | 110 ms | 350 ms |
| 5 | 5 | 55 ms | 220 ms | 460 ms |
| 8 | 8 | 55 ms | 385 ms | 625 ms |
| 12 | 8 | 55 ms | 385 ms | 625 ms (resten følger med nr. 8) |
| 20 | 8 | 55 ms | 385 ms | 625 ms (resten følger med nr. 8) |

Under 40 ms trin læses bevægelsen som ét samlet ryk og er spildt. Over 80 ms
læses den som en kø, brugeren venter i. Bliv i 40-80 ms; 55 ms er standarden.

Uden inline-indeks, ren CSS med loftet indbygget:

```css
.js-motion .liste.er-vist > *:nth-child(1) { animation-delay: 0ms; }
.js-motion .liste.er-vist > *:nth-child(2) { animation-delay: 55ms; }
.js-motion .liste.er-vist > *:nth-child(3) { animation-delay: 110ms; }
.js-motion .liste.er-vist > *:nth-child(4) { animation-delay: 165ms; }
.js-motion .liste.er-vist > *:nth-child(5) { animation-delay: 220ms; }
.js-motion .liste.er-vist > *:nth-child(6) { animation-delay: 275ms; }
.js-motion .liste.er-vist > *:nth-child(7) { animation-delay: 330ms; }
.js-motion .liste.er-vist > *:nth-child(n+8) { animation-delay: 385ms; }
```

Bruger du inline-indekset i stedet, indbygges loftet i beregningen:

```css
.js-motion .liste.er-vist > * {
  animation-delay: calc(min(var(--i), 7) * var(--forsinkelse-stagger));
}
```

Stagger bruges kun ved første visning af en liste, aldrig ved filtrering,
sortering eller paginering, hvor brugeren venter på et svar. Der skal resultatet
bare stå der.

### 5.3 Modal: transitionen

Struktur, markup, fokusstyring, Esc-lukning og scroll-lås ejes af
`html-motor.md`. Herunder er kun bevægelsen, lagt oven på den `<dialog>`, den fil
definerer. `@starting-style` og `allow-discrete` gør, at både ind og ud animerer
uden JavaScript-timere.

```css
dialog.modal {
  opacity: 0;
  transform: translateY(var(--flyt-stor)) scale(0.98);
  transition:
    opacity var(--tid-rolig) var(--ease-ind),
    transform var(--tid-rolig) var(--ease-ind),
    overlay var(--tid-rolig) allow-discrete,
    display var(--tid-rolig) allow-discrete;
}

dialog.modal[open] {
  opacity: 1;
  transform: none;
}

/* Starttilstanden i det øjeblik den vises */
@starting-style {
  dialog.modal[open] {
    opacity: 0;
    transform: translateY(var(--flyt-stor)) scale(0.98);
  }
}

/* Ud skal være hurtigere end ind */
dialog.modal:not([open]) {
  transition-duration: var(--tid-basis);
  transition-timing-function: var(--ease-ud);
}

dialog.modal::backdrop {
  background: rgb(0 0 0 / 0.45);
  opacity: 0;
  transition: opacity var(--tid-rolig) var(--ease-ind),
              overlay var(--tid-rolig) allow-discrete,
              display var(--tid-rolig) allow-discrete;
}
dialog.modal[open]::backdrop { opacity: 1; }
@starting-style { dialog.modal[open]::backdrop { opacity: 0; } }
```

Bevægelsesregler: modalen kommer op **fra bunden med let opskalering**, ikke ind
fra siden. Backdrop og modal starter samtidigt. I ældre browsere uden
`@starting-style` vises modalen bare med det samme; funktionen virker, glansen
mangler, og det er en acceptabel degradering.

### 5.4 Toast

```css
.toast {
  position: fixed;
  inset-block-end: 1.5rem;
  inset-inline-start: 50%;
  animation:
    toast-ind var(--tid-rolig) var(--ease-ind) both,
    toast-ud var(--tid-basis) var(--ease-ud) var(--forsinkelse-toast) forwards;
}

/* Peger man på den eller tabber ind i den, stopper nedtællingen */
.toast:hover,
.toast:focus-within { animation-play-state: paused; }

@keyframes toast-ind {
  from { opacity: 0; transform: translate(-50%, 16px); }
  to   { opacity: 1; transform: translate(-50%, 0); }
}
@keyframes toast-ud {
  to { opacity: 0; transform: translate(-50%, 8px); }
}
```

`animation-delay` på den anden animation er lig med visningstiden. To animationer
i samme deklaration betyder, at du ikke skal bruge en JS-timer til at fjerne en
klasse. Fjern selve elementet fra DOM'en på `animationend`, hvis toasts står i kø.

En toast forsvinder aldrig af sig selv, hvis den indeholder en fejl, brugeren skal
handle på. Så er den en fejlbesked med en lukkeknap, ikke en toast.

### 5.5 Sidetransition med View Transitions

View Transitions er browserens egen mekanisme til at krydsfade eller flytte
elementer mellem to sidevisninger. Den er den eneste sidetransition, filen
tillader, netop fordi den ikke kræver, at du selv holder to sider i live samtidig.

**Hvornår er den berettiget:** når to sider deler et tydeligt element (et
produktbillede, et kort, en overskrift), og brugeren ellers ville miste sporet af,
hvad de klikkede på. Ellers er en almindelig, øjeblikkelig navigation bedre, og
det er også den fallback, du får gratis.

#### Flersides site (almindelige links)

```css
@view-transition { navigation: auto; }

::view-transition-old(root) {
  animation: fade-ud var(--tid-hurtig) var(--ease-ud) both;
}
::view-transition-new(root) {
  animation: fade-ind var(--tid-rolig) var(--ease-ind) both;
}

@keyframes fade-ud  { to   { opacity: 0; } }
@keyframes fade-ind { from { opacity: 0; transform: translateY(8px); } }
```

Vil du have ét element til at flyve med over til den nye side, giv det samme
`view-transition-name` på begge sider:

```css
.produkt-billede { view-transition-name: helt; }
```

#### Enkeltsides app eller JS-styret udskiftning

Skifter du selv indholdet ud med JavaScript, pakkes udskiftningen ind. Findes
API'et ikke, skiftes der bare, og det er det rigtige.

```js
function skiftVisning(opdater) {
  if (!document.startViewTransition) return opdater();
  document.startViewTransition(opdater);
}
```

#### Reduceret motion for View Transitions

Det globale blok i afsnit 4 rammer **ikke** disse pseudoelementer. Skriv derfor
altid dette med:

```css
@media (prefers-reduced-motion: reduce) {
  ::view-transition-old(*),
  ::view-transition-new(*),
  ::view-transition-group(*) {
    animation: none !important;
  }
}
```

Her er `none` det rigtige, fordi ingen kode venter på, at disse animationer
slutter. Browseren skifter bare side med det samme.

#### Regler

- Kun ét element pr. side må bære et givet `view-transition-name`, og navnet skal
  være unikt. Bruges samme navn to steder på samme side, slår hele transitionen
  fra uden fejlmeddelelse.
- Fjern `view-transition-name` fra elementer, der ikke er synlige i viewporten.
  Navne på skjult indhold koster måling uden gevinst.
- Sidetransitionen må aldrig gøre navigationen langsommere end 320 ms. Står den
  nye side tom bagefter, har du bygget noget, der føles langsommere end slet ingen
  transition.
- Ingen polyfill. Browsere uden understøttelse navigerer øjeblikkeligt, og det er
  en bedre oplevelse end en efterligning.

### 5.6 Hover-, fokus- og aktiv-feedback

`--farve-fokus` kommer fra token-blokken i `html-motor.md`. Bruger projektet et
andet navn for fokusfarven, rettes referencen her, ikke tokens dér.

```css
.knap {
  transition:
    background-color var(--tid-mikro) var(--ease-begge),
    transform var(--tid-hurtig) var(--ease-begge),
    box-shadow var(--tid-hurtig) var(--ease-begge);
}

/* Hover kun på enheder med rigtig markør. Uden dette hænger telefoner
   fast i hover-tilstand efter et tryk. */
@media (hover: hover) and (pointer: fine) {
  .knap:hover { transform: translateY(-1px); }
}

.knap:active {
  transform: translateY(1px);
  transition-duration: var(--tid-mikro); /* nedtryk skal være øjeblikkeligt */
}

.knap:focus-visible {
  outline: 3px solid var(--farve-fokus);
  outline-offset: 2px;
  transition: none; /* fokusringen må ALDRIG fade ind. Den skal bare være der */
}
```

Regler for feedback:
- Nedtryk (`:active`) har altid `--forsinkelse-svar` på 0 ms og den korteste
  varighed. Al forsinkelse mellem klik og respons opfattes som et hakkende system.
- Fokusring animeres ikke. Tastaturbrugere skal se den øjeblikkeligt.
- Hover må maks. flytte 2 px og maks. skalere 1,03. Alt derover får layoutet til
  at føles løst.
- Hover-effekt på et helt kort ligger på kortet, ikke på hvert enkelt barn.
  Ellers får du fem animationer i stedet for én.

### 5.7 Fold ud og fold sammen uden at animere height

**Førstevalget er `grid-template-rows`.** Det er den eneste rene CSS-metode, der
folder ud til en ukendt højde uden at måle noget og uden at animere `height`.
`0fr` til `1fr` interpolerer korrekt, og indholdet klippes af `overflow: hidden`
på barnet.

```css
.foldbar {
  display: grid;
  grid-template-rows: 0fr;
  transition: grid-template-rows var(--tid-basis) var(--ease-begge);
}
.foldbar[data-aaben="true"] { grid-template-rows: 1fr; }
.foldbar > .indhold { overflow: hidden; }
```

**Nødløsningen er `max-height` med en målt værdi.** Brug den kun, når du skal
understøtte en browser uden interpolerbar `grid-template-rows`, eller når
elementet af andre grunde ikke kan være et grid. Den målte værdi skrives ind som
en variabel på elementet.

```css
.foldbar-maalt {
  --udfold-hoejde: 0px;   /* startværdi, så reglen virker før JS har målt */
  overflow: hidden;
  max-height: 0;
  transition: max-height var(--tid-basis) var(--ease-begge);
}
.foldbar-maalt[data-aaben="true"] {
  max-height: var(--udfold-hoejde); /* måles og sættes af JS, se nedenfor */
}
```

```js
// --udfold-hoejde er en instansvariabel: den erklæres på .foldbar-maalt ovenfor
// og har ingen plads i :root. 6 linjer, måler kun når noget faktisk ændrer sig.
const maal = new ResizeObserver((poster) => {
  for (const post of poster) {
    const h = post.target.scrollHeight;
    post.target.style.setProperty('--udfold-hoejde', h + 'px');
  }
});
document.querySelectorAll('.foldbar-maalt').forEach(el => maal.observe(el));
```

Regler for `max-height`-varianten:

- **Aldrig et gættet stort tal.** `max-height: 2000px` på et panel, der er 180 px
  højt, betyder, at 91 % af animationstiden går med at flytte en grænse, der ikke
  er i nærheden af indholdet. Brugeren ser en pause og derefter et hurtigt ryk.
- **Mål igen, når indholdet ændrer sig.** Derfor `ResizeObserver` og ikke en
  enkelt måling ved sideindlæsning.
- **Læs højden før du skriver stilen.** Læser og skriver du skiftevis i samme
  løkke over flere elementer, tvinger du en synkron layoutberegning pr. element.
- **Ryd op.** Kald `maal.unobserve(el)`, når elementet tages ud af DOM'en.

Uanset variant: knappen, der folder ud, skal bære `aria-expanded`, og det ejes af
`html-motor.md`.

### 5.8 Ventetilstand: skeleton

Brug kun skeleton, når ventetiden reelt overstiger 200 ms. Derunder gør den
ventetiden længere, ikke kortere, og et rent statisk felt er bedre.

```css
.skeleton {
  background: var(--farve-flade-daempet);
  animation: skeleton-puls 1.5s var(--ease-begge) infinite;
}

@keyframes skeleton-puls {
  0%, 100% { opacity: 0.55; }
  50%      { opacity: 1; }
}

@media (prefers-reduced-motion: reduce) {
  .skeleton { animation: none; opacity: 0.7; }
}
```

1,5 sekund er den rolige puls. Hurtigere læses som blink og trækker øjet væk fra
indholdet. Skeletonen skal have samme størrelse som det indhold, den erstatter,
ellers hopper layoutet, når data lander. Dette er den eneste uendelige animation,
filen tillader uden yderligere begrundelse, netop fordi den kommunikerer en
tilstand og stopper, når tilstanden ophører.

### 5.9 Scroll-drevet motion (animation-timeline)

`animation-timeline` binder en animations fremdrift til scroll-positionen i
stedet for til tiden. Browseren kører den på compositoren, så den koster ikke det,
en scroll-lytter i JavaScript koster. Den er stadig kun berettiget tre steder:

| Berettiget | Ikke berettiget |
|---|---|
| Fremdriftslinje på en lang artikel eller et langt formularflow | Parallax på tekst, man skal læse |
| Ét dekorativt element, der følger med scroll i en hero-sektion | Alt der får layoutet til at skifte størrelse |
| En sticky sektion, hvor fremdriften er selve pointen | Scroll-jacking, altså at overtage scroll-hastigheden |

Maks. én scroll-drevet animation pr. side. To konkurrerer om opmærksomheden og
gør begge uforståelige.

**Fremdriftslinje, bundet til hele dokumentets scroll:**

```css
@supports (animation-timeline: scroll()) {
  @media (prefers-reduced-motion: no-preference) {
    .fremdrift {
      transform-origin: left center;
      animation: fremdrift-fyld linear both;
      animation-timeline: scroll(root block);
    }
  }
}

@keyframes fremdrift-fyld {
  from { transform: scaleX(0); }
  to   { transform: scaleX(1); }
}
```

**Element, der afsløres, mens det passerer gennem viewporten:**

```css
@supports (animation-timeline: view()) {
  @media (prefers-reduced-motion: no-preference) {
    .scroll-afsloer {
      animation: traed-ind linear both;
      animation-timeline: view();
      animation-range: entry 15% cover 35%;
    }
  }
}
```

Regler, der gør den sikker:

- **`linear` er den eneste rigtige kurve her.** Fremdriften styres af brugerens
  finger. Lægger du en easing oveni, føles scrollen selv forkert.
- **Kun `transform` og `opacity`.** Samme regel som overalt ellers, men her er den
  hårdere: en layout-egenskab bundet til scroll genberegner layout for hver eneste
  scrollhændelse.
- **Fallback er den færdige tilstand.** `@supports` sørger for, at browsere uden
  understøttelse aldrig ser den skjulte starttilstand. Skriv den skjulte tilstand
  udelukkende inde i `@supports`-blokken, aldrig udenfor.
- **Reduceret motion slår den helt fra**, og det kræver den eksplicitte
  `no-preference`-indpakning ovenfor. Det globale blok i afsnit 4 sætter kun
  varigheden ned, og en scroll-drevet animation har ingen varighed at sætte ned.
- **Aldrig på noget, der bærer information, man ikke kan få andre steder.** Kan
  brugeren ikke scrolle, skal indholdet stadig være læsbart.
- Elementet, der animeres, skal have plads afsat i layoutet på forhånd. Ellers
  får du et layoutskift midt i scrollen, og det tæller som CLS.

---

## 6. Motion i et eksisterende produkt

Bygges der ind i et produkt, der allerede bruger et animationsbibliotek (fx en
React-flade med et motion-bibliotek), gælder to linjer: brug produktets eget
bibliotek, og mapp tokens fra afsnit 2 ind i det som delte konstanter. Opret
aldrig et parallelt motion-system ved siden af det eksisterende.

Reglerne i denne fil er stadig kontrakten, biblioteket er bare udførelsen:

- Varigheder og kurver læses fra ét fælles tokenmodul, aldrig som tal i
  komponenten. Det gælder også fjederindstillinger: stivhed og dæmpning hører til
  i tokenmodulet ved siden af `--ease-fjeder-kvik` og `--ease-fjeder-rolig`, så
  CSS-siden og JS-siden føles ens.
- Alle transforms gates af bibliotekets reduced-motion-hook, svarende til afsnit 4.
- Starttilstanden i koden skal matche det, serveren sender, jf. reglen i 5.0.
  Ellers blinker indholdet ved hydrering, eller siden står tom, hvis JavaScript
  ikke når frem. Er komponenten serverrenderet synlig, skal indgangsanimationen
  udskydes til efter montering.
- Bland aldrig to versioner eller to konkurrerende motion-biblioteker i samme
  komponenttræ. Deres tidsstyring kolliderer, og udgangsanimationer fejler lydløst.
- Automatisk layout-animation bruges kun på små, isolerede elementer, aldrig på
  store containere eller hele viewporten. Måleomkostningen giver både hak og
  layoutskift.
- Budgettet i afsnit 7 gælder uændret. Et bibliotek gør ikke tyve samtidige
  animationer billigere.

---

## 7. Sådan undgår du hakkende motion

### Hvad koster hvad

| Handling | Trin i browseren | Pris |
|---|---|---|
| `transform`, `opacity` | kun sammensætning | billig, kan køre på GPU |
| `color`, `background-color`, `clip-path` | maling + sammensætning | mellem |
| `box-shadow`, `filter: blur()` | dyr maling | høj, især på store flader |
| `width`, `top`, `margin`, `font-size` | layout + maling + sammensætning | dyrest, undgå helt |

### Budget for samtidig bevægelse

Det er ikke den enkelte animation, der vælter en telefon. Det er summen. Budgettet
herunder er tal, du kan tælle efter i devtools, ikke en fornemmelse.

| Grænse | Mobil (375-430 px) | Desktop |
|---|---|---|
| Elementer, der animerer samtidigt i viewporten | maks. 12 | maks. 24 |
| Elementer med deres eget compositor-lag samtidigt | maks. 6 | maks. 10 |
| Flader med `backdrop-filter` samtidigt | 1 | 1 |
| Samlet areal med `filter: blur()` | maks. cirka 25 % af viewporten | maks. cirka 25 % |
| Uendelige animationer i viewporten | maks. 2 | maks. 2 |

**Hvorfor lagene løber tør.** Et compositor-lag koster hukommelse svarende til
bredde x højde x pixelforhold i anden potens x 4 byte. Et fuldskærmslag på en
telefon med 390 x 844 CSS-pixels og pixelforhold 3 fylder cirka 12 MB. Seks
sådanne lag er cirka 75 MB alene til lag, og det er før billeder, DOM og
JavaScript. Rammer du loftet, begynder browseren at kassere og gentegne lag midt i
animationen, og resultatet er præcis den hakken, du prøvede at undgå med
`will-change`.

Det, der uden videre skaber et lag: `will-change` på en transform-egenskab,
`filter`, `backdrop-filter`, `position: fixed` kombineret med transform, `video`,
`canvas` og elementer med `transform: translateZ()`.

**Er du over budget:** animér containeren i stedet for børnene, stagger så ikke
alt kører samtidigt, eller skær animationen. At animere ét kort med tolv børn er
ét lag; at animere tolv børn er tolv lag.

### De fem hyppigste årsager til hak

1. **Layout-udløsende egenskab i animationen.** Se tabellen i afsnit 3. Det er
   årsagen i de fleste tilfælde.
2. **JavaScript, der læser og skriver layout i samme løkke.** Læser du
   `offsetHeight` og sætter derefter en style, tvinger du en synkron
   genberegning. Gør det i to omgange: læs alt først, skriv alt bagefter.
3. **Store blur- eller backdrop-filter-flader, der animerer.** `backdrop-filter`
   på et fuldskærmsoverlay, der samtidig fader, er den klassiske grund til, at en
   modal hakker på en tre år gammel telefon. Fade overlayets `opacity`, og hold
   `backdrop-filter` konstant.
4. **For mange elementer, der animerer samtidigt.** Se budgettet ovenfor.
5. **Scroll-lyttere, der sætter styles ved hver eneste hændelse.** Brug
   `IntersectionObserver` eller `animation-timeline` (5.9) i stedet.

Manglende `width` og `height` på billeder giver også hak midt i en animation, men
den regel hører til opmærkningen og står i `html-motor.md`.

### Er hardwaren svag, så skær signaturmomentet fra

Skal det store moment i afsnit 8 køre på en svag telefon, kan det gates i tre
linjer JavaScript: er `navigator.deviceMemory` 2 GB eller derunder, eller
`navigator.hardwareConcurrency` 4 eller derunder, springes det over, og indholdet
vises bare. Prioritetsrækkefølgen er: reduceret motion først, derefter svag
enhed, derefter designønske.

### `will-change`: hvornår og hvordan man fjerner den igen

`will-change` beder browseren om at lægge elementet på sit eget lag på forhånd.
Det koster hukommelse, og et lag, der bliver liggende, gør siden langsommere,
ikke hurtigere. Tæl det med i lagbudgettet ovenfor.

**Berettiget når:** en tung animation er lige ved at starte, og der reelt er hak
uden den. Ikke som forebyggende krydderi.

Den bedste form er den, der kun findes, mens musen er over:

```css
.tungt-kort:hover { will-change: transform; }
.tungt-kort       { will-change: auto; }      /* fjernes automatisk igen */
```

Ved JS-styrede animationer: sæt før, fjern på `transitionend`.

```js
el.style.willChange = 'transform, opacity';
el.addEventListener('transitionend', () => { el.style.willChange = 'auto'; },
                    { once: true });
```

**Aldrig:** `* { will-change: transform; }` eller `will-change` i en regel, der
altid er aktiv på mange elementer. Det er den hurtigste vej til en side, der
sluger hukommelse på mobil.

`transform: translateZ(0)` og `backface-visibility: hidden` som GPU-tricks er
forældede. Brug `will-change`, hvis du overhovedet skal fremtvinge et lag.

### Testprotokol for motion

Motion testes ikke ved at se på den på din egen maskine i fuld hastighed. Kør alle
seks gennemløb, hver gang du har rørt ved bevægelse. Et fund er et fund, ikke en
diskussion.

**1. Reduceret bevægelse slået til i systemet.** Ikke emuleret i devtools alene,
mindst én gang på rigtige indstillinger:

| System | Sti |
|---|---|
| macOS | Systemindstillinger > Tilgængelighed > Skærm > Reducér bevægelse |
| iOS og iPadOS | Indstillinger > Tilgængelighed > Bevægelse > Reducér bevægelse |
| Windows | Indstillinger > Hjælp til handicappede > Visuelle effekter > Animationseffekter |
| Android | Indstillinger > Tilgængelighed > Fjern animationer |

Kig efter: alt indhold er synligt, modaler kan åbnes og lukkes, toasts forsvinder
stadig, intet hænger og venter på en hændelse, der aldrig kommer, intet element
har flyttet sig i forhold til normal visning. Gå særligt efter View Transitions
og scroll-drevne animationer, som det globale blok ikke rammer.

**2. JavaScript slået fra.** I devtools' kommandopalet: "Disable JavaScript",
genindlæs. Kig efter: intet indhold er usynligt. Hverken afsløringer, staggerede
lister eller foldede paneler må være skjult. Er noget væk, har du brudt reglen i
5.0.

**3. Langsom CPU.** Devtools > Performance > CPU-nedskalering 4x, optag en
profil, mens animationen kører. Kig efter:

| Fund i profilen | Betydning |
|---|---|
| "Layout" eller "Recalculate style" midt i animationen | Du animerer en forkert egenskab. Se afsnit 3 |
| Røde felter i frame-linjen | Droppede frames |
| Frames over 16,7 ms under animationen | Under 60 billeder i sekundet |
| Lange gule blokke (scripting) under animationen | JavaScript arbejder, mens der animeres. Flyt arbejdet |

Ved 6x nedskalering må animationen gerne blive langsommere, men den må stadig ikke
udløse layout.

**4. Lagoptælling.** Devtools > Rendering > slå "Layer borders" og "Paint
flashing" til. Kig efter: antallet af lag under animationen holder sig inden for
budgettet ovenfor, og der males ikke i store flader, der burde ligge stille.
Blinker hele skærmen grønt under en transform, er der en forkert egenskab med i
transitionen.

**5. Responsivitetstest.** Klik to gange hurtigt på alt, der animerer. Tab hurtigt
gennem hele fladen. Åbn og luk den samme modal fem gange i træk. Kig efter: intet
venter på, at en animation bliver færdig, ingen dobbeltåbning, ingen tilstand der
sætter sig fast halvvejs.

**6. Mobil-viewport og rigtig telefon.** 375 px bredde i emulator, og mindst én
gang på en fysisk telefon på nogle år. Kig efter: ingen vandret scroll skabt af en
transform, ingen hover-tilstand der hænger fast efter et tryk, intet layoutskift
når noget kommer ind eller ud.

---

## 8. Ét til to momenter, ikke tyve effekter

En flade med tyve små animationer føles ikke gennemarbejdet. Den føles rastløs,
og ingen af de tyve huskes. En flade med ét gennemtænkt moment og ellers rolig,
usynlig funktionsmotion føles dyr.

**Reglen:** pr. side har du budget til

- **ét signaturmoment.** Det er dét, man husker: hero-sekvensen der lander,
  tallet der bygger sig op, illustrationen der tegner sig færdig. Her må du bruge
  `--tid-stor` og gøre dig umage. Det sker én gang, ved første visning.
- **eventuelt ét sekundært moment** længere nede, hvis siden er lang og der reelt
  er et vendepunkt i indholdet, som fortjener det.
- **alt andet er funktionsmotion:** 90-320 ms, næsten usynligt, kun til feedback,
  ind og ud, og retning.

Signaturmomentet skal knytte sig til den ene ting, folk skal huske, fra
`designprofil.md`. Er den ene ting "vi er de grundige", er signaturmomentet ikke
et konfettidrys, men noget der lander præcist og roligt. Er den ene ting "vi er
de hurtige", må hele hero-sekvensen være færdig på 400 ms.

**Sådan skærer du ned, hvis du er kommet over budget:** list alle steder med
motion. Markér hver enkelt med hvilket af de fire spørgsmål i afsnit 1 den
besvarer. Alt uden svar ryger. Af det, der er tilbage, må præcis ét bruge over
400 ms.

---

## 9. Tjekliste før aflevering

Kør den hver gang. Nul fund, ellers ret og kør igen.

- [ ] Hvert enkelt sted med motion besvarer ét af de fire spørgsmål: retning,
      sammenhæng, feedback eller status.
- [ ] Ingen animation på `width`, `height`, `top`, `left`, `margin`, `padding`,
      `font-size` eller `border-width`. Intet `transition: all`.
- [ ] Alle varigheder kommer fra tokens i afsnit 2. Ingen løse tal i
      stylesheet'et, og ingen konkurrerende varighedstokens i andre filer.
- [ ] Ud-animationer er 70-80 % af ind-animationerne.
- [ ] Fjederkurver bruges kun på `transform`, kun med `--tid-fjeder`, og kun ét
      sæt pr. komponentfamilie. Fallback-linjen med cubic-bezier står før.
- [ ] `prefers-reduced-motion`-blokket ligger sidst i CSS'en og bruger 0,01 ms,
      ikke `none`.
- [ ] View Transitions og scroll-drevne animationer har deres egne
      reduced-motion-blokke. Det globale blok rammer dem ikke.
- [ ] Testet med reduceret motion slået til i systemindstillingerne: alt indhold
      er synligt, alle modaler kan åbnes og lukkes, intet hænger, intet rykker.
- [ ] Testet med JavaScript slået fra: intet indhold er usynligt, hverken
      afsløringer, staggerede lister eller foldede paneler.
- [ ] Den skjulte starttilstand findes kun bag `.js-motion`, og linjen der sætter
      klassen står synkront i `<head>` før stylesheetet.
- [ ] Ingen ind- eller udgang flytter noget andet på siden. Nul layoutskift.
- [ ] Input er responsivt under enhver animation: dobbeltklik og hurtig
      tabulator-navigation venter ikke på, at bevægelsen bliver færdig.
- [ ] Hover-effekter er pakket i `@media (hover: hover)`.
- [ ] Fokusring er øjeblikkelig, uden transition, og synlig på alle interaktive
      elementer ved tabulator-navigation.
- [ ] Stagger er maks. 8 trin, trin ligger i 40-80 ms, og sidste start er maks.
      400 ms.
- [ ] Udfoldning bruger `grid-template-rows`, eller `max-height` med en målt
      værdi. Ingen gættede store tal.
- [ ] Højst ét signaturmoment over 400 ms på siden.
- [ ] Højst én scroll-drevet animation på siden, og den kører på `transform`
      eller `opacity` med `linear`.
- [ ] Uendelige animationer findes kun der, hvor de fortæller om en tilstand, og
      de stopper, når tilstanden ophører.
- [ ] Ingen `will-change`, der ligger permanent på mange elementer.
- [ ] Budgettet i afsnit 7 er talt efter: samtidige animationer, lag,
      backdrop-filter-flader og blur-areal.
- [ ] Observere og hændelseslyttere fjernes, når elementet er afsløret eller
      taget ud af DOM'en. Ingen efterladte timere.
- [ ] Intet blinker over 3 gange i sekundet. Ingen auto-karrusel uden pause.
- [ ] Profileret med CPU sat ned (4x): ingen "Layout"-blokke i frames under
      animation.
- [ ] Lagoptælling kørt med "Layer borders" og "Paint flashing" slået til.
- [ ] Testet på mobil-viewport (375 px): animationer, der virker på desktop,
      må ikke rykke i layoutet på lille skærm.
