# Aftaleret og forbrugerregler for tilbud

Læs denne fil når tilbuddet er B2C, når du er i tvivl om dokumenttypen (tilbud, overslag eller prisindikation), eller når brugeren beder om formuleringer der binder mindre end et tilbud.

## Indhold

1. [Aftalelovens grundregler](#1-aftalelovens-grundregler)
2. [Tilbud, overslag eller prisindikation - vælg dokumenttype](#2-tilbud-overslag-eller-prisindikation)
3. [Acceptfrist: formuleringer der virker](#3-acceptfrist)
4. [Forbehold: standardkatalog](#4-forbehold-standardkatalog)
5. [B2B vs. B2C](#5-b2b-vs-b2c)
6. [Eskalationsguide](#6-eskalationsguide)
7. [Kilder](#7-kilder)

## 1. Aftalelovens grundregler

Dansk aftalerets udgangspunkt (aftaleloven, kapitel 1) er "løfteprincippet" - og det gør danske tilbud skarpere end fx engelsk ret:

- **Et tilbud er bindende for afsenderen når det er kommet frem til modtageren.** Ikke når det er accepteret - når det er kommet frem. Derfor er indholdet ikke "et oplæg til dialog" men et løfte.
- **Tilbagekaldelse** er kun mulig hvis tilbagekaldelsen når frem senest samtidig med at kunden får kendskab til tilbuddet. I praksis: er mailen sendt og læst, er løbet kørt.
- **Uden eksplicit acceptfrist** gælder en "rimelig tid" til accept - et elastisk begreb der afgøres af domstolene, ikke af afsenderen. Derfor skriver denne skill ALTID en dato.
- **For sen accept** gælder som et nyt tilbud fra kunden - som virksomheden så kan vælge at acceptere eller afvise.
- **Accept med ændringer** ("vi siger ja, men til 10 % mindre") gælder juridisk som afslag kombineret med et nyt tilbud fra kunden. Gør brugeren opmærksom på dette hvis kunden "accepterer med bemærkninger": virksomheden er ikke bundet, men skal reagere.

Konsekvens for skrivearbejdet: alt hvad der står i tilbuddet, skal virksomheden kunne holde. Er noget usikkert, hører det hjemme som forbehold eller forudsætning - ikke som løfte.

## 2. Tilbud, overslag eller prisindikation

Vælg dokumenttype bevidst, og skriv typen i både titel og indledning. De tre forveksles konstant i praksis - og forvekslingen koster penge:

| Dokumenttype | Binder prisen? | Brug når | Titel-eksempel |
|---|---|---|---|
| **Tilbud** | Ja - fast pris, fast omfang | Omfanget er kendt og prisen kan stå fast | "Tilbud: Ny hjemmeside til Jensen VVS" |
| **Overslag** | Delvist - et kvalificeret skøn der ikke må skride væsentligt | Omfanget er kendt i hovedtræk, men timetal/materialer kan variere | "Overslag: Renovering af badeværelse" |
| **Prisindikation** | Nej - uforpligtende budgettal | Tidlig dialog, budgetafklaring, omfang ukendt | "Prisindikation til budgetbrug - ikke et tilbud" |

Vigtige nuancer:

- **Overslag er ikke frit spil.** Efter retspraksis (særligt i håndværker- og forbrugerforhold) må den endelige pris ikke afvige væsentligt fra overslaget uden varsel undervejs. Skriv derfor altid i et overslag: "Overslaget er et kvalificeret skøn. Ser vi undervejs at prisen vil overstige overslaget, stopper vi arbejdet og kontakter jer, før vi fortsætter."
- **Prisindikation skal råbe højt om hvad den er.** Formulering: "Dette er en uforpligtende prisindikation til budgetbrug - ikke et tilbud. Endelig pris kræver [afklaring af X]."
- **Bland aldrig typerne.** "Tilbud" i titlen + "vejledende pris" i teksten giver kunden det bedste af begge verdener og virksomheden det værste.

## 3. Acceptfrist

Standardformulering: **"Tilbuddet er gyldigt til og med [dato]. Herefter bortfalder det uden yderligere varsel."**

Vejledning til fristens længde (spørg brugeren - dette er ikke jura men forretning):

- Standardydelser med stabil pris: 30 dage er almindeligt.
- Materialetunge opgaver eller svingende indkøbspriser: 14 dage eller kortere + prisforbehold (se katalog nedenfor).
- Tilbud med kapacitetsreservation (datoer, bemanding): kort frist + forbehold om mellemliggende salg.

Fristen er også et salgsværktøj: en konkret dato giver følgemailen og opfølgningen (via `pipeline-gennemgang`) noget at hænge næste skridt op på.

## 4. Forbehold: standardkatalog

Medtag kun de forbehold der er relevante for opgaven - en mur af forbehold signalerer utryghed og drukner de vigtige. Formuleringerne er startpunkter; tilpas til `voice-profil.md`:

| Forbehold | Formulering (startpunkt) | Relevant når |
|---|---|---|
| Prisstigninger på materialer | "Prisen forudsætter uændrede materialepriser. Ved dokumenterede stigninger på over [X] % reguleres materialedelen tilsvarende." | Materialetunge opgaver, lang leveringshorisont |
| Mellemsalg/kapacitet | "Tilbuddet er afgivet med forbehold for mellemliggende salg af de reserverede datoer." | Booking af kapacitet, sæsonarbejde |
| Kundens medvirken | "Tidsplanen forudsætter at [kundens leverance] foreligger senest [dato]. Forsinkelse forskyder tidsplanen tilsvarende." | Alt hvor kunden skal levere input |
| Adgangs-/besigtigelsesforbehold | "Prisen er afgivet uden besigtigelse og forudsætter [normale forhold]. Afvigelser afregnes som ekstraarbejde efter aftale." | Fysiske opgaver uden forudgående besigtigelse |
| Tredjepartsydelser | "Priser på [tredjepartsydelse] er viderefaktureret kostpris og kan ændres af leverandøren." | Licenser, hosting, underleverandører |
| Kreditgodkendelse | "Tilbuddet forudsætter sædvanlig kreditgodkendelse." | Nye kunder, store beløb |

Regel: hvert forbehold skal kunne begrundes med en konkret risiko i netop denne opgave. Kan det ikke, ryger det ud.

## 5. B2B vs. B2C

Spørgsmålet "er kunden erhvervsdrivende eller privatperson?" ændrer juraen - stil det altid i interviewet.

**B2B (erhverv til erhverv):**

- Priser angives typisk ekskl. moms - men skriv det ALTID eksplicit: "Alle priser er ekskl. moms."
- Aftalefrihed: betingelserne er som udgangspunkt dem parterne aftaler. Har virksomheden salgs- og leveringsbetingelser i brainen, henvises til dem og de vedlægges.

**B2C (erhverv til forbruger):**

- **Prisen SKAL oplyses inkl. moms og alle obligatoriske gebyrer** (markedsføringslovens prisoplysningsregler). Et B2C-tilbud med "ekskl. moms" som hovedpris er en lovovertrædelse, ikke en stilfejl.
- **Fortrydelsesret ved fjernsalg:** indgås aftalen uden fysisk fremmøde (mail, telefon, web), har forbrugeren som udgangspunkt 14 dages fortrydelsesret efter forbrugeraftaleloven, og virksomheden har oplysningspligt om den - manglende oplysning forlænger fristen markant. Der gælder undtagelser (bl.a. visse håndværksydelser efter udtrykkelig anmodning og arbejde der er påbegyndt med samtykke). Verificér de gældende regler på retsinformation.dk eller forbrug.dk før et B2C-fjernsalgstilbud afleveres - reglerne er detaljerede og skal ikke gengives efter hukommelsen.
- Forbrugerbeskyttelsen kan ikke fraviges ved aftale til skade for forbrugeren - "vi har aftalt andet" gælder ikke.

## 6. Eskalationsguide

Skriv udkastet færdigt hvor du kan, men markér **[ESKALÉR]** og henvis videre når:

- Tilbuddet overstiger virksomhedens beløbsgrænse (fra `virksomhedsprofil.md`) → ejer/salgschef skal godkende før afsendelse.
- Kunden kræver ansvarsbegrænsning, bod, konventionalbod eller andre kontraktvilkår → `kontrakt-tjek` og ved store beløb advokat.
- Offentligt udbud med formkrav (ESPD, tro- og loveerklæringer, tildelingskriterier) → følg udbudsmaterialets krav slavisk; formfejl = afvisning uanset indhold.
- B2C-fjernsalg hvor fortrydelsesretten er uafklaret → verificér reglerne først.
- Brugeren beder om formuleringer der skal "se bindende ud uden at være det" → nej; vælg ærlig dokumenttype i stedet.

## 7. Kilder

Slå altid op i den gældende lovtekst frem for at citere efter hukommelsen:

- Aftaleloven: retsinformation.dk (søg "aftaleloven")
- Forbrugeraftaleloven (fortrydelsesret, fjernsalg): retsinformation.dk
- Markedsføringsloven (prisoplysning): retsinformation.dk
- Praktisk forbrugervejledning: forbrug.dk
- Moms: skat.dk
