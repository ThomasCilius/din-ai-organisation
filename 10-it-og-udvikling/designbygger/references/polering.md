# Polering - laget mellem designprofil og produktion

Designprofilen giver farver, skrifter og spacing-skala. Den siger intet om, hvad
der sker, når knappen er trykket ned, når navnet er 41 tegn langt, eller når to
runde hjørner sidder inden i hinanden. Det er dét, denne fil afgør.

Et design på 90 procent og et design på 100 procent bruger de samme farver. De
adskiller sig på de otte områder nedenfor. Læs den relevante sektion før du
bygger komponenten - ikke bagefter.

**Poleringsgate: en komponent er ikke færdig, før den har alle relevante
tilstande fra tabellen i afsnit 3, et berøringsmål på mindst 44 px, og er testet
med et for langt dansk ord og en tom værdi.** Mangler ét af de tre, er den en
kladde, uanset hvor pæn den ser ud i hviletilstand.

**Hvad denne fil ejer, og hvad den låner.** Filen ejer koncentriske radier,
berøringsmål, interaktionstilstande på komponenter, skyggelæren og skyggeskalaen,
ikonoptik, optisk spacing og kantbrug. Den ejer ikke tokens: farve- og
radiusværdier besluttes i `designsystem.md` §7, alle varigheder og easingkurver i
`motion.md` §2, og de kanoniske tokennavne i koden står i `html-motor.md` §3.
Eksemplerne herunder er skrevet i rollenavnene fra `designsystem.md` §7; skal de
limes ind i en flade bygget på motoren, oversættes navnene efter tabellen i
`html-motor.md` §3 først. Står der en rå værdi i en komponentregel her, er det en
fejl i filen.

---

## 1. Koncentriske radier

Når et rundet element ligger inde i et andet rundet element, skal luften mellem
dem være ens hele vejen rundt. Det kræver, at den indre radius er mindre end den
ydre - præcis så meget som afstanden mellem dem.

**Formlen:**

```
indre radius = ydre radius - padding
```

Er resultatet 0 eller negativt, skal det indre element have `border-radius: 0`.
Aldrig et negativt tal, og aldrig samme radius på begge.

Ignorerer du reglen, bliver luften i hjørnerne synligt tykkere end langs
kanterne, og øjet læser det som slør uden at kunne sige hvorfor.

**Radius-skalaen ejes af `designsystem.md` §5 og §7** og hedder `--radius-sm` (6),
`--radius-md` (10), `--radius-lg` (16), `--radius-xl` (24) og `--radius-full`
(999). Vælg altid den ydre radius fra skalaen. Den **indre** radius er derimod
regnet ud, ikke valgt: 16 px kort med 12 px padding giver 4 px på det indre
element, og 4 er ikke et trin på skalaen. Det er korrekt. Skalaen gælder de
radier, du bestemmer; formlen gælder dem, der følger af en afstand.

**Implementering med variabler, så det holder når tallene ændres:**

```css
.kort {
  --kort-radius: var(--radius-lg);
  --kort-pad: var(--space-3);
  border-radius: var(--kort-radius);
  padding: var(--kort-pad);
}
.kort > .kort-medie {
  /* max() beskytter mod negativ radius */
  border-radius: max(0px, calc(var(--kort-radius) - var(--kort-pad)));
}
```

**Tommelfingerregler:**

| Situation | Regel |
|---|---|
| Billede uden padding (flush til kanten) | Samme radius som forælderen, men kun i de hjørner der rører kanten |
| Input inde i kort med `--radius-lg` og 16 px padding | Input får `--radius-sm`, aldrig kortets egen radius |
| Ikon i cirkel i kort | Cirklen er `--radius-full`, den bryder ikke koncentrik-reglen |
| Knap inde i knapgruppe/segment | Ydre gruppe `--radius-md`, indre knapper `--radius-sm`, gap `--space-1` |
| Modal (`--radius-xl`) med indhold i kort | Indre kort maks. `--radius-lg`, aldrig lige så rundt som modalen |

**Når afstanden bliver stor, holder du op med at regne.** Er padding over cirka
24 px, læses de to lag som selvstændige flader, og det indre element må gerne
tage sit eget trin fra skalaen. Formlen løser et optisk problem, der kun findes,
når hjørnerne er tæt på hinanden.

Pill-form (`--radius-full`) og skarp form (`0`) er de to eneste værdier, der må
stå alene uden for skalaen - de læses som bevidste valg, ikke som fejlramte tal.

