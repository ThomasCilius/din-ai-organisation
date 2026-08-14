# Designsystem - fastlæg systemet, før du bygger fladen

Denne fil bruges EFTER `designprofil.md` er læst. Profilen ejer retningen, skrifterne, paletten og ambitionsniveauet for kontrast (AA eller AAA). Denne fil oversætter profilen til et system, der kan bygges efter: konkrete tal, roller, tokens og gates - herunder de konkrete kontrastgates i §3, som resten af pakken auditerer imod. Modsiger noget her `designprofil.md`, vinder profilen på valget; udførelsen står her. Er profilen tavs om et punkt (fx målbredde, densitet, mørk visning), afgør du det her og skriver det ind i tokens, så resten af bygningen kan læne sig op ad ét sted.

**Systemet fastlægges før første komponent.** Skriver du `<section>` før tokens findes, ender du med hardcodede tal, og fladen kan ikke rettes ét sted.

## Hvem ejer hvad

Når to referencer siger noget forskelligt om samme emne, gælder denne fordeling. Find du en modsigelse, retter du den fil, der IKKE ejer emnet.

| Emne | Ejer |
|------|------|
| Valg af skrift, skala, linjehøjde, målbredde, tal-typografi | Denne fil |
| Hvor skrifterne hentes, og hvilken licens de skal have | Denne fil |
| Farveroller, opbygning af farveskalaen, de konkrete kontrastgates, reglerne for mørk visning | Denne fil |
| Spacing-skala, densitet, lagantal, radieskalaens trin og værdier | Denne fil |
| Valg af ikonsæt og ikonets stregkarakter | Denne fil |
| Layout-arketypen pr. retning: gitterform og kompositoriske greb | Denne fil |
| Indlejring af skrifter og ikoner, leverancekontrakt, layout-mekanik (grid, breakpoints, gitterbrud), den konkrete CSS-blok til mørkt tema, **og det kanoniske tokennavnesprog i koden** | `html-motor.md` |
| Skyggelære og skyggeskala, koncentrisk radiematematik, ikonoptik (størrelsestrin, stregtykkelse pr. størrelse, optisk centrering), interaktionstilstande, fokusringens udseende, klikflader, adskillelsestrappen | `polering.md` |
| Varigheder, easing, forsinkelser, flytteafstande, reduceret motion | `motion.md` |
| Retningsvalget, paletten og kontrastniveauet (AA/AAA) | `designprofil.md` (skrevet af designretning) |
| Audit af den færdige flade | `anti-slop-review.md` |

Rollenavnene i denne fils tokens (`--surface`, `--space-6`, `--radius-lg`) er systemets sprog. Kodens kanoniske navne står i `html-motor.md` §3, og oversættelsen sker dér. Der ligger aldrig to navnesæt i den samme færdige fil.

---

## Beslutningsrækkefølge (lås i denne orden)

| # | Lås | Output | Går ikke videre før |
|---|-----|--------|---------------------|
| 1 | Retning | Ét navn fra profilen | Retningen står som ét ord + 3 troværdighedsvalg |
| 2 | Typografi | 1-2 familier, skala, linjehøjde, målbredde, talbehandling, ikonsæt | Æ, Ø, Å er testet i begge familier, og licensen er tjekket |
| 3 | Farve | Skala bygget fra brandfarven, semantiske roller, lys + mørk | Kontrast målt på brød, stor tekst, UI-kant, fokusring - i begge visninger |
| 4 | Spacing | Én skala + densitet + sektionsrytme | Skalaen har trin, du bevidst IKKE bruger |
| 5 | Overflader | Antal lag (maks. 3), radier, kanter | Radierne er koncentriske, jf. `polering.md` §1 |
| 6 | Layout-arketype | Gitterform, hero-form, sektionsrytme | Arketypen kan navngives, og den passer til retningen |
| 7 | Motion | Varigheder + easing + reduceret motion | Se `motion.md` |
| 8 | Nedskrivning | `:root`-blok med alle tokens + systemfil med beslutningslog | Ingen hardcodede hex, px eller ms uden for blokken |

Springer du et trin over, opdager du det som rod i trin 5-6 og betaler for det i hele fladen.

---

## 1. Retningen, kort

Retningen er allerede valgt i `designprofil.md`. Tabellen her er kun til at eksekvere den: kolonnen "troværdighedsvalg" er de ting, der afgør, om retningen læses som et fagligt valg eller som et kostume, og "dødsfælde" er den fejl, der oftest afliver netop den retning.

| Retning | Tre troværdighedsvalg | Dødsfælde |
|---------|----------------------|-----------|
| Editorial | Målbredde holdes selv på bred skærm; mindst én stor typografisk gestus (initial, hero-citat i 72 px+); billedtekster og kilder i egen, mindre stil | Serif-overskrift ovenpå et almindeligt tre-kolonners kort-grid |
| Brutalisme | Radius 0 overalt uden undtagelser; kanterne er ægte struktur, ikke dekoration lagt uden om kort; rasteret brydes bevidst ét sted | Bløde skygger, 8 px radius og en pastelfarve, der sniger sig ind |
| Luksus lys | Sektionspadding 128-192 px på desktop; højst én accent, brugt på under 5 % af fladen; kort tekst overalt | Mange elementer med luft imellem. Luksus er FÅ elementer |
| Luksus mørk | Baggrunden har kulør, aldrig `#000000`; dybde via lysere overflader og hairlines, ikke skygger; brødtekst 85-90 % hvid | Valgt fordi det "ser dyrt ud" til en flade med 800 ord, der skal læses |
| Bento | Mindst tre feltstørrelser; hvert felt har sit eget indholdsmønster; stramt gittermellemrum (8-16 px) | Ni lige store felter med ikon, overskrift og to linjer tekst |
| Geometrisk / schweizisk | Gridet er synligt: elementer flugter på tværs af sektioner; maks. tre skriftstørrelser i brød; ingen centreret tekst | "Stramt" bliver kedeligt uden mindst ét sted med voldsom skalakontrast |
| Retro-futurisme | Mono bruges funktionelt (data, koder, labels); tekstur på 2-5 % over hele fladen; maks. to mættede farver | Neon-gradient på alt. Så er det 2018-SaaS med nostalgifilter |
| Legende | Én illustrationsstil, ikke blandet stock; farverne holder kontrastkravet; der er alvor ved priser, vilkår og kontakt | Legende brugt til at dække over tyndt indhold |
| Industriel | Ægte foto fra virksomheden, aldrig stock; kontaktvejen er stor og gentaget; versaler kun i overskrifter, med `letter-spacing: 0.02em` | Sort/gul advarselstape uden virksomhedens eget indhold |
| Organisk | Formerne er faktisk uregelmæssige (SVG eller skæve radier), ikke bare store radier; mindst én nedbrudt farve, ikke kun pastel; kontrasten løftes i tekstlaget | Blødt over det hele. Uden ét stramt element bliver det uskarpt |
| Scrollytelling | Historien har en reel rækkefølge; alt indhold findes uden scroll-effekter; reduceret motion giver en fuldt læsbar statisk version | Scroll-effekter på en flade uden fortælling. Så er det bare langsommere |

**Én retning pr. flade.** Ingen blanding. Vælger du editorial, må der ikke også være bento-felter og brutalistiske kanter.

**Operationelt:** skriv retningen som ét ord øverst i CSS'en som kommentar sammen med de tre troværdighedsvalg. Er du i tvivl om en komponent, læser du de tre linjer og svarer derfra.

**Kvoten for modige valg:** fladen skal have 2-3 valg, en gennemsnitlig konkurrent ikke ville turde. Fx en overskrift i 96 px, en fuldbredde farveflade, en asymmetrisk hero i 60/40 eller et nøgletal i display-skrift i 140 px. Under 2 er fladen anonym. Over 4 kæmper de om opmærksomheden.

