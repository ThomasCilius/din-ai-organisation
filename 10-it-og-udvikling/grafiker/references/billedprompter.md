# Billedprompter - spor B, når aktivet skal genereres af brugerens generator

Du kører ikke generatoren. Dit færdige aktiv er **prompten plus kritik-tjeklisten**: en
copy-paste-klar promptblok på engelsk, brugeren selv kører i Gemini, DALL-E, Midjourney eller
lignende, og en konkret modtagekontrol, brugeren kan vurdere resultatet med uden at spørge dig
først. Uden tjeklisten har du afleveret en gætteseddel.

Denne fil ejer to emner for hele pakken: **tekst i genererede billeder** (afsnit 8) og
**leveringsformat for det færdige billede** (afsnit 9). Andre filer henviser hertil frem for at
gentage reglerne.

## 1. Først: er det overhovedet spor B?

| Behovet | Spor | Hvorfor |
|---|---|---|
| Ikon, logomærke, pil, procesflow, diagram, infografik | A - byg SVG | Skarpt i alle størrelser, redigérbart, ingen fingerfejl |
| Tal, kurver, sammenligning | A - SVG-diagram | Generatorer tegner tal som pynt, ikke som data |
| Tekst i billedet (slogan, overskrift, UI-tekst) | A + HTML-tekst ovenpå | Se afsnit 8 |
| Produkt, lokale, medarbejder, kunde, case | Rigtigt foto | Et genereret "vores team" er en usandhed på forsiden |
| Stemning, baggrund, tekstur, scene uden identificerbare personer | B - generator | Her tjener den faktisk noget |

Står der ikke B, så byg SVG'en eller bed om fotoet. Skriv aldrig en prompt på noget, der burde
være vektor.

---

## 2. Brief-skemaet - udfyldes FØR prompten skrives

Alle ni felter skal have et konkret svar. Er et felt tomt, spørger du - eller antager eksplicit
og skriver antagelsen i afleveringen. Tomme felter bliver til gennemsnitsbilleder.

| # | Felt | Krav til svaret | Ubrugeligt svar |
|---|---|---|---|
| 1 | Formål | Hvad billedet skal gøre ved læseren netop dér | "vi mangler noget visuelt" |
| 2 | Flade og format | Hero 16:9, kort 4:3, OG-billede 1200x630, socialt 1:1, print 300 dpi | "til hjemmesiden" |
| 3 | Motiv | ÉT hovedmotiv i én sætning | "teamwork og innovation" |
| 4 | Komposition | Hvor motivet sidder, hvor der er luft til tekst, kameraafstand og -højde | "pænt centreret" |
| 5 | Lys | Kilde, retning, hårdhed, tid på dagen | "godt lys" |
| 6 | Farve | 2-4 farver fra `designprofil.md`, oversat til farveORD | "vores farver" |
| 7 | Stemning | Ét adjektivpar, fx "rolig og præcis" | "professionel og moderne" |
| 8 | Tekst i billedet | Næsten altid nej. Ellers: hvilken tekst, og hvorfor CSS ikke kan gøre det | - |
| 9 | Må ikke være med | Konkrete udelukkelser: ansigter, logoer, skærme, stockfoto-poser | "ikke noget grimt" |

Felt 6 og 7 hentes fra designprofilen, ikke fra din smag. Modsiger de hinanden, vinder profilen.

**Visningsstørrelsen hører til felt 2.** Skriv hvor bredt billedet faktisk vises i pixels på den
største flade, det bruges på. Uden det tal kan du ikke sætte leveringskravene i afsnit 9, og så
kommer der et 4 MB hero-billede tilbage.

---

## 3. Promptreglerne der virker på tværs af generatorer

Prompterne skrives **på engelsk** - alle generatorer er trænet bedst der, og danske
sammensatte ord bliver til vrøvl. Det gælder også de valgmuligheder, du sætter i kantede
parenteser: udfylder brugeren en dansk parentes uden at oversætte, sender de dansk ind i en
engelsk prompt.

**Skriv scenen, ikke stemningen.** Generatorer omsætter substantiver og verber til pixels og
adjektiver til støj.

- SKIDT: "an innovative, modern image radiating trust"
- GODT: "a workbench in light oak seen from a 45-degree angle, a tape measure and three steel
  brackets laid out in a row, soft window light from the left, long soft shadows to the right"

