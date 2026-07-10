> Adapted from gstack (github.com/garrytan/gstack, MIT). Brief-skemaet, prompt-reglerne og kritik-loopet fra gstacks design-modul, runtime strippet: her kører BRUGEREN generatoren (Gemini, DALL-E, Midjourney m.fl.), og skillen leverer prompten og kvalitetsgaten.

# Billedprompter: Brief, skabeloner og kritik-loop

En god billedprompt er ikke en stemningssætning, det er et destilleret brief. Dette dokument rummer brief-skemaet, reglerne for at omsætte brief til prompt, skabeloner pr. genre med udfyldte eksempler, variant/forfin-mønstret og kritik-tjeklisten, som brugeren vurderer generatorens output med.

---

## 1. Brief-skemaet

Udfyld ALTID briefet før du skriver prompten. Hvert felt tvinger en beslutning frem, som ellers ville blive overladt til generatorens tilfældigheder:

| Felt | Indhold | Eksempel |
| --- | --- | --- |
| **goal** | Hvad billedet skal kommunikere, i én sætning | "Hero-billede der viser ro og overblik i bogholderiet" |
| **audience** | Hvem der ser det | "Ejerledere i SMV'er, 40-60 år, ikke-tekniske" |
| **style** | Visuel stil FRA designprofil.md: farver (hex), lys, stemning | "Warm minimal, dusty blue #46698B accents, soft daylight" |
| **elements** | Listen af ting der SKAL være i billedet | ["ryddeligt skrivebord", "laptop", "morgenlys", "kaffekop"] |
| **constraints** | Format, beskæring, friareal, hvad der IKKE må være der | "16:9, negative space in upper third for headline, no text, no logos" |
| **reference** | Uddrag af designprofilen eller et referencebillede i ord | "Matches site palette: cream background, navy text" |
| **format** | Billedtype/flade | produktfoto, hero-baggrund, portræt, illustration |

## 2. Fra brief til prompt (reglerne)

1. **Skriv prompten på engelsk.** Generatorerne er trænet overvejende på engelsk; danske prompter giver ringere styring. Briefet må gerne være dansk, prompten er engelsk.
2. **Fast rækkefølge:** billedtype og mål, dernæst målgruppe/kontekst, dernæst stil (med hex-farver fra designprofilen), dernæst påkrævede elementer, dernæst constraints, dernæst reference. Samme rækkefølge hver gang, så prompter kan sammenlignes og genbruges.
3. **Afslut altid med kvalitetslinjerne:**
   - "The image should look like professional production work, not concept art or a collage."
   - "Composition must be clean and intentional."
   - Plus format: "16:9, high resolution" (eller det aktuelle format).
4. **Ingen tekst i billedet.** Generatorer staver dårligt. Skriv eksplicit "no text, no lettering, no logos" i constraints, og læg al tekst på bagefter som ægte tekst eller SVG. Undtagelse kun når tekstur af tekst er selve motivet (og så aldrig læsbar tekst der skal være korrekt).
5. **Farver som hex, ikke stemningsord.** "Blue tones" giver generatorens yndlingsblå; "dusty blue #46698B and cream #F5F1E8" giver designprofilens.
6. **Én scene pr. prompt.** Vil du have to motiver, så to prompter. Sammensatte ønsker giver collager.
7. **Negativer er constraints.** Alt du ved generatoren plejer at gøre forkert i genren (plastikhud, gridlines, watermark-agtige artefakter), skriv det eksplicit fra.

## 3. Skabeloner pr. genre

### 3.1 Produktfoto

```text
Professional product photograph of [PRODUCT] for [BRAND/CONTEXT].
Target audience: [AUDIENCE].
Style: [LIGHTING, e.g. soft studio lighting / natural window light], [SURFACE/BACKGROUND with hex],
[MOOD]. Brand accent color [HEX] used subtly in props or background.
Required elements: [PRODUCT ANGLE], [PROPS if any], [SHADOW/REFLECTION treatment].
Constraints: [ASPECT], product fills [PORTION] of frame, background clean enough for cutout,
no text, no logos, no hands unless specified.
The image should look like professional production work, not concept art or a collage.
Composition must be clean and intentional. [ASPECT], high resolution.
```

**Udfyldt eksempel** (kaffebrand, designprofil med varm creme og dyb brun):