**Gentagelse er også slop.** Lander du på samme accent-kulør, samme skriftpar og samme layoutgreb som sidste flade, du byggede, er det ikke et system, det er en vane. Skift mindst én bærende parameter, eller skriv i kommentaren hvorfor gentagelsen er det rigtige her. Undtagelsen er den flade, der allerede har en systemfil (§7): dér er gentagelsen selve pointen.

---

## 2. Typografi

### Valg af familier

Maks. 2 familier. Tre modeller, vælg én:

| Model | Opsætning | Bruges når |
|-------|-----------|------------|
| Ét-familie | Én grotesk i vægt 400/500/700 plus skalakontrast | Fladen er indholdstung, kompleksitetsbudgettet er lille, retningen er geometrisk eller bento |
| Kontrastpar | Display eller serif til overskrift + neutral sans til brød | Editorial, luksus, organisk - hvor overskriften skal bære karakteren |
| Sans + mono | Neutral sans til brød + mono til data og labels | Teknisk produkt, retro-futurisme, dashboards |

Beslutningsregel: kan du ikke sige, hvad den anden familie GØR, som den første ikke kan, skal du kun bruge én.

Roller, du skal have taget stilling til: brød, overskrift/display, labels og UI, tal og tabeller, kode. Tal og kode må gerne være samme mono, men det er et valg, ikke en tilfældighed.

**Parret skal have kontrast i mindst to af tre akser:** form (serif over for sans), proportion (bred over for smal, høj over for lav x-højde) og stregkontrast (jævn over for tyk/tynd). To neutrale groteske er to skrifter og ét udtryk - brug så kun den ene.

### Skrifter der virker (frie licenser, Google Fonts eller SIL OFL)

**Brødtekst, sans:** Inter, Source Sans 3, IBM Plex Sans, Public Sans, Figtree, Work Sans, Manrope.
**Brødtekst, serif:** Source Serif 4, Literata, Newsreader, Lora, Spectral, Libre Baskerville.
**Overskrift og display:** Fraunces (variabel, meget karakter), Instrument Serif, Bricolage Grotesque, Archivo inkl. Expanded, DM Serif Display, Syne, Unbounded, Bebas Neue (kun korte overskrifter).
**Tal og tabeller:** enhver af ovenstående med `font-variant-numeric: tabular-nums`, eller en mono. Kravet er, at cifrene har samme bredde.
**Mono:** JetBrains Mono, IBM Plex Mono.
**Systemstak uden webfont:** legitimt, når hastighed vejer tungere end karakter, fx interne værktøjer - men vær opmærksom på, at auditten i `anti-slop-review.md` behandler systemskrift som et fund på en kundevendt flade. Vælger du den, skal begrundelsen stå i CSS-kommentaren.

### Konkrete parringer pr. retning

Startpunkter, ikke lov. Afviger du, skal afvigelsen kunne begrundes i én sætning - og den sætning hører i systemfilens beslutningslog (§7).

| Retning | Display / overskrift | Brød | Tredje rolle |
|---------|---------------------|------|--------------|
| Editorial | Fraunces (høj optisk størrelse, stor stregkontrast) eller Instrument Serif | Source Serif 4 eller Newsreader | Archivo i versal-label til billedtekster og kilder |
| Brutalisme | Archivo Expanded 700 eller Bricolage Grotesque | IBM Plex Sans 400 | IBM Plex Mono til metadata og tal |
| Luksus lys | Instrument Serif eller DM Serif Display | Figtree eller Work Sans, vægt 300-400 | Ingen. Tredje skrift ødelægger roen |
| Luksus mørk | Fraunces i lav optisk størrelse (tyndere streger, mere kontrast) | Manrope 400 | Manrope 600 til nøgletal med `tabular-nums` |
| Bento | Én familie: Archivo eller Public Sans i 400/600/800 | Samme familie, 400 | Samme familie, `tabular-nums` til felternes tal |
| Geometrisk / schweizisk | Archivo 700 med hård skalakontrast | Archivo eller Public Sans 400 | IBM Plex Mono til billedtekster og labels |
| Retro-futurisme | Unbounded eller Syne | IBM Plex Sans | JetBrains Mono, brugt funktionelt til data og koder |
| Legende | Bricolage Grotesque eller Fraunces med wonk-akse | Figtree | Ingen. Karakteren ligger i display-skriften og illustrationerne |
| Industriel | Archivo Expanded eller Bebas Neue (kun korte overskrifter) | IBM Plex Sans | IBM Plex Mono til varenumre, mål og specifikationer |
| Organisk | Fraunces (wonk- og soft-akse) eller Lora | Spectral eller Literata | Ingen |
| Scrollytelling | Newsreader eller Literata i display-vægt | Public Sans | `tabular-nums` på alle tal i fortællingen |

Bemærk parringen af `Fraunces` med to forskellige indstillinger i luksus lys og mørk: variable skrifter tæller som ÉN familie, uanset hvor mange akser du bruger. Det er den billigste vej til karakter uden at bryde loftet på to familier eller motorens loft på antal filer.

### Hvor skrifterne kommer fra, og hvordan de hostes

**Licenskravet er hårdt:** SIL OFL 1.1 eller Apache 2.0. "Gratis til personlig brug", "free for non-commercial" og skrifter fundet på en samlingsside uden licensfil må ikke afleveres til en kunde. Kan du ikke finde licensteksten, findes licensen ikke.

| Kilde | Hvad den er god til | Vær opmærksom på |
|-------|--------------------|------------------|
| Google Fonts | Bredeste udvalg af pålidelige brødtekstskrifter, komplette danske tegn | Hent filerne (`Get font` → download). Aldrig `<link>` til deres CDN - se `html-motor.md` §2 |
| Google Fonts' egne kildearkiver | Nyere variable akser end webudgaven, fx `Fraunces` med wonk og soft | Kildefilerne er ofte `.ttf` og skal subsettes og konverteres selv |
| Fontshare | Karakterfulde display- og grotesk-skrifter, der ikke ligner Google Fonts | Tjek at netop den vægt, du vil bruge, findes i `woff2` |
| Fontsource | Skrifter som pakker med færdige, subsettede `woff2`-filer - hurtigste vej til selvhosting i et byggeopsætning | Vælg latin-subsettet, ikke alle undersæt |
| Uafhængige OFL-arkiver (fx Velvetyne, Collletttivo, Open Foundry, The League of Moveable Type, Use & Modify) | Display-skrifter med reel egenart, når retningen skal turde noget | Danske tegn mangler ofte. Kør dansk-testen nedenfor, FØR du binder designet til skriften |

**Selvhosting i tre skridt.** Motorens loft er maks. 3 filer og 40 kB pr. fil efter base64 (`html-motor.md` §2). Det holder kun, hvis du subsetter:

1. Lås variabel-aksen, hvis du ikke bruger hele aksen: `fonttools varLib.instancer EgenSkrift-VF.ttf wght=400 -o egen-400.ttf`
2. Subset til dansk latin med tegnsætning, cifre og valuta:

```bash
pyftsubset egen-400.ttf \
  --output-file=egen-400.woff2 --flavor=woff2 \
  --layout-features="kern,liga,tnum" \
  --unicodes="U+0020-007E,U+00A0-00FF,U+2013,U+2014,U+2018-201D,U+2026,U+20AC" \
  --desubroutinize
```

`U+00A0-00FF` er det, der indeholder `Æ Ø Å æ ø å`. Dropper du det interval for at spare bytes, får du en dansk flade med huller i teksten.

3. Indlejr efter mønsteret i `html-motor.md` §2. Denne fil definerer ikke `@font-face`.