---

## 2. Klikflader og berøringsmål

**Denne fil ejer 44 px-kravet.** `html-motor.md` §5 (Fitts) og punkt F8 i
`anti-slop-review.md` henviser hertil; de gentager ikke metoderne.

**Minimum: 44 × 44 px reelt berøringsmål på alt der kan klikkes.** Det gælder
også små ikonknapper, lukkekryds, paginering, tabelrækkers handlinger og links i
tætte lister. På desktop er 32 × 32 px acceptabelt for musepræcise værktøjer i
tætte dataflader, men aldrig på noget der også vises på mobil.

Det svære er at give en 16 px stor ikonknap et 44 px mål **uden** at flytte
layoutet. Tre måder, i prioriteret rækkefølge:

**A. Padding plus negativ margin - virker altid, ændrer intet visuelt:**

```css
.ikonknap {
  padding: 14px;              /* 16 + 14 + 14 = 44 */
  margin: -14px;              /* layoutet ser stadig et 16 px element */
  border-radius: var(--radius-sm);
  line-height: 0;
}
```

**B. Pseudoelement - når negativ margin kolliderer med flexbox-gap:**

```css
.ikonknap { position: relative; }
.ikonknap::after {
  content: "";
  position: absolute;
  inset: 50% auto auto 50%;
  translate: -50% -50%;
  width: 44px;
  height: 44px;
}
```

**C. `min-height`/`min-width` på selve knappen** - når der er plads, og du
hellere vil have en synligt større knap end en usynlig større flade. På
touch-layouts er C førstevalget: der er det en fordel, at den synlige knap også
bliver større.

**Regler der følger med:**

- Mindst 8 px luft mellem to berøringsmål. Overlappende mål er værre end små:
  brugeren rammer den forkerte og fortryder ikke, fordi han ikke opdager det.
  Er der ikke plads til fuld udvidelse, skrumper udvidelsen - den krydser aldrig
  nabomålet.
- Hele rækken eller kortet er klikfladen, når hele rækken fører samme sted hen.
  Et 200 px bredt kort med et 60 px klikbart link i midten er en fejl.
- Ligger der en sekundær handling (slet, menu) inde i et klikbart kort, skal den
  stoppe hændelsen og have sit eget synlige 44 px mål.
- Links midt i brødtekst er undtaget - de følger linjeboksen. Fritstående links,
  ikoner, afkrydsningsfelter og radioknapper er ikke.
- Det synlige fokus-omrids skal følge den **visuelle** form, ikke den udvidede
  flade. Bruger du metode A, sætter du `border-radius` på selve knappen, og
  outline'en lander pænt.

---

## 3. Alle interaktionstilstande

**Denne fil ejer komponenternes interaktionstilstande.** Punkt F1-F8 i
`anti-slop-review.md` auditerer mod tabellen herunder og citerer den frem for at
formulere kravene igen. `html-motor.md` §7 ejer **indholdets** tilstande - tom
liste, indlæsning af data, fejlside, for mange rækker - og de hører ikke hjemme
her. Ind- og udgangsanimation ligger i `motion.md` §5.

**Ingen komponent er færdig, før alle relevante tilstande findes.** Hvile er
den, alle bygger. De syv andre er dem, der afgør, om fladen føles færdig.

| Tilstand | Skal signalere | Typisk virkemiddel |
|---|---|---|
| Hvile | Kan det klikkes? | Baseline: farve, kant, vægt |
| Hover | Musen er over | `--accent-hover` eller fladeskift, evt. 1 px løft |
| Fokus (`:focus-visible`) | Tastaturet er her | Synligt omrids, mindst 2 px, 3:1 kontrast |
| Aktiv (`:active`) | Trykket lige nu | `--accent-active` plus 1 px ned eller `scale(.98)` |
| Deaktiveret (`:disabled`) | Kan ikke bruges nu | Dæmpet fyld, `cursor: not-allowed`, ingen hover |
| Indlæser | Systemet arbejder | Spinner **i** knappen, bredde låst, tekst bevaret |
| Fejl | Noget gik galt | Kant i `--danger` + tekstforklaring under, aldrig kun farve |
| Valgt / aktiv side | Hvor er jeg, hvad har jeg valgt | Fyldt baggrund eller markør, `aria-current` |

**Hårde regler:**

