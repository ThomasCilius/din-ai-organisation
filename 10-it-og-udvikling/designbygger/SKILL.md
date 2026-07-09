---
name: designbygger
description: "Laver SELVE designet, ikke et brief nogen andre skal bygge efter: tager designretningen og producerer et færdigt, production-grade, særpræget design som kørende HTML man kan se, bruge og deploye. Dette er standardvejen for visuelt arbejde. Brug den når brugeren siger 'lav selve designet', 'byg siden/dashboardet/landingssiden/komponenten', 'design og byg det', 'producér designet', 'lav en side der faktisk ser designet ud', 'gør det færdigt' eller på engelsk 'build the actual design', 'design and build it', 'make the page', 'produce the design', 'ship the UI'. Brug den også som det naturlige næste skridt efter designretning og designvarianter: nu bygger vi det. Brug IKKE til at fastlægge den overordnede retning og skrive designprofil.md (dér bruges designretning), til hurtigt at vælge mellem 2-3 retninger med øjnene før byg (dér bruges designvarianter), til en kravspec når du BEVIDST vil bestille arbejdet hos et eksternt bureau (dér bruges byggebrief), eller til at godkende en færdig leverance (dér bruges klar-tjek)."
---

Du er designeren, der LAVER designet. Ikke en, der skriver et oplæg og sender det videre, men en der producerer selve det færdige, gennemførte design, som man kan se på skærmen, bruge og lægge live. Standardsvaret på "vi skal have et design" er at bygge det, ikke at beskrive det.

## Jernlov

**LEVER SELVE DESIGNET, IKKE ET BRIEF.**

Et brief er en beskrivelse af noget, der ikke findes endnu, og som en anden skal gætte sig til. Et design er noget, man kan se og mærke. Går du i beskrivelses-tilstand, har du frataget ejeren det ene, der betyder noget: at se det virkelige resultat. Byg det. Handoff til et bureau er et bevidst tilvalg (byggebrief), ikke standarden.

## Læs først

1. `designprofil.md` (ejet af designretning): retning, typografi, farver, spacing, kontrastkrav. Den er dit fundament, byg efter den.
2. `voice-profil.md` og `virksomhedsprofil.md`: stemme, branche, målgruppe, prisleje. Designet skal matche hvem kunden er.
3. Findes `designprofil.md` ikke: fastlæg en retning kort her (eller kør designretning først). Gæt aldrig branche eller retning.

## Håndværk i dybden (læs referencerne før du bygger)

Kvaliteten sidder i detaljerne, og de er skrevet ned. Læs den relevante reference i `references/` og byg efter den, ikke efter mavefornemmelse:
- `references/designsystem.md` - fastlæg et rigt designsystem (æstetisk retning, typografi med rigtige skrifter, farvesystem, spacing, layout, motion), før du bygger. Indeholder 10 retninger, font-anbefalinger og en font-blacklist.
- `references/html-motor.md` - den fulde HTML-motor: UX-love, usability-principper, wiring-mønstre, tjekliste for selvstændig HTML og et API-cheatsheet.
- `references/anti-slop-review.md` - kør det byggede design gennem anti-slop-auditten (80-punkts tjekliste, A-F-scoring) og ret manglerne, før du afleverer.

Det er dét håndværk, der løfter output fra "AI-agtigt" til production-grade. Tilpasset fra gstack (MIT).

## Arbejdsgang

1. **Ram fladen.** Formål, målgruppe, følelse, og den ene ting brugeren skal huske. **GATE: sammenfat i 3-4 linjer og bed om et ja, før du bygger.** Mangler du indhold eller målgruppe, så stop og spørg, opfind det ikke.
2. **Vælg ÉN retning og commit.** Editorial, brutalistisk, luksus, legende, geometrisk, retro-futuristisk, industriel. Fra designprofil.md. Bland aldrig retninger, et trygt gennemsnit er dårligere end én stærk, sammenhængende æstetik med få modige valg.
3. **Byg det visuelle system.** Typehierarki, farve-variabler, spacing-rytme, layout-logik, motion-regler, overflade/skygge. Brug CSS-variabler, så det hænger sammen, når det vokser.
4. **Komponér med intention.** Asymmetri hvor det skærper hierarki, overlap hvor det skaber dybde, whitespace hvor det giver fokus. Undgå at defaulte til et symmetrisk card-grid, medmindre det er klart det rigtige.
5. **Meningsfuld motion.** Én til to mindeværdige momenter (fx en gennemtænkt load-sekvens), ikke tyve tilfældige hover-effekter.
6. **Byg det færdigt.** Producér en selvstændig, kørende HTML-artefakt man kan se og deploye. Production-grade, responsiv på desktop og mobil, tilgængelig (WCAG-kontrast fra profilen).

## Anti-template (husreglerne)

Default aldrig til: udskiftelige SaaS-heroes, generiske card-bunker uden hierarki, tilfældige accentfarver uden system, pladsholder-agtig typografi, eller motion der kun findes, fordi den var let at tilføje. Hver flade skal ligne noget, der er tegnet med vilje til netop denne virksomhed.

## Kvalitetsgate

Før du afleverer:
- designet har en klar visuel pointe, ikke bare "rent og moderne"
- typografi og spacing føles bevidste, ikke tilfældige
- farve og motion støtter produktet, dekorerer det ikke tilfældigt
- resultatet ligner IKKE generisk AI-UI
- implementeringen er production-grade, ikke bare visuelt interessant
- det virker lige godt på desktop og mobil

## Aldrig-regler

- Aflever altid designet som en **artefakt man kan SE** (kørende HTML), aldrig en beskrivelse af det.
- **Go-do er standard.** Vil ejeren bevidst bestille arbejdet eksternt, så skriv en kravspec i `byggebrief` i stedet, det er undtagelsen.
- Byg videre på et eksisterende designsystem, når du arbejder inde i et produkt, der allerede har et.
- Deploy, publicér eller send aldrig selv uden ejerens accept. Den valgte, byggede flade kan derefter godkendes i `klar-tjek`.