Kan en skrift ikke komme under loftet efter hård subsetting, dropper du den og bruger fallback-stakken - og skriver det i afleveringen. En display-skrift, der koster 90 kB, er ikke et designvalg, det er et performancetab, brugeren betaler for.

### Blacklist - skrifter og par der får arbejdet til at ligne en skabelon

| Skrift eller par | Hvorfor væk |
|------------------|-------------|
| Montserrat, særligt til overskrifter | Den mest brugte skabelonskrift der findes. Signalerer gratis tema. |
| Montserrat + Open Sans | Standardparret i tusindvis af temaer. Ingen karakter tilbage. |
| Playfair Display + Montserrat | Bryllupsinvitationsparret. Signalerer 2016. |
| Open Sans, Lato, Nunito som primær | Neutrale til usynlighed. Fungerer, men tilføjer intet. |
| Poppins | Geometrisk med korte underlængder. Læses dårligt i længere dansk tekst og er overalt. |
| Raleway | Den ejendommelige `W` og de tynde vægte gør den skrøbelig i brødtekst. |
| Roboto som defaultvalg | Fint i Android-kontekst, men typisk valgt fordi det var det første forslag. |
| Oswald og Anton som brødtekst | Kondenserede skrifter er overskriftsskrifter. Ulæselige i afsnit. |
| Lobster, Pacifico og lignende script-display | Én gestus, der gentages i hver eneste overskrift. Efter to linjer er charmen brugt op. |
| Impact | Memeskrift. Uanset kontekst læses den som et billedcitat, ikke som en overskrift. |
| Trajan | Filmplakat og advokatlogo. Bærer så meget kulturel bagage, at den overdøver indholdet. |
| Permanent Marker, Bradley Hand, Brush Script og andre håndskrifts-imitationer | Foregiver en personlighed, fladen ikke har. Æ, Ø og Å er næsten altid dårligt tegnet. |
| Courier New som brødtekst | Ægte skrivemaskineskrift har for lav sværte og for stor bogstavafstand til at læses i afsnit. Vil du have mono, så vælg en mono tegnet til skærm. |
| Comic Sans, Papyrus, Jokerman og lignende | Ingen professionel kontekst. |
| Arial, Helvetica, Times uden begrundelse | Ikke et valg, men en manglende beslutning. |

Tre skrifter kræver særlig modvægt, fordi de er sprogmodellernes egne standardsvar: **Inter**, **Space Grotesk** og **Clash Display**. Inter må gerne bære brødteksten, hvis overskriften har karakteren. Space Grotesk og Clash Display vælges kun, hvis du kan skrive én sætning om, hvad netop den gør for netop denne flade - ellers er de bare "det sikre alternativ til Inter", og så er valget truffet af vanen.

**Dansk-test er obligatorisk.** Før en skrift låses: gengiv `Æ Ø Å æ ø å` i både overskrifts- og brødvægt, og se på det. Mange display-skrifter har dårligt tegnede eller helt manglende danske tegn. Gengiv også et rigtigt langt sammensat ord (`arbejdsmiljøkonsulent`) - det afslører for tæt knibning og dårlig orddeling.

### Skala og hierarki

Vælg ÉN ratio og hold den:

| Ratio | Navn | Bruges til |
|-------|------|-----------|
| 1,2 | Lille terts | Datatunge flader, dashboards, mange niveauer |
| 1,25 | Stor terts | Standardvalg til produkt- og marketingsider |
| 1,33 | Kvart | Editorial, luksus, flader med få niveauer |
| 1,5 | Kvint | Kun når der er 3-4 niveauer i alt, og hero skal dominere |

Konkret skala ved 1,25 med 16 px basis, rundet til hele px: 13 / 16 / 20 / 25 / 31 / 39 / 49 / 61 / 76.

**Hero må bryde skalaen.** Den kanoniske hero-skala for hele pakken er:

```css
--text-hero: clamp(2.75rem, 1.2rem + 6.5vw, 6rem);
```

Bruger motoren et andet tokennavn til samme rolle, får det tokennavn denne værdi. Der findes kun én hero-skala.

**Skalakontrast er hierarkiets motor.** Er h1 32 px og h2 28 px, findes hierarkiet kun i teorien. Kravet: mindst faktor 2,5 mellem største og mindste tekst på fladen, og mindst ét spring, der springer et trin over.

**Vægt gør ikke arbejdet alene.** Fed brødtekst som "hierarki" er en genvej. Rigtig rækkefølge: størrelse → farve og tone → vægt → afstand → versaler.

### Linjehøjde, knibning, målbredde

| Element | Linjehøjde | Letter-spacing | Note |
|---------|-----------|----------------|------|
| Display over 56 px | 0,95-1,05 | -0,02 til -0,03em | Store skrifter ser luftige ud ved 1,2 |
| Overskrift 28-56 px | 1,10-1,20 | -0,01 til -0,02em | |
| Underoverskrift 20-27 px | 1,30-1,40 | 0 | |
| Brødtekst 16-19 px | 1,55-1,65 | 0 | Dansk har lange sammensatte ord, giv luft |
| Småtekst 13-15 px | 1,45-1,55 | 0 til +0,01em | |
| Versal-label | 1,20 | +0,06 til +0,10em | Versaler kræver altid ekstra knibning |

Brødtekstens 1,55-1,65 er også gate-værdien i §8 og skal være den værdi, auditten måler efter. Godkender en audit-liste et bredere bånd, er listen forkert, ikke fladen.

**Målbredde:** brødtekst 62-72 tegn. Sæt det som `max-width: 68ch` på tekstblokken, ikke som en px-bredde på containeren. Ingress og manchet må gå ned til 50-58 tegn for at læses hurtigere. En brødtekst over 90 tegn er en fejl uanset retning.

Målbredden er ét tal for hele pakken: motorens tekstbredde-token sættes til `68ch`, og auditten måler mod 62-72 tegn. Møder du 65ch eller et bånd på 55-80 tegn i en anden fil, er det den fil, der skal rettes.

**Minimumsstørrelser:** brødtekst aldrig under 16 px på mobil (iOS zoomer på inputfelter under 16 px). Hjælpetekst aldrig under 13 px. Tekst under 12 px er en tilgængelighedsfejl, ikke et designvalg.

### Tal og data

Tal er indhold på lige fod med tekst, og på dashboards, prislister, nøgletalssektioner og tabeller er de det, brugeren faktisk kommer efter. Bygger du bento eller geometrisk, er tallene ofte det stærkeste designelement, du har.

- **Talskala, tre niveauer.** Nøgletal (hero-agtigt, 64-140 px, gerne display-skrift), tabeltal (samme størrelse som brødtekst) og labeltal (småtekst). Fandt du kun ét niveau, er tallene sat som løbende tekst, og pointen forsvinder.
- **Cifre skal flugte.** `font-variant-numeric: tabular-nums` på alt, der står i kolonner eller opdateres. Uden det hopper tallene sidelæns, og kolonnen ser skæv ud.
- **Talkolonner højrestilles, tekstkolonner venstrestilles.** Overskriften over en talkolonne følger kolonnen, ikke tabellens venstrekant.
- **Enheden er ikke tallet.** Sæt `kr.`, `%`, `stk.` og `mdr.` i mindre størrelse, lavere vægt eller `--text-muted`, så selve tallet bærer. Enheden må aldrig knække til næste linje: bind den med `white-space: nowrap`.
- **Dansk formatering.** Komma som decimaltegn, punktum eller tyndt mellemrum som tusindtalsseparator. Blandet notation på samme flade er et fund.
- **Akser og etiketter er roller, ikke farver.** Aksestreger bruger `--border`, gitterlinjer en svagere variant, akse-etiketter `--text-faint` og dataetiketter `--text-muted`. Selve dataserien bruger `--accent` og modfarven. Hardcodede diagramfarver er den hyppigste vej ind i en flade, der ikke kan skifte tema.
- **Retning før pynt.** Et tal, der bevæger sig, skal have retningen med som ikon eller fortegn, ikke kun som grøn eller rød farve. Farve alene bærer ikke betydning.

