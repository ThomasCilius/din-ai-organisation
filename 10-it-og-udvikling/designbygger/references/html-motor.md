# HTML-motoren

Sådan bygger du den kørende artefakt, designbygger afleverer.

`designprofil.md` bestemmer HVAD (retning, skrifter, hex-koder, spacing-skala, kontrastkrav).
Denne fil bestemmer HVORDAN det bliver til kode, der virker. Værdier hentes altid fra profilen -
skriv aldrig en farve eller en skriftstørrelse ned her, som profilen ikke har sagt.

## Forrang og ejerskab

Referencerne overlapper. Når to filer siger noget forskelligt om det samme, gælder denne rækkefølge:

| Emne | Ejer | Denne fil gør |
|---|---|---|
| Retningsvalget, skrifterne, paletten, spacing-skalaen og kontrastniveauet (AA/AAA) | `designprofil.md` | Læser værdierne, opfinder dem aldrig |
| Typeskala, farveroller, de konkrete kontrastgates, spacing- og radieskala, hierarki, kvoten for modige valg | `designsystem.md` | Bygger det, retningen og skalaerne kræver |
| Varigheder, easing, forsinkelser, flytteafstande, reduced-motion | `motion.md` | Kopierer motion-skalaen uændret ind i tokenblokken. Opfinder aldrig et navn eller en værdi |
| Komponentens tilstande, koncentriske radier, klikflader, ikonoptik, skyggeskalaen, kanter | `polering.md` | Henviser, gentager ikke |
| Fundlisten ved audit | `anti-slop-review.md` | Bygger så listen er tom på forhånd |
| Filstruktur, det kanoniske tokennavnesprog i koden, layout, lagdeling uden JS, tastaturmodel, validering, indholdets tilstande, fejlhåndtering, print og mail | **denne fil** | Ejer det |

**Tokenkataloget i afsnit 3 er det kanoniske navnesprog i koden.** `designsystem.md` §7 afgør,
hvilke roller og værdier systemet har; kataloget her afgør, hvad de hedder i den kode, du
afleverer. De andre referencer skriver deres eksempler i rollenavnene fra `designsystem.md` §7.
Kopierer du en kodestump derfra, omdøber du variablerne til katalogets navne, før du limer ind.
Oversættelsestabellen står i afsnit 3, og den dækker hvert navn, pakken bruger. **Der må kun
være ét navnesæt i den færdige fil** - to sæt betyder, at den næste, der retter en farve, kun
retter det halve.

## Leverancekontrakten

Der findes to leverancer, og de har hver sin kontrakt. Afgør hvilken du er i gang med, før du
skriver en linje kode. Er du i tvivl, er det den selvstændige fil.

### A. Den selvstændige artefakt (standard)

Én fil. Åbnes med dobbeltklik. Virker uden byggeværktøj, uden npm, uden netværk.

| Krav | Grænse |
|---|---|
| Antal filer i leverancen | 1 (`index.html`) - billeder må ligge ved siden af, hvis kunden får en mappe |
| Eksterne requests ved load | 0 |
| Total filstørrelse uden indlejrede skrifter | < 150 kB |
| Med indlejrede skrifter | < 400 kB |
| Blokerende JS før første maling | 0 bytes |
| Virker med JS slået fra | Ja - alt indhold læsbart, alle links virker |

Fejler ét af punkterne, er artefakten ikke selvstændig. Ret det, før du afleverer.

### B. Komponenten ind i et eksisterende produkt

Skal koden ind i en side, en app eller et tema, der allerede findes, gælder kontrakten ovenfor
ikke. Den er direkte skadelig: en global reset og en `:root`-blok, der lander oven i et fremmed
system, ødelægger værtens flader. Reglerne her erstatter den:

| Krav | Sådan |
|---|---|
| Værtens tokens vinder | Findes der allerede variabler for farve, spacing og radius, bruger du dem. Du opretter kun nye tokens for det, værten ikke har |
| Egne tokens scopes | Læg dem på komponentroden (`.tc-kort{--kort-bund:…}`), aldrig på `:root` |
| Ingen global reset | Ingen `*{margin:0}`, ingen `body`-regler, intet der rammer `h1-h6` eller `a` globalt |
| Navnerum | Præfiks alle klasser (fx `tc-`), eller følg værtens egen navnekonvention hvis den findes |
| Lav specificitet | Pak basisregler i `:where()`, så værten kan overskrive uden `!important` |
| Scopede lyttere | Bind hændelser til komponentroden, ikke til `document`. Ellers reagerer komponenten på klik i resten af appen |
| Ingen indlejrede skrifter | Komponenten arver værtens typografi. En base64-font i en komponent er 30 kB, der lægges oven i en font, brugeren allerede har hentet |
| Leveranceformat | Markup, CSS og JS adskilt i den form værten bruger (partial, komponentfil, template) - ikke ét `<style>`-tag i body |
| Verifikation | Testes i værtens miljø med værtens øvrige CSS indlæst. En komponent, der kun er set i en tom fil, er ikke testet |

Sådan ser det ud. Samme kort som i afsnit 3, men bygget til at lande i en fremmed side:

```html
<article class="tc-kort">
  <h3 class="tc-kort__titel">…</h3>
  <p class="tc-kort__tekst">…</p>
  <button class="tc-kort__knap" type="button" data-tc-fold>Læs mere</button>
</article>
```

```css
/* Alt bor under komponentroden. Ingen :root, ingen elementselektor uden præfiks. */
.tc-kort{
  isolation:isolate;                        /* egen stablingskontekst, se fælde 2 */
  --tc-bund:   var(--surface, #f6f7f9);     /* værtens token først, egen værdi som fallback */
  --tc-pad:    var(--space-4, 1rem);
  --tc-radius: var(--radius-md, 12px);
}
:where(.tc-kort){
  background:var(--tc-bund); padding:var(--tc-pad); border-radius:var(--tc-radius);
}
:where(.tc-kort__titel){margin:0 0 .5em; font-size:1.25em}  /* em: arver værtens skala */
```

```js
// Roden, ikke document. Ellers reagerer komponenten på klik i resten af appen.
document.querySelectorAll('.tc-kort').forEach(rod=>{
  rod.addEventListener('click', e=>{
    if(!e.target.closest('[data-tc-fold]')) return;
    rod.classList.toggle('tc-kort--aaben');
  });
});
```

Tre ting går galt hver gang i leverance B:

1. **`rem` mod værtens rodskala.** Værten kan have sat `html{font-size:62.5%}`, og så bliver hele
   komponenten 62,5 procent af den tiltænkte størrelse. Brug `em` inde i komponenten, og kun `rem`
   hvor du bevidst vil have en absolut størrelse uafhængigt af konteksten.
2. **`z-index` i konkurrence med værten.** Sæt `isolation:isolate` på roden og hold interne
   `z-index` under 10. Skal noget ligge over hele siden, bruger du `<dialog>` eller `popover` -
   ikke et højere tal end værtens højeste.
3. **`var()` uden fallback.** `var(--surface)` giver en tom værdi, hvis værten ikke har det token,
   og komponenten mister sin baggrund uden en eneste fejlmeddelelse. Fallback er obligatorisk.

Rækkefølgen: find værtens tokens først (deres stylesheet, eller `:root` i inspektoren), spørg
kunden når navnene er uklare, og opret først egne tokens for det, værten reelt ikke har.

Resten af denne fil gælder begge leverancer med to undtagelser: afsnit 1 (skelettet, print og mail)
og afsnit 2 (indlejring af skrifter) er kun for A. Alt om tokens, layout, tastatur, validering,
tilstande og fejlhåndtering gælder også B - en komponent i en fremmed side skal kunne betjenes med
tastatur og have en fejltilstand på nøjagtig samme måde.

## 1. Skelettet

