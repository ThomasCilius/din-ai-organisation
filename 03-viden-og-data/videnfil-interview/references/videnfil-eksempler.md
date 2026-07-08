# Eksempelsamling: videnfiler

Læs denne fil når du skal ramme formen - gode videnfiler ligner hinanden, og de dårlige fejler på de samme fem måder.

## Indhold

1. [GODT: fakturering af kommunale kunder](#1-godt-fakturering-af-kommunale-kunder)
2. [GODT: reklamation på levering](#2-godt-reklamation-paa-levering)
3. [GODT: bestilling hos fast leverandør](#3-godt-bestilling-hos-fast-leverandoer)
4. [GODT (exit): igangværende sag](#4-godt-exit-igangvaerende-sag)
5. [SKIDT: for lang, passiv, uden kilde](#5-skidt-for-lang-passiv-uden-kilde)
6. [SKIDT: to emner og kategorisvar](#6-skidt-to-emner-og-kategorisvar)

## 1. GODT: fakturering af kommunale kunder

Fil: `brain/oekonomi/fakturering-kommunale-kunder.md`

```markdown
# Fakturering af kommunale kunder
**Bruges når:** En kommune eller kommunal institution skal faktureres.
**Regel/trin:** Send fakturaen samme dag som opgaven afsluttes. Sæt EAN-nummer
på - find det i kundekortet i e-conomic. Betalingsfrist 30 dage, ikke vores
normale 14.
**Typiske fejl:** Glemt EAN-nummer = fakturaen afvises uden besked. Tjek
under "Ubetalte" efter 7 dage; står den der uden bevægelse, ring til
forvaltningens bogholderi.
**Spørg/se:** Lise godkender kreditnotaer. EAN-numre: kundekort i e-conomic.
**Kilde:** Lise Mortensen, 2026-05-12
```

Hvorfor den virker: konkret udløser, aktiv form, indeholder undtagelsen (30 vs. 14 dage) og fejlen med nødgreb ("afvises uden besked" -> ring efter 7 dage). En vikar kan følge den i morgen. 9 linjer inkl. kilde.

## 2. GODT: reklamation på levering

Fil: `brain/kunder/reklamation-levering.md`

```markdown
# Reklamation på levering
**Bruges når:** En kunde melder skade eller mangel på en leverance.
**Regel/trin:** Svar kunden inden for 2 timer - bare en kvittering, ikke en
løsning. Bed om foto. Opret sagen i CRM under "Reklamation" samme dag.
**Typiske fejl:** Lover man erstatningslevering FØR fotoet er set, kan det
ikke trækkes tilbage - kvitter først, vurdér bagefter. Fragtskader skal
meldes til fragtfirmaet inden 48 timer, ellers dækker de ikke.
**Spørg/se:** Over 5.000 kr.: Jens beslutter. Fragtskader: se aftalen i
brain/leverandoerer/.
**Kilde:** Jens Krogh, 2026-06-02
```

Hvorfor den virker: to tidsfrister der ikke står i noget system (2 timer, 48 timer), en beløbsgrænse med navn, og en rækkefølgeregel ("kvitter først, vurdér bagefter") som er ren tavs viden.

## 3. GODT: bestilling hos fast leverandør

Fil: `brain/drift/bestilling-nordjysk-staal.md`

```markdown
# Bestilling hos Nordjysk Stål
**Bruges når:** Vi skal bruge stålprofiler eller plader til produktion.
**Regel/trin:** Bestil via mail til Kim (kim@nordjyskstaal.dk) - aldrig
webshoppen, den opdaterer ikke lagerstatus. Bestil torsdag før kl. 12,
så leveres mandag.
**Typiske fejl:** Haster det, så RING til Kim - mails læses kun morgen.
Kan Kim ikke levere, brug Stålgrossisten i Aarhus (dyrere, men dag-til-dag).
**Spørg/se:** Prisaftale: brain/leverandoerer/prisaftale-nordjysk-staal.md.
**Kilde:** Bo Andersen, 2026-04-20
```

Hvorfor den virker: "aldrig webshoppen" og "ring, mails læses kun morgen" er præcis den slags viden der ellers bor i ét hoved - plus en plan B med trade-off (dyrere, hurtigere).

## 4. GODT (exit): igangværende sag

Fil: `brain/kunder/sag-nordvest-byg-tilbygning.md`

```markdown
# Igangværende sag: Nordvest Byg, tilbygning Hobrovej
**Bruges når:** Nogen overtager sagen efter Mettes fratræden 2026-07-31.
**Regel/trin:** Næste skridt: send revideret tilbud senest 2026-07-25 -
udkastet ligger i Tilbud/2026/nordvest-byg-v2.docx. Kontakt: Per Østergaard
(byggeleder), ikke hovedkontoret.
**Typiske fejl:** Per svarer ikke på mail - ring mellem 7 og 9. Mundtligt
lovet: 5 % rabat ved accept inden 1. august (står IKKE i udkastet endnu).
**Spørg/se:** Historik i CRM under "Nordvest Byg". Prisberegning: Mettes
regneark er flyttet til Tilbud/2026/beregninger/.
**Kilde:** Mette Holm (exit-interview), 2026-07-10
```

Hvorfor den virker: deadline, uskreven rabataftale og "ring mellem 7 og 9" - de tre ting der var forsvundet med Mette. Kildelinjen viser at det er et exit-interview, så `brain-tjek` ved at kilden ikke længere kan spørges.

## 5. SKIDT: for lang, passiv, uden kilde

```markdown
# Om vores faktureringsprocesser
Fakturering er en vigtig del af virksomhedens økonomistyring. Der skal altid
udvises omhu når der faktureres, og det bør sikres at alle relevante
oplysninger er medtaget. Fakturaer udarbejdes i økonomisystemet af den
ansvarlige medarbejder. Der kan være forskellige betalingsbetingelser
afhængigt af kundetypen, og disse bør overholdes. Offentlige kunder kan have
særlige krav, som skal iagttages. Ved uoverensstemmelser tages der kontakt
til de relevante parter, og situationen håndteres efter omstændighederne.
Det anbefales løbende at følge op på udestående fakturaer, så likviditeten
ikke påvirkes negativt. Se i øvrigt gældende retningslinjer på området.
```

Hvorfor den fejler: (1) passiv form skjuler hvem der gør hvad, (2) nul konkrete navne, systemer, frister eller beløb, (3) ingen undtagelser eller fejl - kun floskler, (4) ingen kildelinje, så `brain-tjek` kan aldrig vurdere forældelse, (5) titlen er en kategori, ikke et emne. Filen er sand og ubrugelig på samme tid - den kunne stå i enhver virksomhed i landet.

## 6. SKIDT: to emner og kategorisvar

```markdown
# Kunder og leverandører
**Bruges når:** Vi har kontakt med kunder eller leverandører.
**Regel/trin:** Kunderne håndteres i CRM'et og leverandørerne bestilles der
hvor vi plejer. Vær opmærksom på særlige aftaler.
**Typiske fejl:** Der kan opstå misforståelser.
**Spørg/se:** De relevante kolleger.
**Kilde:** Kontoret, 2026
```

Hvorfor den fejler: (1) to emner i én fil - kunder og leverandører skal hver have deres opslag, (2) kategorisvar hele vejen ("der hvor vi plejer", "særlige aftaler", "de relevante kolleger") - intet kan slås op eller følges, (3) kilden er hverken en person eller en fuld dato, så den kan ikke efterprøves eller forældelsesvurderes. Formen er fulgt, men indholdet er tomt - skabelonen redder ikke et interview der stoppede ved første svar.