**Ét motiv.** Beder du om et bord, en person, en bygning og en graf, får du fire halve. Ét motiv,
resten er baggrund.

**Beskriv materiale og overflade.** Brushed steel, untreated oak, matte paper, lime plaster,
cold-rolled concrete. Materialer giver generatoren noget at regne på; "nice" giver den ingenting.

**Beskriv lyset som en fotograf.** Retning, hårdhed, kilde og hvad skyggerne gør. Lys er den
enkeltfaktor, der skiller et billede, der ligner et rigtigt billede, fra et, der ligner en
generator.

**Luk med én produktionslinje.** Sidste linje i prompten styrer væk fra det AI-look, der ellers
kommer gratis med: `photographic production quality, not concept art, not a collage`. Én linje,
altid den samme, altid til sidst. Ved illustration byttes `photographic` ud med det medie, du
faktisk beder om.

**Angiv formatet eksplicit** - både i prompten og i generatorens egen indstilling:

| Generator | Formatstyring | Bemærk |
|---|---|---|
| Midjourney | `--ar 16:9`, `--ar 1:1` | Parametre til sidst; `--no ...` er det negative felt |
| DALL-E / ChatGPT | Skriv "horizontal 16:9" i prompten | Understøtter kun få faste forhold; vælg blandt dem |
| Gemini | Skriv formatet i prompten og sæt det i UI | Beskær bagefter - derfor skal du bede om luft i kanten |
| Alt andet (lokal Stable Diffusion, Flux, Firefly, Ideogram, noget der kom i går) | Begge dele, hver gang | Se linjen nedenfor |

**Fallback når generatoren ikke står i tabellen:** skriv formatet som ord i prompten
(`horizontal 16:9, wide`) OG sæt det i værktøjets egen indstilling. Ingen generator bliver
dårligere af at få det at vide to gange, og cirka halvdelen ignorerer det ene af de to steder.
Det er den regel, du følger, uanset hvad ejeren kører.

Bed altid om **20-30 % tom flade**, hvor tekst eller logo skal ligge ovenpå. Det er billigere end
at beskære et for stramt billede.

**Negationer virker kun halvt.** "No people" trækker ofte mennesker ind, fordi ordet står i
prompten. Gør to ting: (1) skriv positivt, hvad der SKAL være der i stedet - "an empty workshop,
still and unoccupied" frem for "no people"; (2) læg resten i det negative felt, hvor det findes
(`--no text, watermark, logo, hands`). Findes feltet ikke, fanges det i kritik-tjeklisten.

**Stil uden at nævne levende kunstnere.** Nævn aldrig en nulevende fotograf, illustrator eller et
navngivet studie. Styr stilen med tekniske og historiske håndtag i stedet:

| I stedet for et navn | Skriv |
|---|---|
| "in the style of X" (fotograf) | "35 mm, f/2, shallow depth of field, natural window light, fine film grain" |
| "like Y's illustrations" | "flat vector look, two colours plus paper white, even thick outlines, no gradients" |
| "like Z's posters" | "Swiss poster tradition, strict grid, large negative space, geometric sans" |
| "that 3D look" | "isometric, soft studio light, matte plastic surfaces, no reflections" |

Brede historiske stilperioder er i orden (bauhaus, art deco, dansk modernisme). En navngiven
nulevende person er det ikke.

**Promptskelettet** - samme rækkefølge hver gang, så du kan variere ét led ad gangen:

```
[subject in one sentence] +
[composition and camera position] +
[light] +
[colours in words, 2-4] +
[materials and surfaces] +
[style handles: medium, optics, technique] +
[format and space for text] +
[exclusions] +
[production line]
```

---

## 4. Genre-skabeloner (udfyld de kantede parenteser)

Alt inde i parenteserne skrives på engelsk.

**Produktfoto / stilleben**

```
A single [product] placed on [surface material], shot from a [high / low / 45-degree] angle,
product in the [left / right] third and empty surface in the remaining [third / half].
[Soft side light from a window / hard top light], [long soft / short crisp] shadows.
Colour palette: [colour word 1], [colour word 2], [colour word 3].
Materials: [material], [material].
50 mm, f/4, everything in focus, subtle film grain. Horizontal [format] with clear space for a
headline on the [left / right]. Background clean enough to cut the product out.
No text, no logos, no hands, no packaging copy.
Photographic production quality, not concept art, not a collage.
```

**Hero-baggrund**