1. **Fjern aldrig `outline` uden at erstatte den.** `outline: none` uden et
   synligt alternativ gør fladen ubrugelig med tastatur. Brug `:focus-visible`,
   så musebrugere ikke ser omridset, men tastaturbrugere gør.
2. **Hover er ikke nok alene.** Alt hover viser, skal også kunne nås uden mus.
   Touch-enheder har ingen hover - en handling, der kun findes ved hover, findes
   ikke på mobil. Pak hover-regler i `@media (hover: hover)` som beskrevet i
   `motion.md` §5.6, ellers hænger hover-tilstanden fast efter et tryk på mobil.
3. **Indlæsning må ikke ændre størrelse.** Lås bredden før teksten udskiftes med
   en spinner, ellers hopper layoutet.
4. **Undgå indlæsningsblink.** Vises spinneren først, skal den blive i mindst
   300 ms. En spinner, der er væk efter 80 ms, opfattes som en fejl, ikke som
   fart. (Tærsklerne for indhold - skeletons, forsinket visning - står i
   `html-motor.md` §7.)
5. **Deaktiveret skal forklares.** En grå knap uden årsag er en blindgyde. Skriv
   hvorfor ved siden af eller i hjælpeteksten. Overvej alternativet: lad knappen
   være aktiv og validér ved klik - det er næsten altid en bedre oplevelse.
6. **Fejl kommunikeres aldrig med farve alene** - ikon plus tekst, ellers er den
   usynlig for farveblinde og i gråtoneprint.

**Copy-paste-basis, knap (ren CSS, ingen framework):**

```css
.knap {
  background: var(--accent);
  color: var(--text-on-accent);
  border: 1px solid transparent;
  border-radius: var(--radius-md);
  padding: 10px 18px;
  min-height: 44px;
  font: inherit;
  cursor: pointer;
  transition: background-color var(--tid-mikro) var(--ease-begge),
              transform var(--tid-mikro) var(--ease-begge),
              box-shadow var(--tid-hurtig) var(--ease-begge);
}
@media (hover: hover) {
  .knap:hover { background: var(--accent-hover); }
}
.knap:active { background: var(--accent-active); transform: translateY(1px); }
.knap:focus-visible {
  outline: 2px solid var(--focus-ring);
  outline-offset: 2px;
}
.knap[disabled] {
  background: var(--bg-subtle);
  color: var(--text-muted);
  border-color: var(--border);
  cursor: not-allowed;
  transform: none;
}
.knap[aria-busy="true"] { pointer-events: none; }
.knap[aria-pressed="true"], .knap.er-valgt {
  background: var(--accent-active);
  box-shadow: inset 0 0 0 1px var(--border-strong);
}
```

Reduceret motion håndteres ikke her. Den globale blok i `motion.md` §4 sætter
varigheden ned for alt på siden, også for denne knap; nedtrykket bliver
øjeblikkeligt i stedet for animeret, hvilket er den ønskede opførsel. Skal
`translateY` helt væk, skrives den eksplicitte override efter det globale blok -
mønsteret står samme sted.

**Copy-paste-basis, input.** Formularer er den mest brugte komponent på en
SMV-flade, og den med flest tilstande. Alle seks skal findes:

```css
.felt {
  min-height: 44px;
  padding: 10px 12px;
  background: var(--surface);
  color: var(--text);
  border: 1px solid var(--border);
  border-radius: var(--radius-sm);
  font: inherit;
  transition: border-color var(--tid-hurtig) var(--ease-begge),
              box-shadow var(--tid-hurtig) var(--ease-begge);
}
.felt::placeholder { color: var(--text-faint); }

/* fokus */
.felt:focus-visible {
  outline: 2px solid var(--focus-ring);
  outline-offset: 1px;
  border-color: var(--border-strong);
}

/* udfyldt - så et udfyldt felt ikke ligner et tomt */
.felt:not(:placeholder-shown) { border-color: var(--border-strong); }

/* fejl - kant PLUS tekst under feltet, aldrig farve alene */
.felt[aria-invalid="true"] {
  border-color: var(--danger);
  box-shadow: inset 0 0 0 1px var(--danger);
}
.felt-fejltekst { color: var(--danger); font-size: var(--text-sm); }

/* skrivebeskyttet - må læses og kopieres, ikke ændres */
.felt[readonly] {
  background: var(--bg-subtle);
  border-color: var(--border);
  cursor: default;
}

/* deaktiveret */
.felt:disabled {
  background: var(--bg-subtle);
  color: var(--text-muted);
  border-color: var(--border);
  cursor: not-allowed;
}
```

