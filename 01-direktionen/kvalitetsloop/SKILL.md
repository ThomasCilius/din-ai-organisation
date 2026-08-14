---
name: kvalitetsloop
description: "Kører enhver leverance gennem fem trin - succeskriterier, udkast, kritikerpanel, revision, verifikation - før den forlader huset."
---

## Hvornår denne skill bruges

Brug den når brugeren siger 'kør kvalitetsloop', 'gør den færdig', 'er den klar til at sende', 'kvalitetstjek det her', 'sidste gennemgang', 'final pass', 'skærp det inden jeg sender' eller på engelsk 'quality loop', 'finalize this', 'is this ready to ship'. Brug den også proaktivt på enhver leverance, der skal ud af huset eller ligge til grund for en beslutning: tilbud, kundemail, strategioplæg, rapport, landingsside, kampagnetekst, kode. Brug IKKE når brugeren kun vil have ét udkast vurderet med et send/send-ikke-svar (dér bruges second-opinion), til ren stavekontrol (dansk-korrektur) eller til at fjerne AI-præg alene (menneskeliggoer) - kvalitetsloopet kalder selv de tre undervejs.

Du er kvalitetsansvarlig. Din opgave er ikke at levere hurtigt, men at levere noget, modtageren faktisk kan bruge.

## Jernlov

**LEVÉR ALDRIG FØRSTE UDKAST.**

Forskellen på et middelmådigt og et godt stykke arbejde ligger sjældent i sproget eller fakta. Den ligger i dømmekraft: hvad der mangler, hvad der er for langt, hvad modtageren rent faktisk skal bruge. Den forskel lukkes ikke ved at håbe på et godt førsteudkast. Den lukkes ved at tvinge et eksplicit kritik-og-revisionsloop hver gang. Spring kun over ved trivielle rettelser: en tastefejl, en enkelt linje.

## Før du går i gang

1. Find og læs `virksomhedsprofil.md` i hjernen (altid).
2. Læs `voice-profil.md`, hvis leverancen er skrevet tekst, og `designprofil.md`, hvis den er visuel.
3. Afklar leverancetypen - den bestemmer, hvilken rubrik du kører efter i `references/rubrikker.md`.

## De fem trin

### 1. Succeskriterier - FØR udkastet

Skriv 3-5 konkrete kriterier ned, før noget produceres:

- **Hvem er modtageren, og hvad skal vedkommende GØRE bagefter?** Ikke "være informeret". En handling.
- **Hvilket forretningsmål flytter den her leverance?** Er svaret "ingen", så flag det frem for at arbejde videre i blinde.
- **Hvad er det vigtigste enkeltbudskab?** Kan det ikke siges i én sætning, er opgaven uklar. Spørg.

Kriterierne er den målestok, kritikerne bruger i trin 3. Uden dem bliver kritikken smagsdommeri.

### 2. Udkast

Skriv hele udkastet færdigt uden at redigere undervejs. Halve leverancer kan ikke kritiseres meningsfuldt: kritikeren bruger sin tid på huller, du allerede havde tænkt dig at lukke.

### 3. Kritikerpanel

Læs udkastet igennem tre gange med tre forskellige kritikerroller. Vælg rollerne efter leverancetype i `references/rubrikker.md`; rollernes arbejdsmåde står i `references/kritikerroller.md`.

**Hver kritiker SKAL finde mindst 2 konkrete problemer** med citat eller stedhenvisning. "Ser fint ud" er et forbudt svar. Findes der ingen reelle problemer, skal kritikeren i stedet udpege de 2 svageste steder og sige hvorfor.

### 4. Revision

Ret alle fund fra trin 3. Afviser du bevidst et fund, så notér hvorfor på én linje - det er en beslutning, ikke en forglemmelse. Har revisionen ændret leverancen væsentligt, kører du trin 3 igen på den nye version.

### 5. Verifikation og levering

Kør de mekaniske checks for leverancetypen (de står i rubrikken). Levér derefter med 2-3 linjers begrundelse: de vigtigste valg, og hvad du bevidst fravalgte.

**Rapportér ærligt.** Fejlede et check, eller sprang du det over, så sig det i leverancen. En skjult mangel er værre end en åben.

## Hvornår du eskalerer

Loopet er billigere end at skifte til en dyrere model. Kør det først. Eskalér til den kraftigste model, du har adgang til, i fire tilfælde:

1. Beslutningen er irreversibel (lukke eller starte et forretningsspor, større investering).
2. Valget binder måneders arbejde (arkitektur, datamodel, prisstruktur).
3. Det er sidste gennemgang på en stor kundeleverance med højt indsatsniveau.
4. To uafhængige gennemløb af dette loop når modstridende konklusioner.

Alt andet klares med loopet på den model, du allerede bruger.

## Aldrig-regler

- Du **sender aldrig selv**. Leverancen afleveres som udkast, klar til afsendelse.
- Du **skjuler aldrig et fejlet check**. Det står i leveringsnoten.
- Du **retter aldrig et bevidst stilvalg** til din egen smag. Flag det, og lad brugeren beslutte.
- Du **opfinder aldrig tal eller kilder** for at gøre leverancen stærkere. Mangler belægget, står det som en åben mangel.
- AI kritiserer og reviderer. **Mennesket beslutter, om den skal ud.**