```
[Scene / environment] photographed [wide / medium], the subject pushed to the [left / right] so
the [opposite side] stays open and quiet. [Light source and direction], atmospheric but low
contrast so overlaid text stays readable. Colour palette: [colour words].
Materials: [material]. 35 mm, shallow depth of field in the foreground.
Horizontal 16:9 with at least 30 % calm, low-detail area for a headline.
No text, no people, no screens.
Photographic production quality, not concept art, not a collage.
```

Krav: en hero-baggrund skal have et **roligt felt** til teksten. Kommer den tilbage med detaljer
over hele fladen, er den ubrugelig uanset hvor smuk den er.

Udfyldt eksempel, så niveauet af konkrethed er tydeligt (tømrervirksomhed, profil i mørkegrøn og
sandbeige):

```
An empty joinery workshop photographed wide, the workbench and clamp rack pushed to the right
third so the left two thirds stay open and quiet. Late afternoon daylight from high side
windows, atmospheric but low contrast so overlaid text stays readable.
Colour palette: deep bottle green, warm sand beige, dark oak, a little brushed brass.
Materials: untreated oak, cold-rolled steel, lime-plastered wall.
35 mm, shallow depth of field in the foreground, fine film grain.
Horizontal 16:9 with at least 30 % calm, low-detail area on the left for a headline.
No text, no people, no screens, no visible tools branding.
Photographic production quality, not concept art, not a collage.
```

**Menneske i en arbejdssituation** (kun når et rigtigt foto ikke er muligt)

```
A person seen [from behind / cropped at the wrist / in silhouette] while [concrete action] in
[environment]. Face not visible. [Light]. Colour palette: [colour words].
Materials: [material]. 50 mm, f/2.8, shallow depth of field.
[Format] with space for text on the [left / right].
No visible faces, no logos on clothing, no text.
Photographic production quality, not concept art, not a collage.
```

**Stemning / abstrakt tekstur**

```
A close-up of [material or surface], [description of the structure], filling the frame.
[Light and direction], gentle falloff towards the [direction]. Colour palette: [colour words].
Macro, 100 mm, very shallow depth of field. [Format].
No objects, no text, no recognisable shapes.
Photographic production quality, not concept art, not a collage.
```

**Redaktionel scene** (til artikel, nyhedsbrev, case-billede)

```
[Scene] in [environment], [time of day], observed rather than staged - nobody looking at the
camera, nothing arranged for the shot. [Light]. Colour palette: [colour words].
35 mm, f/2.8, natural documentary look, subtle grain. [Format].
No text, no logos, no posed smiles.
Photographic production quality, not concept art, not a collage.
```

---

## 5. Tre varianter, vælg, forfin

Tre prompter, der kun er tre omformuleringer af den samme sætning, giver tre versioner af det
samme billede. Varianterne skal skille sig på **én styrende akse**, og du skriver aksen ned, så
ejeren kan vælge på noget konkret:

- A: tæt beskæring på materialet
- B: luftig totalscene med stort roligt felt
- C: abstrakt motiv, samme palet og lys

Én akse ad gangen. Varierer du både komposition, lys og metafor på tværs af de tre, ved ingen
bagefter, hvad valget faktisk handlede om.

Når ejeren har valgt, forfines der med målrettede ændringer - **højst to pr. runde**:

```
Same as the previous prompt, but: [change 1], [change 2]. Keep everything else identical.
```

**Går to runder i træk uden forbedring, er det briefet og ikke prompten, der er i stykker.** Gå
tilbage til afsnit 2 og stram formål, motiv og komposition. Endnu en promptvariant på et uklart
brief er spildt tid for begge parter.

---

## 6. Sådan holder du billederne inden for designprofilen

Fem prompter uden bindeled giver fem billeder, der ligner fem forskellige virksomheder.

**Skriv billedstil-blokken én gang pr. virksomhed** og klistr den uændret ind i BUNDEN af hver
eneste prompt. Den indeholder kun det, der aldrig varierer:

```
Fixed house style (paste into every prompt):
- Medium: photography, 50 mm, f/2.8, shallow depth of field, fine film grain
- Light: soft natural side light, no flash, no coloured studio gels
- Colour: deep bottle green (#1F4A38), warm sand beige (#E7DCC8), dark oak, occasional brass
- Surfaces: matte and natural - no high gloss, no neon, no glass effects
- Framing: generous negative space, subject never dead centre
- Never: text, logos, screens, recognisable faces
```