To ting, der oftest går galt her:

- `:not(:placeholder-shown)` virker kun, når feltet **har** en placeholder. Har
  du ingen synlig placeholder, sæt `placeholder=" "` (ét mellemrum), ellers er
  udfyldt-tilstanden død uden at nogen opdager det.
- `readonly` og `disabled` er ikke det samme. `readonly` sendes med formularen,
  kan fokuseres og kan kopieres af en skærmlæser. `disabled` sendes ikke og
  springes over ved tabulering. Vælg `readonly` til værdier, brugeren skal kunne
  se og kopiere, men ikke rette - fx et kundenummer.

Samme øvelse gælder links (hvile, hover, fokus, besøgt hvis relevant), rækker
(hover, valgt, fokus inden i) og faner (hvile, hover, aktiv, fokus,
deaktiveret). De tre bygges efter samme mønster som knappen.

**Tilstande i mørk visning.** Tabellen ovenfor er skrevet med tokens, netop for
at den også gælder i mørk visning - men tokenværdierne skal justeres, og
justeringen går den anden vej:

| Tilstand | Lys visning | Mørk visning |
|---|---|---|
| Hover på fyldt flade | 4-8 % **mørkere** end hvile | 6-10 % **lysere** end hvile |
| Hover på neutral flade | Fladen bliver et trin mørkere | Fladen bliver et trin lysere |
| Aktiv (nedtryk) | Yderligere 4-6 % mørkere | Yderligere 4-6 % lysere |
| Deaktiveret | Dæmpet fyld, tekst i `--text-muted` | Samme mønster, men **aldrig** under 3:1 kontrast |
| Fokusring | `--focus-ring` mod lys flade | Lysere ring, ellers forsvinder den i den mørke flade |

Tre konsekvenser, der skal håndteres i token-blokken, ikke i komponenten:

- **`--accent-hover` og `--accent-active` skal med i den mørke blok.** Arver mørk
  visning de lyse tilstandsfarver, er de markant mørkere end den mørke accent, og
  nedtrykket ser ud som en fejl. Spejlingen af de to roller ejes af
  `designsystem.md` §3 og skrives i token-blokken i §7 - ikke her.
- **Deaktiveret må ikke løses med opacitet i mørk visning.** 40-50 procents
  opacitet på en mørk flade lægger teksten under kontrastgrænsen. Brug et
  dæmpet fyld og `--text-muted` som i koden ovenfor, så kontrasten kan måles.
- **Kontrasten skal måles i begge temaer.** En hover-farve, der klarer 3:1 i lys
  visning, gør det ikke automatisk i mørk. Kontrastgates står i
  `designsystem.md` §3.

---

## 4. Tekst i virkeligheden

Design testet med "Lorem ipsum" og "Jens Hansen" holder ikke. Dansk skaber lange
sammensatte ord, og virkelige data indeholder tomme felter.

**Testsættet du altid kører en komponent igennem:**

| Testværdi | Hvad den afslører |
|---|---|
| `Ejendomsadministrationsselskabet Nørrebro ApS` | Om lange ord bryder layoutet |
| `A` | Om komponenten kollapser ved minimum |
| Tom streng | Om der står en tom kasse uden forklaring |
| `Æ Ø Å æ ø å` | Om skriften og linjehøjden holder til danske tegn |
| 3 × normal længde | Om beskrivelsen skubber knappen ud af kortet |
| `1.284.900,50 kr.` | Om talkolonner brækker eller ombryder |

**Baseregler i CSS:**

```css
body {
  hyphens: auto;              /* kræver lang="da" på <html> */
  overflow-wrap: break-word;  /* nødbremse for umulige ord */
}
```

`lang="da"` sættes i skelettet, ikke her. Begrundelserne - både orddeling og
skærmlæserens udtale - står samlet i `html-motor.md` §1. Mangler attributten,
virker `hyphens: auto` ikke, og hele dette afsnit falder fra hinanden.

- `overflow-wrap: break-word` bryder kun, når ordet ellers ville flyde ud. Brug
  det som sikkerhedsnet overalt.
- `word-break: break-all` bruges **aldrig** på almindelig tekst - det bryder
  midt i korte ord og ser ødelagt ud.
