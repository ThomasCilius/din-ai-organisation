# Basistjek efter sikkerdigital.dk- og D-mærket-principper

Den fulde tjekliste bag Spor B. Læs den, når du kører det kvartalsvise basistjek og skal skrive `sikkerhedsstatus.md`. Statusfeltet er altid ét af tre: **OK**, **Mangel**, **Ikke verificeret**. "Ikke verificeret" er et ærligt svar - gæt aldrig "OK" for at gøre listen pæn.

## Indhold
- [Sådan kører du tjekket](#sådan-kører-du-tjekket)
- [De seks områder i dybden](#de-seks-områder-i-dybden)
- [Statusformat pr. punkt](#statusformat-pr-punkt)
- [D-mærket](#d-mærket)
- [Slå op](#slå-op)

## Sådan kører du tjekket

Gå område for område. For hvert punkt: spørg om status (ja/nej/ved ikke), notér en kort note, en ansvarlig og en næste handling. Findes `systemoversigt.md` (fra `adgangsstyring`), så brug den til at afgøre hvilke konkrete systemer der skal have MFA og backup - ellers spørg hvilke systemer virksomheden bruger. Prioritér til sidst efter risiko: MFA og en testet backup øverst.

## De seks områder i dybden

**1. MFA (to-faktor) på alle konti.** To-faktor er den enkeltforanstaltning der stopper flest reelle angreb, fordi en stjålet adgangskode så ikke er nok. Krav: MFA på e-mail (den vigtigste - den kan nulstille alle andre adgangskoder), på alle administrator-konti, på netbank/erhvervsbank, og på kritiske SaaS (økonomi, CRM, fildeling). Foretræk en autentificator-app eller sikkerhedsnøgle frem for SMS, hvor det kan lade sig gøre. Mangel = en eller flere kritiske konti uden MFA.

**2. Backup efter 3-2-1 MED testet gendannelse.** 3-2-1: mindst **3** kopier af data, på **2** forskellige medietyper, hvoraf **1** ligger offline eller et andet sted (offsite/sky). Det afgørende punkt er den testede gendannelse: en backup du aldrig har prøvet at gendanne fra, er en antagelse - ikke en backup. Krav: automatisk backup af forretningskritiske data, én kopi der ikke kan rammes af ransomware på netværket, og en dokumenteret, gennemført prøvegendannelse inden for en rimelig periode. Mangel = ingen offsite-kopi eller ingen testet gendannelse.

**3. Automatiske opdateringer.** Uopdateret software er den hyppigste vej ind. Krav: automatiske opdateringer slået til på styresystem (Windows/macOS), på browsere, på CMS og plugins (WordPress/Shopify), og på netværksudstyr/firmware hvor muligt. Særligt web-plugins er en klassisk indgang. Mangel = manuel eller udskudt opdatering på noget kritisk.

**4. Adgangsbegrænsning (mindsteprivilegie).** Krav: brugere har kun adgang til det, jobbet kræver; administrator-rettigheder er adskilt fra dagligkonti og gives kun til dem der skal bruge dem; adgange lukkes samme dag som en medarbejder fratræder; delte adgangskoder undgås eller ligger i en password manager. Selve on-/offboarding-tjeklisterne bor i `adgangsstyring` - her tjekker du blot, om princippet holdes. Mangel = hængende adgange eller udbredte administrator-rettigheder.

**5. Medarbejder-awareness.** Teknik alene stopper ikke phishing - mennesket er sidste led. Krav: kolleger kan genkende de typiske røde flag (hast, ændret kontonummer, mail "fra chefen"); der findes en kendt, nem måde at melde en mistænkelig mail på; nye medarbejdere får en kort introduktion; verifikationsprotokollen for betalingsændringer er kendt af dem der betaler fakturaer. Mangel = ingen fast meldevej eller ingen introduktion.

**6. Enheder.** Krav: diskkryptering (BitLocker/FileVault) på bærbare, så en stjålet computer ikke er et databrud; automatisk skærmlås; opdateret sikkerhedssoftware; mobiltelefoner med kode/biometri og mulighed for fjernsletning. Mangel = ukrypterede bærbare med forretningsdata.

## Statusformat pr. punkt

Skriv hvert område ind i tabellen i `sikkerhedsstatus.md`:

| Felt | Indhold |
|---|---|
| Område | et af de seks ovenfor |
| Status | OK / Mangel / Ikke verificeret |
| Note | kort begrundelse eller hvad der mangler |
| Ansvarlig | hvem lukker manglen |
| Næste handling | konkret, fx "slå MFA til på økonomisystemet" |

## D-mærket

D-mærket er en frivillig dansk mærkningsordning for it-sikkerhed og ansvarlig databrug, målrettet bl.a. mindre virksomheder. Nævn det som en mulig ramme, hvis virksomheden vil have et struktureret niveau at arbejde mod eller vil kunne dokumentere sikkerhed over for kunder. Slå de aktuelle kriterier og trin op på **virk.dk / d-maerket.dk** - hardcode dem ikke, de justeres over tid.

## Slå op

Basistjekkets anbefalinger opdateres. Slå den aktuelle version op frem for at antage:
- **sikkerdigital.dk** - myndighedernes aktuelle basistjek og råd til SMV'er.
- **virk.dk / d-maerket.dk** - D-mærkets aktuelle kriterier.
- Findes der en `systemoversigt.md`, så kryds MFA- og backup-status af mod de faktiske systemer der står i den.
