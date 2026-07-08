# Rapportskabelon: maaned-rapport-YYYY-MM.md

Den faste skabelon for månedsrapporten plus et udfyldt eksempel. Brug skabelonen præcis - faste overskrifter gør rapporterne sammenlignelige måned for måned, og genkendelighed gør dem hurtigere at læse for ledelsen.

## Skabelonen

```markdown
# Marketingrapport - [Måned ÅÅÅÅ]

*Udarbejdet [dato] af [navn] med AI-assistance. Status: KLADDE til gennemsyn.*

## Hovedtal

| Nøgletal | [Måned] | Forrige måned | Samme måned sidste år | Mål |
|---|---|---|---|---|
| [effekt-tal øverst, fx henvendelser/leads] | | | | |
| [klik til sitet] | | | | |
| [nyhedsbrev: klikrate] | | | | |
| [pynt-tal nederst, markeret som retning] | | | | |
| [aktivitet: antal opslag/udsendelser] | | | | |

*Organisk og betalt: [adskilt / kunne ikke adskilles - forbehold].*

## Udvikling

[2-4 sætninger: den vigtigste bevægelse mod forrige måned og samme måned
sidste år. Sæsonforklaring hvor relevant.]

**Opfølgning på sidste måneds anbefalinger:** [Blev de fulgt? Hvad skete der?
Eller: [MANGLER] - første rapport.]

## 3 indsigter

1. [Indsigt bygget på effekt-tal, med de konkrete tal i sætningen.]
2. [Indsigt - gerne det der IKKE virkede, hvis data viser det.]
3. [Indsigt - eller en ærlig "det ved vi ikke endnu, fordi..."]

## Anbefalinger til næste måned

1. [Testbar handling med konkret første skridt - aldrig "skalér X" på én måneds data.]
2. [Valgfri anden anbefaling. Max 2.]

## Datagrundlag og huller

- Kilder: [GA4-eksport af (dato), Meta Ads Manager-skærmbillede, LinkedIn-statistik, nyhedsbrevssystem X]
- Huller: [MANGLER: ...] / Ubekræftede tal: [UBEKRÆFTET: ...]
- Forbehold: [små tal, tracking-ændringer, kampagneperioder der skævvrider m.m.]
```

## Regler for udfyldning

- **Max én side.** Ledelsen skal kunne læse rapporten på 3 minutter. Skær pynt-rækker væk før du skærer effekt-rækker.
- **5-8 rækker i hovedtalstabellen.** Effekt-tal øverst, aktivitet nederst. Flere rækker = ingen kan se hvad der er vigtigt.
- **Tomme celler udfyldes med [MANGLER]** - aldrig med et skøn.
- **Præcis 3 indsigter, 1-2 anbefalinger.** Formatet er en prioriteringsøvelse: har du 6 indsigter, har du ikke analyseret færdig.
- **Hver indsigt indeholder mindst ét konkret tal** fra hovedtalstabellen - en indsigt uden tal er en mening.
- **Anbefalinger formuleres som testbare handlinger** med et første skridt der kan tages i den kommende uge.
- **Statuslinjen "KLADDE til gennemsyn" bliver stående** til brugeren selv fjerner den.

## Ledelsesvenligt sprog

Modtageren er en ejer eller ledelse uden marketingbaggrund:

- Skriv "henvendelser fra hjemmesiden", ikke "MQL-konvertering fra organisk trafik".
- Oversæt fagtermer første gang de bruges: "klikrate (andelen af modtagere der klikkede på et link)".
- Én pointe pr. sætning. Korte sætninger.
- Tal skrives med dansk tusindtalsseparator og procenttegn med mellemrum: 4.212 besøg, 3,1 %.

## Udfyldt eksempel (fiktiv virksomhed)

Møllers Maskinservice ApS - B2B-servicevirksomhed, 12 ansatte. Aktive kanaler: hjemmeside, LinkedIn (organisk), nyhedsbrev hver 14. dag. Bemærk hvordan eksemplet håndterer huller, små tal og et "virkede ikke"-fund.

```markdown
# Marketingrapport - Juni 2026

*Udarbejdet 3. juli 2026 af Lene M. med AI-assistance. Status: KLADDE til gennemsyn.*

## Hovedtal

| Nøgletal | Juni | Maj | Juni 2025 | Mål |
|---|---|---|---|---|
| Henvendelser (formular + opkald sporet) | 11 | 14 | [MANGLER] | 15/md. |
| Klik til sitet fra LinkedIn | 208 | 145 | [MANGLER] | - |
| Nyhedsbrev: klikrate | 4,1 % | 3,2 % | [MANGLER] | - |
| LinkedIn: visninger (retning, ikke konklusion) | 9.400 | 11.200 | [MANGLER] | - |
| Aktivitet: 6 opslag + 2 nyhedsbreve | 6 + 2 | 8 + 2 | - | 8 + 2 |

*Organisk og betalt: kun organisk aktivitet i juni. Ingen sidste-års-tal: GA4 blev
først sat op i september 2025.*

## Udvikling

Henvendelser faldt fra 14 til 11 - med så små tal kan det være tilfældigt, og juni
er erfaringsmæssigt påvirket af ferieplanlægning hos kunderne. Klik fra LinkedIn
steg 43 % (145 → 208) selv om visningerne faldt: færre så opslagene, men flere
handlede på dem.

**Opfølgning på sidste måneds anbefalinger:** "Test kundehistorier som format" blev
fulgt - 2 af de 6 opslag var kundehistorier. Resultatet indgår i indsigt 1.

## 3 indsigter

1. De 2 kundehistorie-opslag stod for 131 af månedens 208 klik til sitet - de 4
   faglige opslag delte resten. Én måned er ikke bevis, men det understøtter
   mønstret fra maj.
2. Nyhedsbrevets klikrate steg fra 3,2 % til 4,1 % efter skiftet til én CTA pr.
   brev. Åbningsraten udelades - den er upålidelig efter Apple Mail Privacy
   Protection.
3. Om faldet i henvendelser (14 → 11) er sæson eller tilbagegang, kan vi ikke
   afgøre endnu: grundtallet er for lille, og vi mangler juni 2025 at sammenligne
   med. Fra næste år har vi sæsontal.

## Anbefalinger til næste måned

1. Fasthold 2 kundehistorier af de 8 planlagte opslag i juli og mål igen - hvis
   mønstret holder tre måneder i træk, tages formatvægtningen op i content-kalenderen.
2. Der er ikke sat mål for klik og klikrate. Sæt dem ved kvartalsrevisionen af
   årshjulet, så rapporten kan måle mod mål frem for kun mod forrige måned.

## Datagrundlag og huller

- Kilder: GA4-eksport 1/7, LinkedIn virksomhedsside-statistik (skærmbillede 1/7),
  MailerLite-rapport juni.
- Huller: [MANGLER] alle juni 2025-tal (GA4 opsat sep. 2025). Opkald der ikke går
  via formularen, spores ikke - antallet af henvendelser er derfor et minimumstal.
- Forbehold: henvendelser og klikrater bygger på små grundtal; udsving under
  ±30 % behandles som støj.
```

Læg mærke til hvad eksemplet gør: huller står åbent som [MANGLER] med forklaring, indsigt 3 er en ærlig "det ved vi ikke endnu", anbefaling 1 gentager en test i stedet for at skalere, og anbefaling 2 følger reglen om at manglende mål bliver til første anbefaling.