- Tabelceller med tal: `font-variant-numeric: tabular-nums;` og
  `text-align: right;`. Det gælder alt, der **opdaterer sig** - tællere, ure,
  priser - ikke kun tabeller. Uden tabulartal hopper cifrene ved hvert skift.
- Undgå `white-space: nowrap` på indhold, du ikke selv skriver. På knapper og
  labels er det rigtigt; på brugerdata er det en overløbsfejl, der venter.

**Truncation - kun når du kan give teksten igen:**

```css
.en-linje {
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  min-width: 0;   /* uden denne virker det ikke i flex */
}
.to-linjer {
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
}
```

`min-width: 0` på flex-børn er den enkeltfejl, der oftest får truncation til
ikke at virke. Flex-elementer har `min-width: auto` som standard og nægter at
blive smallere end deres indhold.

Fire regler oveni:

- Afkortet tekst skal altid kunne læses fuldt et andet sted: `title`-attribut,
  tooltip eller detaljevisning. Afkortning uden vej tilbage er datatab.
- **Data, brugeren skal aflæse præcist, afkortes aldrig** - kontonumre, CVR,
  fakturanumre, fejlkoder, beløb. De ombrydes i stedet.
- **Filnavne og stier afkortes i midten**, ikke i enden. Slutningen er det, der
  skelner dem fra hinanden: `faktura...2026-06.pdf` er brugbar,
  `faktura-noerrebro-ejendom...` er ikke.
- **En line-clamp er en layoutbeslutning, ikke en indholdsbeslutning.** Klipper
  alle kort ved to linjer, skal teksterne skrives, så de holder på to linjer.
  Klip er ikke en undskyldning for ikke at redigere.

**Tomme værdier skrives ud.** Vis `-` eller "Ikke oplyst" i den svage
tekstfarve - aldrig et blankt felt. Blanke felter læses som en fejl i systemet.

**Tomme lister får en rigtig tom-tilstand:** én linje der forklarer hvad der
mangler, og én handling der fylder listen. Kravene til den står i
`html-motor.md` §7.

---

## 5. Skyggelag

**Denne fil ejer skyggelæren og skyggeskalaen** - tre trin, ikke flere:
`--shadow-sm`, `--shadow-md` og `--shadow-lg`. Reglerne herunder er dem, de tre
tokens bygges efter, og dem, du auditerer en flade imod. Linjerne skrives ind i
projektets `:root` sammen med resten af tokens; i motorens navnesprog hedder de
tre trin `--skygge-1`, `--skygge-2` og `--skygge-3`, og tokenblokken i
`html-motor.md` §3 bærer den kopi. Ingen anden fil må lægge et fjerde trin eller
en konkurrerende skala ved siden af.

En enkelt `box-shadow` med sort ved høj opacitet giver en grå kasse under
elementet. Rigtigt lys giver blød aftegning, ikke grå tåge.

**Byg hver skygge i tre lag:**

1. **Kontaktlag** - meget lille blur, tæt på elementet. Definerer kanten.
2. **Formlag** - middel blur og offset. Bærer selve dybden.
3. **Rumlag** - stort blur, lav opacitet. Kun på elementer højt over fladen.

Sådan ser doktrinen ud i praksis på det højeste trin. Den skrives ind i
projektets `:root` én gang - findes der allerede en skyggeskala i fladen, rettes
den, i stedet for at der lægges en ny ved siden af:

```css
/* illustration af tre-lags-opbygningen - i motorens navnesprog er dette --skygge-3 */
--shadow-lg:
  0 1px 2px  hsl(220 40% 10% / .06),   /* kontakt */
  0 8px 16px hsl(220 40% 10% / .08),   /* form    */
  0 24px 48px hsl(220 40% 10% / .06);  /* rum     */
```

**Regler:**

- **Lyset kommer ét sted fra.** Alle skygger på fladen har positiv Y-offset og
  X-offset nul (eller samme lille X hele vejen). Skygger i forskellige retninger
  ødelægger illusionen på ét sekund.
- **Blur er større end offset.** `0 4px 8px` er lys. `0 4px 4px` er en kasse.
- **Opacitet under 10 procent pr. lag.** Dybden kommer af flere lag, ikke af ét
  mørkt.
- **Skyggefarven er baggrundens kulør ved lav lyshed**, ikke ren sort. Sort
  skygge på en varm baggrund bliver grumset.