### Ikonografi er en typografisk beslutning

Ikonerne står side om side med skriften og aflæses som en del af den. Vælger du et tungt, fyldt ikonsæt til en let serif, ser fladen sammenklippet ud, uanset hvor rigtige tallene er. Her vælges sættet og stregkarakteren; størrelsestrin, stregtykkelse pr. størrelse og optisk centrering ejes af `polering.md` §6, og selve SVG-sprite-mekanikken af `html-motor.md` §2.

**Ét sæt på hele fladen.** Blandede sæt er den tydeligste sammenklippet-markør, der findes. Mangler du ét ikon i sættet, tegner du det i sættets stil - du henter det ikke et andet sted.

Frie sæt, der kan afleveres: Lucide (outline, jævn streg, meget bredt), Phosphor (seks vægte inkl. fyldt og duotone), Tabler (outline, stramt 24 px-raster), Remix Icon (outline og fyldt i par), Material Symbols (variabel akse for vægt og fyldning). Alle er MIT- eller Apache-licenserede. Tjek licensfilen, samme krav som for skrifter.

Matchningen mod typografien:

| Skriftens karakter | Ikonstil | Grundstreg ved 24 px |
|--------------------|----------|----------------------|
| Let serif eller display med tynde streger (Instrument Serif, Fraunces høj optisk størrelse) | Outline, runde hjørner, tynd streg | 1,5 px |
| Neutral grotesk 400-500 (Public Sans, Figtree, Manrope) | Outline, neutral streg | 1,75 px |
| Kraftig grotesk eller expanded (Archivo Expanded, Bricolage 700) | Outline med tung streg, eller fyldt | 2-2,5 px |
| Mono-tung teknisk flade (IBM Plex Mono, JetBrains Mono) | Outline, skarpe hjørner, 90 graders knæk | 1,75-2 px |
| Legende eller organisk (Bricolage med wonk, Fraunces soft) | Afrundede endestykker, gerne let uregelmæssige | 2 px |

Grundstregen låses som ét token, `--ikon-streg`, og skaleres derfra efter tabellen i `polering.md` §6. Skriv den aldrig direkte på det enkelte `<symbol>`.

- Ikonets hjørneradius skal følge fladens radieskala i ånden: kører retningen radius 0, har ikonerne skarpe hjørner og `stroke-linecap: butt`; kører den 16-24 px, har ikonerne `stroke-linejoin: round`.
- Ikoner arver farve via `currentColor`. Et hardkodet ikon er den fejl, der først viser sig i mørk visning.
- Fyldte ikoner bruges KUN til at markere en valgt tilstand, når resten af sættet er outline. Blandet uden system er støj.
- Illustrationer er ikke ikoner. Har fladen både, skal illustrationerne have samme stregtykkelse i forhold til deres størrelse, ellers ser de ud til at komme fra to leverandører.

### Indlæsning

Valget af skrift hører til her. Selve indlejringen - base64, subsetting, størrelsesloft og fallback - ejes af `html-motor.md` §2 og skal følges derfra. Denne fil definerer ikke `@font-face`.

Praktisk konsekvens for dit valg: motoren tillader et begrænset antal filer med et hårdt loft pr. fil. Vælg derfor variable fonts, hvor det kan lade sig gøre, og vælg kun de vægte, designet faktisk bruger. Fallback-stakken skal have nogenlunde samme x-højde som den valgte skrift, ellers hopper layoutet ved swap.

---

## 3. Farvesystem

### Semantiske roller, ikke dekorative navne

Navngiv efter FUNKTION. `--blue-500` fortæller ikke, hvor den må bruges, og overlever ikke en mørk visning. Minimumssættet:

```
Baggrund:   --bg, --bg-subtle
Overflader: --surface, --surface-raised
Kanter:     --border, --border-strong
Tekst:      --text, --text-muted, --text-faint, --text-on-accent
Aktion:     --accent, --accent-hover, --accent-active, --accent-subtle
Fokus:      --focus-ring
Status:     --ok, --ok-bg, --warn, --warn-bg, --danger, --danger-bg
```

Reglen: en komponent må kun referere til roller. Ser du `background: #1f6feb` inde i en komponent, mangler der en rolle.

Bruger motoren eller poleringen andre tokennavne til de samme roller, er det navnene der skal forenes, ikke rollerne der skal fordobles. Læg aldrig to sæt tokens for samme rolle i samme `:root`.

### Byg skalaen fra brandfarven - i et perceptuelt farverum

Du har typisk ÉN farve givet: brandfarven. Alt andet skal udledes. Gør du det i hex eller HSL, gætter du.

**Hvorfor hex og HSL ikke duer.** `hsl(60 100% 50%)` og `hsl(240 100% 50%)` har samme tal for lysstyrke, men den gule er næsten hvid og den blå næsten sort. HSL's `L` beskriver et matematisk midtpunkt, ikke det øjet ser. Konsekvensen er en skala, hvor trinene springer uens: to nabotrin i det gule område kan ikke skelnes, mens to nabotrin i det blå ligner to forskellige farver. Og fordi kontrast følger oplevet lysstyrke, bliver kontrastforholdene tilfældige, når du skifter kulørtone.

**Arbejd i `oklch()`.** `oklch(L C H)` er bygget på oplevet lysstyrke: `L` går fra 0 til 1 og betyder det samme uanset kulør, `C` er kroma (mætning uafhængigt af lysstyrke), `H` er kulørtonen i grader. Samme `L` på tværs af kulører giver samme oplevede lysstyrke. Det er dét, der gør skalaen forudsigelig, og det er dét, der gør, at du kan skifte brandets kulørtone uden at bygge kontrasten om.

Rækkefølgen:

1. **Konvertér brandfarven til oklch, og lås `H`.** Kulørtonen er brandet. Alt andet er dit at bestemme.
2. **Byg lysstyrketrinene efter tabellen nedenfor.** `L` er fast, `C` er en faktor gange dit maks-kroma. Kroma skal toppe i midten: fuld kroma på et lyst trin giver en beskidt pastel, og fuld kroma på et mørkt trin giver en næsten sort klat.
3. **Byg neutralerne af SAMME `H`** med kroma 0,008-0,03. Det er hele hemmeligheden bag "neutraler med temperatur" (udvej 1 nedenfor) - du skal ikke finde en grå, du skal skrue kroma ned på brandfarven.
4. **Modfarven** ligger enten analogt (`H` ± 30-60 grader, roligt) eller næsten komplementært (`H` ± 150-210 grader, hårdt). Giv den samme `L`-trin, men 10-20 % lavere kroma end accenten, ellers slås de to om opmærksomheden.
5. **Pluk rollerne fra trinene** efter kolonnen "typisk rolle".
6. **Mål kontrasten bagefter.** Et perceptuelt farverum giver ensartede spring, ikke WCAG-overholdelse. WCAG regner i sRGB-luminans og skal måles særskilt, jf. kontrastafsnittet nedenfor.

| Trin | `L` | Kroma-faktor | Typisk rolle |
|------|-----|--------------|--------------|
| 50 | 0,98 | 0,10 | `--accent-subtle`, meget svag baggrundstoning |
| 100 | 0,95 | 0,18 | hover på en svag flade, valgt række i en tabel |
| 200 | 0,90 | 0,32 | kant på svag flade, chip-baggrund |
| 300 | 0,82 | 0,55 | deaktiveret accent, dekorativ streg |
| 400 | 0,70 | 0,85 | `--accent` i MØRK visning |
| 500 | 0,58 | 1,00 | `--accent` i lys visning, hvis kontrasten holder |
| 600 | 0,50 | 0,95 | `--accent-hover` i lys visning |
| 700 | 0,42 | 0,85 | `--accent-active`, accentfarvet tekst på lys bund |
| 800 | 0,33 | 0,65 | tekst oven på en lys accentflade |
| 900 | 0,24 | 0,45 | mørk bund med brandtone |

