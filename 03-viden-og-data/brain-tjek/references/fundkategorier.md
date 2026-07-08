# Fundkategorier: definitioner, alvorlighed og foreslåede handlinger

Læses når du skal vurdere alvorlighed i grænsetilfælde, håndtere filer der rammer flere kategorier, eller formulere den foreslåede handling pr. fund.

## Indhold

1. [Alvorlighedsskalaen](#alvorlighedsskalaen)
2. [Kategori: Modstridende](#kategori-modstridende)
3. [Kategori: Forældet](#kategori-foraeldet)
4. [Kategori: Forældreløs](#kategori-foraeldreloes)
5. [Kategori: Dublet](#kategori-dublet)
6. [Kategori: Skabelon-uensartet](#kategori-skabelon-uensartet)
7. [Kategori: Manglende](#kategori-manglende)
8. [Grænsetilfælde og dømmekraft](#graensetilfaelde-og-doemmekraft)

## Alvorlighedsskalaen

Alvorlighed = konsekvens x brugsfrekvens. Spørg pr. fund: hvad går galt hvis nogen handler på denne fil i morgen, og hvor tit sker det?

| Niveau | Definition | Ejerens handling |
|---|---|---|
| KRITISK | Forkert faktum som aktivt bruges i beslutninger, tilbud, kundekontakt eller lovpligtig dokumentation - eller persondata/slettefrist-problem | Behandles med det samme, godkendes pr. fund |
| HØJ | Forkert eller modstridende faktum i en fil der bruges jævnligt, men hvor fejlen ikke rammer kunder eller myndigheder direkte | Behandles i denne kørsel |
| MELLEM | Viden der ikke kan verificeres (mangler kilde/dato) eller er rodet (dublet), men hvor indholdet formentlig stadig er rigtigt | Behandles i denne eller næste kørsel |
| LAV | Kosmetisk: formatafvigelse, uensartet skabelon, forældet note om nedlagt rutine | Kan samles til bunkebehandling kvartalsvist |

To tommelfingerregler:

- Er du i tvivl mellem to niveauer, så vælg det højeste og skriv hvorfor du var i tvivl - ejeren kan altid nedgradere, men et overset KRITISK-fund koster.
- Alt der involverer penge (priser, satser, betalingsbetingelser), lovkrav eller persondata starter mindst på HØJ.

## Kategori: Modstridende

**Definition:** To eller flere filer angiver forskellige værdier for samme faktum: pris, ansvarlig person, systemnavn, procestrin, kundesegment, frist.

**Signaler:** Samme nøgleord (produktnavn, personnavn, "pris", "frist") optræder i flere filer med forskellige tal eller navne omkring sig.

**Regler:**

- `virksomhedsprofil.md` vinder altid; den anden fil markeres til rettelse.
- Konflikt mellem to almindelige videnfiler: foreslå at nyeste kildedato vinder, men lad ejeren afgøre. Har ingen af filerne kildedato, er det TO fund: én konflikt + to forældreløse.
- Citér altid begge versioner ordret med filnavn og dato. Et konfliktfund uden begge citater kan ejeren ikke dømme.

**Foreslået handling-mønster:** "Ret [fil A] så [faktum] matcher [autoritativ fil] ([citat]). Opdatér revisionsdato i [fil A]."

## Kategori: Forældet

**Definition:** Mindst ét forældelseskriterium fra SKILL.md er opfyldt: over 6 måneder uden review, henvisning til fratrådte medarbejdere eller udgåede systemer/produkter, tal/satser ældre end indeværende regnskabsår, eller eksterne satser uden kilde.

**Regler:**

- Alder udløser review; indholdet afgør dommen. En gammel fil med tidløst indhold (fx "sådan taler vi med vrede kunder") er ikke forældet - foreslå i stedet blot at revisionsdatoen bekræftes.
- Skeln mellem "forældet indhold" (skal opdateres) og "udgået emne" (processen/produktet findes ikke længere - filen skal arkiveres med status: udgået).
- Eksterne satser og frister (rykkergebyr, momssats, opbevaringsfrister, kørselsgodtgørelse) må ALDRIG opdateres fra hukommelsen. Foreslå handling med opslagshenvisning: Datatilsynet (datatilsynet.dk) for persondatafrister, Skat (skat.dk) for satser, Erhvervsstyrelsen (erhvervsstyrelsen.dk) for bogførings- og regnskabskrav.

**Foreslået handling-mønstre:**

- Opdatérbar: "Opdatér [konkret felt] i [fil] - bekræft ny værdi hos [kilde/person]."
- Udgået: "Sæt status: udgået, og flyt [fil] til /arkiv som [filnavn]-arkiveret-[aar-mm-dd].md."

## Kategori: Forældreløs

**Definition:** Filen mangler kilde/ejer, revisionsdato eller status - se metadata-standard.md for felterne og grænsetilfældene.

**Regler:**

- En forældreløs fil kan have helt korrekt indhold - problemet er at ingen kan VURDERE det. Derfor MELLEM som udgangspunkt, ikke HØJ.
- Undtagelse: handler filen om penge, lovkrav eller persondata, løftes den til HØJ - uverificerbar viden på de områder er farlig.
- Foreslå aldrig selv at udfylde metadata. Kilden skal være en person der faktisk står inde for indholdet.

**Foreslået handling-mønster:** "Spørg [sandsynlig ejer, hvis en kan udledes af indholdet] om de står inde for indholdet, og tilføj metadata-blok - eller genindsaml via videnfil-interview."

## Kategori: Dublet

**Definition:** To eller flere filer dækker samme emne, helt eller delvist. Kun i fuld kørsel.

**Regler:**

- Overlap er ikke automatisk dublet: en salgsvinkel og en driftsvinkel på samme produkt kan være to legitime filer. Dublet = samme emne, samme vinkel, samme spørgsmål besvaret.
- Ved fletning: foreslå at beholde den fil med nyeste kildedato som stamfil, flette unikke pointer fra de andre ind, og arkivere resten. Fletningen er en rettelse og kræver godkendelse som alt andet.
- Siger de to dubletter noget forskelligt, er det IKKE en dublet men en konflikt - kategorisér som modstridende (højere alvorlighed).

**Foreslået handling-mønster:** "Flet [fil B] ind i [fil A] (nyeste kilde), arkivér [fil B]."

## Kategori: Skabelon-uensartet

**Definition:** Filen afviger fra den fælles standard: manglende eller anderledes metadata-blok, videnfil over 10 linjer, filnavn uden kebab-case, flere emner i én fil, forkert undermappe. Kun i fuld kørsel.

**Regler:**

- Dette er kvalitetsansvarliges "ensretning af skabeloner" - lavfrekvent, men det der gør at tingene kan findes igen.
- Flere emner i én fil: foreslå opdeling i én fil pr. emne (det er en strukturrettelse, ikke en indholdsrettelse - men stadig kun efter godkendelse).
- Bunkebehandling er tilladt her: ejeren kan godkende hele kategorien med ét ja.

**Foreslået handling-mønster:** "Ensret [fil] til standarden: [konkret afvigelse -> konkret rettelse]."

## Kategori: Manglende

**Definition:** Viden der burde findes, findes ikke. Opdages typisk indirekte: en fil henviser til en anden fil der ikke eksisterer, virksomhedsprofilen nævner en kerneproces uden tilhørende videnfil, eller en fratrådt medarbejders ansvarsområder har ingen dokumentation.

**Regler:**

- Markér kun huller du har belæg for (en død henvisning, en proces uden fil) - ikke alt hvad virksomheden "kunne" dokumentere. Ellers drukner rapporten.
- Alvorligheden følger emnet: manglende dokumentation af en kerneproces med én nøgleperson er KRITISK (bus-faktor); en manglende fil om en sjælden biopgave er LAV.
- brain-tjek opretter aldrig selv den manglende fil - henvis til `videnfil-interview`.

**Foreslået handling-mønster:** "Kør videnfil-interview med [person] om [emne] - hullet blev synligt fordi [belæg]."

## Grænsetilfælde og dømmekraft

- **Fil rammer flere kategorier:** rapportér den under den alvorligste kategori, og nævn de øvrige i samme fund - ét fund pr. fil, ikke tre.
- **Kladder og noter under arbejde:** filer tydeligt markeret som kladde/udkast markeres ikke som forældreløse - men kladder ældre end 3 måneder markeres som forældede ("færdiggør eller arkivér").
- **Personlige præferencer vs. virksomhedsviden:** "Hanne foretrækker Teams frem for mail" er legitim videnfil-viden; markér den ikke som uensartet fordi den er blødere end en procedure.
- **Filer på andre sprog eller i andre formater** (pdf, docx) i brain-mappen: markér som skabelon-uensartet med forslag om konvertering til .md - indholdet tæller stadig med i konsistenskontrollen hvis det kan læses.
- **Meget stor usikkerhed:** kan du ikke afgøre om et fund overhovedet ER et fund, så skriv det under fundet som "kræver afklaring: [det konkrete spørgsmål]" i stedet for at gætte eller tie.