- **Højde er en skala, ikke en værdi.** `--shadow-sm` = kort og input,
  `--shadow-md` = dropdown og popover, `--shadow-lg` = modal og drawer. Et kort,
  en dropdown og en modal må aldrig dele token. Har du brug for et fjerde
  niveau, er hierarkiet forkert.
- **I mørk visning virker skygger næsten ikke.** Dybden skabes i stedet af
  fladens lyshed - jo højere oppe, jo lysere flade - plus en hårfin lys kant:
  `box-shadow: inset 0 1px 0 hsl(0 0% 100% / .06)`. Behold en svag ydre skygge
  til kontakten. Bare at skrue op for sort gør fladen sort på sort.
- **Kant plus skygge på samme kort er ofte rigtigt.** Kanten definerer kanten,
  skyggen giver dybden. Det er tre samtidige signaler, der er fejlen (se §8),
  ikke to.
- **Fladt design er et gyldigt valg.** Vælger designprofilen kant frem for
  skygge, så brug kant konsekvent - ikke skygge nogle steder og kant andre.

**Billeder skal have en kant, også når de ikke har en.** Et foto med lys himmel
øverst flyder ud i en lys flade, og kortet ser i stykker ud i toppen. Læg et
neutralt indadgående omrids på:

```css
img {
  outline: 1px solid hsl(0 0% 0% / .10);
  outline-offset: -1px;   /* indad, så billedets størrelse ikke ændres */
}
@media (prefers-color-scheme: dark) {
  img { outline-color: hsl(0 0% 100% / .10); }
}
```

Omridset er altid neutral sort eller hvid med alfa. Tonet det med accentfarven,
og hvert billede får en farvet ramme, ingen har bedt om.

---

## 6. Ikonoptik

**Størrelse:** ikoner sættes i faste trin - 16, 20, 24, 32 px. Et 18 px ikon
mellem to 16 px ikoner ser forkert ud, selvom ingen kan sige hvorfor.

**Stregtykkelse skalerer ikke lineært.** Et ikon tegnet med 1,5 px streg ved
24 px bliver tyndt og udvasket ved 16 px og klodset ved 32 px.

| Ikonstørrelse | Stregtykkelse |
|---|---|
| 16 px | 1,5 px |
| 20 px | 1,5-1,75 px |
| 24 px | 2 px |
| 32 px og op | 2-2,5 px |

Brug **ét** ikonsæt på hele fladen. Blandede sæt - en tynd outline-stil sammen
med en fyldt stil - er den tydeligste sammenklippet-markør, der findes.

**Et ikon tegnet til 24 px overlever sjældent 16 px.** Detaljer, der er
læsbare på det store trin, bliver til grød på det lille. Bruger du samme ikon i
to størrelser, så kig på det lille trin i 100 procent zoom, og lav om nødvendigt
en forenklet variant med færre linjer.

**Optisk centrering:** ikoner med retning skal forskydes for at se centrerede
ud. Klassikeren er afspil-trekanten i en rund knap: matematisk centreret ser den
ud til at hælde mod venstre, fordi massen ligger til venstre for midtaksen.
Forskydningen er 4-8 procent af ikonets bredde for trekanter, 1-2 px for
chevroner og pile.

**Ret det i SVG'en, ikke i CSS.** Flytter du formen inde i dens egen `viewBox`,
er den rettet alle de steder, ikonet bruges, også dem du ikke kender endnu. CSS
er nødløsningen, når du ikke ejer filen:

```css
/* sidste udvej: ikonfilen kan ikke rettes */
.afspil-ikon { transform: translateX(1px); }  /* 24 px ikon: 1-2 px */
```

**Justering mod tekst:**

```css
.ikon-og-tekst {
  display: inline-flex;
  align-items: center;
  gap: var(--space-2);   /* 16 px ikon. 20-24 px ikon: --space-3 */
}
.ikon-og-tekst svg {
  flex: none;            /* ikonet må aldrig klemmes af lang tekst */
  width: 1em;
  height: 1em;
}
```

- Ikonet flugter med bogstavernes **versalhøjde**, ikke med hele linjeboksen.
  Ved én linje rammer `align-items: center` plus en ikonstørrelse omkring 1em
  som regel rigtigt - men efterse det ved den endelige skriftstørrelse, ikke i
  en zoomet skærmbillede.
- Ved flere linjer skal ikonet flugte med **første** linje: brug
  `align-items: flex-start` og `margin-top` svarende til
  `(linjehøjde - ikonhøjde) / 2`.
