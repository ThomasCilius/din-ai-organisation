# Høstregler - fra kilder til én aktionsliste

Regler for hvordan åbne aktioner høstes fra referater, ugestatusser og mailtråde og flettes til én liste. Læs hele filen før første høst i en session.

## Indhold

1. [Det fælles aktionsformat](#det-fælles-aktionsformat)
2. [Hvad tæller som en aktion - pr. kildetype](#hvad-tæller-som-en-aktion---pr-kildetype)
3. [Hvad tæller IKKE som en aktion](#hvad-tæller-ikke-som-en-aktion)
4. [Dubletter og konflikter på tværs af kilder](#dubletter-og-konflikter-på-tværs-af-kilder)
5. [Kant-tilfælde](#kant-tilfælde)

## Det fælles aktionsformat

Alle aktioner - uanset kilde - normaliseres til samme fire felter. Formatet deles med `referat` (som producerer aktioner) og `ugestatus` (som aftager dem), så kæden referat → opfølgningsliste → ugestatus virker uden oversættelse.

| Felt | Krav | Eksempel |
|---|---|---|
| Hvem | Én navngiven person (ikke et team, ikke "vi") | Mette (Nordkyst A/S) |
| Hvad | Konkret leverance eller handling, maks 14 ord, startende med udsagnsord | Sende underskrevet databehandleraftale retur |
| Deadline | En dato - eller `[UAFKLARET: deadline]` | 2026-07-10 |
| Kilde | Fil + dato; flere kilder adskilles med semikolon | referat-2026-06-30-ledermoede.md, 30/6 |

Hvorfor én person: "teamet" og "vi" kan ikke rykkes. Står der et team i kilden, så spørg ejeren hvem der ejer aktionen, eller skriv `[UAFKLARET: ejer]`.

Hvorfor kildepligt: en aktion uden kilde kan hverken verificeres eller forsvares når modtageren spørger "hvor har du det fra?". Kan du ikke citere fil + dato, optages aktionen ikke - nævn den i stedet under "Antagelser og åbne spørgsmål" og spørg ejeren.

## Hvad tæller som en aktion - pr. kildetype

### Referater (`referat-*.md`)

- **AKTION-linjer** høstes direkte - de står allerede i formatet hvem/hvad/deadline.
- **`[UAFKLARET - spørg mødedeltagerne]`-markeringer** høstes MED markeringen intakt - de er netop det opfølgningslisten skal have lukket.
- **BESLUTNINGER** høstes kun hvis beslutningen indeholder en handling med ejer ("Vi skifter leverandør; Lars opsiger aftalen inden 1/8" → aktion på Lars). En beslutning uden handling er ikke en aktion.
- Drøftelser og orienteringer høstes aldrig - heller ikke når de lyder handlingsagtige ("vi talte om at nogen burde kigge på hjemmesiden").

### Ugestatusser (`ugestatus-*.md`)

- **Blokeringer** med "hvad vi behøver fra modtageren" er aktioner på modtageren.
- **"Planen for næste uge"-punkter** med en navngiven ejer er aktioner med deadline = udgangen af den pågældende uge, medmindre andet står.
- **"Beslutninger der kræves"** er aktioner på beslutningstageren.
- **`[MANGLER INPUT: spørg X]`-markeringer** er aktioner på X (hvad = levere det manglende input).
- Rene fremdriftsbeskrivelser ("vi er 80 % færdige") er status, ikke aktioner.

### Mailtråde og mailudkast

- **Eksplicitte løfter** - "jeg vender tilbage torsdag", "vi sender tilbuddet i næste uge" - er aktioner på afsenderen med den nævnte dato som deadline.
- **Anmodninger med frist** - "kan I bekræfte senest fredag?" - er aktioner på modtageren.
- **`[AFKLAR: ...]`-markeringer** fra `mail-i-min-stil`-udkast er aktioner på ejeren (hvad = afklare punktet).
- Ubesvarede mails hvor ejeren venter svar, er aktioner på modparten med status "Afventer svar" - men kun hvis ejeren faktisk har sendt mailen; en usendt kladde forpligter ingen.
- Høflighedsfraser ("vi må endelig ses snart") er ikke aktioner.

## Hvad tæller IKKE som en aktion

- Hensigtserklæringer uden ejer og dato: "vi bør på et tidspunkt opdatere prislisten".
- Vaner og driftsopgaver der kører fast (ugens bogføring, den månedlige backup) - de hører til i rutiner, ikke på opfølgningslisten.
- Aktioner ejeren allerede har bekræftet lukket på en tidligere liste - de genoptages kun hvis en ny kilde genåbner dem, og så noteres begge kilder.
- Betalingskrav og ubetalte fakturaer - de hører til `rykker-runde` i Økonomi. Finder du dem under høsten, så nævn dem én gang under "Antagelser og åbne spørgsmål" med henvisning til `rykker-runde`, og optag dem ikke på listen.

## Dubletter og konflikter på tværs af kilder

- **Samme aktion i flere kilder** (fx nævnt i både referat og ugestatus): én linje på listen, alle kilder i kildefeltet. Aktionen bliver ikke "vigtigere" af at stå to steder - prioriteten styres af deadline og prioriteringsreglen.
- **Deadline-konflikt** mellem kilder: den nyeste kilde vinder, og ændringen noteres i Hvad-feltet ("deadline flyttet 3/7 → 10/7, jf. mail 2/7"). En flyttet deadline nulstiller IKKE påmindelsestælleren - to påmindelser er stadig loftet for den samme leverance.
- **Ejer-konflikt** (to kilder peger på hver sin person): optag aktionen med `[UAFKLARET: ejer - referat siger Lars, mail siger Sofie]` og spørg ejeren i statusgennemgangen.
- **Omformuleringer** af samme aktion ("sende kontrakten" vs. "fremsende aftalen til underskrift"): behandl som dublet når hvem og leverance reelt er ens - vær rund i matchningen, mennesker formulerer sig forskelligt fra uge til uge.

## Kant-tilfælde

- **Ejerens egne aktioner:** de høstes og står på listen på lige fod - listen er også ejerens spejl. Men de får aldrig påmindelsesudkast; markér dem "din egen" og lad dem tale for sig selv i gennemgangen.
- **Aktion med ejer, uden deadline:** optages med `[UAFKLARET: deadline]` og placeres under Åben, nederst i gruppen. Foreslå ejeren en deadline i statusgennemgangen - en aktion uden dato kan aldrig blive overskredet og dør derfor stille.
- **Aktion på en person der er stoppet/utilgængelig:** flag den i statusgennemgangen; ejeren skal udpege en ny ejer, du gætter ikke.
- **Meget gamle aktioner** (fra før den ældste kilde i perioden): står de på forrige opfølgningsliste, følger de med - reglen om at intet forsvinder uden spor gælder uanset alder. Foreslå ejeren aktivt at lukke eller genbekræfte aktioner over 30 dage gamle; en liste fuld af døde aktioner mister sin autoritet.
- **Følsomme aktioner** (personale, konflikt, helbred): optages med neutral formulering ("afklare bemandingsspørgsmål" - ikke detaljer), og påmindelsesudkast skrives aldrig automatisk; spørg ejeren først.