```text
Professional product photograph of a matte black coffee bag standing upright, for a Danish
specialty coffee brand. Target audience: quality-conscious urban consumers, 25-45.
Style: soft directional window light from the left, warm cream background #F5F1E8, oak
surface, calm premium mood. Brand accent color #3E2B23 echoed in scattered coffee beans.
Required elements: bag centered slightly right of frame, a few whole coffee beans in the
foreground, soft natural shadow falling right.
Constraints: 4:5 vertical, product fills two thirds of frame height, background clean
enough for cutout, no text, no logos, no steam, no cups.
The image should look like professional production work, not concept art or a collage.
Composition must be clean and intentional. 4:5, high resolution.
```

### 3.2 Hero-baggrund

```text
Wide atmospheric background image for the hero section of a [SITE TYPE] for [COMPANY/INDUSTRY].
Target audience: [AUDIENCE].
Style: [AESTHETIC DIRECTION from designprofil.md], palette anchored in [HEX, HEX], [LIGHT/MOOD].
Required elements: [SUBJECT or abstract motif], visual interest concentrated in [AREA].
Constraints: [ASPECT], large calm negative space in [AREA] for headline and CTA overlay,
low contrast in the negative-space area so [LIGHT or DARK] text stays readable (WCAG),
no text, no logos, no people looking at camera.
The image should look like professional production work, not concept art or a collage.
Composition must be clean and intentional. [ASPECT], high resolution.
```

**Udfyldt eksempel** (revisionsfirma, rolig navy/creme-profil):

```text
Wide atmospheric background image for the hero section of a marketing site for a Danish
accounting firm. Target audience: owner-managers of small businesses, non-technical.
Style: warm minimalism, palette anchored in navy #1F3A5F and cream #F7F4EE, soft morning
light, calm and trustworthy mood. Required elements: out-of-focus modern office interior
with warm wood details, visual interest concentrated in the right third.
Constraints: 21:9, large calm negative space in the left two thirds for headline and CTA
overlay, low contrast in the negative-space area so dark navy text stays readable, no text,
no logos, no people looking at camera.
The image should look like professional production work, not concept art or a collage.
Composition must be clean and intentional. 21:9, high resolution.
```

### 3.3 Portræt / team

```text
Professional [ENVIRONMENTAL/STUDIO] portrait of [PERSON DESCRIPTION, ROLE] for [USE].
Target audience: [AUDIENCE].
Style: [LIGHTING], background [DESCRIPTION with hex tone], wardrobe in [PALETTE DIRECTION],
authentic and relaxed expression, not stocky or posed.
Required elements: [FRAMING, e.g. chest-up], eyes in focus, [DEPTH OF FIELD].
Constraints: [ASPECT], consistent with a series (same light, background tone and framing
across all portraits), natural skin texture, no beauty-filter smoothing, no text, no logos.
The image should look like professional production work, not concept art or a collage.
Composition must be clean and intentional. [ASPECT], high resolution.
```

**Udfyldt eksempel** (om os-side, samme serie for hele teamet):

```text
Professional environmental portrait of a woman in her forties, senior consultant, for the
about page of a Danish IT consultancy. Target audience: public-sector decision makers.
Style: soft key light from a large window, background a blurred warm gray office tone close
to #E8E4DE, wardrobe in muted navy and off-white, authentic relaxed expression, not stocky
or posed. Required elements: chest-up framing, eyes in sharp focus, shallow depth of field.
Constraints: 3:4 vertical, consistent with a series (same light, background tone and framing
across all portraits), natural skin texture, no beauty-filter smoothing, no text, no logos.
The image should look like professional production work, not concept art or a collage.
Composition must be clean and intentional. 3:4, high resolution.
```

Bemærk ved portrætter: AI-genererede portrætter af NAVNGIVNE, virkelige medarbejdere er som regel en dårlig idé (de ligner ikke, og det opdages). Genren bruges til persona-/illustrationsbilleder og pladsholdere; ægte team-fotos tages med kamera.

### 3.4 Ikon-stil-beskrivelse

Bruges når et ikonsæt skal rasteriseres/illustreres af en generator, ELLER som stilkontrakt du selv bygger SVG-ikoner efter (spor A). Pointen er at fastfryse STILEN én gang, så alle ikoner i sættet taler samme sprog:

```text
Icon set style definition for [BRAND]:
[LINE STYLE, e.g. 2px consistent stroke, rounded caps and joins], [FILL: outline only /
duotone with HEX + HEX / solid HEX], corner language [SHARP/ROUNDED, radius], drawn on a
[24px] grid with [2px] safe margin, geometric and reduced (max [3] shapes per icon),
no gradients, no shadows, no 3D, flat on transparent background.
Motifs must use widely recognized conventions (search = magnifying glass).
Icon 1: [MOTIF]. Icon 2: [MOTIF]. Icon 3: [MOTIF].
Each icon centered, same visual weight across the set. [ASPECT/SIZE].
```

**Udfyldt eksempel:**

```text
Icon set style definition for a Danish accounting SaaS:
2px consistent stroke, rounded caps and joins, outline only in navy #1F3A5F, softly rounded
corner language (2px radius), drawn on a 24px grid with 2px safe margin, geometric and
reduced (max 3 shapes per icon), no gradients, no shadows, no 3D, flat on transparent
background. Motifs must use widely recognized conventions (search = magnifying glass).
Icon 1: invoice (document with two lines and amount). Icon 2: bank reconciliation (two
arrows meeting). Icon 3: VAT deadline (calendar with checkmark).
Each icon centered, same visual weight across the set. 1:1, 1024px.
```

---

## 4. Variant/forfin-mønstret

Kør altid: **3 varianter, vælg, forfin.**

1. **3 varianter:** tre prompter der adskiller sig på ÉN styrende akse (komposition, lyssætning eller metafor), ikke tre omformuleringer. Navngiv akserne for brugeren: "A: tæt beskæring, B: luftig med negative space, C: abstrakt motiv".
2. **Vælg:** brugeren kører prompterne i sin generator og vælger retning ud fra kritik-tjeklisten (afsnit 5).
3. **Forfin:** justér den valgte prompt ad flere omgange med målrettede ændringer, én til to ad gangen:

```text
Same as the previous prompt, but: [CHANGE 1, e.g. warmer light], [CHANGE 2, e.g. move the
product to the left third]. Keep everything else identical.
```

Ændr aldrig mere end to ting pr. iteration, ellers ved ingen hvad der virkede. Hvis to iterationer i træk ikke forbedrer, er det briefet og ikke prompten, der er problemet: gå tilbage og stram goal/style.

---

## 5. Kritik-tjeklisten (gives ALTID med til brugeren)

Generatoren er brugerens, så kritik-loopet flytter med. Aflever denne tjekliste sammen med prompten, og bed brugeren vurdere hver generation mod den, FØR noget tages i brug. Dumper billedet på ét punkt, kasseres det (eller prompten justeres):

**De tre hovedtjek (kør dem på alt):**
1. **Læsbarhed:** Er alle detaljer der betyder noget, skarpe og aflæselige i brugsstørrelsen? Er der utilsigtet tekst eller tekstlignende vrøvl i billedet?
2. **Komplethed:** Er ALLE elementer fra briefet med? Mangler noget, eller er der kommet uønskede elementer til (ekstra hænder, tilfældige objekter, watermark-agtige pletter)?
3. **Sammenhæng:** Ligner det professionel produktion i designprofilens palet og stemning, ikke AI-kunst, stock-kliché eller en collage? Ville en menneskelig grafiker lægge navn til?

**Genre-specifikke tillægstjek:**
- *Produktfoto:* korrekt antal/form på produktdetaljer (hanke, lukninger, etiketflader), fysisk trolig skygge og refleksion, baggrund ren nok til fritlægning.
- *Hero-baggrund:* er friarealet reelt roligt nok til tekst (test med overlay), holder kontrasten til tekstfarven, virker beskæringen også på mobil?
- *Portræt:* hænder og tænder (klassiske fejlpunkter), naturlig hudtekstur, samme lys og baggrundstone som resten af serien.
- *Ikoner:* ens stregtykkelse og visuel vægt på tværs af sættet, genkendeligt motiv på 3 sekunder, fungerer i 16-24px.

**Husk brugeren på:** billeder af virkelige personer, varemærker og andres værker må ikke genereres eller efterlignes; tjek generatorens licensvilkår for kommerciel brug.