**Tærsklen, der afgør tekstfarven på accenten:** hvid tekst holder typisk fra `L` 0,60 og nedefter, mørk tekst fra `L` 0,72 og opefter. Båndet 0,61-0,71 er dødt land - vælg side, i stedet for at håbe. Det er også dét bånd, "hvid tekst på en mættet knap"-fejlen bor i.

**Hold kroma under ca. 0,16.** Over det falder mange kulørtoner uden for sRGB ved `L` 0,6-0,75, browseren klipper til nærmeste gyldige farve, og to nabotrin ender identiske. Skal fladen se ens ud alle steder, er 0,16 loftet.

```css
:root {
  /* Brandet: to tal styrer hele paletten */
  --accent-tone:    262;    /* H i oklch - brandets kulørtone */
  --accent-kroma:   0.14;   /* maks. kroma, holdes under 0,16 for sRGB */
  --neutral-tone:   262;    /* samme kulørtone: dét er temperaturen */
  --neutral-kroma:  0.012;  /* 0,008-0,03. Over det er neutralen ikke neutral */

  /* Accent-trin: L er fast, kroma er en faktor af --accent-kroma */
  --accent-50:  oklch(0.98 calc(var(--accent-kroma) * 0.10) var(--accent-tone));
  --accent-200: oklch(0.90 calc(var(--accent-kroma) * 0.32) var(--accent-tone));
  --accent-400: oklch(0.70 calc(var(--accent-kroma) * 0.85) var(--accent-tone));
  --accent-500: oklch(0.58 var(--accent-kroma)              var(--accent-tone));
  --accent-600: oklch(0.50 calc(var(--accent-kroma) * 0.95) var(--accent-tone));
  --accent-700: oklch(0.42 calc(var(--accent-kroma) * 0.85) var(--accent-tone));

  /* Neutraler: samme kulørtone, kroma skruet ned */
  --neutral-0:   oklch(0.99 var(--neutral-kroma) var(--neutral-tone));
  --neutral-100: oklch(0.96 var(--neutral-kroma) var(--neutral-tone));
  --neutral-300: oklch(0.88 var(--neutral-kroma) var(--neutral-tone));
  --neutral-600: oklch(0.55 var(--neutral-kroma) var(--neutral-tone));
  --neutral-900: oklch(0.18 var(--neutral-kroma) var(--neutral-tone));

  /* Rollerne peger på trinene - komponenter ser kun rollerne */
  --accent:        var(--accent-500);
  --accent-hover:  var(--accent-600);
  --accent-active: var(--accent-700);
  --accent-subtle: var(--accent-50);
}
```

Trinene er byggeriets stillads, rollerne er facaden. En komponent må aldrig referere til `--accent-600`; den refererer til `--accent-hover`. Skifter brandet farve, retter du to tal øverst, og hele fladen følger med - inklusive neutralerne.

Skal afleveringen understøtte browsere uden `oklch()`, konverterer du trinene til hex TIL SIDST, lægger hex-værdien som fallback lige over `oklch()`-linjen, og måler kontrasten på hex-værdierne. Konvertering før måling er den klassiske vej til en palet, der kun holder på papiret.

### 60-30-10 i praksis

60 % neutral baggrund og overflader, 30 % en sekundær tone (tonet overflade, tekstfarve, dæmpet brandfarve), 10 % accent. Accenten skal gøre ondt at bruge, fordi den er sjælden. Det er dét, der får knapper og links til at virke.

Tæl efter på den byggede flade: er accentfarven brugt mere end 6-8 steder over folden, er den ikke længere en accent.

### Sådan undgår du grå-på-hvid med én accent

Diagnosen: `#FFFFFF` baggrund, `#333333` tekst, `#F5F5F5` kort, én blå knap. Det er defaulttilstanden, ikke et valg. Fire udveje, og **mindst to skal være brugt** - det er et punkt i gaten i §8:

1. **Giv neutralerne temperatur.** Neutraler med kulør læses som valgte. Det er præcis dét, `--neutral-kroma` gør ovenfor: samme kulørtone som accenten, kroma skruet ned til 0,008-0,03. Rene gråtoner er fravalgt, ikke valgt.
2. **Byg 4-5 tekstniveauer, ikke 2.** `--text` (næsten sort), `--text-muted` (60-70 % vej ned), `--text-faint` (labels), `--text-on-accent` plus accentfarvet tekst til links. Hierarki i farve er gratis dybde.
3. **Tilføj en modfarve, der bruges sjældent.** En anden farve end accenten, til highlights, nøgletal eller citatstreger. 1-2 % af fladen. Det er den, der gør paletten til en palet.
4. **Lad en sektion vende paletten.** Én sektion med mørk eller mættet baggrund og lys tekst bryder monotoni bedre end nogen kortskygge.

### Kontrast - hårde gates

Mål med et kontrastværktøj, gæt aldrig. Krav efter WCAG 2.2 AA:

| Element | Minimum |
|---------|---------|
| Brødtekst og al tekst under 24 px | 4,5:1 |
| Stor tekst (≥ 24 px, eller ≥ 18,66 px i bold) | 3,0:1 |
| UI-grænser: knapkant, inputkant, ikon der bærer betydning | 3,0:1 |
| Fokusindikator mod tilstødende baggrund | 3,0:1 |
| Deaktiverede elementer | Undtaget af kravet, men gør dem stadig læsbare |

Fejl der går igen: placeholder-tekst under 4,5:1, hvid tekst på en mættet accent (test den, mange accenter kræver mørk tekst), muted tekst målt mod baggrunden i stedet for mod den overflade, den faktisk står på, og fokusring i accentfarve på en accentfarvet knap.

**Farve må aldrig bære betydningen alene.** Status kræver ikon eller tekst ud over farven. Links i brødtekst kræver understregning eller en anden markør end farve.

### Mørk visning er en visning, ikke en efterbehandling

Mørk visning bygges samtidig med den lyse og gennemgår den samme audit. Den er ikke en `@media`-blok, du skriver til sidst, og den er ALDRIG en invertering. Reglerne står her; den konkrete CSS-blok, der implementerer dem, står i `html-motor.md` og skrives kun ét sted.

Vælg, hvilken visning der er standarden, efter retningen: luksus mørk og retro-futurisme starter mørkt, resten starter lyst. Uanset valget defineres ALLE roller i lys visning på `:root`, og kun de tokens, der ændrer sig, overskrives. Aldrig en farve, der kun findes inde i en `@media`-blok.

**Paletten spejles.** Du beholder kulørtonen og afstandene mellem rollerne og vender lysstyrkeaksen for de flader, der bærer indholdet - men ikke blindt for alt:

