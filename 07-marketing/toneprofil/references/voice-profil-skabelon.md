# Skabelon: voice-profil.md

Brug PRÆCIS denne skabelon når du skriver voice-profil.md (arbejdsgangens trin 6). Alle 10 sektioner er obligatoriske og skal stå i denne rækkefølge - en forbruger-skill skal kunne finde det samme afsnit i enhver virksomheds profil. Tekst i [klammer] erstattes; instruktioner i kursiv slettes i den færdige fil.

## Indhold

1. [Selve skabelonen](#selve-skabelonen)
2. [Udfyldningsregler pr. sektion](#udfyldningsregler-pr-sektion)
3. [Arkiveringsregler](#arkiveringsregler)

## Selve skabelonen

```markdown
# Voice-profil: [virksomhedsnavn]

| | |
|---|---|
| Version | [1.0 / 1.1 ved revision] |
| Dato | [YYYY-MM-DD] |
| Naeste revision | [YYYY-MM-DD - 3 maaneder frem; 1 maaned ved FORELOEBIG] |
| Kildegrundlag | [antal] tekster fra [antal] kanaler, rang A: [n], B: [n], C: [n] |
| Status | [GODKENDT af [navn] / FORELOEBIG - tyndt grundlag] |

## Saadan lyder vi

[3-5 linjer prosa: essensen af stemmen, bygget af fundene - ingen vage
tillaegsord uden citatbelaeg. Skal kunne laeses hoejt for en ny medarbejder
som svar paa "hvordan skriver vi her?"]

## De seks dimensioner

[Én blok pr. dimension, observationsformatet fra stilanalysen:]

**1. Formalitet:** [fund]. Citat: "[...]" ([kanal], [dato], rang [A/B/C]). Gaelder: [brand-voice/kanal-tone].
**2. Humor/toerhed:** [...]
**3. Fagtermer vs. hverdagssprog:** [...]
**4. Saetningslaengde og rytme:** [fund med TAL, fx "typisk 8-14 ord"]. [...]
**5. CTA-stil:** [...]
**6. Holdning:** [fund + emnerne der menes noget om]. [...]

## Goer / goer-ikke

[5-8 punkter pr. kolonne. KUN brand-voice-traek - intet kanalspecifikt her.]

| Goer | Goer ikke |
|---|---|
| [fx Skriv "du", altid] | [fx Skriv aldrig "De" eller "man"] |
| [fx Aabn gerne med et spoergsmaal til laeseren] | [fx Aabn aldrig med "Vi er stolte af..."] |
| [...] | [...] |

## Ordliste

**Foretrukne ord:** [5-10 ord med evt. kontekst - fx "kunder (aldrig 'klienter')"]
**Forbudte ord:** [ord teksterne konsekvent undgaar + AI-klichéer brugeren har bandlyst]
**Produktnavne og stavemaader:** [praecis stavning af egne produkter/ydelser,
krydstjekket mod virksomhedsprofil.md - fx "TalPakken (ét ord, stort T og P)"]

## Foer/efter-eksempler

[Praecis 3. "Foer" = saadan skriver en generisk AI/et bureau det.
"Efter" = samme budskab i virksomhedens stemme, bygget af citaternes traek.]

1. FOER: "[generisk version]"
   EFTER: "[versionen i virksomhedens stemme]"
2. FOER: "[...]" / EFTER: "[...]"
3. FOER: "[...]" / EFTER: "[...]"

## Kanal-toner

[Kun kanaler med belaeg i kildeteksterne. Afvigelser fra brand-voice, ikke gentagelser af den.]

- **LinkedIn:** [fx "emojis ok som punktopstilling, max 3; afsnit paa 1-2 linjer"]
- **Nyhedsbrev:** [fx "personlig indledning i jeg-form; ingen emojis"]
- **Web:** [...]
- **Mails/tilbud:** [fx "et nøk mere formel: fuld hilsen, ingen humor i priser og vilkaar"]

## Bevidste stilvalg

[Valg der TRUMFER dansk retskrivning - hvert punkt bekraeftet af brugeren.
Er der ingen: skriv "Ingen - vi foelger Retskrivningsordbogen."]

- [fx "Vi saetter ikke startkomma - bevidst valg, bekraeftet af [navn] [dato]"]
- [fx "[brandnavn] skrives med lille begyndelsesbogstav, ogsaa foerst i saetninger"]

## Til andre skills: konfliktregel

Afviger et udkast fra denne profil, skal afvigelsen flages eksplicit -
ret den ALDRIG stiltiende. Format:

> **[TONE-AFVIGELSE]** Udkastet [hvad udkastet goer], profilen siger
> [hvad profilen siger] ([sektion + punkt]). Behold afvigelsen eller ret til profilen?

Brugeren afgoer. Punkterne under "Bevidste stilvalg" maa aldrig "rettes"
til retskrivningsnormen.

## Kilder og kildekvalitet

| # | Tekst | Kanal | Dato (ca.) | Forfatter | Rang |
|---|---|---|---|---|---|
| 1 | [titel/beskrivelse] | [kanal] | [dato] | [ejer/medarbejder/bureau/AI] | [A-D] |
| ... | | | | | |

[Frasorterede tekster (rang D) naevnes med én linjes begrundelse.]

## Versionshistorik

| Version | Dato | AEndring | Arkivfil |
|---|---|---|---|
| 1.0 | [dato] | Foerste profil ([n] tekster, [n] kanaler) | - |
| [1.1] | [dato] | [hvad blev aendret og hvorfor] | voice-profil-arkiv/voice-profil-[dato].md |
```

## Udfyldningsregler pr. sektion

- **Header:** "Naeste revision" er obligatorisk - 3 måneder frem, dog 1 måned ved status FORELØBIG. Status GODKENDT kræver at brugeren har godkendt observationerne i arbejdsgangens trin 5.
- **Saadan lyder vi:** skriv den SIDST, når alt andet er udfyldt - den er en sammenfatning, ikke et gæt. Testen: kunne afsnittet også beskrive konkurrenten? Hvis ja: skriv om.
- **De seks dimensioner:** observationsformatet er ufravigeligt (fund + ordret citat + kanal + rang + brand-voice/kanal-tone). Ved tyndt grundlag markeres enkeltfund `[FORELØBIG]` frem for at udelade dem.
- **Goer/goer-ikke:** hvert "goer" skal kunne efterleves af en skrivende skill uden yderligere forklaring - konkret handling, ikke egenskab. "Vaer autentisk" er forbudt; "brug et konkret eksempel fra hverdagen i hvert opslag" er godt.
- **Foer/efter:** "efter"-versionerne må ikke være opdigtede idealer - de bygges af træk der ER dokumenteret i dimensionerne. Genbrug gerne let omskrevne, rigtige sætninger fra kildeteksterne som "efter".
- **Kanal-toner:** kun kanaler med kildebelæg. Skriv aldrig en anbefalet tone for en kanal virksomheden ikke har tekster fra - notér i stedet "[kanal]: intet belæg endnu - tilfoej tekster ved naeste revision".
- **Kilder:** tabellen gør profilen efterprøvelig; uden den kan næste revision ikke se hvad konklusionerne hviler på.

## Arkiveringsregler

1. Ved enhver revision: kopiér den gældende profil til `voice-profil-arkiv/voice-profil-[YYYY-MM-DD].md` (datoen er den gamle profils dato) FØR noget ændres.
2. Fremlæg planen (hvilken fil arkiveres, hvad ændres i den nye version) og få den godkendt før filhandlingerne udføres.
3. Versionshistorikken i den nye profil skal henvise til arkivfilen, så udviklingen i tonen kan spores tilbage.
4. Slet aldrig arkivfiler - heller ikke på opfordring uden eksplicit bekræftelse ("skal jeg virkelig slette historikken?").