- Ikonstørrelse i `em` gør, at ikonet følger tekstens skalering automatisk.
- Ikoner skal arve farve: `fill: currentColor` eller `stroke: currentColor`.
  Hardkodet ikonfarve er den fejl, der viser sig først i mørk visning.
- Afstanden mellem ikon og tekst kommer fra spacing-skalaen, ikke fra en løs
  margin, der er tunet på ét sted.
- Rent dekorative ikoner: `aria-hidden="true"`. Ikoner der ER handlingen (en
  ikonknap uden tekst): `aria-label` med en dansk beskrivelse.

---

## 7. Optisk vs. matematisk spacing

Spacing-skalaen fra designprofilen er udgangspunktet, ikke facit. Øjet måler
**opfattet** afstand, ikke pixels, og opfattet afstand afhænger af, hvor meget
tyngde der ligger ved kanten.

**Hvor øjet skal vinde over regnearket:**

| Situation | Matematisk | Optisk korrekt |
|---|---|---|
| Rund knap i firkantet kort | Samme padding hele vejen | 1-2 px mere padding om cirklen |
| Stor overskrift over brødtekst | 24 px afstand | 18-20 px - store bogstaver har luft indbygget over |
| Tekst i knap med ikon til venstre | Lige padding venstre/højre | 2-4 px mindre til venstre for ikonet |
| Trekant eller chevron mod kant | Lige margin | Mere margin - spidse former ser løse ud |
| Versaler eller store tal i kasse | Centreret via `line-height` | 1-2 px ned - versaler hænger optisk højt |
| Citat med anførselstegn | Venstrestillet på gridlinjen | Hængende: tegnet trækkes ud i margenen |

**Regler der ikke er smagssag:**

1. **Nærhed slår kant.** En label hører til det felt, der står tættest på. Er
   afstanden op og ned ens, hører den ingen steder hjemme. Brug 6 px op til
   label og 20 px ned til næste felt - ikke 12/12.
2. **Gruppering er et forhold, ikke et tal.** Afstanden mellem grupper skal være
   mindst **dobbelt** så stor som afstanden inde i gruppen. Er der 8 px fra
   label til felt og 12 px til næste felt, er grupperingen tvetydig for øjet,
   uanset at tallene er forskellige. Gør det 8 og 24.
3. **Linjehøjde er usynlig padding.** En tekstblok har indbygget luft over og
   under den synlige tekst. Måler du kortets toppadding til linjeboksen i stedet
   for til bogstaverne, ser toppen altid tommere ud end siderne. Trim
   linjeboksen, hvor browseren tillader det, ellers tag et trin ned på
   toppadding.
4. **Optisk tunge elementer skal have mere luft.** En mættet badge eller en mørk
   knap ved siden af stille tekst har brug for et trin mere, end gitteret siger.
   Visuel vægt smitter af på afstanden.
5. **Hjørne-padding må gerne være asymmetrisk.** Kort med billede øverst har ofte
   brug for lidt mere bundpadding end toppadding, fordi tekstens underlængder
   skaber optisk luft foroven.
6. **Rytmen er vigtigere end tallet.** Tre sektioner med 64 / 64 / 64 px ser
   rigtigt ud. 64 / 60 / 68 ser tilfældigt ud, selvom ingen kan måle det.
7. **Optiske korrektioner er små.** 1-4 px, og helst et trin på skalaen. Ryger du
   op på 12 px afvigelse, løser du et layoutproblem, ikke et optisk.
8. **Skriv korrektionen ned i koden** med en kommentar, ellers retter den næste
   den tilbage til det matematiske tal.

```css
.knap-med-ikon {
  /* optisk: ikonet har luft i sin egen boks, derfor mindre venstre-padding */
  padding-inline: 14px 18px;
}
```

---

## 8. Kanter, dividers - og hvornår man skal lade være

En kant er den dyreste måde at adskille to ting på: den tegner en streg over
hele fladen og trækker opmærksomhed hen et sted, hvor der ikke sker noget.

**Adskillelsestrappen - brug det laveste trin, der virker:**

1. **Whitespace.** Mere afstand mellem grupperne. Virker i de fleste tilfælde og
   koster ingen visuel støj.
2. **Baggrundsskift.** Sektionen får en anelse anden flade (2-4 procents
   forskel). Ingen streger, tydelig gruppering.
3. **Kant.** Kun når to elementer skal være tæt på hinanden og alligevel adskilt
   - tabelrækker, listeposter, inputfelter.