| Rolle | Lys visning (`L`) | Mørk visning (`L`) | Hvad der sker |
|-------|-------------------|--------------------|----------------|
| `--bg` | 0,98-1,00 | 0,16-0,20, kroma 0,015-0,025 | Aldrig 0. Kulør bevares, så bunden ikke er død |
| `--bg-subtle` | ét trin MØRKERE end `--bg` | ét trin LYSERE end `--bg` | Retningen vendes: i mørke betyder "hævet" lysere |
| `--surface` | 1,00 | 0,20-0,23 | |
| `--surface-raised` | = `--surface` + skygge | 0,24-0,27 + hairline, INGEN skygge | Dybde skifter middel, ikke bare værdi |
| `--text` | 0,15-0,20 | 0,92-0,95 | Ikke 1,00. Ren hvid på mørk bund flyder ud |
| `--text-muted` | 0,45 | 0,70-0,75 | Afstanden til `--text` spejles, ikke tallet |
| `--text-faint` | 0,58 | 0,60-0,65 | Rykker mindst, fordi den skal blive ved med at være svag |
| `--border` | 0,88 | 0,30-0,34 | Kanter i mørke er lysere end fladen, ikke mørkere |
| `--accent` | 0,50-0,58 | 0,68-0,74, kroma 10-20 % lavere | Trin 500 bliver til trin 400 |
| `--accent-hover`, `--accent-active` | ét og to trin MØRKERE end `--accent` | ét og to trin LYSERE end `--accent` | Tilstandsretningen vendes med baggrunden. Mangler de i den mørke blok, arves de lyse værdier, og nedtrykket ser ud som en fejl |
| `--accent-subtle` | 0,96 | 0,26-0,30, lav kroma | Tonet mørk flade, ikke en lys plet |
| Status-par (`--ok`, `--ok-bg` m.fl.) | fg 0,30-0,40 / bg 0,95 | fg 0,72-0,80 / bg 0,24-0,28 | Bygges som par, ikke ved at flytte én af dem |

Læg mærke til, at `--text`, `--text-muted` og `--text-faint` IKKE bytter indbyrdes rækkefølge. Baggrundslagene vender retning; teksthierarkiet gør ikke. Det er hele forskellen mellem en spejling og en invertering.

**Hvad der går galt ved naiv inversion:**

1. **`filter: invert(1)` eller inverterede hex-værdier rammer også indholdet.** Fotos bliver negativer, logoer skifter farve, og et diagram, der betød noget, betyder nu noget andet.
2. **Ren sort bund (`#000000`).** Lys tekst på ren sort giver halation - teksten "gløder" og bliver træls at læse, især for læsere med astigmatisme. Og du har intet lag tilbage under bunden, når noget skal ligge lavere.
3. **Skyggerne overlever ikke.** En mørk skygge på en mørk flade er usynlig. Beholder du skyggeskalaen uændret, forsvinder al dybde, og fladen bliver flad uden at nogen kan pege på hvorfor. Skift middel: lysere overflade plus hairline.
4. **Mættede farver vibrerer.** Den accent, der var behagelig på hvidt, flimrer mod mørk bund. Sænk kroma 10-20 % og hæv lysstyrken, i stedet for at genbruge tallet.
5. **Kontrast er ikke symmetrisk.** En muted grå med 4,6:1 mod hvid har ikke 4,6:1 mod mørk bund efter en simpel omvending. Hvert eneste tekstniveau måles på ny.
6. **`--text-on-accent` skifter måske side.** Løftes accenten til `L` 0,70 i mørk visning, skal teksten på den ofte være mørk, ikke hvid. Den fejl ses kun, hvis knappen faktisk bliver testet i mørk visning.
7. **Overlays vendes.** Et halvgennemsigtigt sort overlay bliver til mudder på mørk bund. I mørk visning lægges overlay som hvid med lav alfa.
8. **Billeder og illustrationer skal dæmpes, ikke inverteres.** En let `filter: brightness(0.92)` fjerner den skarpe kant mod den mørke bund. Logoer og SVG-illustrationer leveres som separate varianter.

**Attributnavnet er `data-tema`** med værdierne `moerk` og `lys` i hele pakken. Systemvalget håndteres med `prefers-color-scheme`, og en manuel knap skal vinde begge veje: `:root:not([data-tema="lys"])` inde i mørk-media og `:root[data-tema="moerk"]` uden for.

Kan du kun nå at gøre én visning helt færdig, er det et scope-valg, der skal stå i afleveringen og i systemfilens beslutningslog - ikke noget, der ordnes med en media query til sidst.

---

## 4. Spacing og rytme

### Skalaen

4 px-basis, ikke-lineær opad. Brug disse trin og ingen andre:

`2, 4, 8, 12, 16, 24, 32, 48, 64, 96, 128, 160`

Sektionsafstand skaleres med viewport:
`--space-section: clamp(4rem, 2.5rem + 6vw, 10rem);`

### Densitet er et valg, ikke en tilfældighed

Vælg ét af tre og hold det, ellers får dashboardet marketingsidens luft og omvendt:

| Densitet | Bruges til | Konsekvens |
|----------|-----------|------------|
| Tæt | Dashboards, tabeller, admin, værktøjer | Ryk padding og mellemrum ét trin ned på skalaen. Sektionsafstand maks. 64 px |
| Normal | Produktsider, de fleste B2B-flader | Skalaen som den står |
| Luftig | Luksus, editorial, korte fortællende flader | Ryk sektionsafstand ét trin op, ikke padding inde i komponenter |

Densiteten ændrer aldrig selve skalaen. Den ændrer kun, hvilke trin du plukker fra.

### Uniform padding dræber hierarkiet

Får alt 24 px padding og 24 px mellemrum, siger layoutet intet om, hvad der hører sammen. Rytme er forskellen, ikke ensartetheden.

Nærhedsreglen, som du eksekverer efter: **afstanden mellem to elementer, der hører sammen, skal være mindre end afstanden ud til det, de ikke hører til.** Konkret:

| Relation | Afstand |
|----------|---------|
| Overskrift til sin egen brødtekst | 8-12 px |
| Mellem afsnit i samme blok | 16-24 px |
| Mellem to blokke i samme sektion | 48-64 px |
| Mellem to sektioner | 96-160 px |

Det er 1:2:4:8-forholdet. Er springet fra "hører sammen" til "hører ikke sammen" mindre end faktor 2, læser øjet det ikke.

**Optisk frem for matematisk.** Toppen af en versal ligger lavere end boksens kant, og runde former stikker ud over rette. `polering.md` §7 har detaljerne; de tre, du skal kende allerede her:

- Padding over en overskrift må trimmes 2-4 px i forhold til padding under.
- Ikon ved siden af tekst justeres optisk, ikke på boksens baseline.
- En knap med kun et ikon har brug for lige padding hele vejen rundt; en knap med tekst har brug for mere vandret end lodret, typisk forholdet 1,8:1.

**Vertikal rytme:** vælg 4 px som mindste enhed og lad alle lodrette afstande være delelige med 4. Det er nok til, at fladen føles rolig, uden at tvinge dig ind i en stiv baseline-grid.

---

## 5. Overflader og dybde

### Lag

Maks. 3 niveauer: baggrund → overflade → hævet overflade. Et fjerde niveau kan ikke aflæses og opstår altid ved et uheld (modal i modal, kort i kort).

**Hvordan du adskiller to flader fra hinanden, er allerede afgjort:** brug adskillelsestrappen i `polering.md` §8 og tag det laveste trin, der virker (luft → baggrundsskift → kant → skygge). Rækkefølgen er ikke en smagssag, og der findes kun én af dem i pakken.

To ting værd at huske, når du vælger trin: lysstyrkeskift på overfladen er det eneste middel, der også virker i mørk visning, og overlap eller beskæring giver den stærkeste dybdevirkning uden at koste en eneste effekt. Overlap hører hjemme i editorial og organisk.

### Skygger

Skyggelæren og skyggeskalaen ejes af `polering.md` §5, inklusive tokennavne og lagdeling. Definér dem dér og brug dem herfra. Skriv ikke en konkurrerende skala ind i denne fils `:root`.

### Radier og kanter

```
--radius-sm: 6px      (inputs, tags, små knapper)
--radius-md: 10px     (knapper, felter)
--radius-lg: 16px     (kort, paneler)
--radius-xl: 24px     (sektionsflader, modaler)
--radius-full: 999px  (pills, avatar)
```

Ligger et element inde i et andet, gælder `ydre radius = indre radius + afstanden mellem dem`. Regnestykket og undtagelserne står i `polering.md` §1.

