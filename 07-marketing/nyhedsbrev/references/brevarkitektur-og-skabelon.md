# Brevarkitektur og skabelon-vedligehold

Læs denne fil når du skriver brødteksten. Den uddyber de fem faste sektioner, viser et komplet annoteret eksempel og forklarer hvordan virksomhedens egen skabelon gemmes og genbruges.

## Princippet: genkendelighed slår nyhed

Et nyhedsbrev er ikke en kreativ konkurrence - det er en aftale med læseren. Samme struktur, samme faste sektioner, samme stemme hver gang betyder at læseren kan skimme brevet på 30 sekunder og finde det, de plejer at få værdi af. Lad indholdet variere, aldrig formen. Derfor: findes der en gemt `brevskabelon.md`, følger du den slavisk; findes den ikke, bygger du brevet efter standardarkitekturen nedenfor og foreslår at gemme den som skabelon bagefter.

## De fem sektioner i detaljer

### 1. Personlig indledning (2-4 sætninger)

- Skrives i afsenderens stemme (voice-profil.md) og med rigtig person som afsender - "Thomas fra Jensen VVS", ikke "Jensen VVS Nyhedsbrev".
- Besvarer implicit: hvorfor skriver vi netop nu? En anledning (sæson, begivenhed, noget en kunde sagde) gør brevet menneskeligt.
- Går hurtigt videre til hovedhistorien - indledningen er en håndsrækning, ikke en sektion i sig selv.

### 2. Hovedhistorien (150-300 ord)

- ÉN pointe. Har brugeren to store historier, foreslå at gemme den ene til næste brev - det er også godt for kadencen.
- Konkret slår generelt: navne, datoer, tal, det der faktisk skete. "En kunde spurgte i tirsdags..." slår "mange oplever...".
- Læseren er hovedperson: skriv udbyttet ("du kan nu..."), ikke bedriften ("vi har implementeret...").
- Mellemrubrik hvis historien runder 150 ord - mobil-skimmeren skal kunne gribe pointen af overskrifterne alene.

### 3. Korte noter (0-3 stk., max 40 ord pr. note)

- Småt-men-godt: en dato, et link til et blogindlæg, en driftsinfo, et velkommen-til-ny-medarbejder.
- Hver note må gerne have et link, men noterne konkurrerer ALDRIG med den primære CTA - ingen knapper her, kun tekstlinks.
- Ingen noter er bedre end fyld-noter. Tre stærke maksimum.

### 4. Den primære CTA (én, altid)

- Knaptekst i bydeform, max 4 ord, og den beskriver hvad handlingen giver: "Book dit forårstjek", "Se de nye priser", "Svar mig direkte".
- Placeres efter hovedhistorien - dér hvor motivationen topper. Ved lange breve må samme CTA gerne gentages nederst; det tæller stadig som én.
- CTA'en skal matche interviewets handlings-svar ét til ét. Er der opstået en ekstra CTA undervejs, er det et fund i tjek-loopet.

### 5. Signatur og footer

- Signatur fra et menneske: navn, rolle, evt. direkte telefonnummer. Svar på nyhedsbrevet skal ende hos en rigtig person - direkte svar er et af de ærligste målepunkter.
- Footer (ligger typisk i udsendelsesværktøjets skabelon): afmeldingslink + virksomhedens navn og kontaktoplysninger er lovkrav - se `spam-og-samtykkeregler.md`, afsnit 4. Skillen skriver ikke footeren, men udsendelsesnoten skal minde om den.

## Billeder og alt-tekster

- Foreslå kun billeder der bærer information (produktet, personen, situationen) - ingen stock-dekoration.
- Skriv et alt-tekst-forslag pr. billedplacering: 6-12 ord, beskriv indholdet, aldrig "billede af". Mange mailklienter blokerer billeder som standard - alt-teksten ER brevet for de læsere.
- Brevet skal fungere HELT uden billeder: al kritisk information (dato, pris, CTA) står i tekst.

## Mobil-skimbarhed

Over halvdelen af alle nyhedsbreve åbnes på mobil. Tjekpunkterne:

- Afsnit på max 3 linjer (mobilbredde), luft imellem.
- Mellemrubrikker ved hvert sektionsskift - skimmeren navigerer på dem.
- Det vigtigste øverst i hver sektion; ingen "opbygning til pointen".
- Én spalte i tanken: skriv brevet så det fungerer som ren lodret tekststrøm.

## Annoteret eksempel (fiktiv virksomhed: Jensen VVS)

```markdown
Hej [fornavn]                                          ← flettefelt, ellers direkte til sagen

Karim og Jonas startede hos os i mandags, og jeg vil   ← indledning: anledning + afsenderens
gerne fortælle dig hvorfor vi har ansat dem. Det korte    stemme + peger frem mod historien
svar: I har ventet for længe på os.

**Samme dags-service fra 1. marts**                    ← mellemrubrik = hovedhistoriens pointe

Flere af jer har sagt det direkte: tre dages ventetid  ← læserne som hovedperson, konkret
på en servicetekniker er for lang tid, når fyret          årsag - ikke "vi er stolte af..."
står stille. Det havde I ret i.

Derfor kan du fra 1. marts få en tekniker samme dag,   ← udbyttet i du-form, med konkret
hvis du ringer inden kl. 10. Karim tager Nordbyen,        mekanik (inden kl. 10) og navne
Jonas tager Sydbyen, og priserne er de samme som i dag.

[ Book dit forårstjek ]                                ← primær CTA: bydeform, 3 ord, efter
                                                          hovedhistorien
**Kort nyt**
- Prislisten for 2026 ligger nu på hjemmesiden [link]  ← 2 noter a under 40 ord, tekstlinks,
- Vi holder lukket fredag d. 14/3 (kursusdag)             ingen konkurrerende knapper

Venlig hilsen
Thomas Jensen, Jensen VVS                              ← rigtig person; svar lander hos ham
Direkte: [telefonnummer]

[Footer fra udsendelsesværktøjet: afmeldingslink +     ← lovkrav - nævnes i udsendelsesnoten
firmanavn/adresse]
```

Bemærk hvad eksemplet IKKE gør: ingen "Velkommen til vores nyhedsbrev", ingen tre konkurrerende budskaber, ingen "vi er stolte af at kunne meddele", kun én knap.

## Skabelon-vedligehold

- **Findes `brevskabelon.md` ikke:** foreslå efter første godkendte udkast at gemme brevets struktur (sektioner, rækkefølge, faste rubrikker som "Kort nyt", signaturformat) som `brevskabelon.md` i brain-mappen. Fra næste gang er formen fast.
- **Findes den:** følg den. Foreslå kun ændringer eksplicit og hver for sig - og opdatér filen først når brugeren har godkendt ændringen. Notér ændringsdato nederst i skabelonen; den gamle version arkiveres (fx `brevskabelon-2026-03.md`), aldrig bare overskrives.
- Skabelonen er strukturen, ikke indholdet: den indeholder sektioner og faste rubrikker, aldrig gammel brødtekst.
