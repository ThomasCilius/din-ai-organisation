# Skabelon og eksempel: strategi-status-Q[x]-[år].md

Læses når statusfilen skal skrives (arbejdsgangens trin 8). Skabelonen er samtidig bestyrelsens strategiside - derfor er formatreglerne ufravigelige.

## Indhold

1. Formatregler
2. Skabelonen (kopiér og udfyld)
3. Gennemarbejdet eksempel
4. 2-minutters-testen

## 1. Formatregler

- Max 1 side - ca. 45 linjer. Kan det ikke være der, er det en rapport, ikke en status.
- Afvigelser (gule/røde mål) står FØRST. Grønne mål fylder præcis én linje hver, til sidst i målgennemgangen.
- Hvert mål: farve i VERSALER, "hvorfor" på max 20 ord, "hvad nu" på max 20 ord, diagnose ved gul/rød.
- Hver vurdering bærer [DATA: kilde] eller [MAVEFORNEMMELSE] - ingen umarkerede påstande.
- Beslutningspunkter formuleres som spørgsmål med alternativer ("Skal vi A eller B?"), aldrig som konklusioner.
- Ingen aktivitetsopremsning: mødeantal, travlhed og god stemning hører ikke hjemme her.
- Datering og version nederst - filen er et øjebliksbillede, ikke et levende dokument.

## 2. Skabelonen

```markdown
# Strategi-tjek Q[x] [år] - [virksomhed]

## Konklusion
[2-3 linjer: på sporet eller ej, vigtigste afvigelse, vigtigste beslutningspunkt.]

## Afvigelser og beslutningspunkter

**[RØD/GUL] Mål [nr.]: [målformulering fra kvartalsplanen] (ejer: [navn])**
- Hvorfor: [max 20 ord + [DATA: kilde] eller [MAVEFORNEMMELSE]]
- Hvad nu: [max 20 ord - konkret næste handling]
- Diagnose: [bagud på plan / planen var forkert / UAFKLARET]

**Beslutningspunkt til [ejerleder/bestyrelse]:** [spørgsmål med alternativer]

## På sporet
- GRØN - Mål [nr.]: [status i én linje, med tal] [DATA: kilde]

## Læring og ændringer udenfor
- Lært: [én linje]
- Ændret udenfor: [én linje, jf. radar-Q[x].md hvis den findes]
- Fravalg: [holder de - én linje]
- Ville gøre anderledes: [én linje - input til næste kvartals-nedbrydning]

## Foreslåede justeringer (max 1-2 - eller "ingen")
**Justering 1:** [hvilket dokument og punkt]
- Nuværende: "[ordret tekst]"
- Foreslået: "[ordret ny tekst]"
- Begrundelse: [med kilde - kræver diagnosen "planen var forkert" eller dokumenteret ekstern ændring]

## Datagrundlag
[Kilder brugt: kvartalsplan-Q[x].md, ugestatus uge [x-y], perioderegnskab [periode], radar-Q[x].md.
Hvilke vurderinger bygger på mavefornemmelse.]

## Antagelser og uafklarede punkter
[Altid med - også når tom: skriv "ingen".]

---
Udarbejdet [dato] med strategi-tjek. KLADDE - til [ejerleders navn]s godkendelse.
```

## 3. Gennemarbejdet eksempel

Fiktiv virksomhed: Nordkyst VVS A/S, 22 ansatte, strategiplan med tre must-win battles.

```markdown
# Strategi-tjek Q2 2026 - Nordkyst VVS A/S

## Konklusion
2 af 4 kvartalsmål på sporet. Vigtigste afvigelse: servicekontrakter (4 af 10, bagud).
Vigtigste beslutningspunkt: skal webshop-målet omformuleres til bookingflow?

## Afvigelser og beslutningspunkter

**RØD Mål 3: Webshop mod private lanceret med 25 ordrer (ejer: Jonas)**
- Hvorfor: Lanceret, men 2 ordrer - private ringer og vil rådgives før køb [DATA: shop-statistik 26/6].
- Hvad nu: Stop annoncering; afvent beslutning om omformulering.
- Diagnose: planen var forkert (antagelsen om selvbetjening holdt ikke).

**GUL Mål 1: 10 nye servicekontrakter tegnet (ejer: Mette)**
- Hvorfor: 4 tegnet; Mette bundet af reklamationssag i 5 uger [DATA: kontraktliste 27/6].
- Hvad nu: Reklamationssag overdraget til Per; 9 klare tilbud følges til dørs inden 1/8.
- Diagnose: bagud på plan.

**Beslutningspunkt til Karsten:** Skal mål 3 omformuleres til "bookingflow til rådgivning
live i Q3" (se justering 1) - eller droppes privatsegmentet i år?

## På sporet
- GRØN - Mål 2: Lærlingeaftale nr. 2 underskrevet 14/5 [DATA: aftale i personalemappen].
- GRØN - Mål 4: Sygefravær 3,1 % mod mål om under 4 % [DATA: lønsystem, juni].

## Læring og ændringer udenfor
- Lært: private købere kræver rådgivning før køb - selvbetjening bærer ikke segmentet.
- Ændret udenfor: BadeCo har ansat 2 sælgere i vores område [DATA: radar-Q2.md].
- Fravalg: "vi byder ikke på totalentrepriser" holder - 2 forespørgsler afvist uden anger.
- Ville gøre anderledes: sat kontraktmålet til 6, ikke 10, i et kvartal med ferieafvikling [MAVEFORNEMMELSE].

## Foreslåede justeringer (max 1-2)
**Justering 1:** kvartalsplan-Q3.md, mål 3
- Nuværende: "Webshop mod private lanceret med 25 ordrer"
- Foreslået: "Bookingflow til rådgivning live med 15 bookede rådgivninger"
- Begrundelse: diagnose "planen var forkert" - kundeadfærd modsagde antagelsen [DATA: shop-statistik + 31 indgående opkald].

## Datagrundlag
Kvartalsplan-Q2.md, ugestatus uge 14-26, perioderegnskab jan-maj, radar-Q2.md.
Vurderingen af kontraktmålets realisme bygger på mavefornemmelse; resten på data.

## Antagelser og uafklarede punkter
Ingen.

---
Udarbejdet 29/6 2026 med strategi-tjek. KLADDE - til Karstens godkendelse.
```

## 4. 2-minutters-testen

Før aflevering: forestil dig et bestyrelsesmedlem med 2 minutter. Kan vedkommende ud fra siden alene svare på:

1. Lever strategien - ja eller nej?
2. Hvad er den største afvigelse, og er den tempo eller retning?
3. Hvad skal jeg tage stilling til i dag?

Kan alle tre besvares uden at bladre eller spørge, består filen. Kan de ikke, er det typisk fordi afvigelserne drukner i grønt, eller fordi beslutningspunktet er formuleret som en konklusion i stedet for et spørgsmål - ret det og test igen.