Kopiér dette og fyld ud. Rækkefølgen er ikke tilfældig: metatags før alt andet,
al CSS i ét `<style>` i `<head>` (så første maling er korrekt uden flash),
alt JS i ét `<script>` lige før `</body>` (så DOM'en findes, når det kører).

```html
<!doctype html>
<html lang="da">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="color-scheme" content="light dark">
<title>Konkret sidetitel - Virksomhed</title>
<meta name="description" content="Én sætning, 120-155 tegn, om hvad siden tilbyder.">

<!-- Deling. og:image kræver en absolut URL og et rigtigt billede i 1200x630 px.
     Findes billedet ikke endnu, står linjen med en kommentar om, hvad kunden skal indsætte. -->
<meta property="og:type" content="website">
<meta property="og:url" content="https://virksomhed.dk/side">
<meta property="og:title" content="Samme løfte som <title>, må gerne være kortere">
<meta property="og:description" content="Samme sætning som description.">
<meta property="og:image" content="https://virksomhed.dk/del/side.png">
<meta name="twitter:card" content="summary_large_image">

<link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 32 32'><text y='26' font-size='28'>■</text></svg>">

<!-- Eneste script i head. Sætter .js FØR første maling, så no-JS-layoutet aldrig blinker forbi. -->
<script>document.documentElement.classList.add('js')</script>
<style>
  /* 1. tokens  2. reset  3. base  4. layout  5. komponenter  6. utilities  7. print  8. reduced-motion */
</style>
</head>
<body>
<a class="skip" href="#indhold">Spring til indhold</a>

<header class="site-head">
  <a class="brand" href="/">Virksomhed</a>
  <nav aria-label="Hovedmenu">
    <ul role="list"> … </ul>
  </nav>
</header>

<main id="indhold">
  <section aria-labelledby="hero-h">
    <h1 id="hero-h">…</h1>
  </section>
  …
</main>

<footer class="site-foot">
  <p>© <span data-aar></span> Virksomhed. CVR 12345678.</p>
</footer>

<script>
/* Al adfærd. Ingen inline onclick nogen steder i dokumentet. */
</script>
</body>
</html>
```

Den ene linje i `<head>` er undtagelsen fra "alt JS før `</body>`". Den sætter `.js`, før noget
males, så CSS'en kan skjule det, der kun giver mening med JS, uden at no-JS-varianten blinker forbi
først. Den er under 60 bytes, den rører ikke DOM'en, og den er derfor ikke blokerende JS i
kontraktens forstand. Alt andet script bliver nede i bunden.

`og:image` peger på en ekstern URL, men den hentes af Facebook, LinkedIn og Slack - ikke af
browseren ved load. Den bryder derfor ikke nul-requests-kravet. Alle fire og-tags er obligatoriske,
når siden nogensinde skal deles; er den et internt værktøj, skriver du det i afleveringen i stedet.

### Regler for skelettet

- `lang="da"` altid. Skærmlæsere udtaler dansk tekst som engelsk uden det, og automatisk orddeling virker ikke.
- `<title>` er konkret og unik. Aldrig "Forside" eller "Dokument".
- Præcis ét `<h1>` pr. side. Overskriftsniveauer springes ikke over (h2 → h4 er en fejl).
- `<main>` findes én gang og indeholder alt sideindhold. Skip-linket peger på dens id.
- Sektioner får `aria-labelledby` mod deres egen overskrift, ellers er de usynlige i landmark-oversigten.
- `<ul role="list">` fordi Safari fjerner listesemantik, når man sætter `list-style: none`.
- Ingen `onclick=""`, `onchange=""` eller `style=""` i markup. Adfærd i scriptet, udseende i CSS.
- `<div>` bruges kun, når intet semantisk element passer. `<section> <article> <aside> <nav> <figure> <details> <dialog> <button> <table>` findes - brug dem.

### Skip-link (obligatorisk, 8 linjer)

Skip-linket er ikke betinget af, hvor mange menupunkter der er. Det koster otte linjer, det er
det første Tab-stop, og en tastaturbruger skal ikke tabbe gennem hovedmenuen på hver eneste side
for at nå indholdet.

```css
.skip{position:absolute;left:-9999px;top:0;padding:.75rem 1rem;background:var(--farve-flade);color:var(--farve-tekst);z-index:100}
.skip:focus{left:0}
```

### Print og PDF

Skal fladen kunne printes eller gemmes som PDF (tilbud, program, kontaktside, prisliste), tilføjer
du dette blok. Skal den ikke, skriver du eksplicit i afleveringen, at print er uden for scope -
så er det et valg og ikke en forglemmelse.

```css
@media print{
  .skip,.site-head nav,.menu-knap,.filtre,dialog,.kun-skaerm{display:none}
  body{background:#fff;color:#000}
  a[href^="http"]::after{content:" (" attr(href) ")";font-size:.85em;word-break:break-all}
  a[href^="#"]::after,a[href^="mailto"]::after{content:""}  /* ankre og mails: URL'en er støj */
  details{display:block}
  details > *{display:revert}
  h2,h3{break-after:avoid}
  figure,table,.kort{break-inside:avoid}
  thead{display:table-header-group}     /* tabelhoved gentages på hver side */
  tr{break-inside:avoid}
  .kun-print{display:revert}            /* fx CVR, kontaktlinje, dato for udskrift */
}
@page{margin:18mm 16mm}
```

Foldet indhold skal foldes ud på print. En printet FAQ, hvor kun overskrifterne står, er ubrugelig.

Fem ting, der kun ses ved faktisk at printe til PDF, så gør det:

1. Mørkt tema må aldrig følge med i printet. `body{background:#fff;color:#000}` er ikke pynt.
2. Det, kunden skal bruge på papir, skal være der: firmanavn, CVR, dato, telefonnummer og pris.
   Ligger de kun i et sidehoved, du skjuler, er printet ubrugeligt.
3. Sidetal og sidehoved styres af browserens printdialog, ikke af dig. Skriv ikke dit eget.
4. Flerspaltet layout og `position:sticky` opfører sig uforudsigeligt på papir - fald tilbage til
   én spalte i printblokken.
5. Baggrundsfarver printes kun, hvis brugeren slår det til. Bær aldrig information i en flade
   uden også at have en kant eller en tekst.

### Når leverancen skal sendes som mail

HTML-mail er en anden motor end en side. Gmail, Outlook og Apple Mail understøtter ikke det, denne
fil ellers bygger på. Skal der leveres en mail (tilbud, ordrebekræftelse, nyhedsbrev), bygger du den
som en selvstændig fil efter reglerne herunder - ikke som en variant af siden.

| Emne | I mail |
|---|---|
| Layout | `<table role="presentation">` med bredde i px. Ingen grid, ingen flex, ingen `position` |
| Bredde | 600 px fast, og indholdet skal stadig kunne læses ved 320 px |
| CSS | Inline `style=""` på hvert element. En `<style>`-blok i `<head>` overlever ikke alle klienter |
| Custom properties | Virker ikke. Skriv profilens hex-koder direkte ind |
| Skrifter | Kun web-sikre stakke. Ingen `@font-face`, ingen indlejret skrift |
| Billeder | Absolutte URL'er, `width` og `height` som attributter, og et `alt` der bærer beskeden - billeder er blokeret som standard hos mange |
| Mørkt tema | Klienterne inverterer selv, og de gør det forskelligt. Undgå hvid tekst på hvid flade efter invertering, og test i mindst Outlook og Apple Mail |
| Knap | En tabelcelle med baggrundsfarve og et `<a>` med padding. Ingen `<button>` |
| Baggrundsbilleder | Bruges ikke. Outlook viser dem ikke |
| Afmelding | Ved markedsføring er et synligt afmeldingslink i bunden et lovkrav, ikke en detalje |

Reglen om nul eksterne requests gælder ikke i mail: billederne SKAL ligge på en offentlig URL.
Er du i tvivl om, om du bygger en side eller en mail, spørger du kunden, før du skriver en linje -
de to leverancer kan ikke laves om til hinanden bagefter.

## 2. Ingen eksterne afhængigheder

### Skrifter

**Standard: profilens skrifter indlejres i filen.** Typografien er halvdelen af, om fladen ligner
denne virksomhed eller en skabelon, og en systemskriftstak er det tydeligste tegn på, at ingen har
taget stilling. Auditten i `anti-slop-review.md` behandler den udtrykkeligt som et fund.

Systemstakken er undtagelsen, ikke udgangspunktet. Den er det rigtige valg til interne værktøjer,
administrationsflader og alt hvor hastighed og bytes vejer tungere end karakter. Vælger du den,
skriver du i afleveringen hvorfor - ét ord er nok ("internt værktøj"), men valget skal være synligt.

```css
/* Undtagelsen: systemstak. Kun med begrundelse i afleveringen. */
--skrift-brod: ui-sans-serif, system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
--skrift-serif: ui-serif, Georgia, "Times New Roman", serif;
--skrift-mono: ui-monospace, SFMono-Regular, "SF Mono", Menlo, Consolas, monospace;
```

Indlejring som base64 i `@font-face`. Regler:

1. Kun `woff2`.
2. Kun de vægte, designet faktisk bruger. Maks. 3 filer (fx 400, 600 og én display-vægt).
3. Subset til latin + `æøåÆØÅ` inden konvertering. En usubsettet fil er 80-150 kB, en subsettet 15-30 kB.
4. Maks. 40 kB pr. fil efter base64. Er den større, subsetter du hårdere. Kan den stadig ikke være der, dropper du skriften og bruger fallback-stakken fra profilen - og skriver det i afleveringen.
5. `font-display: swap` altid.
6. Fallback-stakken i `font-family` skal have nogenlunde samme bredde og x-højde som den rigtige skrift, ellers hopper layoutet, når skriften lander.

```css
@font-face{
  font-family:"Egen";
  src:url(data:font/woff2;base64,d09GMgABAAAA…) format("woff2");
  font-weight:400;font-style:normal;font-display:swap;
}
```

Aldrig `<link href="https://fonts.googleapis.com/...">`. Det er en ekstern request, en GDPR-diskussion og et brud på leverancekontrakten.

**Kontrollér efter indlejring, at skriften faktisk bruges.** Slå den beregnede `font-family` op
i inspektoren på et rigtigt tekstelement, ikke i CSS-kilden. En stavefejl i `font-family` giver
en side, der ser fuldstændig normal ud og kører på fallback.

### Ikoner

Inline SVG-sprite øverst i `<body>`, brugt med `<use>`. Ingen ikonfont, intet CDN.

```html
<svg hidden aria-hidden="true">
  <symbol id="i-pil" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round">
    <path d="M5 12h14M13 6l6 6-6 6"/>
  </symbol>
</svg>

<!-- dekorativt ikon ved siden af tekst -->
<svg class="ikon" aria-hidden="true"><use href="#i-pil"/></svg>

<!-- ikon der ER knappens eneste indhold -->
<button class="knap-ikon" aria-label="Næste">
  <svg class="ikon" aria-hidden="true"><use href="#i-pil"/></svg>
</button>
```

```css
.ikon{width:1em;height:1em;flex:none}
```

`stroke="currentColor"` gør, at ikonet arver tekstfarven og dermed også temaskift og hover-tilstand automatisk.
Stregtykkelse pr. ikonstørrelse og optisk centrering står i `polering.md` afsnit 6.

### Billeder

- Altid `width` og `height` som attributter, i billedets EGNE pixels. De to tal er ikke en
  størrelse, de er et sideforhold, som browseren regner videre på.
- `loading="lazy"` på alt under folden, `fetchpriority="high"` kun på ét hero-billede.
- `alt` er indholdsbeskrivende eller tom (`alt=""`) for ren dekoration. Aldrig "billede af".
- Har du ikke rigtige billeder: brug CSS-genererede flader (gradient, mønster, stor typografi) frem for gråt pladsholder-rektangel med et kamerasymbol. Pladsholdere er det tydeligste tegn på et halvfærdigt design.

### Layoutstabilitet

Indhold, der hopper, mens siden loader, er den mest irriterende fejl, en bruger kan møde, og den
eneste, ingen opdager ved at kigge på et færdigt skærmbillede. Budgettet er **CLS under 0,1**.
To ting forårsager stort set al hoppen: billeder uden reserveret plads og skrifter, der lander sent.

**Billeder og alt andet med en ukendt højde**

```css
/* Browseren udleder selv sideforholdet af width- og height-attributterne og reserverer
   pladsen. Det er `height:auto` i reset'et, der holder reservationen i live, når CSS'en
   sætter bredden. Fjerner du den linje, får du hoppet tilbage. */

/* Når kilden ikke kender sine egne mål (billede fra JS, indlejret kort, video): */
.medie{aspect-ratio:16/9;background:var(--farve-flade)}
.medie > img,.medie > iframe{width:100%;height:100%;object-fit:cover;border:0}
```

- Et element, hvis indhold kommer fra JS (kort, annonce, indlejret video, grafik), får en
  minimumshøjde eller et `aspect-ratio` FØR indholdet er der. Ellers er tomrummet nul, og alt
  under det rykker, når det fyldes.
- Indsæt aldrig noget over eksisterende indhold efter load. Cookiebanner, kampagnebånd og
  fejlbeskeder lægges enten i dokumentet fra start eller oven på indholdet (`position:fixed`).
- Lister med `content-visibility:auto` skal have `contain-intrinsic-size` (se afsnit 7), ellers
  hopper scrollbaren, mens man scroller.

**Skrifter**

`font-display:swap` betyder, at teksten vises i fallback-skriften først og skifter, når den
rigtige lander. Det skift må ikke flytte noget. Mål fallbacken ind, i stedet for at håbe:

```css
/* Fallback med justerede metrikker: samme plads som den rigtige skrift, fra første maling. */
@font-face{
  font-family:"Egen fallback";
  src:local("Arial");
  size-adjust:104%;          /* rammer x-højden */
  ascent-override:92%;
  descent-override:24%;
  line-gap-override:0%;
}
:root{ --skrift-brod:"Egen", "Egen fallback", Arial, sans-serif; }
```

Sådan finder du tallene: sæt en overskrift og et afsnit op, mål højden af blokken med den rigtige
skrift, tving fallbacken frem (omdøb `font-family` midlertidigt), og justér `size-adjust` i skridt
på 2 procent, til de to højder er ens. Det tager fem minutter og fjerner hele hoppet.

- `font-display:swap` er standard. `optional` er alternativet, når hoppet er vigtigere end
  skriften: browseren bruger så fallbacken i denne visning og gemmer den rigtige til næste gang.
  Vælg `optional` til lange tekstsider, `swap` til alt andet.
- Indlejrede base64-skrifter (afsnittet ovenfor) har ingen ventetid og dermed intet hop. Det er
  endnu en grund til at indlejre frem for at hente.
- `text-wrap:balance` på overskrifter kan ændre antal linjer, når skriften skifter. Test
  overskrifterne specifikt.

**Sådan måler du det**

Åbn siden med tom cache, sæt netværket til langsom 3G i browserens netværksfane, og genindlæs
mens du ser på fladen. Hopper noget som helst, er det ikke færdigt. Kør den samme prøve på 375 px
bredde - hop er næsten altid værst på mobil, hvor der er mindre plads at absorbere det i.

## 3. CSS-arkitektur

### Custom properties er eneste sandhed

Alle farver, skriftstørrelser, afstande, radier, skygger og tider defineres én gang i `:root`.
Komponenter må aldrig indeholde en rå værdi. Skriver du `padding: 18px` eller `#3b5bdb` inde i en
komponentregel, har du brudt systemet - læg værdien i en token, eller brug den nærmeste eksisterende.

Undtagelser (må stå rå i komponenter): `0`, `1px` hårlinjer, `100%`, `1em`, `50%` og
`translate`-værdier i motion.

### Navngivning

Dansk, med bindestreg, i mønsteret `--kategori-rolle[-variant]`. Rolle, ikke udseende.

```css
:root{
  /* farve - rolle, ikke navn. "--farve-blaa" dør, når profilen skifter accent. */
  --farve-bund:        #fff;
  --farve-flade:       #f6f7f9;   /* kort, paneler */
  --farve-flade-hoej:  #fff;      /* flade der ligger over --farve-flade */
  --farve-flade-daempet:#eceef2;  /* dæmpet flade: skeleton, deaktiveret fyld */
  --farve-tekst:       #14161a;
  --farve-tekst-svag:  #545a63;   /* skal stadig klare 4,5:1 mod --farve-bund */
  --farve-tekst-mat:   #666c75;   /* svageste tekstniveau: placeholder, hjælpetekst.
                                     Klarer 4,5:1 mod bund, flade OG flade-daempet */
  --farve-kant:        #e2e5ea;
  --farve-kant-staerk: #c7ccd4;   /* kant der skal ses, fx valgt tilstand */
  --farve-accent:      #0f4c81;
  --farve-accent-hover:#0d4372;   /* accent under markøren */
  --farve-accent-maerk:#0b3a63;   /* accent i trykket/valgt tilstand */
  --farve-accent-tekst:#fff;      /* tekst PÅ accent */
  --farve-fokus:       #0a58ca;
  --farve-fejl:        #b3261e;
  --farve-ok:          #1b6b3a;
  --farve-advarsel:    #8a5300;   /* delvist svar, offline, "2 af 10 mangler" */

  /* skrift - kun fallback-stakken står her, så blokken virker alene. Standarden er
     profilens indlejrede skrifter: erstat navnene efter afsnit 2, behold tokennavnene. */
  --skrift-brod:  ui-sans-serif, system-ui, -apple-system, "Segoe UI", Roboto, Arial, sans-serif;
  --skrift-serif: ui-serif, Georgia, "Times New Roman", serif;
  --skrift-mono:  ui-monospace, SFMono-Regular, Menlo, Consolas, monospace;

  /* type - clamp giver flydende skala uden breakpoints */
  --type-mikro:  .8125rem;
  --type-brod:   clamp(1rem, .96rem + .2vw, 1.0625rem);
  --type-mellem: clamp(1.25rem, 1.1rem + .6vw, 1.5rem);
  --type-h3:     clamp(1.35rem, 1.15rem + .9vw, 1.75rem);
  --type-h2:     clamp(1.75rem, 1.35rem + 1.8vw, 2.5rem);
  --type-h1:     clamp(2.25rem, 1.6rem + 3.2vw, 4rem);
  --linje-taet:  1.1;   /* overskrifter */
  --linje-brod:  1.6;   /* brødtekst */

  /* spacing - fast skala fra profilen, ingen tal udenfor */
  --plads-1:.25rem; --plads-2:.5rem;  --plads-3:.75rem; --plads-4:1rem;
  --plads-6:1.5rem; --plads-8:2rem;   --plads-12:3rem;  --plads-16:4rem;
  --plads-sektion: clamp(3rem, 2rem + 6vw, 8rem);

  /* form - radieskalaen ejes af designsystem.md §5 og §7. Kopiér trinene derfra;
     opfind ikke et sjette trin her. */
  --radius-lille:6px; --radius:10px; --radius-stor:16px;
  --radius-xl:24px;   --radius-fuld:999px;
  --kant: 1px solid var(--farve-kant);

  /* skygge - lagdelt, ikke én generisk box-shadow. Farvet, ikke ren sort. Doktrinen og
     skalaen ejes af polering.md §5; de tre trin herunder er den skala i motorens navne. */
  --skygge-farve: 220 40% 12%;
  --skygge-1:0 1px 2px hsl(var(--skygge-farve)/.06), 0 1px 3px hsl(var(--skygge-farve)/.05);
  --skygge-2:0 1px 2px hsl(var(--skygge-farve)/.06), 0 4px 8px hsl(var(--skygge-farve)/.06);
  --skygge-3:0 1px 2px hsl(var(--skygge-farve)/.06), 0 8px 16px hsl(var(--skygge-farve)/.08),
             0 24px 48px hsl(var(--skygge-farve)/.06);

  /* motion - navne, værdier og brugsregler ejes af motion.md §2. Blokken herunder er
     den skala i sin helhed, kopieret uændret. Tilføj aldrig en varighed, en kurve,
     en forsinkelse eller en flytteafstand, der ikke står dér. */
  --tid-mikro:  90ms;   /* farve, kantfarve, ikon-swap */
  --tid-hurtig: 150ms;  /* hover, fokusring, checkbox, tooltip */
  --tid-basis:  240ms;  /* dropdown, accordion, fane-skift, filterresultat */
  --tid-rolig:  320ms;  /* modal, drawer, toast, sidetransition */
  --tid-fjeder: 420ms;  /* KUN sammen med en fjederkurve, se motion.md §2 */
  --tid-stor:   520ms;  /* ét hero-moment pr. flade, intet andet */
  --ease-ind:   cubic-bezier(0, 0, .2, 1);      /* kommer ind: bremser op */
  --ease-ud:    cubic-bezier(.4, 0, 1, 1);      /* går ud: accelererer væk */
  --ease-begge: cubic-bezier(.4, 0, .2, 1);     /* flytter sig og bliver */
  --ease-skarp: cubic-bezier(.2, 0, 0, 1);      /* præcist, teknisk */
  --ease-blod:  cubic-bezier(.34, 1.3, .64, 1); /* overshoot - højst ét sted, se motion.md */
  --forsinkelse-stagger: 55ms;   /* mellem elementer i en liste */
  --forsinkelse-svar:    0ms;    /* feedback på klik: ALTID nul */
  --forsinkelse-tooltip: 400ms;  /* før tooltip vises ved hover */
  --forsinkelse-toast:   4000ms; /* før toast forsvinder af sig selv */
  --flyt-lille:  4px;   /* feedback, hover-løft */
  --flyt-mellem: 12px;  /* indgang af element */
  --flyt-stor:   24px;  /* panel, modal */
  /* Fjederkurverne --ease-fjeder-kvik og --ease-fjeder-rolig er lange linear()-
     definitioner. Hent dem fra motion.md §2, når fladen faktisk bruger en fjeder. */

  /* mål */
  --maal-bredde: 72rem;      /* sidens maksimale indholdsbredde */
  --maal-tekst: 65ch;        /* læsbar tekstlængde */
}
```

### Oversættelse fra de andre referencer

De øvrige filer skriver deres eksempler i rollenavnene fra `designsystem.md` §7. Tabellen
herunder dækker hvert eneste af de navne, pakken faktisk bruger - plus de mest almindelige
navne fra fremmed kode. Oversæt, når du kopierer. **En `var()` uden dækning i tokenblokken
giver et ufarvet element eller en manglende fokusring, ikke en fejlmeddelelse.**

| Set i en anden reference eller i fremmed kode | Her |
|---|---|
| `--bg`, `--surface`, `--surface-raised` | `--farve-bund`, `--farve-flade`, `--farve-flade-hoej` |
| `--bg-subtle`, `--surface-muted` | `--farve-flade-daempet` |
| `--text`, `--muted`, `--text-muted` | `--farve-tekst`, `--farve-tekst-svag` |
| `--text-faint` | `--farve-tekst-mat` |
| `--accent`, `--accent-maerk` | `--farve-accent`, `--farve-accent-maerk` |
| `--accent-hover`, `--accent-active` | `--farve-accent-hover`, `--farve-accent-maerk` |
| `--paa-accent`, `--on-accent`, `--text-on-accent` | `--farve-accent-tekst` |
| `--fokus`, `--focus`, `--focus-ring` | `--farve-fokus` |
| `--danger`, `--ok`, `--warn` | `--farve-fejl`, `--farve-ok`, `--farve-advarsel` |
| `--kant`, `--border`, `--kant-staerk`, `--border-strong` | `--farve-kant` (bemærk: `--kant` her er hele `border`-genvejen), `--farve-kant-staerk` |
| `--radius-sm`, `--radius-md`, `--radius-lg`, `--radius-xl`, `--radius-full` | `--radius-lille`, `--radius`, `--radius-stor`, `--radius-xl`, `--radius-fuld` |
| `--radius-card` | `--radius` |
| `--shadow-sm/md/lg`, `--hoejde-1/2/3`, `--elevation-*` | `--skygge-1/2/3` |
| `--space-1/2/3/4/6/8/12/16`, `--space-24/32/40` | `--plads-1/2/3/4/6/8/12/16` (trin over 16 findes ikke her: brug `--plads-sektion`) |
| `--space-section`, `--card-padding`, `--gutter` | `--plads-sektion`, `--plads-6`, `--plads-4` |
| `--measure`, `--container` | `--maal-tekst`, `--maal-bredde` |
| `--text-xs/sm/base/lg/xl`, `--text-2xl/3xl/4xl`, `--text-hero` | `--type-mikro`, `--type-brod`, `--type-mellem`, `--type-h3`, `--type-h2`, `--type-h1` (motorens skala har seks trin, ikke ni: vælg det nærmeste og hold dig til det) |
| `--leading-body`, `--leading-heading`, `--leading-display` | `--linje-brod`, `--linje-taet` |
| `--font-body`, `--font-display`, `--font-mono` | `--skrift-brod`, `--skrift-serif`, `--skrift-mono` |
| `--motion-hurtig`, `--duration-fast` | `--tid-hurtig` |
| `--motion-instant` | `--tid-mikro` |
| `--tid` (uden endelse), `--duration-normal` | `--tid-basis` |
| `--ease` (uden endelse), `--ease-out` | Vælg efter retning: `--ease-ind` når noget kommer ind, `--ease-ud` når det går ud, `--ease-begge` når det flytter sig og bliver |

Skal du lime meget kode ind på én gang, må du lægge en broblok øverst i stylesheetet og slette de
linjer, du ikke bruger. Broen er midlertidig: står den stadig ved aflevering, har du to navnesprog
i samme fil, og den næste, der retter en farve, retter kun det halve.

```css
:root{ --accent:var(--farve-accent); --paa-accent:var(--farve-accent-tekst);
       --fokus:var(--farve-fokus);   --accent-maerk:var(--farve-accent-maerk);
       --kant-staerk:var(--farve-kant-staerk);
       --hoejde-1:var(--skygge-1); --hoejde-2:var(--skygge-2); --hoejde-3:var(--skygge-3); }
```

### Komponenter arver, de hardkoder ikke

Giv hver komponent sine egne lokale variabler, der peger på globale tokens. Så kan en variant
ændres med én linje i stedet for at overskrive fem egenskaber.

```css
.kort{
  --kort-bund: var(--farve-flade);
  --kort-pad: var(--plads-6);
  background: var(--kort-bund);
  padding: var(--kort-pad);
  border-radius: var(--radius);
  border: var(--kant);
}
.kort--fremhaevet{ --kort-bund: var(--farve-accent); color: var(--farve-accent-tekst); }
.kort--taet{ --kort-pad: var(--plads-4); }
```

Ligger der noget rundt inde i kortet, udregnes dets radius efter formlen i `polering.md` afsnit 1.

### Mørkt tema

Definér den lyse palet på bare `:root`. Overskriv kun tokens - aldrig komponentregler.
Blokken skal skrives ud to gange: én gang til systemindstillingen og én gang til en manuel
temaknap, ellers vinder knappen kun den ene vej.

```css
@media (prefers-color-scheme: dark){
  :root:not([data-tema="lys"]){
    --farve-bund:#0f1114; --farve-flade:#171a1f; --farve-flade-hoej:#1e222a;
    --farve-flade-daempet:#22262e;
    --farve-tekst:#f2f4f7; --farve-tekst-svag:#a8b0ba; --farve-tekst-mat:#8b939d;
    --farve-kant:#2a2f37; --farve-kant-staerk:#3b424d;
    --farve-accent:#5b9bd8; --farve-accent-hover:#6da8de; --farve-accent-maerk:#7fb4e5;
    --farve-accent-tekst:#0f1114;
    --farve-fokus:#8ab4f8; --farve-fejl:#f2857c; --farve-ok:#6fc492; --farve-advarsel:#e0a860;
    --ikon-invert:1;
  }
}
:root[data-tema="moerk"]{
  --farve-bund:#0f1114; --farve-flade:#171a1f; --farve-flade-hoej:#1e222a;
  --farve-flade-daempet:#22262e;
  --farve-tekst:#f2f4f7; --farve-tekst-svag:#a8b0ba; --farve-tekst-mat:#8b939d;
  --farve-kant:#2a2f37; --farve-kant-staerk:#3b424d;
  --farve-accent:#5b9bd8; --farve-accent-hover:#6da8de; --farve-accent-maerk:#7fb4e5;
  --farve-accent-tekst:#0f1114;
  --farve-fokus:#8ab4f8; --farve-fejl:#f2857c; --farve-ok:#6fc492; --farve-advarsel:#e0a860;
  --ikon-invert:1;
}
```

`--ikon-invert` skal stå i BEGGE blokke. Står den kun under `[data-tema="moerk"]`, er
kalenderikonet i et datofelt sort på mørk bund for alle, der bare har mørkt tema i systemet og
aldrig rører temaknappen. Det gælder ethvert token: findes det i den ene blok, findes det i begge.

Værdierne ovenfor er eksempler på formen, ikke en palet. Hent de rigtige fra `designprofil.md`
og mål kontrasten i begge temaer.

Tre ting går galt hver gang:

1. **Skygger forsvinder i mørk visning.** Sort på næsten sort er usynligt. Erstat med en lys hårlinje: `box-shadow: inset 0 1px 0 hsl(0 0% 100% / .06)` plus en svag ydre skygge.
2. **Mættet accent vibrerer mod mørk bund.** Dæmp den 10-20 procent, og tjek om teksten på accenten skal skifte fra hvid til mørk.
3. **En farve, der kun findes inde i `@media`-blokken.** Så mangler den i lys visning. Alle roller defineres på bare `:root` først.

Sæt altid `background` og `color` eksplicit på `body`. En gennemsigtig body arver værtens baggrund
og ødelægger kontrasten.

### Rækkefølge i stylesheetet

1. `:root`-tokens
2. Reset (under 15 linjer, se nedenfor)
3. Basis-elementer (`body, h1-h6, p, a, button, input, table`)
4. Layout-hjælpere (`.wrap`, `.stak`, `.gitter`)
5. Komponenter
6. Få utilities (`.visuelt-skjult`, `.midt`, `.tekstmaal`)
7. `@media print`
8. `@media (prefers-reduced-motion: reduce)` - allersidst

**Ingen `!important` i komponentregler.** Undtagelsen er reduced-motion-blokken, hvor den er
nødvendig: den skal overskrive enhver varighed, uanset hvor specifikt den er sat, og den er
derfor også grunden til, at blokken ligger til sidst. Ingen selektorer dybere end to niveauer.
Ingen id-selektorer til styling.

### Minimalt reset

```css
*,*::before,*::after{box-sizing:border-box}
*{margin:0}
html{-webkit-text-size-adjust:100%}
body{min-height:100svh;background:var(--farve-bund);color:var(--farve-tekst);
     font:var(--type-brod)/var(--linje-brod) var(--skrift-brod);
     text-rendering:optimizeLegibility;hyphens:auto;overflow-wrap:break-word}
img,svg,video{display:block;max-width:100%;height:auto}
input,button,textarea,select{font:inherit;color:inherit}
h1,h2,h3{line-height:var(--linje-taet);text-wrap:balance}
p,li{text-wrap:pretty;max-width:var(--maal-tekst)}
:focus-visible{outline:3px solid var(--farve-fokus);outline-offset:2px;border-radius:2px}
```

`text-wrap: balance` på overskrifter og `pretty` på brødtekst fjerner enlige ord på sidste linje.
Det er to linjer CSS og den billigste kvalitetsforskel i hele filen. `hyphens: auto` virker kun,
fordi `lang="da"` står i `<html>` - uden det deler browseren efter engelske regler.

## 4. Layout

### Grid eller flex

| Situation | Vælg |
|---|---|
| To dimensioner - rækker OG kolonner skal flugte | `grid` |
| Sidens overordnede skelet | `grid` |
| Kortoversigt, der skal ombryde af sig selv | `grid` med `auto-fit` |
| En række elementer, der bare skal ligge ved siden af hinanden | `flex` |
| Indhold, hvis bredde bestemmes af indholdet selv (knapper, tags, chips) | `flex` med `wrap` |
| Lodret stak med ens afstand | `flex` kolonne + `gap`, eller `.stak` |
| Noget skal skubbes ud i højre side | `flex` + `margin-inline-start:auto` |

Brug altid `gap`. Aldrig `margin` mellem søskende til at lave afstand i et grid eller flex.

### Responsivt uden en bunke breakpoints

Fire teknikker dækker næsten alt. Brug dem, før du overhovedet overvejer en breddebaseret media query.

**1. Selvombrydende gitter.** Ingen breakpoints, virker fra 320 til 2560 px:

```css
.gitter{
  display:grid;
  gap:var(--plads-6);
  grid-template-columns:repeat(auto-fit, minmax(min(18rem,100%), 1fr));
}
```

`min(18rem,100%)` er det, der forhindrer vandret overløb på små skærme. Uden den overflower gitteret på 320 px.

**2. Flydende værdier.** `clamp(min, foretrukken, maks)` til typografi og sektionsafstand -
allerede i tokens ovenfor. Skriftstørrelser skal aldrig springe ved et breakpoint.

**3. Indholdsstyret centrering.** Én wrapper, brugt overalt:

```css
.wrap{width:min(100% - 2*var(--plads-4), var(--maal-bredde));margin-inline:auto}
```

**4. Container queries, når komponenten skal reagere på sin egen plads.** Det samme kort ligger
både i en bred hovedspalte og i en smal sidebar. En media query kender kun vinduets bredde og
rammer derfor forkert i den ene af dem.

```css
.kort-vaert{container-type:inline-size}
@container (width > 30rem){
  .kort{display:grid;grid-template-columns:12rem 1fr;gap:var(--plads-6)}
}
```

Herefter må du bruge **højst to breddebaserede media queries** i hele filen, og kun til rigtige
layoutskift (fx sidebar bliver til stak, menu bliver til burger). Feature- og præferencequeries
tæller ikke med: `@media (hover: hover)`, `@media (prefers-reduced-motion)`,
`@media (prefers-color-scheme)`, `@media print` og alle `@container` er ikke breakpoints og har
ingen kvote. Sæt breakpointet på indhold, ikke på enheder: brug det punkt, hvor designet faktisk knækker.

```css
@media (width < 48em){ .side-layout{grid-template-columns:1fr} }
```

Test altid på 320, 375, 768 og 1440 px. Ingen vandret scroll på nogen af dem. Brede tabeller,
kodeblokke og diagrammer lægges i en egen `overflow-x:auto`-beholder - siden selv scroller aldrig sidelæns.

### Bevidst gitterbrud

Et symmetrisk kortgitter uden brud er det tydeligste AI-fingeraftryk. Bryd gitteret på præcis
ét eller to steder pr. flade - flere, og det bliver støj. **Denne tælling er den eneste for
gitterbrud på fladen**, og den dækker også fremhævede kort og alt andet, der bevidst falder ud
af mønsteret. `designsystem.md` taler et andet sted om 2-3 modige valg; det er noget andet - dét
handler om skala, farveflader og typografisk mod, ikke om at bryde gitterets rytme. De to kvoter
lægges ikke sammen og trækkes ikke fra hinanden.

Sikre metoder:

```css
/* Ét element fylder to spor og bliver visuelt hovedpersonen */
.gitter > .fremhaev{ grid-column: span 2 }
@media (width < 48em){ .gitter > .fremhaev{ grid-column: auto } }

/* Fuldbredde-bånd inde i en centreret spalte, uden ekstra wrapper */
.side{ display:grid; grid-template-columns:
        [fuld-start] minmax(var(--plads-4),1fr)
        [indhold-start] min(var(--maal-bredde),100% - 2*var(--plads-4)) [indhold-slut]
        minmax(var(--plads-4),1fr) [fuld-slut] }
.side > *{ grid-column: indhold }
.side > .baand{ grid-column: fuld }

/* Bevidst overlap: to elementer i samme celle, forskudt */
.overlap{ display:grid }
.overlap > *{ grid-area:1/1 }
.overlap > .foran{ transform:translate(var(--plads-8), calc(var(--plads-8) * -1)) }
@media (width < 48em){ .overlap > .foran{ transform:none } }
```

Regler for brud: bruddet skal falde tilbage til noget roligt under 48em, det må aldrig skabe
vandret scroll, og det må aldrig lægge tekst oven på tekst. Overlap laves med grid-area eller
negativ margin - ikke med `position:absolute` og faste px-koordinater, der knækker ved anden skriftstørrelse.

## 5. UX-love, der ændrer bygningen

Hver lov herunder har en konkret konsekvens i koden. Kender du ikke konsekvensen, har loven ingen værdi.

**Brugeren skanner, læser ikke.** Fladen læses som et skilt i forbifarten, ikke som en brochure.
→ Vigtighed skal kunne ses på afstand: størrelseskontrast mindst 2,5x mellem overskrift og brødtekst,
grupper der hører sammen står tættere end grupper der ikke gør, nøgleord fremhævet i teksten frem for
hele afsnit i fed. Alt på fladen er visuel støj, indtil det har bevist sin ret til at fylde.

**Klikbart skal se klikbart ud uden at man rører det.** Mobil har ingen hover.
→ Form, placering og farve skal bære signalet i hviletilstand. En knap, man først kan se er en knap,
når musen er over den, findes ikke på telefonen. Links i brødtekst understreges. Hover er en
bekræftelse, aldrig en afsløring. Tilstandstabellen ligger i `polering.md` afsnit 3.

**Fitts' lov** - tiden til at ramme et mål afhænger af afstand og størrelse.
→ Alle klikmål mindst 44x44 px. Primær handling er den fysisk største knap på fladen, og på mobil
hører den til i den nederste tredjedel. Destruktive handlinger placeres væk fra de hyppige.
Hvordan man giver et 16 px ikon et 44 px mål uden at flytte layoutet, står i `polering.md` afsnit 2.

**Hicks lov** - valgtid vokser med antal og kompleksitet af valg.
→ Maks. 7 punkter i hovedmenuen. Én primær CTA pr. skærmfuld, resten sekundære.
Har en formular over 8 felter, deles den i trin eller skjules bag `<details>`.
Prislister med over 4 pakker: fremhæv én og fold resten.

**Millers grænse** - arbejdshukommelsen holder cirka 4-7 enheder.
→ Grupper i bidder på 3-5: navigationsgrupper, listeelementer før en overskrift bryder,
tal i telefonnumre og kontonumre. En liste på 12 punkter uden underoverskrifter er en fejl.

**Jakobs lov** - brugere forventer, at din side virker som alle de andre sider, de kender.
→ Logo øverst til venstre og linker til forsiden. Menu øverst. Kurv eller kontakt øverst til højre.
Understregede eller tydeligt farvede links. Formularknappen under formularen, ikke ved siden af.
Vær original i det visuelle udtryk, aldrig i placeringen af de konventionelle elementer.

**Orientering** - brugeren har ingen fornemmelse af, hvor på sitet han er.
→ Navigationen skal til enhver tid kunne svare på: hvilket site er det her, hvilken side er jeg på,
hvad findes der ellers. Aktivt punkt markeres med `aria-current="page"` og en synlig markør, ikke
kun med farve. Brødkrumme ved mere end to niveauer. Prøven: dæk alt undtagen navigationen til -
kan man stadig svare på de tre spørgsmål, holder den.

**Velviljekontoen** - brugeren starter med tålmodighed, og hver forhindring trækker på den.
→ Det, kunden kom efter, gemmes aldrig: pris eller prisinterval, telefonnummer, adresse, leveringstid.
Spørg ikke om oplysninger, du ikke skal bruge. Ingen splash, ingen tvungen rundvisning, ingen
nyhedsbrevs-overlay før første skærmfuld er læst. En SMV-side, der kræver en formular for at oplyse
en pris, mister kunden til den næste side i søgeresultatet.

**Æstetik-brugbarhedseffekten** - pænt opfattes som mere brugbart og tilgives flere fejl.
→ Retfærdiggør tiden brugt på optisk justering (`polering.md` afsnit 1, 6 og 7). Men: æstetik
skjuler problemer i test - den erstatter ikke, at flowet virker.

**Von Restorff (isolationseffekten)** - det, der skiller sig ud, huskes.
→ Fremhævelse tælles som gitterbrud efter afsnit 4: ét eller to steder pr. flade. Er der fem
fremhævede kort, huskes ingen af dem. Accentfarven bruges på under 10 procent af fladen.

**Postels lov** - vær tolerant med input, streng med output.
→ Accepter telefonnumre med mellemrum, CVR med og uden mellemrum, e-mail med store bogstaver.
Normalisér i JS i stedet for at afvise. Aldrig `pattern` der afviser lovlige danske formater.

**Doherty-tærsklen** - respons under 400 ms holder brugeren i flow.
→ Vælg varighed fra skalaen i `motion.md`: `--tid-mikro` til farveskift, `--tid-basis` til noget
der folder ud, `--tid-rolig` til modal og drawer. Enhver handling giver synligt svar inden for
100 ms, også når resultatet tager længere - knappen skifter tilstand med det samme, og først
derefter venter man på svaret.

**Zeigarnik og målgradient** - påbegyndt arbejde trækker mod afslutning.
→ Flertrinsformularer viser trin ("2 af 3") og en delvist udfyldt progressbar fra start.

**Serieposition** - første og sidste punkt huskes bedst.
→ Læg det vigtigste menupunkt først, handlingen sidst. Læg aldrig hovedbudskabet i midten af en liste.

**Klarhed slår konsekvens.** Gør en lille afvigelse fra systemet en ting markant tydeligere,
vælger du klarheden. Konsekvens er et middel til forståelse, ikke et mål i sig selv.

## 6. Wiring-mønstre

Fælles regler for alt interaktivt:

1. **HTML først.** Byg tilstanden, der virker uden JS. Læg derefter JS ovenpå.
2. Alt, der kan klikkes, er en `<button type="button">` eller et `<a href>`. Aldrig en `<div>` med en klikhandler.
3. Alt, der kan nås med mus, kan nås med Tab. Tabulatorrækkefølgen følger den visuelle rækkefølge.
4. `Esc` lukker altid det, der er åbnet oven på indholdet, og fokus går tilbage til det, der åbnede det.
5. Ingen `tabindex` over 0.
6. Delegér begivenheder fra `document` med `closest()`, så indhold kan tilføjes senere uden at genbinde. I komponentleverancen (B) delegeres fra komponentroden i stedet.

### Lagdeling: hvad der virker uden JS

Regel 1 ovenfor er ikke en holdning, det er en arbejdsmetode: byg den fungerende udgave i HTML,
og læg JS ovenpå som en forbedring. Det er også det, der gør, at fladen overlever et script, der
fejler på linje 3, en langsom forbindelse, der aldrig får scriptet hjem, og en browserudvidelse,
der blokerer det.

| Komponent | Uden JS | Hvad JS lægger ovenpå |
|---|---|---|
| Navigation | Synlig liste med links | Klapper sammen under 48em |
| Accordion, FAQ | `<details>` - alt indhold læsbart og foldbart | Kun animationen af foldningen |
| Faner | Alle paneler synlige, hver under sin egen overskrift | Skjuler alle på nær ét og tilføjer tablist-rollen |
| Modal | Indholdet findes som en almindelig sektion eller en egen side, nået med `#id` | `showModal()` overtager linket |
| Formular | `method="post"` til et rigtigt endepunkt, browserens egen validering | `novalidate`, danske beskeder, indsendelse uden genindlæsning |
| Filtrering og søgning | `method="get"`, siden genindlæses med parametre | Filtrerer på stedet og skriver URL'en med `replaceState` |
| Sortering af tabel | Kolonneoverskrifter er links med `?sorter=pris` | Sorterer i DOM'en |
| Galleri | Alle billeder i dokumentet, hvert som link til fuld størrelse | Lightbox |
| Temaknap | Findes ikke - `prefers-color-scheme` styrer | Knappen sætter `data-tema` og husker valget |
| Tal der tæller op | Slutværdien står i markup | Tæller op til den værdi, der allerede står der |

Reglerne, der holder lagdelingen i live:

1. **Slutværdien står altid i markup.** Et tal, JS tæller op til, en pris, JS formaterer, en dato,
   JS oversætter - de skal alle stå læsbart i HTML'en først.
2. **`.js` skjuler, `.js` viser ikke.** Skriv `.js .kun-uden-js{display:none}`. Skriver du det
   omvendt (`.uden-js{display:none}` i basis-CSS'en og JS fjerner klassen), efterlader du
   no-JS-brugeren med en tom side.
3. **Skjul aldrig indhold i CSS for at vise det med JS.** Fejler scriptet, er indholdet væk for
   alle, og der er ingen fejlmeddelelse nogen steder.
4. **Én defekt komponent må ikke slukke resten.** Ét uhåndteret kast stopper hele scriptet, og
   alt under fejlen bliver aldrig sat op. Start hver komponent for sig:

   ```js
   [saetMenuOp, saetFanerOp, saetFilterOp, saetFormOp].forEach(f=>{
     try{ f(); }
     catch(fejl){ console.error('Komponent kunne ikke startes:', f.name, fejl); }
   });
   ```

5. **Testen er ikke `<noscript>`.** Slå JavaScript fra i browseren og genindlæs. Kan du læse alt
   indhold, klikke alle links, folde FAQ'en ud og sende formularen, er lagdelingen i orden.
   `<noscript>` bruges kun, hvor der er noget konkret at sige ("Kortet kræver JavaScript, adressen
   står herunder"), aldrig som undskyldning for en tom side.

### Tastaturmodel pr. komponent

Musen tilgiver. Tastaturet gør ikke. Kør denne tabel igennem for hver komponent, du bygger -
det er også præcis den liste, en tilgængelighedsgennemgang måler dig på.

| Komponent | Taster der SKAL virke | Det, der bliver glemt |
|---|---|---|
| Knap | Enter og Mellemrum | En `<div role="button">` giver ingen af dem gratis. Brug `<button>` |
| Link | Enter (ikke Mellemrum) | Vælg element efter handling: navigerer man, er det et link; ændrer man noget, er det en knap |
| Faneliste | Pil venstre/højre skifter, Home til første, End til sidste, Tab forlader listen | Kun den valgte fane har `tabindex="0"`. Ellers skal brugeren tabbe gennem alle faner for at nå indholdet |
| Accordion (`<details>`) | Enter og Mellemrum på `<summary>` | Virker gratis. Bygger du den selv med divs, mister du begge |
| Modal (`<dialog>`) | Esc lukker, Tab cirkulerer inde i dialogen, fokus starter inde i den | Fokus tilbage til den knap, der åbnede. Resten giver `showModal()` |
| Dropdown og menu | Pil ned åbner og går til første punkt, pil op/ned flytter, Home/End, bogstav springer til punktet, Esc lukker og fokus tilbage til knappen, Enter vælger | Typeahead. Uden den er en liste med 98 kommuner ubrugelig med tastatur |
| Kombiboks (felt med forslag) | Pil ned/op gennem forslagene, Enter vælger, Esc lukker listen uden at rydde feltet | Fokus BLIVER i feltet. Det aktive forslag udpeges med `aria-activedescendant` |
| Mobilmenu (disclosure) | Enter/Mellemrum åbner, Esc lukker, fokus bliver på knappen | Esc |
| Radiogruppe | Piletaster flytter valget, Tab forlader hele gruppen | En radiogruppe er ÉT tabstop. Sætter du `tabindex="0"` på hver knap, ødelægger du det |
| Tabel med sortering | Enter/Mellemrum på kolonneknappen | `aria-sort` skal opdateres på den aktive kolonne, ellers er sorteringen usynlig for en skærmlæser |
| Karrusel | Piletaster flytter, Tab når hvert synligt kort, og der findes en pause-knap ved autoafspilning | Kort uden for visningen skal være `inert`, ellers tabber man ud i ingenting |

Fælles krav uanset komponent: fokus må aldrig forsvinde ud i ingenting. Lukker du noget, sender du
fokus et defineret sted hen. Fjerner du det element, der har fokus, flytter du fokus FØR du fjerner
det. Prøven er at tabbe hele fladen igennem og tilbage igen uden at miste den synlige fokusring en
eneste gang.

### Mobilmenu

Den hyppigste interaktive komponent på et SMV-site og den, der oftest bygges forkert. Mønsteret er
en disclosure: en knap, der viser og skjuler et panel. Ikke en dialog, ikke en `<div>` med en klasse.

```html
<header class="site-head">
  <a class="brand" href="/">Virksomhed</a>
  <button class="menu-knap" type="button" aria-expanded="false" aria-controls="hovedmenu">
    <span class="menu-knap__streger" aria-hidden="true"></span> Menu
  </button>
  <nav id="hovedmenu" class="hovedmenu" aria-label="Hovedmenu">
    <ul role="list">
      <li><a href="/ydelser" aria-current="page">Ydelser</a></li>
      …
    </ul>
  </nav>
</header>
```

```css
/* Uden JS: knappen findes ikke, menuen er en almindelig synlig liste. */
.menu-knap{display:none}
.js .menu-knap{display:inline-flex;align-items:center;gap:var(--plads-2);min-height:44px}

@media (width < 48em){
  .js .hovedmenu{display:none}
  .js .site-head:has(.menu-knap[aria-expanded="true"]) .hovedmenu{display:block}
  .hovedmenu a{display:flex;align-items:center;min-height:44px}
}
```

```js
/* .js er allerede sat af én-linjen i <head>. */
const menuKnap = document.querySelector('.menu-knap');
const menu = document.getElementById('hovedmenu');

const saetMenu = aaben => menuKnap.setAttribute('aria-expanded', String(aaben));

menuKnap.addEventListener('click', () =>
  saetMenu(menuKnap.getAttribute('aria-expanded') !== 'true'));

// Esc lukker og sender fokus tilbage til knappen
document.addEventListener('keydown', e => {
  if(e.key === 'Escape' && menuKnap.getAttribute('aria-expanded') === 'true'){
    saetMenu(false); menuKnap.focus();
  }
});

// Klik uden for menuen lukker den
document.addEventListener('click', e => {
  if(!e.target.closest('.site-head') && menuKnap.getAttribute('aria-expanded') === 'true')
    saetMenu(false);
});

// Et klik på et menupunkt lukker, så ankerlinks ikke lander bag en åben menu
menu.addEventListener('click', e => { if(e.target.closest('a')) saetMenu(false); });

// Skiftes der til desktopbredde med menuen åben, nulstilles tilstanden
matchMedia('(width >= 48em)').addEventListener('change', e => { if(e.matches) saetMenu(false); });
```

Regler:

- `aria-expanded` sidder på knappen, aldrig på panelet, og opdateres hver gang.
- Menuen skjules med `display:none`, ikke med `opacity:0` eller `visibility` alene - ellers kan
  man tabbe ned i en usynlig menu.
- Fokus bliver på knappen, når menuen åbnes. Det er en disclosure, ikke en dialog.
- **Dækker menuen hele skærmen**, er den reelt en dialog: så skal resten af siden gøres `inert`,
  fokus flyttes ind i menuen, og fokus fanges der, indtil den lukkes. Vælg den simple variant,
  medmindre designet kræver fuldskærm.
- `:has()` bruges her, fordi tilstanden bor på knappen. Kan du ikke bruge `:has()`, sætter du en
  klasse på `.site-head` i stedet.
- Ét menupunkt bærer `aria-current="page"` og en synlig markør.

### Faner

```html
<div class="faner">
  <div role="tablist" aria-label="Ydelser">
    <button role="tab" id="t1" aria-controls="p1" aria-selected="true"  type="button">Rådgivning</button>
    <button role="tab" id="t2" aria-controls="p2" aria-selected="false" tabindex="-1" type="button">Drift</button>
  </div>
  <section role="tabpanel" id="p1" aria-labelledby="t1" tabindex="0">…</section>
  <section role="tabpanel" id="p2" aria-labelledby="t2" tabindex="0" hidden>…</section>
</div>
```

```js
document.querySelectorAll('[role="tablist"]').forEach(liste=>{
  const faner=[...liste.querySelectorAll('[role="tab"]')];
  const vis=i=>{
    faner.forEach((f,j)=>{
      const valgt=i===j;
      f.setAttribute('aria-selected',valgt);
      f.tabIndex=valgt?0:-1;
      document.getElementById(f.getAttribute('aria-controls')).hidden=!valgt;
    });
    faner[i].focus();
  };
  liste.addEventListener('click',e=>{
    const f=e.target.closest('[role="tab"]'); if(f) vis(faner.indexOf(f));
  });
  liste.addEventListener('keydown',e=>{
    const i=faner.indexOf(document.activeElement); if(i<0) return;
    const n={ArrowRight:i+1,ArrowLeft:i-1,Home:0,End:faner.length-1}[e.key];
    if(n===undefined) return;
    e.preventDefault(); vis((n+faner.length)%faner.length);
  });
});
```

Uden JS er panel 2 skjult. Er indholdet vigtigt for alle, så brug accordion i stedet - eller
udelad `hidden` i markup og lad scriptet sætte det ved opstart.

### Accordion

Brug `<details>`. Den virker uden en linje JS, har korrekt semantik og tastaturhåndtering indbygget.

```html
<details class="fold" name="faq">
  <summary>Hvad koster det?</summary>
  <div class="fold__krop"><p>…</p></div>
</details>
```

```css
.fold summary{cursor:pointer;min-height:44px;display:flex;align-items:center;gap:var(--plads-3);
  padding:var(--plads-3) var(--plads-4);list-style:none}
.fold summary::-webkit-details-marker{display:none}
.fold summary::after{content:"+";margin-inline-start:auto;transition:transform var(--tid-basis) var(--ease-begge)}
.fold[open] summary::after{transform:rotate(45deg)}
```

`name="faq"` på flere `<details>` gør dem gensidigt udelukkende uden JS. Skriv aldrig en accordion
fra bunden med divs og klikhandlere.

### Modal

Brug `<dialog>`. Den giver fokusfælde, `Esc`, inert baggrund og backdrop gratis.

```html
<button type="button" data-aabn="#kontakt-dialog">Book møde</button>

<dialog id="kontakt-dialog" aria-labelledby="dlg-h">
  <h2 id="dlg-h">Book et møde</h2>
  <form method="dialog"><button class="luk" aria-label="Luk">×</button></form>
  …
</dialog>
```

```js
document.addEventListener('click',e=>{
  const aabner=e.target.closest('[data-aabn]');
  if(!aabner) return;
  const d=document.querySelector(aabner.dataset.aabn);
  d.dataset.kalder=aabner.id||''; d.showModal();
});
document.querySelectorAll('dialog').forEach(d=>{
  d.addEventListener('click',e=>{ if(e.target===d) d.close(); }); // klik på backdrop
  d.addEventListener('close',()=>{ document.getElementById(d.dataset.kalder)?.focus(); });
});
```

```css
dialog{border:none;border-radius:var(--radius-stor);padding:var(--plads-8);
  max-width:min(34rem,calc(100% - 2*var(--plads-4)));box-shadow:var(--skygge-3)}
dialog::backdrop{background:rgb(0 0 0 / .45)}
```

Fokus skal tilbage til den knap, der åbnede dialogen - derfor `data-kalder`. Findes indholdet
kun i dialogen, skal det også kunne nås som en almindelig side eller sektion, ellers er det
utilgængeligt uden JS.

Resten af tastaturmodellen får du gratis af `showModal()`: Esc lukker, Tab cirkulerer inde i
dialogen, og baggrunden er `inert`. Det gælder KUN `showModal()`. Bruger du `show()` eller bygger
du overlejringen selv med en `<div>`, har du intet af det, og så skal du selv:

```js
// Fokusfælde til en overlejring, der IKKE er en <dialog>. Undgå at havne her.
const FOKUSBARE = 'a[href],button:not([disabled]),input:not([disabled]),select,textarea,[tabindex]:not([tabindex="-1"])';
function faelde(rod){
  const p = [...rod.querySelectorAll(FOKUSBARE)];
  rod.addEventListener('keydown', e=>{
    if(e.key !== 'Tab' || !p.length) return;
    const foerste = p[0], sidste = p[p.length-1];
    if(e.shiftKey && document.activeElement === foerste){ e.preventDefault(); sidste.focus(); }
    else if(!e.shiftKey && document.activeElement === sidste){ e.preventDefault(); foerste.focus(); }
  });
  document.querySelector('main').inert = true;   // og sæt den tilbage til false ved lukning
}
```

Fælden er ikke bare tre linjer: listen af fokusbare elementer skal genberegnes, hvis indholdet
ændrer sig, og `inert` skal fjernes igen ved enhver vej ud. Brug `<dialog>`.

### Dropdown og menu med typeahead

En liste med 98 kommuner, 30 ydelser eller 40 produkter er ubrugelig med tastatur, hvis man skal
trykke pil ned 61 gange. Er valget en værdi i en formular, bruger du `<select>` - den har det hele
indbygget. Er det en menu af handlinger eller links, bygger du dette:

```html
<div class="menu">
  <button class="menu__knap" type="button" aria-expanded="false" aria-haspopup="true"
          aria-controls="menu-liste">Vælg kommune</button>
  <ul class="menu__liste" id="menu-liste" role="menu" hidden>
    <li role="none"><button role="menuitem" type="button" tabindex="-1">Aarhus</button></li>
    <li role="none"><button role="menuitem" type="button" tabindex="-1">Aalborg</button></li>
    …
  </ul>
</div>
```

```js
function saetMenuerOp(rod = document){
  rod.querySelectorAll('.menu').forEach(menu=>{
    const knap  = menu.querySelector('.menu__knap');
    const liste = menu.querySelector('.menu__liste');
    const punkter = () => [...liste.querySelectorAll('[role="menuitem"]:not([disabled])')];
    let buffer = '', nulstil;

    const aabn = (til = 0) => {
      knap.setAttribute('aria-expanded','true'); liste.hidden = false;
      const p = punkter(); p[til === -1 ? p.length - 1 : til]?.focus();
    };
    const luk = (tilbageTilKnap = true) => {
      knap.setAttribute('aria-expanded','false'); liste.hidden = true;
      if(tilbageTilKnap) knap.focus();
    };

    knap.addEventListener('click', () => liste.hidden ? aabn(0) : luk());
    knap.addEventListener('keydown', e=>{
      if(e.key === 'ArrowDown'){ e.preventDefault(); aabn(0); }      // ned: første punkt
      if(e.key === 'ArrowUp'){   e.preventDefault(); aabn(-1); }     // op: sidste punkt
    });

    liste.addEventListener('keydown', e=>{
      const p = punkter(), i = p.indexOf(document.activeElement);
      if(e.key === 'Escape'){ luk(); return; }
      if(e.key === 'Tab'){ luk(false); return; }   // Tab lukker og går videre i siden

      const spring = {ArrowDown:i+1, ArrowUp:i-1, Home:0, End:p.length-1}[e.key];
      if(spring !== undefined){
        e.preventDefault(); p[(spring + p.length) % p.length].focus(); return;
      }

      // Typeahead: "aa" springer til Aalborg. Bufferen nulstilles efter 500 ms.
      if(e.key.length !== 1 || e.metaKey || e.ctrlKey || e.altKey) return;
      buffer += e.key.toLowerCase();
      clearTimeout(nulstil); nulstil = setTimeout(()=> buffer = '', 500);
      const fra = (i + (buffer.length > 1 ? 0 : 1)) % p.length;   // samme bogstav igen = næste træf
      [...p.slice(fra), ...p.slice(0, fra)]
        .find(el => el.textContent.trim().toLowerCase().startsWith(buffer))
        ?.focus();
    });

    // Klik uden for er den ENE lytter, der skal ligge på document, også i leverance B.
    // Den rører til gengæld intet uden for komponenten.
    document.addEventListener('click', e=>{
      if(!menu.contains(e.target) && !liste.hidden) luk(false);
    });
  });
}
```

Regler:

- Bogstavet, der skrives, matches mod punktets synlige tekst - ikke mod en værdi, brugeren ikke
  kan se. Skriver man "aa", skal man ramme det, der står "Aalborg".
- Sorter listen med `localeCompare(…, 'da-DK')`. Standardsorteringen lægger Æ, Ø og Å forkert.
- Er listen over 15 punkter lang, skal den have et søgefelt oven over sig, ikke bare typeahead.
- Panelet skal kunne rummes på skærmen. Lukker den nedad ved bunden af viewporten, vender du den
  opad - eller bruger `popover` med `<button popovertarget>`, som lader browseren om placeringen.
- `hidden` skjuler den, ikke `opacity:0`. Ellers kan man tabbe ned i en usynlig liste.
- Uden JS er dette bare en synlig liste med knapper eller links. Det er en acceptabel reservevisning -
  vær sikker på, at CSS'en ikke skjuler listen som udgangspunkt.

### Felter: den samlede blok

Alt, hvad der kan udfyldes, får samme behandling. Uden dette blok ender select, radio og filupload
med browserens standardudseende midt i et designet layout - det er det tydeligste tegn på, at
formularen blev bygget til sidst.

```html
<div class="felt">
  <label for="type">Opgavetype</label>
  <select id="type" name="type" required>
    <option value="">Vælg …</option>
    <option>Rådgivning</option>
  </select>
  <p id="type-fejl" class="fejl" hidden></p>
</div>

<fieldset class="felt">
  <legend>Hvornår passer det?</legend>
  <label class="valg"><input type="radio" name="tid" value="formiddag"> Formiddag</label>
  <label class="valg"><input type="radio" name="tid" value="eftermiddag"> Eftermiddag</label>
</fieldset>

<div class="felt">
  <label for="dato">Ønsket startdato</label>
  <input id="dato" name="dato" type="date" min="2026-01-01">
</div>

<div class="felt">
  <label for="fil">Vedhæft tegning (PDF eller JPG, maks. 10 MB)</label>
  <input id="fil" name="fil" type="file" accept=".pdf,image/jpeg">
</div>

<label class="valg">
  <input type="checkbox" name="samtykke" required>
  Jeg accepterer, at I gemmer mine oplysninger for at kunne svare.
</label>
```

```css
.felt{display:grid;gap:var(--plads-2);margin-block-end:var(--plads-6);border:0;padding:0}
.felt > label, .felt > legend{font-weight:600}
.hjaelp{color:var(--farve-tekst-svag);font-size:var(--type-mikro);max-width:none}
.fejl{color:var(--farve-fejl);font-size:var(--type-mikro);max-width:none}

:where(input,select,textarea){
  min-height:44px;width:100%;
  padding:var(--plads-2) var(--plads-3);
  background:var(--farve-flade-hoej);
  color:var(--farve-tekst);
  border:var(--kant);
  border-radius:var(--radius-lille);
}
textarea{min-height:8rem;resize:vertical}

/* select: fjern systemudseendet og tegn selv chevronen, ellers ser den fremmed ud */
select{
  appearance:none;padding-inline-end:var(--plads-8);
  background-image:linear-gradient(45deg,transparent 50%,currentColor 50%),
                   linear-gradient(135deg,currentColor 50%,transparent 50%);
  background-size:6px 6px,6px 6px;
  background-position:right 1.15rem center,right .8rem center;
  background-repeat:no-repeat;
}

/* radio og checkbox: accentfarven i én linje, og et mål der kan rammes */
input[type=checkbox],input[type=radio]{
  accent-color:var(--farve-accent);
  inline-size:1.25rem;block-size:1.25rem;min-height:0;width:auto;flex:none;margin:0;
}
.valg{display:flex;align-items:center;gap:var(--plads-3);min-height:44px;font-weight:400;cursor:pointer}

/* dato: kalenderikonet arver tekstfarven, ellers er det sort i mørkt tema.
   --ikon-invert er defineret i begge tema-blokke, se afsnittet om mørkt tema. */
input[type=date]::-webkit-calendar-picker-indicator{filter:invert(var(--ikon-invert,0))}

/* fil: knappen inde i feltet styles for sig */
input[type=file]{padding:var(--plads-2)}
input[type=file]::file-selector-button{
  font:inherit;margin-inline-end:var(--plads-3);min-height:36px;
  padding:0 var(--plads-3);border:var(--kant);border-radius:var(--radius-lille);
  background:var(--farve-flade);color:var(--farve-tekst);cursor:pointer;
}

/* tilstande - samme sprog som polering.md afsnit 3 */
:where(input,select,textarea):focus-visible{outline:3px solid var(--farve-fokus);outline-offset:2px}
:where(input,select,textarea)[aria-invalid="true"]{border-color:var(--farve-fejl);box-shadow:0 0 0 1px var(--farve-fejl)}
:where(input,select,textarea):disabled{opacity:.5;cursor:not-allowed}
:where(input,textarea):read-only{background:var(--farve-flade);cursor:default}
:where(input,textarea)::placeholder{color:var(--farve-tekst-svag)}
```

Regler, der følger med felterne:

- Radiogrupper og checkbox-grupper pakkes i `<fieldset>` med `<legend>`. Et løst spørgsmål over
  tre radioknapper er ikke koblet til dem for en skærmlæser.
- Checkbox og radio bliver inde i deres `<label>`, så hele teksten er klikflade.
- `accept` på filupload er en hjælp, ikke en sikring. Grænsen for filstørrelse skrives i labelen
  og kontrolleres på serveren.
- Datofelter: brug `type="date"` og sæt `min`/`max`, hvor det giver mening. Skriv formatet i
  hjælpeteksten, og byg aldrig din egen kalender i en selvstændig artefakt.
- Deaktiverede felter forklares. Grå uden årsag er en blindgyde.
- Alt, der kan valideres, har en fejl-node. Se næste afsnit.

### Formular

```html
<form class="form" novalidate action="/tak" method="post">
  <div class="felt">
    <label for="mail">E-mail</label>
    <input id="mail" name="mail" type="email" autocomplete="email" required
           inputmode="email" aria-describedby="mail-hj mail-fejl">
    <p id="mail-hj" class="hjaelp">Vi svarer inden for én arbejdsdag.</p>
    <p id="mail-fejl" class="fejl" hidden></p>
  </div>
  <button type="submit">Send</button>
  <p class="status" role="status" aria-live="polite"></p>
</form>
```

Regler:

- `<label for>` på hvert felt. Placeholder er ikke en label og forsvinder ved indtastning.
- **Hvert felt, der kan valideres, har en tom `<p class="fejl" hidden>` med et id, der står i feltets `aria-describedby`.** Uden den har scriptet intet sted at skrive fejlen hen.
- `autocomplete` udfyldt korrekt (`name`, `email`, `tel`, `organization`, `postal-code`). Det sparer brugeren for de fleste tastetryk.
- `novalidate` på formen + egne beskeder, så teksten er dansk og konkret. Browserens standardbesked er ikke din tone.
- Valider ved `blur`, ikke ved hver tast. Efter første fejl: valider ved `input`, så brugeren ser rettelsen med det samme.
- Fejlbesked står ved feltet, siger hvad der er galt OG hvad man gør ("Skriv en e-mail med @, fx navn@firma.dk").
- Fejlmarkering aldrig kun med farve: ikon eller tekst skal også bære signalet.
- Sæt `aria-invalid="true"` og flyt fokus til første fejl ved submit.
- Send-knappen deaktiveres først EFTER klik, aldrig før - en grå knap uden forklaring er en blindgyde.
- Honeypot mod spam frem for CAPTCHA:

```html
<div class="visuelt-skjult" aria-hidden="true">
  <label>Efterlad tomt<input name="firma_x" tabindex="-1" autocomplete="off"></label>
</div>
```

```js
// Finder feltets fejl-node. Returnerer null, hvis feltet ikke har en - fx honeypotten
// og alle felter uden hjælpetekst. Uden dette tjek dør hele indsendelsen på første
// felt, der mangler aria-describedby.
const fejlNode = el => {
  const ids = (el.getAttribute('aria-describedby') || '').split(/\s+/).filter(Boolean);
  for (const id of ids){
    const n = document.getElementById(id);
    if (n && n.classList.contains('fejl')) return n;
  }
  return null;
};

form.addEventListener('submit',e=>{
  const fejl=[...form.elements].filter(el=>el.willValidate && !el.checkValidity());
  fejl.forEach(el=>{ if(!fejlNode(el)) console.warn('Felt uden fejl-node:', el.name); });

  if(!fejl.length){ form.querySelector('.fejl-samlet').hidden = true; return; }
  e.preventDefault();
  fejl.forEach(visFejl);   // sætter aria-invalid og skriver beskeden, se næste afsnit
  opsummer(fejl);          // samlet role="alert" øverst i formularen, se næste afsnit
  fejl[0].focus();
});
```

Advarslen i konsollen er et byggeværktøj: rammer den ved test, mangler feltet sin fejl-node i
markup. Ret markuppen. Aflever aldrig en flade, hvor advarslen fyrer.

`action` skal pege et rigtigt sted hen. Findes endepunktet ikke endnu, sæt `action="mailto:…"`
eller skriv i én kommentar, hvad kunden skal indsætte. Aflever aldrig en formular, hvor knappen intet gør.

#### Hvornår du validerer

Timingen afgør, om validering føles som hjælp eller som en irettesættelse. En rød kant efter tre
tegn er at rette nogen midt i en sætning.

| Tidspunkt | Hvad der sker | Hvorfor |
|---|---|---|
| Mens der tastes, før feltet har fejlet | Intet. Ingen kant, ingen besked | Brugeren er ikke færdig endnu |
| Ved `blur`, hvis feltet er udfyldt | Valider og vis fejlen | Brugeren har erklæret sig færdig med feltet ved at gå videre |
| Ved `blur` på et tomt, ikke-påkrævet felt | Intet | Der er ikke sket noget forkert |
| Ved `input`, EFTER feltet har fejlet én gang | Valider igen, og fjern fejlen i samme øjeblik den er rettet | Kvitteringen skal komme, mens brugeren stadig kigger på feltet |
| Ved `change` | Valider også her | Autofyld udfylder tit uden at udløse `blur` |
| Ved submit | Valider alt, marker alle fejl, opsummer, flyt fokus til første fejl | Én samlet besked, ikke en fejl ad gangen |
| Når serveren svarer med en fejl | Skriv serverens besked ind i de SAMME fejl-noder | To fejlsystemer i én formular er i sig selv en fejl |

```js
const roert = new WeakSet();

// blur bobler ikke - derfor capture-fasen (tredje argument true).
form.addEventListener('blur', e=>{
  const el = e.target;
  if(!el.willValidate) return;
  if(!el.value && !el.required) return;
  roert.add(el); visFejl(el);
}, true);

form.addEventListener('input',  e=>{ if(roert.has(e.target)) visFejl(e.target); });
form.addEventListener('change', e=>{ if(e.target.willValidate){ roert.add(e.target); visFejl(e.target); } });

function visFejl(el){
  const node = fejlNode(el);
  const ok = el.checkValidity();
  el.toggleAttribute('aria-invalid', !ok);      // fjernes IGEN, når fejlen er rettet
  if(!node) return;
  node.textContent = ok ? '' : besked(el);
  node.hidden = ok;
}
```

Et felt, der bliver ved med at have `aria-invalid="true"` efter rettelsen, er værre end ingen
validering: skærmlæseren siger "ugyldig" om noget, der er rigtigt.

#### Sådan når fejlen frem til en skærmlæser

- Fejl-noden findes i DOM'en fra start, tom og `hidden`, og dens id står i feltets
  `aria-describedby`. Indsætter du noden først, når fejlen opstår, når `aria-describedby` ikke
  at pege på noget, og beskeden læses aldrig op.
- Ved submit skrives en samlet opsummering øverst i formularen i `role="alert"`, med et link til
  hvert fejlende felt. Så hører brugeren antallet og kan hoppe direkte hen til problemet.
- `role="alert"` afbryder oplæsningen - brug den til det, der blokerer indsendelsen. `role="status"`
  venter til der er en pause - brug den til kvitteringer og tællinger. Byt aldrig om på de to.
- Fokus flyttes til det første fejlende felt. Vil du hellere have hele listen læst op først, giver
  du opsummeringen `tabindex="-1"` og flytter fokus dertil. Vælg én af delene, og gør det ens hver
  gang i hele leverancen.
- Fejlmarkeringen bæres aldrig af farve alene: teksten under feltet ER signalet, den røde kant er
  kun forstærkning.

```html
<div class="fejl-samlet" role="alert" tabindex="-1" hidden>
  <p>Der er <span data-antal></span> felter, der skal rettes:</p>
  <ul role="list"></ul>
</div>
```

```js
const etiket = el => form.querySelector(`label[for="${el.id}"]`)?.textContent.trim() || el.name;

function opsummer(fejl){
  const boks = form.querySelector('.fejl-samlet');
  boks.querySelector('[data-antal]').textContent = fejl.length;
  boks.querySelector('ul').replaceChildren(...fejl.map(el=>{
    const li = document.createElement('li');
    const a  = document.createElement('a');
    a.href = '#' + el.id;
    a.textContent = `${etiket(el)}: ${besked(el)}`;
    a.addEventListener('click', e=>{ e.preventDefault(); el.focus(); });
    li.append(a); return li;
  }));
  boks.hidden = false;
}
```

#### Beskederne

Browserens standardbesked er engelsk eller maskinoversat og siger sjældent, hvad man skal gøre.
Skriv dem selv, ud fra hvilken kontrol der fejlede:

```js
const BESKEDER = {
  valueMissing:   el => `Udfyld ${etiket(el).toLowerCase()}.`,
  typeMismatch:   el => el.type === 'email'
                        ? 'Skriv en e-mail med snabel-a, fx navn@firma.dk.'
                        : 'Skriv en fuld adresse, fx https://firma.dk.',
  tooShort:       el => `Skriv mindst ${el.minLength} tegn.`,
  rangeUnderflow: el => `Vælg tidligst ${el.min}.`,
  rangeOverflow:  el => `Vælg senest ${el.max}.`,
  patternMismatch:()  => 'Formatet passer ikke. Se hjælpeteksten under feltet.',
};
const besked = el => {
  for(const flag in BESKEDER) if(el.validity[flag]) return BESKEDER[flag](el);
  return el.dataset.fejl || 'Feltet kan ikke godkendes sådan her.';
};
```

Beskeden siger altid HVAD der er galt og HVAD man gør. "Ugyldig e-mail" siger kun det første.
Skriv aldrig "fejl i felt", "påkrævet" eller et feltnavn fra databasen.

Bruger du `setCustomValidity()`, skal du tømme den med `setCustomValidity('')` før hver ny kontrol.
Gør du ikke det, forbliver feltet ugyldigt for evigt - også når brugeren har rettet det.

#### Straf aldrig et gyldigt input for sit format

Dette er Postels lov omsat til kode. Kunden skriver sit telefonnummer, som han plejer, og det er
vores opgave at forstå det - ikke hans opgave at gætte vores format.

```js
// Normalisér FØR validering, ved change (og altid før afsendelse).
const NORMALISER = {
  tel:    v => v.replace(/[\s()./-]/g, '').replace(/^(?:\+45|0045)/, ''),
  cvr:    v => v.replace(/\D/g, ''),
  postnr: v => v.replace(/\D/g, ''),
  email:  v => v.trim().toLowerCase(),
  beloeb: v => v.replace(/\s|\./g, '').replace(',', '.'),   // "12.500,50" → "12500.50"
};
form.addEventListener('change', e=>{
  const f = NORMALISER[e.target.dataset.normaliser];
  if(f) e.target.value = f(e.target.value);
});
```

- Danske telefonnumre skrives "12 34 56 78", "+45 12345678" og "12345678". Det er den samme kunde.
  Et `pattern`, der kun accepterer den ene, koster dig de to andre.
- E-mail: kontrollér at der er tegn, ét snabel-a og et punktum bagefter. Alt strengere afviser
  rigtige adresser - blandt andet dem med plus, bindestreg og lange nye topdomæner.
- Ingen `maxlength` under 100 tegn på navn, adresse eller firmanavn.
- Postnummer: fire cifre. Slå gerne byen op og vis den som kvittering i stedet for at bede
  brugeren skrive den også.
- CVR og kontonummer: normalisér, og skriv i hjælpeteksten at mellemrum er ligegyldige.
- Æ, Ø, Å og accenter er lovlige tegn i navne og adresser. Et `pattern` med `[a-zA-Z]` afviser
  en stor del af landet.
- Klip aldrig tegn væk, mens brugeren skriver. Normalisering sker ved `change`, når feltet er
  forladt - ikke ved hvert tastetryk, hvor markøren så hopper.

### Filtre og søgning

Byg som en rigtig `<form method="get">`, der virker uden JS (siden genindlæses med query-parametre).
Læg JS ovenpå til øjeblikkelig filtrering.

```html
<form class="filtre" method="get" role="search">
  <label for="q">Søg</label>
  <input id="q" name="q" type="search" autocomplete="off">
  <fieldset><legend>Kategori</legend>
    <label class="valg"><input type="checkbox" name="kat" value="drift"> Drift</label>
    …
  </fieldset>
  <button type="submit" class="kun-uden-js">Filtrér</button>
</form>
<p class="resultat-tal" role="status" aria-live="polite">12 resultater</p>
<ul id="liste" role="list"> … </ul>
```

- Skjul submit-knappen med `.js .kun-uden-js{display:none}` (klassen sættes i `<head>`), aldrig omvendt.
- Antal resultater i et `role="status"` - ellers får skærmlæserbrugere ingen besked om, at listen ændrede sig.
- Filtrering skjuler med `hidden`, ikke med inline `display:none`, så tilstanden også er semantisk.
- Debounce fritekst med 150-250 ms. Aldrig filtrering på hvert `keydown` uden debounce.
- Ryd-filtre-knap altid synlig, når mindst ét filter er aktivt.
- Skriv de aktive filtre i URL'en med `history.replaceState`, så visningen kan deles og genindlæses.
- Rammer filtrene nul resultater, vises tom-tilstanden fra afsnit 7 - ikke en tom liste.

## 7. Indholdets tilstande

**Arbejdsdeling:** `polering.md` afsnit 3 ejer KOMPONENTENS tilstande - hvile, hover, fokus, aktiv,
deaktiveret, indlæser, fejl og valgt på en knap, et felt, en række, en fane. Denne fil ejer
INDHOLDETS tilstande: hvad fladen viser, når der ingen data er, mens de hentes, når de ikke kom,
og når der er for mange. Knappens spinner er polering. Listens skelet er her.

Fire tilstande skal designes og bygges hver gang, der vises en liste, en tabel eller data.
Bygger du kun den fyldte tilstand, er fladen ikke færdig.

| Tilstand | Krav |
|---|---|
| **Tom** | Forklar hvorfor der intet er, og giv præcis én handling videre. Ingen tom kasse, ingen "Ingen data". Illustrationen må ikke fylde mere end teksten. Skeln mellem "der er endnu ikke oprettet noget" og "dit filter gav nul" - det er to forskellige tekster og to forskellige handlinger. |
| **Indlæsning** | Under 400 ms: vis intet (en blinkende spinner er værre end ingenting). 400 ms til 5 sek.: skeleton i indholdets egen form og størrelse, så layoutet ikke hopper. Over 5 sek.: skriv hvad der sker, og hvor længe der er tilbage. Antallet af skeletrækker skal ligne det forventede resultat, ikke være tre tilfældige. |
| **Fejl** | Sig hvad der gik galt i menneskesprog, hvad brugeren kan gøre nu, og hvordan de får fat i et menneske. Prøv-igen-knap. Ingen fejlkode alene. Ingen mistet indtastning. |
| **For meget** | Definér grænserne på forhånd: pagination eller "vis flere" over 25 elementer, `overflow-x:auto` på tabeller, afkortning på lange navne og beskrivelser efter reglerne i `polering.md` afsnit 4. |

```css
.skelet{background:linear-gradient(90deg,var(--farve-flade) 25%,var(--farve-flade-hoej) 37%,var(--farve-flade) 63%);
  background-size:400% 100%;animation:skim 1.4s linear infinite;border-radius:var(--radius-lille)}
@keyframes skim{to{background-position:-135% 0}}
```

Afkortning (`.en-linje`, `.to-linjer` og fælden med `min-width: 0` i flex) hentes fra
`polering.md` afsnit 4. Skriv den ikke igen her.

Skiftet mellem tilstandene annonceres i en `role="status"`-region, ellers opdager en
skærmlæserbruger ikke, at listen gik fra skelet til indhold.

### Fejl er en skærm, ikke en tekststreng

En fejl er det eneste sted på fladen, hvor brugeren er i knibe. Det er derfor også det sted, hvor
en dårlig formulering koster mest. Fejlbeskeden har fire dele, i denne rækkefølge:

1. **Hvad der skete**, i brugerens ord: "Vi kunne ikke hente priserne."
2. **Hvad det betyder for ham nu**: "Det, du har udfyldt, er ikke gået tabt."
3. **Den handling, han kan foretage**: en Prøv igen-knap, eller en vej udenom.
4. **Vejen til et menneske**, når 3 ikke virker: telefonnummer eller mail, direkte klikbart.

Forbudt: "Der opstod en fejl", "Something went wrong", "Error 500", en rå exception på skærmen,
et tomt område hvor indholdet skulle have været, og en rød boks uden en eneste knap. Sproget
lægger aldrig skylden på brugeren: "Vi kunne ikke …", ikke "Du har …".

| Situation | Hvad brugeren ser | Hvad koden gør |
|---|---|---|
| Svaret kommer ikke inden for 8 sekunder | "Det tager længere end normalt." plus Prøv igen | `AbortController` med timeout. Aldrig en spinner uden ende |
| Netværket er væk | "Du ser ud til at være offline." plus Prøv igen | Lyt på `online` og prøv af sig selv, når forbindelsen er tilbage |
| Serveren svarer 5xx | Fejlskærm, Prøv igen, kontaktvej | Ét automatisk genforsøg efter 1 sekund, derefter overlades det til brugeren |
| Serveren svarer 4xx | Konkret besked om det, der er galt | Ingen genforsøg. En 4xx retter sig ikke selv |
| Delvist svar: 8 af 10 elementer kom | De 8 vises, og en linje siger, at 2 mangler | Vis aldrig ingenting, når du har noget |
| Et enkelt felt mangler i data | Feltet udelades, eller der står en neutral streg | Rens ved indgangen, ikke i visningen |
| Handlingen fejlede efter klik | Knappen går tilbage til hviletilstand, og alt indtastet står der stadig | Ryd ALDRIG en formular, fordi indsendelsen fejlede |
| Fejlen sker igen og igen | Efter tredje forsøg: skift budskab og tilbyd kontaktvejen tydeligere | Tæl forsøgene |

```js
async function hent(url, {timeout = 8000, forsoeg = 1} = {}){
  const styring = new AbortController();
  const ur = setTimeout(()=> styring.abort(), timeout);
  try{
    const svar = await fetch(url, {signal: styring.signal});
    if(!svar.ok) throw Object.assign(new Error('http'), {status: svar.status});
    return await svar.json();
  }catch(fejl){
    const kanProevesIgen = fejl.name === 'AbortError' || !fejl.status || fejl.status >= 500;
    if(kanProevesIgen && forsoeg > 0){
      await new Promise(r => setTimeout(r, 1000));
      return hent(url, {timeout, forsoeg: forsoeg - 1});
    }
    throw fejl;
  }finally{ clearTimeout(ur); }
}

// Kaldstedet ejer skærmen. Ingen fejl må ende i konsollen, uden at brugeren ser noget.
try{
  visTilstand('indlaeser');
  const data = await hent('/api/priser');
  data.length ? visListe(data) : visTilstand('tom');
}catch(fejl){
  visTilstand('fejl', !navigator.onLine
      ? 'Du ser ud til at være offline. Prøv igen, når du har forbindelse.'
      : fejl.status === 404
        ? 'Prislisten findes ikke længere. Ring til os på 12 34 56 78, så finder vi prisen.'
        : 'Vi kunne ikke hente priserne lige nu. Det, du har udfyldt, er gemt.');
}
```

En fejl og en advarsel må ikke se ens ud. Delvist svar og offline er advarsler - brugeren har noget,
men ikke det hele:

```css
.baand{padding:var(--plads-3) var(--plads-4);border-radius:var(--radius-lille);
  display:flex;gap:var(--plads-3);align-items:flex-start}
.baand--advarsel{border-inline-start:4px solid var(--farve-advarsel);
  background:color-mix(in oklab, var(--farve-advarsel) 10%, var(--farve-bund))}
.baand--fejl{border-inline-start:4px solid var(--farve-fejl);
  background:color-mix(in oklab, var(--farve-fejl) 10%, var(--farve-bund))}
```

`color-mix` blander mod `--farve-bund` og følger derfor automatisk med i mørkt tema, så du slipper
for to ekstra tokens. Båndet bærer altid et ikon og en tekst ved siden af farven - kanten alene er
information båret af farve.

Manglende værdier stoppes ved indgangen, aldrig i visningen. Ordene "undefined", "null", "NaN" og
"Invalid Date" må ikke kunne nå en skærm:

```js
const tekst  = v => (v ?? '') === '' ? '-' : String(v);
const kroner = v => Number.isFinite(v)
  ? new Intl.NumberFormat('da-DK',{style:'currency',currency:'DKK'}).format(v)
  : 'Pris på forespørgsel';
const dato = v => {
  const d = new Date(v);
  return isNaN(d) ? '-' : new Intl.DateTimeFormat('da-DK',{dateStyle:'long'}).format(d);
};
```

En streg for en manglende værdi er kun i orden, når det er tydeligt, hvad den betyder. Er feltet
vigtigt (pris, leveringstid, kontaktperson), skriver du hvorfor det mangler, og hvad man gør i
stedet: "Pris på forespørgsel" er en handling, en bar streg er en blindgyde.

Fejlskærmen skal ses, ikke kun skrives. Slå netværket fra i browserens netværksfane, genindlæs, og
kig på den. Sæt derefter svaret til 500 og se den igen. En fejltilstand, ingen har set, er ikke bygget.

### Når listen er lang

| Antal elementer | Metode |
|---|---|
| Under 50 | Vis alt |
| 50-200 | Vis alt, men læg `content-visibility:auto` på rækkerne, så browseren springer layout over for det, der er uden for skærmen |
| 200-1000 | Paginering eller "Vis 25 mere". Paginering når brugeren skal kunne dele eller vende tilbage til et bestemt sted; "vis mere" når listen bare skannes |
| Over 1000 | Virtualisering: render kun de synlige rækker plus en buffer over og under |

```css
.raekke{content-visibility:auto; contain-intrinsic-size:auto 72px}
```

`contain-intrinsic-size` er ikke valgfri. Uden den regner browseren de oversprungne rækker som
nul høje, og scrollbaren hopper, mens man scroller.

Regler:

- Sidetallet står i URL'en (`?side=3`). Ellers kan visningen hverken deles eller genskabes med
  browserens tilbage-knap.
- "Vis 25 mere" flytter fokus til det første nye element. Ellers taber en tastaturbruger sin plads
  og starter forfra i toppen.
- Totalen vises altid: "Viser 25 af 312". En liste uden et samlet tal føles uendelig, og brugeren
  kan ikke vurdere, om det kan betale sig at kigge videre.
- Filtrering nulstiller til side 1 og annoncerer det nye antal i `role="status"`.
- Uendelig scroll gør footeren uopnåelig og gør det umuligt at vende tilbage til et element. Brug
  en knap, medmindre kunden udtrykkeligt beder om det modsatte - og skriv i så fald i afleveringen,
  at footerens indhold skal ligge et andet sted.

Virtualisering i en selvstændig artefakt skriver du selv: `IntersectionObserver` på en vagtpost i
bunden til at hente næste bid, eller absolut placerede rækker i en beholder med beregnet højde.
Hent aldrig et virtualiseringsbibliotek ind - det bryder leverancekontrakten. Kan opgaven ikke
løses uden, er listen for stor til en selvstændig artefakt, og det skriver du i afleveringen.

Test hver flade med: 0 elementer, 1 element, 3 elementer, 200 elementer, og med et navn på 80 tegn
uden mellemrum. Knækker layoutet på nogen af dem, er det ikke bygget færdigt.

## 8. Sådan ser du efter

Den selvstændige fil åbnes med dobbeltklik. Skal du bruge `fetch`, ES-moduler eller relative
data-filer, kræver browseren en server - så start en lokal på et tilfældigt ledigt portnummer og
luk den igen, når du er færdig. En artefakt, der KUN virker via server, har brudt kontrakten;
serveren er et arbejdsredskab, ikke en forudsætning.

Kør altid denne runde, før du kalder noget færdigt:

1. Bredderne 320, 375, 768 og 1440 px. Ingen vandret scroll nogen steder.
2. Zoom til 200 procent i browseren. Intet forsvinder, intet overlapper.
3. Begge temaer. Skift systemets udseende, ikke kun temaknappen.
4. Tab dig gennem hele fladen fra top til bund og tilbage. Ét synligt fokus hele vejen, og
   piletaster, Home/End og Esc virker i hver komponent, der har dem i tabellen i afsnit 6.
5. Konsollen: nul fejl og nul advarsler, både ved load og efter hver interaktion.
6. Slå JavaScript fra og genindlæs.
7. Tom cache plus langsom forbindelse i netværksfanen, genindlæs ved 375 px. Intet må hoppe.
8. Netværket slået fra: hver flade, der henter data, viser sin fejltilstand med en handling.
9. Print til PDF, hvis print er i scope.

## 9. Tjekliste før aflevering

Kør hele listen. Et ubekræftet punkt er et fejlet punkt.

**Selvstændighed (leverance A)**
- [ ] Filen åbner korrekt fra skrivebordet uden server og uden netværk
- [ ] Nul eksterne requests ved load (tjek netværksfanen: kun selve dokumentet)
- [ ] Ingen `http(s)://` i `src`, i `href` til stylesheets eller i `@import` (og-tags er undtaget)
- [ ] Ingen konsolfejl og ingen advarsler ved load og efter hver interaktion
- [ ] Slås JS fra: alt indhold er læsbart, alle links virker, formularen kan sendes, menuen er synlig
- [ ] Hver komponent startes i sin egen `try/catch` - én defekt komponent slukker ikke resten
- [ ] Alt, JS skriver på skærmen (tal, priser, datoer), står også læsbart i markup

**Indlejring (leverance B)**
- [ ] Ingen global reset, ingen `:root`-override, ingen regler på `body` eller `h1-h6`
- [ ] Alle klasser præfikset eller efter værtens konvention
- [ ] Hændelser bundet til komponentroden, ikke til `document` (klik-uden-for er den ene undtagelse, og den tjekker `contains()` først)
- [ ] Værtens tokens brugt, hvor de findes, og hvert `var()` har en fallback
- [ ] `isolation:isolate` på roden, ingen intern `z-index` over 10
- [ ] Testet med værtens øvrige CSS indlæst

**Struktur**
- [ ] `lang="da"`, viewport-meta, unik `<title>`, `<meta name="description">`
- [ ] og:title, og:description, og:image og og:url er sat - eller print/deling er eksplicit uden for scope
- [ ] Ét `<h1>`, ingen sprungne overskriftsniveauer
- [ ] `<main>` findes, skip-linket er der og virker som første Tab-stop
- [ ] Alle billeder har `alt`, `width` og `height`
- [ ] Ingen `onclick=""` eller `style=""` i markup

**System**
- [ ] Alle farver, afstande, radier og tider kommer fra `:root`-tokens
- [ ] Ét navnesprog i filen - ingen broblok tilbage fra indkopieret kode
- [ ] Ingen rå hex-kode eller px-afstand inde i en komponentregel
- [ ] Ingen `!important` uden for reduced-motion-blokken, ingen id-selektorer, ingen selektor dybere end to niveauer
- [ ] Mørk-tema-blokken er skrevet ud både under `prefers-color-scheme` og under `[data-tema="moerk"]`
- [ ] Værdierne stemmer med `designprofil.md` - ikke med hukommelsen

**Typografi**
- [ ] Profilens skrifter er indlejret og faktisk i brug (tjek beregnet `font-family` i inspektoren)
- [ ] Bruges systemstakken, står begrundelsen i afleveringen
- [ ] Hver indlejret fil under 40 kB, kun de vægte designet bruger
- [ ] Fallback-skriften er metrisk justeret, eller det er målt, at intet flytter sig, når skriften lander

**Layoutstabilitet**
- [ ] Genindlæst med tom cache og langsom forbindelse ved 375 px: intet hopper
- [ ] Alle billeder, videoer og indlejringer har reserveret plads (`width`/`height` eller `aspect-ratio`)
- [ ] Alt, der fyldes af JS, har en højde eller et sideforhold, før indholdet kommer
- [ ] Intet indsættes over eksisterende indhold efter load

**Layout**
- [ ] Ingen vandret scroll ved 320, 375, 768 og 1440 px
- [ ] Højst to breddebaserede media queries, og de er sat, hvor designet faktisk knækker
- [ ] Brede tabeller, kodeblokke og diagrammer scroller i egen beholder
- [ ] Ét eller to gitterbrud på fladen, og de falder tilbage til noget roligt på mobil
- [ ] Zoom til 200 procent: intet indhold forsvinder eller overlapper

**Interaktion og tilgængelighed**
- [ ] Hele fladen kan betjenes med Tab, Enter, Mellemrum, piletaster og Esc
- [ ] `:focus-visible` er synlig overalt og har mindst 3:1 mod baggrunden
- [ ] Alle klikmål er mindst 44x44 px med mindst 8 px imellem
- [ ] Mobilmenuen: `aria-expanded` opdateres, Esc lukker, fokus vender tilbage, punkterne er 44 px høje
- [ ] Tastaturmodellen er kørt igennem pr. komponent: piletaster, Home/End, typeahead i lange lister, Esc
- [ ] Hvert felt, der kan valideres, har en fejl-node - konsollen advarer ikke ved test-submit
- [ ] Validering sker tidligst ved `blur`, fejlen forsvinder i samme øjeblik den rettes, og `aria-invalid` fjernes med den
- [ ] Fejl ved submit opsummeres i `role="alert"`, og fokus går til første fejlende felt
- [ ] Gyldigt input afvises aldrig på grund af mellemrum, store bogstaver, +45, æøå eller punktummer
- [ ] Select, radio, checkbox, dato og filupload er stylet, ikke browserens standard
- [ ] Kontrast målt: brødtekst ≥ 4,5:1, stor tekst og grafik ≥ 3:1 - i begge temaer
- [ ] Ingen information bæres af farve alene
- [ ] `prefers-reduced-motion: reduce` fjerner al ikke-essentiel bevægelse
- [ ] Dynamiske ændringer annonceres via `role="status"` eller `aria-live="polite"`

**Indhold**
- [ ] Ingen lorem ipsum, ingen pladsholderbilleder
- [ ] Al tekst er dansk, korrekturlæst og i virksomhedens stemme
- [ ] Tom, indlæsning, fejl og overfyldt tilstand er bygget for hver liste
- [ ] Fejlskærmen er set med netværket slået fra, og den har både en handling og en vej til et menneske
- [ ] Ordene "undefined", "null", "NaN" og "Invalid Date" kan ikke nå skærmen
- [ ] Lister over 200 elementer er pagineret eller virtualiseret, sidetallet står i URL'en, og totalen vises
- [ ] Print er bygget eller eksplicit uden for scope; skal der leveres en mail, er den bygget som sin egen fil
- [ ] Pris, telefonnummer og adresse er synlige uden formular
- [ ] Alle links peger et rigtigt sted hen eller er markeret med en kommentar om, hvad kunden skal indsætte
- [ ] Formularen sender faktisk et sted hen

**Sidste øjekast**
- [ ] Fladen har én visuel pointe, man kan sige i én sætning
- [ ] Navigationsprøven holder: dæk alt undtagen menuen - man kan stadig se, hvilket site og hvilken side det er
- [ ] Den ligner denne virksomhed - ikke en skabelon, nogen kunne købe

## 10. API-huskeliste

Ting, der løser opgaven med indbyggede midler i stedet for kode.

| Behov | Brug |
|---|---|
| Let overlejring uden fokusfælde (menu, tooltip, popover) | `popover`-attributten + `popovertarget` på knappen. Browseren klarer laget og lukning ved Esc og klik udenfor |
| Komponentens egen bredde i JS | `new ResizeObserver(…)` - pak kroppen i `requestAnimationFrame`, ellers får du "loop completed with undelivered notifications" i konsollen |
| Foldbart indhold | `<details><summary>` |
| Modal | `<dialog>.showModal()` |
| Fremdrift | `<progress value max>` |
| Auto-komplettering | `<input list>` + `<datalist>` |
| Komponent der reagerer på sin egen bredde | `container-type:inline-size` + `@container` |
| Tilstand fra et barn styrer forælderen | `:has()` |
| Blødt scroll til anker | `scroll-behavior:smooth` (pakket ind i reduced-motion-tjek) |
| "Kommer til syne ved scroll" | `IntersectionObserver` - aldrig en scroll-lytter |
| Klistret sidehoved | `position:sticky;top:0` |
| Kopiér til udklipsholder | `navigator.clipboard.writeText()` + synlig kvittering |
| Dato, tal og valuta | `Intl.DateTimeFormat('da-DK')`, `Intl.NumberFormat('da-DK',{style:'currency',currency:'DKK'})` |
| Ental og flertal i en tælling | `Intl.PluralRules('da-DK')` |
| Årstal i footeren | `document.querySelector('[data-aar]').textContent=new Date().getFullYear()` |
| Gem valg lokalt | `localStorage` - med `try/catch`, den fejler i privat tilstand |
| Reagér på breddeskift i JS | `matchMedia(...).addEventListener('change', …)` - aldrig en resize-lytter uden throttle |
| Skjult for øjet, læst af skærmlæser | `.visuelt-skjult{position:absolute;width:1px;height:1px;overflow:hidden;clip-path:inset(50%);white-space:nowrap}` |
| Skjult for alle | `hidden` |
| Uden for tastatur og skærmlæser (baggrund bag overlay) | `inert` |
| Tal i tabeller flugter | `font-variant-numeric:tabular-nums` |
| Farve på checkbox og radio | `accent-color` |
| Optisk ens ikonstørrelse | `.ikon{width:1em;height:1em}` + `stroke="currentColor"` |

### Signaturerne, du skal have rigtigt

Seks API'er bærer stort set al adfærd i en SMV-flade. Fejlene i dem er altid de samme, så de står
med.

```
<dialog>
  d.show()              åbner UDEN fokusfælde, uden inert baggrund, uden backdrop
  d.showModal()         åbner modalt: baggrunden bliver inert, Esc lukker, ::backdrop tegnes
  d.close(vaerdi)       lukker og sætter d.returnValue
  d.open                boolsk. Læs den - sæt den aldrig selv, så mister du fokusfælden
  d.returnValue         value fra den knap, der lukkede en <form method="dialog">
  hændelser             'close' efter lukning, 'cancel' ved Esc (kan stoppes med preventDefault)
  Fælde 1  showModal() på en dialog, der allerede er åben, kaster. Tjek d.open først.
  Fælde 2  klik på ::backdrop rammer selve <dialog>-elementet. Derfor virker
           e.target === d som "klik uden for indholdet".
  Fælde 3  ind- og udanimation kræver allow-discrete på display og overlay, se motion.md.
```

```
<details>
  el.open               boolsk, kan både læses og sættes
  hændelse 'toggle'     fyrer EFTER tilstanden er skiftet, både ved åbn og luk
  name="gruppe"         flere <details> med samme navn bliver gensidigt udelukkende, uden JS
  Fælde 1  browserens søgefunktion åbner selv en lukket <details>. Din 'toggle'-lytter
           skal kunne tåle at blive kaldt uden at nogen har klikket.
  Fælde 2  højden kan ikke animeres direkte. Brug grid-template-rows-mønsteret i motion.md.
```

```
IntersectionObserver
  new IntersectionObserver(kald, {root, rootMargin:'0px 0px -20% 0px', threshold:0.2})
  kald(poster)          poster[].isIntersecting, .intersectionRatio, .target
  io.observe(el) / io.unobserve(el) / io.disconnect()
  Fælde 1  elementet skal have en højde. Et tomt element på 0 px udløser aldrig noget.
  Fælde 2  skal effekten kun ske én gang, kald io.unobserve(post.target) inde i kaldet.
  Fælde 3  rootMargin måles fra roden, ikke fra elementet, og procent gælder kun,
           når roden er viewporten.
  Brug den til "kommer til syne ved scroll", dovent indhold og vagtposten i bunden
  af en lang liste. Aldrig en scroll-lytter.
```

```
matchMedia
  const mq = matchMedia('(width >= 48em)')
  mq.matches                       tilstanden lige nu
  mq.addEventListener('change', e => e.matches ? … : …)
  Fælde   lytteren fyrer KUN ved skift. Kald din opsætning én gang selv ved opstart,
          ellers er tilstanden forkert, indtil brugeren tilfældigvis ændrer vinduet.
  Bevægelse: matchMedia('(prefers-reduced-motion: reduce)').matches - brug den, før du
  starter en animation i JS. CSS-siden af reglen ejer motion.md.
```

```
navigator.clipboard
  await navigator.clipboard.writeText(tekst)
  Krav    sikker kontekst (https eller file:) OG udløst af et rigtigt klik
  Fejler  i iframes uden tilladelse og i ældre klienter - derfor altid try/catch
  Mønster try { await navigator.clipboard.writeText(t); kvitter('Kopieret'); }
          catch { vis teksten i et felt, markeret, så brugeren kan kopiere selv }
  Kvitteringen er obligatorisk og skal stå i en role="status". En kopiknap, der ikke
  svarer, opleves som i stykker, og brugeren trykker igen og igen.
```

```
Constraint Validation (formularvalidering)
  el.willValidate       false på disabled, readonly, type=hidden og knapper. Filtrér på den FØRST
  el.checkValidity()    → boolsk. Fyrer 'invalid' på feltet, viser ingenting
  el.reportValidity()   → boolsk, og viser browserens egen boble. Brug den ikke sammen med novalidate
  el.validity.*         valueMissing, typeMismatch, patternMismatch, tooShort, tooLong,
                        rangeUnderflow, rangeOverflow, stepMismatch, badInput, customError, valid
  el.setCustomValidity(s)  sætter customError. TØM med setCustomValidity('') før hver ny kontrol,
                        ellers er feltet ugyldigt for evigt
  form.elements         alle felter, også dem der ligger uden for <form> med form="id"
  Fælde 1  en radiogruppe rapporterer required på hver enkelt knap. Valider gruppen, ikke knappen.
  Fælde 2  type="number" giver badInput ved bogstaver, og el.value er så tom streng -
           du kan ikke læse, hvad brugeren skrev. Brug inputmode="numeric" på et tekstfelt,
           når du selv vil validere indholdet.
```