Fire regler oven på blokken:

1. **Farveordet styrer, hexen er gratis ekstra.** Generatoren regner på ordene, ikke på
   `#1F4A38`. Oversæt profilens palet til 3-5 faste engelske farveord én gang, og skriv hexen i
   parentes bagefter: `deep bottle green (#1F4A38)`. Ordet virker i alle generatorer; hexen
   rammes af nogle af de nyere og koster ingenting, når den ikke gør. Brug præcis de samme ord i
   alle prompter - skifter du fra "bottle green" til "forest green" undervejs, skifter serien
   farve.
2. **Efterbehandlingen er en del af leverancen.** Den præcise palet rammes efter generering:

   ```css
   .billede-brand {
     position: relative;              /* uden denne lægger tonelaget sig over hele siden */
     --tonelag: var(--farve-accent, #000);  /* fladens accent-token fra det fælles katalog */
     filter: saturate(.85) contrast(1.05);
   }
   .billede-brand::after {            /* tonelag i profilens accentfarve */
     content: ""; position: absolute; inset: 0; pointer-events: none;
     background: var(--tonelag);
     mix-blend-mode: soft-light; opacity: .18;
   }
   ```

   Variabelnavnet `--farve-accent` er det kanoniske navn fra tokenkataloget i
   `designbygger/references/html-motor.md` §3. Bruger fladen et andet navn (fx `--accent`),
   rettes det ét sted - i `--tonelag` - og ikke i hver enkelt regel. Fallbacken `#000` er der med
   vilje: rammer du forkert token, bliver billedet synligt mørkere, i stedet for at
   efterbehandlingen forsvinder lydløst og ingen opdager det.

   Det gør fem billeder fra tre generatorer til én serie. Tjek kontrasten igen, hvis der ligger
   tekst ovenpå.
3. **Ét medie pr. flade.** Bland ikke fotografi, 3D-render og fladtegnet illustration på samme
   side. Vælg ét og hold det.
4. **Samme kameraafstand i en serie.** Tre kort med henholdsvis nærbillede, halvtotal og luftfoto
   ser rodet ud, uanset hvor gode billederne er hver for sig.

---

## 7. Kritik-tjeklisten - den brugeren kører på generatorens output

Afleveres sammen med prompten. Rækkefølgen er valgt, så ingen bruger tre forsøg på lyset i et
billede med forkert motiv. Stop ved første nej, og bed om den rettelse, der står i kolonne 3.

| # | Spørgsmål | Nej betyder |
|---|---|---|
| 1 | Er motivet det, briefen bad om? | Omskriv KUN motivsætningen, behold resten ordret |
| 2 | Er der roligt felt dér, hvor teksten skal ligge? | Bed om mere negativ plads og lavere detaljegrad i det felt |
| 3 | Er lyset ét sammenhængende lys? | Præcisér kilde og retning, fjern øvrige lyskilder |
| 4 | Ligger farverne inden for paletten? | Gentag farveordene - eller løs det i efterbehandlingen |
| 5 | Fejl: hænder, ansigter, tekst, logoer, forkert antal ting? | Ofte er beskæring hurtigere end en ny generering |
| 6 | Er det læsbart ved brugsstørrelsen? | Motiv for småt eller for detaljeret; gå tættere på |
| 7 | Kunne billedet lige så godt stå på konkurrentens side? | Skift til et motiv, der kun findes hos denne virksomhed - eller skær billedet |

Punkt 7 er slop-diagnosen i én sætning. Den fulde begrundelse og de øvrige tells hører til i
`anti-slop-review.md`; står de to steder forskelligt, vinder anti-slop-filen.

**Genre-tillæg, fire linjer at lægge oveni efter behov:**

- *Produktfoto:* er antallet og formen på produktets detaljer rigtige (hanke, lukninger,
  kanter), er skyggen fysisk mulig, og er baggrunden ren nok til at fritlægge?
- *Hero:* læg den rigtige overskrift ovenpå og se på det - først dér ved du, om det rolige felt
  er roligt nok. Og virker beskæringen også i mobilbredde, hvor billedet skæres til højformat?
- *Menneske:* hænder og tænder er de klassiske fejlpunkter. Ser huden ud som hud, eller som
  plastik?