4. **Skygge.** Kun når elementet reelt skal ligge oven på noget (dropdown,
   modal).

Kanter **adskiller**, skygger **løfter**. Bruger du en tung skygge, hvor en
hårfin kant gør arbejdet, ser fladen ud, som om alt svæver.

**Regler for kanter, når du endelig bruger dem:**

- 1 px, aldrig 2 px, medmindre kanten er et bevidst designtræk i profilens
  stilretning (brutalistisk, industriel).
- Farven er lav kontrast: `--border` til det normale, `--border-strong` kun hvor
  noget skal træde frem. En kant med høj kontrast læses som en fejltilstand.
- **Ingen kant på første og sidste element** i en liste, når kortet allerede har
  en kant. Dobbeltstreger ser altid forkert ud:

```css
.liste > * + * { border-top: 1px solid var(--border); }
```

  `* + *`-mønsteret sætter automatisk kun kant mellem elementer - aldrig over det
  første eller under det sidste.

- **Divideren skal have luft på begge sider**, mindst halvdelen af den mindste
  omkringliggende afstand. En divider klemt op ad tekst gør mere skade end gavn.
- **Indrykkede dividers** (der starter ved teksten, ikke ved kortets kant) bruges
  i lister med ikon eller avatar til venstre - så bliver ikonet en visuel søjle i
  stedet for at blive skåret over.
- **Aldrig kant plus skygge plus baggrundsskift på samme element.** Vælg to,
  højst. Tre samtidige signaler er den tydeligste markør for et design, hvor
  ingen har taget stilling.
- Lodrette dividers i knapgrupper: kun når knapperne deler flade. Har de gap
  imellem sig, er dividerne overflødige.

---

## 9. Tjekliste før aflevering

- [ ] Alle indre radier følger `ydre - padding`, ingen negative værdier
- [ ] Alle valgte radier kommer fra `--radius-sm/md/lg/xl/full`, ikke fra sag til sag
- [ ] Alt klikbart har mindst 44 × 44 px berøringsmål, mindst 8 px imellem, ingen
      overlappende udvidelser
- [ ] Hover, `:focus-visible`, `:active`, deaktiveret, indlæser, fejl og valgt
      findes på alle interaktive komponenter
- [ ] Input har alle seks tilstande: hvile, fokus, udfyldt, fejl, skrivebeskyttet,
      deaktiveret
- [ ] Hover-regler er pakket i `@media (hover: hover)`
- [ ] `outline` er aldrig fjernet uden synlig erstatning
- [ ] Hover-, aktiv- og deaktiveret-værdier er efterset i **begge** temaer, og
      `--accent-active` findes også i den mørke blok
- [ ] Komponentreglerne indeholder ingen rå ms-værdier, ingen `ease`, ingen
      hardkodede farver - alt kommer fra tokens
- [ ] `<html lang="da">` er sat (jf. `html-motor.md` §1), og `hyphens: auto` +
      `overflow-wrap` er aktive
- [ ] Testet med et 45-tegns dansk sammensat ord, ét bogstav og tom værdi
- [ ] Afkortet tekst kan læses fuldt et andet sted; præcisionsdata afkortes ikke;
      filnavne afkortes i midten
- [ ] Opdaterende tal bruger `tabular-nums`, talkolonner er højrestillede
- [ ] Tomme felter viser `-` eller "Ikke oplyst"
- [ ] Skygger har samme lysretning, tre lag, hver under 10 procents opacitet, og
      kommer fra `--shadow-sm/md/lg`
- [ ] Kort, dropdown og modal deler ikke skyggetoken
- [ ] Mørk visning løfter med fladelyshed og hårfin lys kant, ikke med mere sort
- [ ] Billeder har et neutralt indadgående omrids
- [ ] Ét ikonsæt, stregtykkelse matcher størrelsen, `currentColor` som farve,
      retningsikoner optisk centreret i SVG'en
- [ ] Ikoner justeret mod første tekstlinje, `flex: none`, korrekt aria
- [ ] Afstand mellem grupper er mindst dobbelt så stor som inde i gruppen
- [ ] Optiske korrektioner er små (1-4 px) og kommenteret i koden
- [ ] Hver kant er efterprøvet: kunne whitespace eller baggrundsskift klare det?
- [ ] Ingen elementer med kant + skygge + baggrundsskift samtidig

Fejler ét punkt, er fladen ikke klar. Ret det, og kør listen igen.
