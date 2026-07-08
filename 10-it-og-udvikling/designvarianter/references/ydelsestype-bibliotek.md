# Ydelsestype-bibliotek: best practice pr. flade

Læs den sektion der matcher fladen FØR du genererer varianter. Hver fladetype har sine egne love - en variant der er smuk men ignorerer fladens best practice er ubrugelig. Hver sektion giver: hvad fladen skal kunne, en tjekliste varianten skal bestå, typiske fejl, og forslag til akser der giver mening netop her.

Alt herunder gælder INDEN FOR `designprofil.md` - farver, skrifter og spacing kommer altid derfra. Best practice styrer layout og hierarki, ikke paletten.

## Indhold

1. [Landingsside / webside](#1-landingsside--webside)
2. [Dashboard / app-skærm](#2-dashboard--app-skaerm)
3. [Slides / præsentation](#3-slides--praesentation)
4. [Dokument / skabelon](#4-dokument--skabelon)
5. [Tværgående UX-love (gælder alle flader)](#5-tvaergaaende-ux-love-gaelder-alle-flader)

## 1. Landingsside / webside

**Fladens opgave:** få én bestemt besøgende til at forstå værdien og tage ét bestemt skridt. Alt andet er støtte.

Tjekliste pr. variant:
- [ ] **Klart værdiløfte over folden.** Hvad er det, hvem er det til, hvorfor det - læsbart uden at scrolle. Ikke en slogan-floskel, men et konkret løfte.
- [ ] **ÉT primært CTA.** Én handling der fremhæves visuelt. Sekundære links må findes, men kun ét blikfang.
- [ ] **Visuelt hierarki der leder øjet** fra løfte -> bevis -> handling. Størrelseskontrast bærer hierarkiet, ikke farve alene.
- [ ] **Social proof:** kundelogoer, tal, citater eller cases - det der gør løftet troværdigt.
- [ ] **Mobil først.** Flertallet af besøgende er på telefon; CTA og kernebudskab skal virke på en lille skærm og med tommelfingeren.

Typiske fejl: to-tre ligeværdige CTA'er der konkurrerer; et værdiløfte om afsenderen ("Vi er en professionel virksomhed") i stedet for om kunden; en hero der er ren dekoration uden budskab.

Akser der ofte passer: rolig <-> markant, tekst-tung <-> billed-tung, ét langt scroll <-> kort og fokuseret.

## 2. Dashboard / app-skærm

**Fladens opgave:** lade en bruger aflæse status og handle hurtigt - ikke imponere.

Tjekliste pr. variant:
- [ ] **Datatæthed før pynt.** Skærmen skal vise det brugeren har brug for, ikke gemme det bag store kort og luft. Arbejdsskærme må gerne være tætte.
- [ ] **Tabeller frem for kort når tal skal sammenlignes.** Kort er fine til få nøgletal; skal man sammenligne rækker, vinder tabellen hver gang.
- [ ] **Tydelig tomme-tilstand.** Hvad ser brugeren første gang, før der er data? En tom skærm skal forklare og vise næste skridt, ikke bare være blank.
- [ ] **Tydelig fejltilstand.** Hvad sker der når noget går galt eller loader? Vis det, gæt ikke.
- [ ] **Status aflæses på et sekund.** Farve + ikon/tekst, aldrig farve alene (rød/grøn rammer farveblinde).
- [ ] **Primær handling er synlig uden at lede.** Det brugeren gør oftest skal være det nemmeste at ramme.

Typiske fejl: kort-grid med tre ens bokse hvor en tabel var det rigtige; ingen tomme- eller fejltilstande tænkt igennem; nøgletal uden kontekst (tal uden sammenligning eller tendens).

Akser der ofte passer: tæt <-> luftig, tal-først <-> graf-først, alt på én skærm <-> trinvis afsløring.

## 3. Slides / præsentation

**Fladens opgave:** støtte en der taler - ikke erstatte taleren. Slides læses på afstand på sekunder.

Tjekliste pr. variant:
- [ ] **Én pointe pr. slide.** Kan slidens budskab ikke koges ned til én sætning, skal den deles.
- [ ] **Handlingsoverskrift.** Overskriften siger konklusionen ("Salget steg 18 % i Q3"), ikke emnet ("Salgstal"). Publikum skal kunne læse kun overskrifterne og forstå historien.
- [ ] **Maks. 6 linjer pr. slide.** Slides er ikke et dokument; det talte bærer detaljerne.
- [ ] **Stor typografi og høj kontrast** - læsbart bagerst i lokalet.
- [ ] **Ét billede eller én graf pr. slide**, ikke en collage.

Typiske fejl: overskrifter der navngiver emnet i stedet for pointen; slides fyldt med brødtekst der læses op; fire grafer på én slide.

Akser der ofte passer: tekst-drevet <-> billed-drevet, minimal <-> visuelt rig, konservativ <-> legende.

Byg selve dækket med Claudes `pptx`-skill efter valget - denne skill leverer retningen, pptx bygger filen.

## 4. Dokument / skabelon

**Fladens opgave:** blive læst uden anstrengelse - tilbud, rapport, one-pager, brevskabelon.

Tjekliste pr. variant:
- [ ] **Tydeligt typografisk hierarki:** overskrift, underoverskrift, brødtekst klart adskilt i størrelse og vægt - så øjet kan skimme.
- [ ] **Læselinjelængde 45-75 tegn.** Længere linjer trætter øjet; sæt margin eller spalte derefter.
- [ ] **Luft mellem afsnit og sektioner.** Rytmen i afstandene styrer læsbarheden.
- [ ] **Tabeller der kan læses uden at tælle kolonner:** klare rækker, justerede tal, ikke for mange linjer.
- [ ] **Konsistent brug af profilens skrifter og farver** - accentfarve sparsomt, ikke som highlighter.

Typiske fejl: brødtekst i fuld sidebredde (for lange linjer); overskrifter der ikke skiller sig nok ud fra brødtekst; accentfarve brugt på alt så intet fremhæves.

Akser der ofte passer: klassisk <-> moderne, tekst-tung <-> visuel, formel <-> uformel.

Byg selve dokumentet med Claudes `docx`-skill efter valget.

## 5. Tværgående UX-love (gælder alle flader)

Disse gælder uanset fladetype - tjek dem på hver variant:

- **Genkendelighed frem for originalitet i navigation (Jakobs lov).** Brugere forventer at ting virker som de er vant til fra andre sites/apps. Vær original i udtrykket, ikke i hvor menuen ligger eller hvordan en knap ser ud.
- **Store klikmål på mobil (Fitts' lov).** Jo mindre og længere væk et mål er, jo sværere at ramme. Knapper og links på mobil skal være store nok til en tommelfinger (retningslinje: mindst ca. 44x44px).
- **Visuelt hierarki via størrelseskontrast frem for farve alene.** Det vigtigste er størst, ikke bare farvet. Farve alene rammer ikke farveblinde og forsvinder i sort/hvid-print.
- **Konsistent rytme i afstande.** Brug designprofilens spacing-skala - samme afstande igen og igen. Tilfældige mellemrum får en flade til at se sjusket ud selv med perfekt palet.