- *Serie:* hold de færdige billeder ved siden af hinanden i den størrelse, de vises i. Fejl i en
  serie ses kun ved siden af hinanden, aldrig ét ad gangen.

**Ét ord ad gangen.** Ændr kun det led, der fejlede, og bevar resten ordret. Ændrer brugeren fire
ting samtidig, ved ingen bagefter, hvad der virkede.

**Opgiv efter tre forsøg på samme fejl.** Har generatoren tre gange leveret forkerte hænder,
ulæselig tekst eller et andet motiv, er den ikke det rigtige værktøj her. Skift til:

- **SVG (spor A)**, hvis motivet er skematisk, ikonisk eller kan tegnes med former.
- **Rigtigt foto**, hvis motivet er virkeligt: produkt, lokale, medarbejder, kunde.
- **Ren typografisk flade eller farveflade**, hvis billedet reelt kun var pynt.

Sig det direkte: "Generatoren rammer ikke det her. Jeg tegner det som SVG i stedet" - og gør det.
Ikke flere prompter.

---

## 8. Tekst i billedet - reglen og den rigtige opsætning

Denne fil ejer emnet. Generatorer forvansker tekst, og æ, ø og å gør det værre. **Bed aldrig om
tekst i et genereret billede.** Skal der stå noget, lægges det som rigtig HTML-tekst ovenpå - så
er det også søgbart, oversætbart og tilgængeligt for skærmlæsere.

Og teksten skal ligge i den rigtige HTML-rolle. En `figcaption` er en billedtekst, ikke en
sideoverskrift; bruger du den til at bære overskriften, står siden uden overskrift i
dokumentstrukturen. Sådan her:

```html
<section class="hero" aria-labelledby="hero-titel">
  <img class="hero__baggrund" src="hero-vaerksted.avif" alt="" width="1600" height="900">
  <div class="hero__indhold">
    <h1 id="hero-titel">Overskriften står her, som rigtig tekst</h1>
    <p>Underrubrikken står her.</p>
  </div>
</section>
```

Billedet er ren baggrund og får derfor `alt=""`. Overskriften er sidens `<h1>`, og sektionen
peger på den med `aria-labelledby`. Én `<h1>` pr. side, som i `html-motor.md`.

**Alt-teksten skriver, hvad billedet betyder i sammenhængen** - ikke hvad der er i det, og
aldrig med "billede af" foran:

- *Informationsbærende* (billedet bærer noget, teksten ikke siger):
  `alt="Montøren spænder beslaget fast med momentnøgle, mens den anden hånd holder pladen på
  plads"`
- *Dekorativt* (billedet gentager eller pynter kun): `alt=""`. Er det rent dekorativt og ligger
  bag tekst, hører det ofte slet ikke hjemme som `<img>`, men som CSS-baggrund.

Er du i tvivl om, hvilken af de to det er: fjern billedet og læs siden. Mangler der information,
er det informationsbærende.

---

## 9. Leveringsformat for det færdige billede

Prompten er ikke leveringen. Et råt hero-billede fra en generator er typisk 3-6 MB, og alene det
sprænger leverancekontraktens loft i `html-motor.md`. Kravene her gælder det billede, der lægges
i projektet:

| Krav | Regel |
|---|---|
| Format | AVIF som førstevalg, WebP som fallback. JPEG kun hvor de to ikke kan bruges. PNG kun ved skarpe kanter plus gennemsigtighed - og der burde svaret som regel være SVG (spor A) |
| Pixelbredde | Maks. **to gange** visningsbredden på den største flade, billedet bruges på. Vises heroen 1200 px bredt, leveres 2400 px - ikke 4096 |
| Filstørrelse | Hero maks. **200 KB**. Artikel- eller kortbillede maks. **100 KB**. Thumbnail maks. **40 KB** |
| Markup | Altid `width` og `height` på `<img>`, så layoutet ikke hopper under indlæsning |

Rammer du ikke loftet, skal detaljegraden eller beskæringen ned - ikke loftet op. Et støjet,
detaljerigt motiv komprimerer dårligt; det er i sig selv et argument for det rolige felt, du
allerede har bedt om.

Filnavnet er en del af leverancen: små bogstaver, bindestreger, ingen æøå, versionsnummer i
navnet. `hero-vaerksted_v3.avif`, ikke `Hero Billede FINAL (2).png`.

---

## 10. Andre faldgruber