Radier er også et retningsvalg: brutalisme og schweizisk kører 0 overalt, organisk kører 20-32 px, bento kører 12-20 px. Bland ikke - vælg ét niveau og lad hele skalaen følge det. Ikonernes hjørner følger samme valg, jf. §2.

**Kanter:** `--border` skal være 3:1 mod overfladen, hvis den bærer betydning (fx en inputkant), og må gå ned til cirka 1,3:1, hvis den kun er dekorativ adskillelse. Brug `1px`, og brug kun `2px`, hvis retningen er brutalistisk.

---

## 6. Layout-arketyper

Retningen bestemmer ikke kun skrift og farve. Den bestemmer gitteret. Vælger du editorial og bygger det på et symmetrisk tre-kolonners kortgitter, er retningen kun en påklædning. Her vælges arketypen; mekanikken - grid over for flex, selvombrydende gitter, container queries, breakpoint-kvoten og de tilladte gitterbrud - ejes af `html-motor.md` §4.

| Retning | Gitterform | Kompositoriske greb | Bredder |
|---------|-----------|---------------------|---------|
| Editorial | Asymmetrisk 12-spors gitter; brødteksten ligger i 6-7 spor forskudt fra midten | Initial, marginnoter, billeder der bryder ud i margenen, pull quote i sidespalten | `--container` 76rem, `--measure` 66ch |
| Brutalisme | 12 spor med synlige 1 px-kanter mellem alle celler, `gap: 0` (cellerne deler kant) | Fuldbredde-bånd, tekst helt ud i kanten, ingen ydre padding på store flader | `--container` 100 %, `--gutter` lille |
| Luksus lys | Enkelt centreret spalte, intet gitter | Store tomme felter, maks. to elementer i bredden, alt hviler på `--space-section` i høj ende | `--container` 60-64rem |
| Luksus mørk | Enkelt spalte forskudt mod venstre tredjedel | Stort billed- eller farvefelt i højre side, der løber til kanten | `--container` 72rem, indhold i venstre 55 % |
| Bento | `repeat(6, 1fr)` med felter der spænder 2, 3 og 4 spor og rækker der spænder 2 | Mindst tre feltstørrelser, hvert felt med sit eget indholdsmønster, stramt mellemrum | `--gutter` 8-16 px |
| Geometrisk / schweizisk | Stramt 12-spors gitter, samme venstrekant gennem hele fladen | Labelspalte i spor 1-3, indhold i 5-12; ingen centreret tekst; ét sted med voldsom skalakontrast | `--container` 76rem |
| Retro-futurisme | To spalter: smal mono-labelspalte til venstre, indhold til højre | Rammer og skillelinjer som i et datablad, svag rastertekstur i bunden | `--container` 68rem |
| Legende | Centreret enkelt spalte | Illustrationer bryder ud over sektionens kant, store radier, farvede sektionsflader | `--container` 64rem |
| Industriel | Fuldbredde hero med foto, derefter 3-4 spors datablokke | Klæbende kontaktbånd, tabelagtige specifikationer, versal-labels | `--container` 80rem |
| Organisk | Forskudte to-spaltede rækker i zigzag | Overlappende former, ingen lige kant mellem to sektioner, ét stramt element som modvægt | `--container` 72rem |
| Scrollytelling | Klæbende visuelt felt (55-60 %) plus rullende tekstspalte (40-45 %) | Ét trin pr. skærm, tekstblokke i `--measure`, fuldt læsbar statisk version uden scroll-effekter | `--measure` 60ch |

### Hero-arketyper

Der findes fire, og valget er ikke frit:

| Hero | Passer til | Kræver |
|------|-----------|--------|
| Typografisk (ingen billede) | Editorial, schweizisk, brutalisme, luksus | En overskrift der kan bære alene: `--text-hero` i øverste ende |
| Venstretung split 60/40 | Produkt, industriel, retro-futurisme | Ægte indhold i højre felt: skærmbillede, foto, nøgletal - ikke en dekorativ figur |
| Fuldbredde billede med forskudt tekstblok | Industriel, organisk, legende | Rigtige billeder fra virksomheden og målt kontrast på teksten over billedet |
| Centreret | Luksus lys, legende | Kort tekst. Centreret hero PLUS tre lige store kort under er standardsloppet - brug kun én af delene |

### Sektionsrytme

- Samme sektionsform må ikke gentages mere end to gange i træk. Skift mellem tekst-med-billede, fuldbredde-bånd, gitter og citat- eller nøgletalsblok.
- Hver flade har mindst ét fuldbredde-brud, hvor indholdet forlader `--container`. Uden det bliver siden en lang kolonne i en kasse.
- Gitterbruddet tælles i `html-motor.md` §4 og lægges IKKE sammen med kvoten for modige valg i §1.
- Vælger du et selvombrydende gitter, sættes den mindste sporbredde som token (`--gitter-min`), ikke som et tal i komponenten. Ellers kan tætheden ikke justeres ét sted.

---

## 7. Skriv systemet ned

### Token-blokken

Alt ovenstående lever ét sted, øverst i stylesheet'et. Ingen komponent må indeholde en rå hex-kode, en rå px-værdi til afstand eller en rå ms-værdi.

```css
:root {
  /* --- RETNING: [ét ord]. Troværdighedsvalg: 1) ... 2) ... 3) ... --- */
  /* --- LAYOUT-ARKETYPE: [navn fra §6]. Hero: [arketype] --- */
  /* --- AFVIGELSER FRA PROFILEN: [dato] [hvad] fordi [grund] --- */

  /* Typografi */
  --font-display: "Fraunces", Georgia, serif;
  --font-body: "Inter", -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
  --font-mono: "JetBrains Mono", ui-monospace, monospace;

  --text-xs:   0.8125rem;  /* 13 */
  --text-sm:   0.875rem;   /* 14 */
  --text-base: 1rem;       /* 16 */
  --text-lg:   1.25rem;    /* 20 */
  --text-xl:   1.5625rem;  /* 25 */
  --text-2xl:  1.9375rem;  /* 31 */
  --text-3xl:  2.4375rem;  /* 39 */
  --text-4xl:  3.0625rem;  /* 49 */
  --text-hero: clamp(2.75rem, 1.2rem + 6.5vw, 6rem);

  --leading-display: 1.0;
  --leading-heading: 1.15;
  --leading-body: 1.6;
  --tracking-display: -0.025em;
  --tracking-label: 0.08em;
  --measure: 68ch;         /* 62-72 tegn */

  /* Ikoner: grundstreg ved 24 px. Skalering pr. størrelse: polering.md §6 */
  --ikon-streg: 1.75px;

  /* Farve - lys visning er sandheden. Trinene bygges efter §3 */
  --accent-tone:   262;
  --accent-kroma:  0.14;
  --neutral-tone:  262;
  --neutral-kroma: 0.012;

  --bg:             oklch(0.99 var(--neutral-kroma) var(--neutral-tone));
  --bg-subtle:      oklch(0.96 var(--neutral-kroma) var(--neutral-tone));
  --surface:        oklch(1.00 0 0);
  --surface-raised: oklch(1.00 0 0);
  --border:         oklch(0.88 var(--neutral-kroma) var(--neutral-tone));
  --border-strong:  oklch(0.72 var(--neutral-kroma) var(--neutral-tone));
  --text:           oklch(0.18 var(--neutral-kroma) var(--neutral-tone));
  --text-muted:     oklch(0.45 var(--neutral-kroma) var(--neutral-tone));
  --text-faint:     oklch(0.58 var(--neutral-kroma) var(--neutral-tone));
  --text-on-accent: oklch(1.00 0 0);
  --accent:         oklch(0.58 var(--accent-kroma)              var(--accent-tone));
  --accent-hover:   oklch(0.50 calc(var(--accent-kroma) * 0.95) var(--accent-tone));
  --accent-active:  oklch(0.42 calc(var(--accent-kroma) * 0.85) var(--accent-tone));
  --accent-subtle:  oklch(0.96 calc(var(--accent-kroma) * 0.14) var(--accent-tone));
  --counter:        oklch(0.62 0.13 calc(var(--accent-tone) + 170)); /* modfarve, maks. 2 % af fladen */
  --focus-ring:     oklch(0.55 var(--accent-kroma) var(--accent-tone));
  --ok:     oklch(0.45 0.11 150);  --ok-bg:     oklch(0.96 0.03 150);
  --warn:   oklch(0.55 0.12 75);   --warn-bg:   oklch(0.96 0.05 75);
  --danger: oklch(0.48 0.16 25);   --danger-bg: oklch(0.96 0.04 25);

  /* Spacing */
  --space-1: 0.25rem; --space-2: 0.5rem;  --space-3: 0.75rem;
  --space-4: 1rem;    --space-6: 1.5rem;  --space-8: 2rem;
  --space-12: 3rem;   --space-16: 4rem;   --space-24: 6rem;
  --space-32: 8rem;   --space-40: 10rem;
  --space-section: clamp(4rem, 2.5rem + 6vw, 10rem);

  /* Layout - arketypen fra §6 sætter disse tre */
  --container: 72rem;
  --gutter: clamp(1rem, 0.5rem + 2vw, 2.5rem);
  --gitter-min: 18rem;     /* mindste sporbredde i et selvombrydende gitter */

  /* Overflader */
  --radius-sm: 6px; --radius-md: 10px; --radius-lg: 16px;
  --radius-xl: 24px; --radius-full: 999px;
  /* Skyggetokens: defineres efter skalaen i polering.md §5 - ikke her */

  /* Motion: --tid-* og --ease-* defineres i motion.md §2 - ikke her */
}
```

