# Bestiller-mode: review af et leverandørforslag

Danske SMV'er bestiller langt oftere digitale løsninger end de bygger dem, og tilbudsvurdering er den dyreste beslutning i afdelingen. Dømmekraften er den samme ingeniørchef-gennemgang som i byg-mode, men rettet mod et bureaus eller en freelancers forslag. Formålet er ét: at forslaget bygger det byggebrief.md bad om, til en pris og på vilkår virksomheden kan leve med - før der accepteres.

**Grundregel:** vurdér altid forslaget mod byggebrief.md, aldrig forslaget alene. Uden briefen som målestok vinder det forslag der lyder bedst, ikke det der leverer mest.

## Indhold

1. Punkt-for-punkt-match mod byggebrief
2. Hvad står der IKKE
3. Estimat-realisme
4. Timepris uden loft
5. Ejerskab og exit
6. GDPR og databehandleraftale
7. Spørgsmål at stille før valg
8. Røde flag i danske forslag

## 1. Punkt-for-punkt-match mod byggebrief

Gå hvert færdig-kriterium og hvert krav i byggebrief.md igennem, og markér for hvert: **dækket / delvist / ikke nævnt**. Et krav der ikke nævnes i forslaget, er ikke "underforstået med" - det er uden for scope indtil det står skrevet. Delvist-dækkede krav er de dyreste overraskelser: de ser med ud, men er skåret ned.

## 2. Hvad står der IKKE

Det udeladte er ofte det dyre. Tjek aktivt for det der mangler, ikke kun det der står:

- Er drift, hosting, support og vedligehold EFTER levering med - eller er det et separat, uafklaret beløb?
- Er test, fejlretning i garantiperioden og overdragelse med?
- Er datamigrering fra det gamle system med (ofte glemt, ofte stort)?
- Er der en fast leveringsdato, eller kun "løbende"?

## 3. Estimat-realisme

- Er estimatet brudt ned pr. leverance, eller ét stort rundt tal? Ét tal skjuler antagelser.
- Passer timeforbruget til opgavens størrelse? Både urealistisk lavt (bliver dyrere undervejs) og oppustet er et fund.
- **Aktuelle danske timeprisniveauer slås op** (fx typiske bureau- vs. freelance-niveauer på opslagstidspunktet) - hardcode aldrig en "normal" pris fra hukommelsen. Citér kilde og dato i dommen.

## 4. Timepris uden loft

Fastpris egner sig til veldefineret scope - og det er præcis det byggebrief.md giver. Timepris kan være fint, men kun med:

- et **loft** (maks-beløb der ikke overskrides uden ny godkendelse), og
- **løbende afrapportering** af forbrug.

Timeestimat uden loft er et rødt flag: regningen kan løbe frit, og bestilleren bærer hele risikoen.

## 5. Ejerskab og exit

Det der binder virksomheden fast efter projektet. Kræv at forslaget svarer klart:

- Hvem ejer **koden** efter levering?
- Hvem ejer **dataene**, og kan de eksporteres i et brugbart format?
- Hvem står registreret som ejer af **domænet** og **hosting-kontoen**? (Skal være virksomheden selv - ikke bureauet.)
- Hvad sker der hvis samarbejdet stopper: får man kode, adgange og data udleveret, og hvad koster en overdragelse til en anden leverandør?

Uafklaret ejerskab og manglende exit er blandt de dyreste fejl at opdage bagefter.

## 6. GDPR og databehandleraftale

Behandler løsningen persondata på virksomhedens vegne, kræver GDPR art. 28 en **databehandleraftale** med leverandøren. Mangler den i forslaget, er det et fund. Tjek også dataminimering (indsamles kun det nødvendige?) og hvor data hostes (EU/EØS vs. tredjeland). Slå aktuel praksis op frem for at antage - henvis til `gdpr-fortegnelse` (03-viden-og-data) for selve fortegnelsesarbejdet.

## 7. Spørgsmål at stille før valg

Formulér disse som konkrete spørgsmål brugeren kan sende leverandøren:

- Har I referencer fra lignende opgaver vi må kontakte?
- Hvem udfører konkret arbejdet - senior, junior eller underleverandør?
- Hvad koster ændringer efter levering, og hvordan afregnes de?
- Hvad sker der praktisk hvis samarbejdet stopper midt i projektet?

## 8. Røde flag i danske forslag

Står ét af disse, kan dommen højst blive GO-med-ændringer:

- Timeestimat uden loft.
- 100 % forudbetaling (del betaling op efter milepæle).
- Leverandøren ejer domænet eller hosting-kontoen.
- Ingen databehandleraftale selv om der behandles persondata (GDPR art. 28).
- "Vi plejer at finde ud af det undervejs" i stedet for skriftligt scope - det er en åben regning forklædt som fleksibilitet.
