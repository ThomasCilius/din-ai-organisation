# Artikel 30-fortegnelsen: pligtfelter, skabelon og typiske SMV-aktiviteter

Indhold:

1. [Hvem skal have en fortegnelse](#1-hvem-skal-have-en-fortegnelse)
2. [Pligtfelter pr. behandlingsaktivitet](#2-pligtfelter-pr-behandlingsaktivitet)
3. [Skabelon: én behandlingsaktivitet](#3-skabelon-en-behandlingsaktivitet)
4. [Eksempelsamling: typiske SMV-behandlingsaktiviteter](#4-eksempelsamling-typiske-smv-behandlingsaktiviteter)
5. [Kilder](#5-kilder)

## 1. Hvem skal have en fortegnelse

Artikel 30 pålægger dataansvarlige at føre en fortegnelse over behandlingsaktiviteter. Der findes en undtagelse for virksomheder med under 250 ansatte - men den gælder IKKE når behandlingen:

- ikke er lejlighedsvis (dvs. den er regelmæssig), eller
- omfatter følsomme oplysninger (artikel 9) eller oplysninger om strafbare forhold, eller
- kan indebære en risiko for de registreredes rettigheder.

Praktisk dom: løn-, personale- og kundedata behandles regelmæssigt i stort set enhver virksomhed med ansatte eller kunder. Derfor er udgangspunktet i denne skill altid: **antag pligt**. Skriv aldrig en aktivitet ud af fortegnelsen med henvisning til undtagelsen - dokumentér hellere for meget end for lidt. Fortegnelsen skal kunne udleveres til Datatilsynet på forlangende.

Fortegnelsen er desuden virksomhedens eget kort: uden den kan ingen besvare en indsigtsanmodning eller vurdere et databrud inden for fristerne.

## 2. Pligtfelter pr. behandlingsaktivitet

Efter artikel 30, stk. 1 skal fortegnelsen for hver behandlingsaktivitet indeholde:

| # | Felt | Hvad det betyder i praksis |
|---|---|---|
| 1 | Navn og kontaktoplysninger på dataansvarlig | Virksomheden selv + GDPR-kontaktperson (én gang øverst i fortegnelsen, ikke pr. aktivitet) |
| 2 | Formål med behandlingen | Konkret og afgrænset: "lønudbetaling", ikke "administration" |
| 3 | Kategorier af registrerede | Medarbejdere, ansøgere, kunder, leverandørkontakter, hjemmesidebesøgende... |
| 4 | Kategorier af personoplysninger | Navn, CPR, kontonummer, helbred, købshistorik... - skil almindelige fra følsomme |
| 5 | Kategorier af modtagere | Hvem får data: lønbureau, revisor, offentlige myndigheder, mailudbyder... |
| 6 | Tredjelandsoverførsler | Forlader data EU/EØS? I så fald: til hvilket land og med hvilket overførselsgrundlag (se references/databehandleraftaler.md) |
| 7 | Forventede slettefrister | Om muligt pr. oplysningskategori - altid med kilde og "verificér på datatilsynet.dk" (se references/slettefrister.md) |
| 8 | Tekniske og organisatoriske sikkerhedsforanstaltninger | Generel beskrivelse: adgangsstyring, kryptering, tofaktor, backup, aflåst arkiv - overordnet niveau, ikke en IT-revision |

Derudover noterer denne skill pr. aktivitet (god praksis, ikke pligt efter artikel 30, men nødvendigt for et brugbart dokument):

- **Behandlingsgrundlag** (artikel 6, og artikel 9-undtagelse hvis relevant) - se references/behandlingsgrundlag.md.
- **Systemer** hvor oplysningerne ligger - det gør indsigtsanmodninger og sletterutiner praktisk mulige.

## 3. Skabelon: én behandlingsaktivitet

Brug præcis denne struktur pr. aktivitet i `gdpr-fortegnelse.md`:

```markdown
### [Aktivitetens navn, fx "Lønadministration"]

| Felt | Indhold |
|---|---|
| Formål | |
| Registrerede | |
| Oplysninger (almindelige) | |
| Oplysninger (følsomme/CPR) | [eller "ingen"] |
| Behandlingsgrundlag | Artikel 6, stk. 1, litra [x] - [kort begrundelse]. [Evt. artikel 9-undtagelse] |
| Systemer | |
| Modtagere | |
| Tredjelandsoverførsel | [nej / land + overførselsgrundlag / [MANGLER]] |
| Slettefrist | [udgangspunkt + kilde] - verificér på datatilsynet.dk (verificeret: [dato eller MANGLER]) |
| Sikkerhedsforanstaltninger | |
| Sidst gennemgået | [dato] |
```

Udfyld aldrig et felt med gæt. Kan feltet ikke besvares, skriv [MANGLER - spørg ejeren]; er svaret en kvalificeret antagelse, skriv [ANTAGELSE].

## 4. Eksempelsamling: typiske SMV-behandlingsaktiviteter

Brug listen som interviewets tjekliste - gennemgå den med brugeren, og spring det over der beviseligt ikke findes i virksomheden. De fleste danske SMV'er har 6-10 af disse:

| Aktivitet | Typiske registrerede | Typiske oplysninger | Typiske modtagere | Bemærk |
|---|---|---|---|---|
| Lønadministration | Medarbejdere | Navn, CPR, konto, løn, sygefravær | Lønbureau, Skattestyrelsen, pensionsselskab | Indeholder næsten altid CPR + helbred |
| Personaleadministration | Medarbejdere | Kontrakt, MUS, advarsler, sygefravær | Ledelse, evt. HR-system | Følsomt: helbred, evt. fagforening |
| Rekruttering | Ansøgere | CV, ansøgning, referencer | Ledelse, evt. rekrutteringssystem | Kort slettefrist - se references/slettefrister.md |
| Kunde-/CRM-administration | Kundekontakter | Navn, mail, telefon, købshistorik, noter | CRM-leverandør, evt. mailudbyder | B2B-kontakter er også persondata |
| Bogføring og fakturering | Kunder, leverandørkontakter | Navn, adresse, betalingsoplysninger | Bogføringssystem, revisor | Bogføringslovens opbevaringskrav |
| Markedsføring/nyhedsbrev | Abonnenter | Navn, mail, åbnings-/klikdata | Nyhedsbrevsværktøj | Kræver typisk samtykke; dokumentér det |
| Hjemmeside og statistik | Besøgende | IP, cookies, adfærdsdata | Host, analytics-leverandør | Ofte tredjelandsoverførsel - tjek |
| Kontaktformular/support | Kunder, henvendere | Navn, mail, sagens indhold | Mailudbyder, evt. helpdesk-system | Folk skriver ofte mere end de bliver bedt om |
| Videoovervågning (hvis relevant) | Medarbejdere, besøgende | Optagelser | Evt. vagtselskab | Særlige regler + skiltning - henvis til Datatilsynets vejledning |
| Leverandøradministration | Leverandørkontakter | Navn, mail, telefon, aftaler | Bogføringssystem | Ofte glemt - også persondata |

Fang også det udenfor systemerne: personalemapper på fællesdrev, Excel-ark med kundelister, fysiske arkiver. Spørg direkte: "Hvor ligger der persondata UDEN FOR de systemer vi har talt om?"

## 5. Kilder

- Datatilsynets vejledning om fortegnelse (datatilsynet.dk) - slå den aktuelle udgave op ved hver brug; Datatilsynet udgiver også en fortegnelsesskabelon, som denne skabelon er foreneligt struktureret med.
- Databeskyttelsesforordningen artikel 30 (fortegnelse), artikel 9 (følsomme oplysninger).
- Citér altid hvilken vejledning og hvilken dato der er slået op, i fortegnelsens kildeafsnit.