Mørk visning og reduceret motion sættes i samme `:root`-arkitektur efter mønstrene i `html-motor.md` og `motion.md`, med `data-tema` som attribut. Der må kun være ét sæt tokens pr. rolle i den færdige fil. Bruger motoren sit eget navnesprog (`--farve-bund`, `--plads-6`, `--maal-bredde`), oversætter du efter tabellen i `html-motor.md` §3 - du lægger ikke begge sæt ind.

Brug derefter kun roller:

```css
.kort {
  background: var(--surface);
  border: 1px solid var(--border);
  border-radius: var(--radius-lg);
  padding: var(--space-6);
}
.kort h3 {
  font-size: var(--text-xl);
  line-height: var(--leading-heading);
  margin-bottom: var(--space-2);
}
.kort p { color: var(--text-muted); max-width: var(--measure); }
.kort .tal { font-variant-numeric: tabular-nums; }

.kort svg { stroke-width: var(--ikon-streg); stroke: currentColor; }

:where(a, button, input, select, textarea, summary):focus-visible {
  outline: 2px solid var(--focus-ring);
  outline-offset: 2px;
  /* Fokusringen animeres aldrig - den skal være der med det samme. Reglen ejes af
     motion.md §5.6, og fokusringens udseende af polering.md §3. */
  transition: none;
}
```

### Systemet er en fil, ikke en session

Tokens, der kun findes inde i den HTML, du lige byggede, er ikke et system. De er en kopi, den næste flade skal gætte sig til. Derfor afleveres systemet altid også som en selvstændig fil i projektet - `designsystem-[projekt].md`, eller en `tokens.css` med et kort dokument ved siden af.

Filen indeholder præcis dette:

1. Retningen som ét ord plus de tre troværdighedsvalg.
2. Layout-arketypen og hero-arketypen ved navn.
3. Skrifterne med kilde, licens og hvilke vægte og akser der faktisk er indlejret.
4. Ikonsættet med licens og `--ikon-streg`.
5. Hele token-blokken, lys og mørk.
6. Kontrastmålingerne med dato: hvilke par, hvilke tal, hvilken visning.
7. Beslutningsloggen.

```markdown
| Dato | Beslutning | Begrundelse | Fravalgt |
|------|-----------|-------------|----------|
| 2026-08-14 | Fraunces + Manrope | Serif-display bærer retningen, Manrope holder tallene rolige | Instrument Serif: for tynd i mørk visning |
| 2026-08-14 | Accent oklch(0.58 0.14 262) | Trin 500 er eneste trin med 4,6:1 mod --bg | Trin 400: kun 3,1:1 |
```

**Kolonnen "fravalgt" er den vigtigste.** Uden den foreslår den næste session præcis det, du allerede har prøvet og kasseret, og du bruger en time på at nå frem til samme svar igen.

Regler for filen:

- **Læs den først.** Skal du bygge videre på en flade, der har en systemfil, starter du med at læse den. Du genopfinder ikke paletten, og du foreslår ikke en ny skrift, fordi du ikke kan se den gamle.
- **Ret den i samme arbejdsgang.** Ændrer du et token efter aflevering, retter du filen og skriver en linje i loggen. En ændring, der ikke står i loggen, er drift - og en systemfil, der ikke passer til koden, er værre end ingen fil, fordi den næste tror på tallene.
- **Afvigelser er en linje, ikke en tavshed.** Fraviger du profilen eller en af referencerne, skriver du dato, hvad og hvorfor - både i CSS-kommentaren øverst og i loggen.
- **Genbrug er ikke gentagelse.** Filen genbruges på SAMME produkt. Starter du et nyt produkt, kopierer du ikke paletten over - så gælder gentagelsesreglen i §1.

---

## 8. Gate før du bygger første komponent

Alle fjorten skal være opfyldt. Mangler én, mangler systemet, og fladen bliver dyr at rette senere.

- [ ] Retningen står som ét ord plus tre troværdighedsvalg i en kommentar øverst i CSS'en
- [ ] Højst 2 skriftfamilier, begge testet med `Æ Ø Å æ ø å` og et langt sammensat dansk ord
- [ ] Skrifterne er hentet lokalt, licensen er OFL eller Apache, og ingen af dem står på blacklisten uden en skrevet begrundelse
- [ ] Skalaen har én ratio, og der er mindst faktor 2,5 mellem største og mindste tekst
- [ ] Brødtekst har `max-width` i `ch` svarende til 62-72 tegn, og linjehøjde mellem 1,55 og 1,65
- [ ] Ét ikonsæt, licens tjekket, `--ikon-streg` defineret og matchet til skriftens karakter
- [ ] Farveskalaen er bygget fra brandfarven i `oklch`, neutralerne deler kulørtone med accenten, og trinene er skjult bag roller
- [ ] Alle farver er semantiske roller, defineret i lys visning på `:root`, med kun overrides i mørk
- [ ] Mindst to af de fire udveje mod grå-på-hvid er brugt, og det kan udpeges hvilke to
- [ ] Mørk visning er bygget som spejling efter tabellen i §3, ikke som invertering, og skygger er erstattet af lysere overflade plus hairline
- [ ] Kontrast målt: brød ≥ 4,5:1, stor tekst ≥ 3:1, kant og fokusring ≥ 3:1 - i BEGGE visninger
- [ ] Spacing bruger den faste skala, densiteten er valgt, og forholdet mellem "hører sammen" og "hører ikke sammen" er mindst faktor 2
- [ ] Layout-arketypen og hero-arketypen er valgt ved navn, og `--container`, `--gutter` og `--gitter-min` er sat efter den
- [ ] Findes der tal på fladen: talskalaen har mindst to niveauer, cifrene flugter, og diagramfarver kommer fra roller

Er gaten grøn, bygger du. Ikke før. Og når du afleverer, følger systemfilen med - ellers starter næste opgave forfra.
