# Skabelon og eksempel: beslutningsgrundlag-[emne].md

Læs denne fil før du skriver dit første beslutningsgrundlag i en session. Første del er skabelonen med instruktioner pr. sektion; anden del er et udfyldt minieksempel, der viser niveauet. ALLE tal i eksemplet er opdigtede - det er formen der skal kopieres, aldrig indholdet.

## Skabelon med instruktioner

```markdown
# Beslutningsgrundlag: [emne]

*Udarbejdet [dato] til [modtager]. Beslutning senest [deadline]. Status: KLADDE.*

## Beslutningsspørgsmålet

[Ét spørgsmål der kan besvares med ja eller nej, med beløb/marked/dato.
Én sætning. Kan læseren ikke svare ja eller nej på det, er det ikke skarpt nok.]

## Anbefaling

**[Gør det / gør det ikke / afklar X først.] Konfidens: [høj/middel/lav].**

[2-4 sætninger: den vigtigste grund, svaret på det stærkeste modargument,
og begrundelsen for konfidensen i kildekvaliteten ("X af Y nøgletal er
VERIFICERET"). Ved lav konfidens: den billigste måde at hæve den på.]

## Fakta med kilder

| # | Påstand | Tal | Kilde + dato | Status |
|---|---------|-----|--------------|--------|
| 1 | [påstand] | [tal] | [kilde, tabel/side, dato for tal, hentet dato] | VERIFICERET |
| 2 | ... | ... | ... | UBEKRÆFTET |
| 3 | ... | ... | [regnestykke vist under tabellen] | SKØN |

[Kun de fakta anbefalingen bruger - typisk 5-10 rækker. Tal ældre end
12 måneder flages med årstal direkte i tabellen.]

## Økonomien i beslutningen

[Regnestykket, ikke bare resultatet: investering, årlig effekt,
tilbagebetalingstid. Hvert inputtal refererer til en række i
faktatabellen. Vis følsomhed på det mest usikre tal: "falder X
med 20 %, bliver tilbagebetalingstiden Y".]

## Det stærkeste modargument

[Steelman i fuld styrke med egne kilder - se steelman-og-modargumenter.md.
Slut med falsifikationskriteriet:]

**Falsifikationskriterium:** Hvis [observerbart X] inden [dato], ændres
anbefalingen til [konsekvens].

## Antagelser og åbne spørgsmål (altid med)

[Alle SKØN og UBEKRÆFTEDE tal samlet ét sted, hver med den billigste
afklaring: hvem kan svare, hvad koster det, hvor lang tid tager det.]

## Kilder (altid med)

[Nummereret liste svarende til faktatabellen: kilde, hvad den belægger,
dato for tallet, opslagsdato, link.]
```

## Udfyldt minieksempel

(Fiktiv virksomhed, fiktive tal - viser omfang og tone. Et rigtigt grundlag er 2-3 sider; eksemplet her er komprimeret.)

```markdown
# Beslutningsgrundlag: Køb af CNC-fræser

*Udarbejdet 2026-07-07 til banken (finansieringsmøde). Beslutning senest 2026-09-01. Status: KLADDE.*

## Beslutningsspørgsmålet

Skal vi købe en CNC-fræser til 1,4 mio. kr. i 2026 og insource de
bearbejdningsopgaver vi i dag outsourcer?

## Anbefaling

**Afklar én ting først - køb derefter. Konfidens: middel.**

Økonomien holder klart ved nuværende volumen (tilbagebetalingstid 3,1 år),
og 4 af 6 nøgletal er VERIFICERET. Men casen hviler på at outsourcing-timerne
fortsætter, og 61 % af dem ligger hos to kunder med kontraktudløb inden for
14 måneder. Billigste afklaring: bed de to kunder om en forlængelses-
tilkendegivelse FØR købet - det koster to møder. Får vi mindst én, hæves
konfidensen til høj, og anbefalingen er køb.

## Fakta med kilder

| # | Påstand | Tal | Kilde + dato | Status |
|---|---------|-----|--------------|--------|
| 1 | Outsourcede bearbejdningstimer 2025 | 620 timer | Eget regnskab, kreditorliste 2025, hentet 2026-07-07 | VERIFICERET |
| 2 | Gennemsnitspris pr. outsourcet time | 890 kr. | Egne leverandørfakturaer 2025 | VERIFICERET |
| 3 | Maskinpris inkl. installation | 1,40 mio. kr. | Skriftligt tilbud, [leverandør], 2026-06-24 | VERIFICERET |
| 4 | Andel af timer hos 2 største kunder | 61 % | Egen ordrebog pr. 2026-07-01 | VERIFICERET |
| 5 | Egen kostpris pr. time efter køb | ca. 310 kr. | Regnestykke: afskrivning + strøm + værktøj + operatørtid, vist nedenfor | SKØN |
| 6 | Branchens ordreindgang stiger | +4 % (2025) | Brancherapport [organisation] - primærtal ikke set | UBEKRÆFTET |

## Økonomien i beslutningen

Årlig besparelse: 620 timer x (890 - 310) kr. = ca. 360.000 kr. (rækker 1, 2, 5).
Tilbagebetalingstid: 1.400.000 / 360.000 = ca. 3,9 år - 3,1 år hvis to kendte
emner mere flyttes hjem (tilbud indhentet, række 3).
Følsomhed: falder timerne til 350/år (én storkunde mistet), stiger
tilbagebetalingstiden til over 6 år.

## Det stærkeste modargument

Casen hviler på at de 620 timer fortsætter. To kunder står for 61 % af dem
(række 4), og begge kontrakter udløber inden for 14 måneder. Mister vi én,
falder udnyttelsen til ca. 350 timer/år, og investeringen er først tjent hjem
efter 6+ år - samtidig med at vi har bundet 1,4 mio. kr. og lagerplads i en
maskine med begrænset gensalgsværdi. Branchetallet der skulle berolige (række 6)
er UBEKRÆFTET og bærer derfor ingen vægt i konklusionen.

**Falsifikationskriterium:** Hvis ingen af de to storkunder inden 2026-08-15
vil tilkendegive forlængelse, ændres anbefalingen til "udskyd købet, fortsæt
outsourcing".

## Antagelser og åbne spørgsmål (altid med)

- Række 5 (kostpris 310 kr./time) er SKØN - afklares billigst med driftsdata
  fra leverandørens referencekunde (ét opkald).
- Række 6 (branchevækst) er UBEKRÆFTET - primærtallet bør findes i
  statistikbanken.dk før mødet med banken.
- Serviceaftalens pris efter år 1 kendes ikke - bed leverandøren om den
  skriftligt.

## Kilder (altid med)

1. Eget regnskab 2025, kreditorliste - belægger række 1-2. Hentet 2026-07-07.
2. Skriftligt tilbud fra [leverandør], dateret 2026-06-24 - belægger række 3.
3. Egen ordrebog pr. 2026-07-01 - belægger række 4.
4. Brancherapport [organisation], 2026 - belægger række 6 (UBEKRÆFTET,
   primærkilde ikke set).
```

## Bemærk ved brug af skabelonen

- Anbefalingen står ØVERST efter spørgsmålet - modtageren skal ikke lede efter konklusionen. Resten af dokumentet er belægget.
- "Afklar X først" er en fuldgyldig anbefaling - ofte den rigtige ved middel/lav konfidens.
- Faktatabellen er dokumentets rygrad: står et tal ikke i den, må det ikke bære noget i anbefalingen.
- Skriv [MANGLER: ...] hvor brugeren skal levere data - opfind aldrig udfyldning.