**Hænder og ansigter.** Fingre og øjne er der, folk ser fejlen først. Undgå dem: beskær ved
håndleddet, vis personen bagfra eller i silhuet, eller vælg et motiv uden mennesker. Skal der
være et rigtigt menneske, er svaret et rigtigt foto af et rigtigt menneske.

**Genererede portrætter af navngivne medarbejdere.** De ligner ikke, og det bliver opdaget.
Genererede mennesker er til stemning og pladsholdere, aldrig til om os-siden.

**Logoer og varemærker.** Bed aldrig generatoren om at tegne virksomhedens logo eller gengive
andres mærker på produkter, tøj eller skilte. Logoet lægges på bagefter som SVG i korrekt farve
og frizone. Kommer der et hallucineret mærke med, er billedet kasseret - ikke redigeret.

**Stockfoto-udseendet.** Kendetegn: smilende mennesker i skjorte omkring en bærbar, håndtryk,
opadpegende pil, glødende hjerne, robothånd der rører en menneskehånd, blå netværkslinjer på mørk
baggrund. Alt sammen læses som "vi tog det første, der lignede noget". Skriv i stedet motivet fra
virksomhedens egen virkelighed: værktøjet, materialet, produktet, arbejdsbordet, leveringsbilen.

**Et billede der ikke tilføjer noget, skæres helt.** Testen er hård: bliver fladen lige så god
uden billedet, skal billedet væk. Dekorative billeder koster indlæsningstid, opmærksomhed og
troværdighed, og de skubber indholdet ned under skærmkanten. Tom plads er et gyldigt valg -
foreslå aktivt at droppe billedet, når det hverken bærer information, stemning eller genkendelse.

---

## 11. Rettigheder og ansvar

- **Bed aldrig om** en navngiven nulevende kunstners stil, et eksisterende varemærke eller logo,
  en genkendelig virkelig person (kendt, politiker, kunde, medarbejder), eller en gengivelse af
  et konkret ophavsretligt beskyttet værk.
- **Genererede mennesker er ikke jeres folk.** Et genereret ansigt må aldrig præsenteres som
  medarbejder, kunde, anmelder eller case.
- **Genererede billeder er ikke dokumentation.** Aldrig som produktfoto, før-og-efter,
  referencebillede eller bevis for noget, der er sket.
- **Kommerciel ret afklares som en handling, ikke en bekymring.** Vilkårene ændrer sig for tit
  til, at du kan gengive dem efter hukommelsen, så skriv i stedet to konkrete ting i
  afleveringen: (1) hvilken generator prompten er skrevet til, og (2) linjen *"Bekræft i dit
  eget abonnement, at billeder herfra må bruges kommercielt, før billedet publiceres."* Ejeren
  ved, hvilken plan hen sidder på; det gør du ikke.
- **Oplys, når det er relevant.** Ligger et genereret billede et sted, hvor læseren med rimelighed
  kan tro, det er et virkeligt foto (nyhed, case, redaktionelt indhold), skal det fremgå, at det
  er AI-genereret. Ren dekoration og abstrakte baggrunde kræver det normalt ikke.
- **Gem prompten sammen med billedet:** `hero-vaerksted_v3.avif` + `hero-vaerksted_v3.prompt.txt`.
  Uden prompten kan serien ikke udvides, når der skal bruges billede nummer seks.
- **Ejeren beslutter.** Du leverer brief, prompt, tjekliste og anbefaling. Generatoren, kontoen,
  købet og publiceringen er ejerens.

---

## 12. Afleveringsformat (spor B)

1. **Brief-skemaet udfyldt** - ni korte linjer, så ejeren kan se, hvad der er antaget.
2. **Tre prompter**, der skiller sig på én navngiven akse (afsnit 5), hver i sin kodeblok, på
   engelsk, med den faste billedstil-blok i bunden og formatparametre til den generator, ejeren
   bruger. Én linje pr. variant om, hvad aksen er.
3. **Kritik-tjeklisten** fra afsnit 7, tilskåret til de 4-5 punkter der er kritiske for netop
   dette billede, plus det relevante genre-tillæg.
4. **Leveringskravene** fra afsnit 9 i tre linjer: format, maks. bredde, maks. filstørrelse.
5. **Generator og rettighedslinje** fra afsnit 11.
6. **Plan B i én linje:** hvad du gør i stedet, hvis generatoren fejler tre gange - SVG, rigtigt
   foto eller intet billede.
