# Kadence-katalog - dansk SMV-rytme og landingstidspunkter

Læs denne fil når frekvensen skal vælges, eller når brugeren er usikker på hvornår en rutine skal lande.

## Grundreglen

**Rutinen lander FØR mennesket skal bruge resultatet - med luft til at læse og rette.**

En rutine der lander efter behovet, er værre end ingen rutine: den lærer brugeren at resultatet ikke kan bruges, og så dør tilliden til hele vagtplanen. Frekvens vælges derfor aldrig først - anledningen findes først, og frekvensen følger af den.

## Baglæns-beregning i tre trin

1. **Find anledningen.** Hvilket møde, hvilken beslutning, hvilket tidspunkt skal resultatet bruges til? Spørg til det konkrete: "mandagsmødet kl. 9", "før jeg åbner indbakken", "når momsen skal indberettes".
2. **Træk læse- og rettetid fra.** Brugeren skal kunne nå at læse artefaktet, opdage en fejl og bede om en rettelse. Tommelfingerregel: mindst 1-2 timers luft ved daglige rutiner, en halv til hel arbejdsdag ved uge- og månedsrutiner.
3. **Sæt triggeren dér.** Mandagsmøde kl. 9 → rutinen kører mandag kl. 06:00. Momsfrist → rutinen kører når regnskabsperioden lukker, ikke dagen før fristen.

## Den danske SMV-uge

| Anledning | Rutine-eksempel | Landingstidspunkt |
|---|---|---|
| Ugens start / mandagsmøde | Mandagsbrief: ugens aftaler, deadlines, opfølgninger | Mandag kl. 06:00 |
| Arbejdsdagens start | Morgenens mailudkast, dagens opgaveliste | Hverdage kl. 06:30-07:00 |
| Det ugentlige salgsmøde | Pipeline-gennemgang (`pipeline-gennemgang`) | Aftenen før mødet |
| Ugens afslutning | Ugestatus (`ugestatus`) | Fredag kl. 11:00 - før frokost, mens ugen huskes |
| Natten (ingen læser venter) | Natportner-kørsel, oprydningsforslag | Kl. 02:00-05:00 |

## Den danske SMV-måned og det lange årshjul

| Anledning | Rutine-eksempel | Landingstidspunkt |
|---|---|---|
| Månedsafslutning | Bilagsrydning, rykker-runde, budgetopfølgning (Økonomi-skills) | 1.-3. hverdag i den nye måned |
| Likviditetsoverblik | `likviditetsoverblik` | Fast månedsdag, fx den 1. |
| Kvartalsstatus | `strategi-tjek`, kvartalsrapport | Kvartalets sidste uge |
| Kvartalsplanlægning | Input til `kvartals-nedbrydning` | Kvartalets første uge |
| Moms og indberetninger | Påmindelses- og klargøringsrutine | Når perioden lukker - **frister slås ALTID op på skat.dk/virk.dk, aldrig hardcodet i rutinen** |
| MUS-cyklus | Forberedelsesrutine pr. medarbejder (`mus-forberedelse`) | 1-2 uger før hver samtale |
| APV og trivsel | Påmindelsesrutine | Efter virksomhedens APV-plan - kravet slås op på at.dk (Arbejdstilsynet) |

Årshjulets lovpligtige punkter (moms, ferieår, APV, indberetninger) ændrer sig. Derfor: rutinen anviser HVOR fristen slås op, og selve opslaget er en del af kørslen. En rutine med en indbygget frist fra sidste år er farligere end ingen rutine.

## Hændelsestriggere - det episodiske

Ikke alt følger kalenderen. Hændelsestrigger bruges når arbejdet opstår uregelmæssigt, men skal behandles ens hver gang:

| Hændelse | Rutine-eksempel |
|---|---|
| Ny ansøgning i rekrutteringsmappen | Screening mod kravprofil (`rekruttering`) - som udkast til vurdering |
| Nyt kundeemne i indbakken/CRM | Berigelse og udkast til første svar (`kundeemner`) |
| Ny medarbejder bekræftet | Onboardingplan-udkast (`onboarding-offboarding`) |
| Faktura forfalden (observeret i regnskabsdata) | Rykkerudkast (`rykker-runde`) - aldrig afsendelse |

Krav til en hændelsestrigger: hændelsen skal være **observerbar** i en fil, mappe, indbakke eller kalender. "Når der sker noget vigtigt" er ikke en hændelse. Er hændelsen ikke observerbar, så konvertér til en kalendertrigger der TJEKKER for hændelsen ("hver morgen: er der nye ansøgninger?").

## Valg mellem kalender og hændelse

- **Vælg kalender som udgangspunkt.** Forudsigelig, let at forklare, let at savne når den svigter. Begyndere bør starte her.
- **Vælg hændelse** når ventetiden koster noget (et kundeemne der venter tre dage, er koldt) og hændelsen er observerbar.
- **Kombinér ved tvivl:** en hyppig kalendertrigger der tjekker for hændelsen ("hver morgen kl. 7: nye ansøgninger?") giver hændelsens effekt med kalenderens forudsigelighed.

## Advarsler

- **For hyppigt er den hyppigste fejl.** En daglig rapport ingen når at læse, rammer Nedlukningsreglen på to uger. Start på den lave frekvens (ugentlig frem for daglig) og skru op hvis brugeren beder om det - aldrig omvendt.
- **Læg ikke to store rutiner på samme landingstidspunkt.** Mandag kl. 06:00 med tre rapporter betyder at to af dem ikke bliver læst. Fordel dem over ugen efter hvornår de faktisk bruges.
- **Nattens rutiner skal være de ufarligste.** Om natten er der længst tid til at ingen opdager en fejl - natlige rutiner bør kun læse og foreslå, aldrig producere noget der bruges direkte uden gennemsyn.
