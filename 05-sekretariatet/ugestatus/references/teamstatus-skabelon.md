# Intern teamstatus - skabelon og udfyldt eksempel

Læs denne fil FØR du skriver en intern teamstatus. Formålet er det modsatte af kundestatussens: ikke at fastholde tillid udadtil, men at skabe et fælles, ÆRLIGT billede indadtil - så problemer bliver løst mens de er små. En intern status der pynter, er værre end ingen status: den giver teamet ro netop dér hvor der skulle handles.

## Indhold

1. [Teamstatussens fem regler](#teamstatussens-fem-regler)
2. [Skabelon](#skabelon)
3. [Udfyldt eksempel](#udfyldt-eksempel)
4. [Ærlig uden at være destruktiv](#aerlig-uden-at-vaere-destruktiv)
5. [Typiske fejl i intern status](#typiske-fejl-i-intern-status)

## Teamstatussens fem regler

1. **Det der skrider, står øverst.** Rækkefølgen er signalet: problemer og røde/gule spor før succeser. En intern status der åbner med tre grønne spor og gemmer det røde til sidst, er pyntet - uanset at alt er nævnt.
2. **Alle blokeringer med - også de pinlige.** Sygdom, overbooket kapacitet, en aftale der blev glemt, en leverandør der ikke svarer: nævnes med konsekvens og plan. Det der ikke står i statussen, bliver ikke løst.
3. **Navne og tal, ikke "vi".** "Jonas mangler 2 dage på modul 2 og er booket på NordVent til onsdag" kan der handles på; "vi er lidt pressede" kan der ikke.
4. **Ærlig om årsag, konstruktiv om person.** Skriv hvad der gik galt og hvorfor - men vurderinger af personer (indsats, attitude, egnethed) hører til i en samtale, ikke i en status alle læser. Se afsnittet nedenfor.
5. **Beslutninger til ejeren/teamet formuleres som valg.** "Skal vi (a) skubbe intern udvikling en uge eller (b) leje ekstern hjælp ca. [beløb]?" - med anbefaling og frist. En intern status må gerne anbefale; den må ikke beslutte.

## Skabelon

```markdown
# Ugestatus - uge [uu], [aaaa] - internt team

## Trafiklys-overblik

| Spor | Farve | Begrundelse (én sætning) | Sidste uge |
|---|---|---|---|
| [spor - røde og gule spor listes ØVERST] | Rød/Gul/Grøn | [hvorfor] | [farve / "ny"] |

Ugens hovedbudskab: [én sætning - det vigtigste teamet skal vide/gøre].

## Det der skrider (fremhævet - altid først)

- [problem] - konsekvens: [hvad det koster/rammer] - plan: [hvem gør hvad hvornår]

## Fremdrift siden sidst

- [leveret/flyttet - med navn på hvem]

## Planen for næste uge

- [punkt med ejer og dato - kan tjekkes af næste uge]

## Blokeringer

- [alle blokeringer, interne som eksterne - med hvad der skal til, fra hvem]

## Beslutninger der kræves

- [valg a/b med anbefaling, frist og konsekvens af intet svar]

## Opfølgning fra sidste uge

- "[punkt fra sidste uges plan]" - Gjort/Skredet (ny dato + hvorfor)/Droppet (hvorfor)

## Mailudkast

[kort følgetekst - hovedbudskab, hvad teamet skal gøre, henvisning til statussen]

## Kilder og aabne huller

- [kilder pr. spor + alle [MANGLER INPUT: spørg X]]
```

Feltet "Det der skrider" er teamstatussens tilføjelse til firefelts-skelettet: en fremhævelse af de gule/røde punkter fra fremdrift og blokeringer, samlet ét sted øverst. Er der intet der skrider, skrives det eksplicit ("Intet kritisk skred denne uge") - så ved teamet at stilheden er ægte.

## Udfyldt eksempel

(Eksempel på FORMEN - virksomhed, navne og tal er opdigtede. Samme fiktive konsulentfirma "Broager Digital" som i kundestatus-eksemplet, samme uge - bemærk hvordan de samme fakta rapporteres forskelligt.)

```markdown
# Ugestatus - uge 28, 2026 - internt team

## Trafiklys-overblik

| Spor | Farve | Begrundelse (én sætning) | Sidste uge |
|---|---|---|---|
| NordVent fase 2 | Gul | 4 dages skred: NordVents it leverede testdata sent OG Jonas var syg tirs-ons - bufferen i uge 30 er nu i brug | Grøn |
| Intern timeregistrering | Rød | Ingen har rørt den i 3 uger; faktureringsgrundlaget for juni er stadig ikke klart | Gul |
| Tilbud til Fjordkraft | Grøn | Sendt onsdag, opfølgningsmøde booket til d. 21 | Ny |

Ugens hovedbudskab: NordVent-bufferen er brugt - endnu et skred rammer slutdatoen, så uge 29 skal friholdes for nyt.

## Det der skrider (fremhævet - altid først)

- Timeregistrering (RØD, 3. uge): junifakturering kan ikke laves - konsekvens: ca. 180.000 kr. faktureres for sent. Plan: Thomas afsætter fredag formiddag; ny plan foreligger senest fredag d. 18.
- NordVent-buffer opbrugt: næste skred rammer slutdatoen 1/9. Plan: ingen nye opgaver til Jonas i uge 29; Mia overtager supportvagten.

## Fremdrift siden sidst

- Rapportmodul leveret til kundetest (Jonas, torsdag - én dag senere end lovet).
- Datasæt 3 valideret (Mia, referat-2026-07-08-nordvent.md).
- Fjordkraft-tilbud sendt (Thomas, onsdag).

## Planen for næste uge

- Ordrehistorik migreret senest onsdag d. 16 (Mia).
- Leverance 2 klar til kundetest fredag d. 18 (Jonas - friholdt for andet).
- Ny plan for timeregistrering senest fredag d. 18 (Thomas).

## Blokeringer

- NordVent har endnu ikke bekræftet testdeltagere til onsdag - Thomas rykker Mette mandag.
- Timeregistrering blokerer junifakturering - kræver Thomas' fredag formiddag.

## Beslutninger der kræves

- Skal supportvagten i uge 29 (a) dækkes af Mia (koster fremdrift på migrering) eller (b) sættes på nedsat beredskab med autosvar? Anbefaling: b. Svar senest mandag.

## Opfølgning fra sidste uge

- "Rapportmodul klar til test onsdag" - Skredet 1 dag (Jonas syg tirs-ons); leveret torsdag.
- "Timeregistrering ajourført" - Ikke gjort, 3. uge i træk - derfor løftet til RØD med plan-dato.
- "Fjordkraft-tilbud sendt" - Gjort.
```

Sammenlign med kundestatus-eksemplet: samme uge, samme fakta. Kunden ser "leverance 2 skrider 4 dage, slutdato holder". Teamet ser HVORFOR (sen testdata + sygdom), at bufferen er brugt, og hvad det kræver af uge 29. Begge er sande - de har bare hver sit formål.

## Aerlig uden at vaere destruktiv

Grænsen mellem ærlig status og personkritik:

- SKIDT (persondom i plenum): "Timeregistreringen skrider fordi Jonas igen ikke har prioriteret den."
- GODT (fakta + systemløsning): "Timeregistrering er ikke ajourført 3. uge i træk - opgaven har ingen fast ejer og taber altid til kundearbejde. Plan: fast ejer + 30 min. fredag morgen i kalenderen."

Handler skredet reelt om én persons indsats eller adfærd: markér punktet [KRÆVER DIN VURDERING] og foreslå brugeren at tage det som samtale i stedet for på skrift i statussen.

## Typiske fejl i intern status

| Fejl | Hvorfor den skader |
|---|---|
| Succeser først, problemer i en bisætning | Teamet får ro præcis dér hvor der skulle handles |
| "Vi er lidt pressede" uden navne og tal | Ingen kan handle på det - og alle nikker og glemmer det |
| Problemer nævnt uden plan og ejer | Statussen bliver en klagemur; samme punkt står der igen næste uge |
| Kundestatussens polerede sprog genbrugt internt | Teamet lærer at statussen er PR, og holder op med at læse den |
| Persondomme på skrift i plenum | Skaber forsvar i stedet for løsning - og bliver liggende i arkivet |
| Rødt spor uden dato for ny plan | Rød uden plan er alarm uden handling - den udmatter i stedet for at mobilisere |
