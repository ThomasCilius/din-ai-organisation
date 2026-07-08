# Interviewprotokol: opgave-dekomposition

Protokollen bruges i arbejdsgangens trin 2-3. Formålet er at trække HELE opgaven ud af nøglepersonens hoved - ikke kun den polerede version de fortæller til nye kolleger, men også undtagelserne, tommelfingerreglerne og den tavse viden de ikke selv ved de har.

## Indhold

1. [De seks dele af enhver opgave](#de-seks-dele-af-enhver-opgave)
2. [Spørgeteknik](#spoergeteknik)
3. [Tvingende spørgsmål med acceptkriterier](#tvingende-spoergsmaal-med-acceptkriterier)
4. [Kritiske hændelser-metoden](#kritiske-haendelser-metoden)
5. [Tavs viden-signaler](#tavs-viden-signaler)
6. [Stopkriterier og spørgebudget](#stopkriterier-og-spoergebudget)

## De seks dele af enhver opgave

Interviewet skal dække alle seks - i denne rækkefølge, fordi den følger opgavens egen kronologi:

| # | Del | Kernespørgsmål |
|---|---|---|
| 1 | **Trigger** | Hvad starter opgaven? En dato, en mail, en hændelse, en person der beder om det? |
| 2 | **Input** | Hvad skal ligge klar før man kan gå i gang? Filer, adgange, oplysninger, godkendelser? |
| 3 | **Trin** | Hvad gøres, i hvilken rækkefølge, i hvilke systemer? |
| 4 | **Beslutningspunkter** | Hvor i forløbet skal der vælges eller vurderes - og efter hvilke kriterier? |
| 5 | **Kvalitetskriterier** | Hvordan ser et godt resultat ud? Hvordan opdager man selv en fejl før andre gør? |
| 6 | **Undtagelser** | Hvad gør man når det går galt? (Kritiske hændelser-metoden nedenfor.) |

En SOP der kun dækker del 1-3 er en happy path-beskrivelse. Del 4-6 er dét der gør den uddelegérbar.

## Spørgeteknik

- **Ét spørgsmål pr. besked.** Stiller du tre spørgsmål på én gang, besvares det letteste - og de to vigtige forsvinder.
- **Multiple choice hvor muligt.** "Starter opgaven (a) på en fast dato, (b) når en mail kommer ind, eller (c) når nogen beder om det?" er hurtigere at besvare end et åbent spørgsmål og tvinger et præcist svar.
- **Spørg til sidste konkrete gang, ikke til vanen.** "Hvordan plejer du at gøre?" giver den redigerede idealversion. "Tag den seneste gang du gjorde det - hvad var det første du åbnede?" giver virkeligheden, inkl. de trin folk glemmer at nævne fordi de er automatiserede.
- **Gentag brugerens svar i dine egne ord ved komplekse trin.** "Så du åbner banken FØR du åbner e-conomic, fordi du skal bruge saldoen til afstemningen - korrekt?" Misforståelser fanges billigst her.
- **Spring spørgsmål over som tidligere svar allerede dækker.** Interviewet skal føles som en samtale med en skarp kollega, ikke som et spørgeskema.
- **Notér ordret ved fagudtryk og systemnavne.** Brugerens egne ord skal genbruges i SOP'en, så den næste person kan genkende dem på skærmen.

## Tvingende spørgsmål med acceptkriterier

For hver af de seks dele: bliv ved med at grave indtil acceptkriteriet er opfyldt. Uden acceptkriterier accepterer man det første, pæne svar - og det første svar er næsten altid for vagt til en SOP.

### 1. Trigger

- **Spørg:** "Hvad er det HELT konkrete signal der starter opgaven - hvad ser eller modtager du?"
- **Grav videre indtil du hører:** et observérbart signal (en dato, en mail fra en navngiven afsender, en status i et navngivet system) - noget en vikar også ville kunne se.
- **Røde flag:** "når det bliver relevant", "når jeg kan mærke det er tid", "løbende".

### 2. Input

- **Spørg:** "Forestil dig at du skal udføre opgaven i morgen tidlig - hvad skal ligge klar på dit bord/din skærm for at du overhovedet kan starte?"
- **Grav videre indtil du hører:** navngivne filer og deres placering, navngivne systemadgange, konkrete oplysninger og hvem der leverer dem.
- **Røde flag:** "det sædvanlige", "det ligger der bare", "de sender det".

### 3. Trin

- **Spørg:** "Hvad var det allerførste du gjorde sidste gang - klik for klik?" og derefter "Hvad så?" indtil opgaven er slut.
- **Grav videre indtil du hører:** ét verbum pr. trin, i et navngivet system, med et konkret resultat ("så ligger der en PDF i mappen X").
- **Røde flag:** trin der dækker over fem skjulte deltrin ("så klargør jeg materialet"), spring i kronologien, passiv form uden aktør ("så bliver det godkendt" - af HVEM?).

### 4. Beslutningspunkter

- **Spørg:** "Du sagde 'hvis det ser rigtigt ud' - hvad kigger du helt konkret på, og hvad er grænsen mellem rigtigt og forkert?"
- **Grav videre indtil du hører:** kriteriet (beløb, dato, status, match mellem to tal) OG begge udfald ("hvis ja: videre til trin 6, hvis nej: stop og kontakt Mette").
- **Røde flag:** "det afhænger", "så bruger jeg min erfaring", kun det ene udfald beskrevet.

### 5. Kvalitetskriterier

- **Spørg:** "Hvordan ville DU opdage det, hvis en vikar havde lavet opgaven forkert - hvad ville du tjekke først?"
- **Grav videre indtil du hører:** konkrete kontrolpunkter der kan omsættes til "sådan ser godt ud"-eksempler i SOP'en.
- **Røde flag:** "det kan man bare se", "så ville kunden nok klage" (dvs. fejlen opdages først eksternt - netop derfor skal kontrolpunktet ind i SOP'en).

### 6. Undtagelser

- Se kritiske hændelser-metoden nedenfor. **Acceptkriterium: mindst 2 konkrete undtagelser med håndtering.** Nul undtagelser betyder ikke at opgaven er fejlfri - det betyder at interviewet ikke er færdigt.

## Kritiske hændelser-metoden

Metoden (Flanagans critical incident technique) bygger på én indsigt: folk kan ikke opremse deres tavse viden, men de kan FORTÆLLE om konkrete episoder - og i episoderne ligger videnen. Brug disse spørgsmål, i denne rækkefølge:

1. **"Hvad gør du når det går galt?"** - åbningen. Stil det altid, ordret. Svaret afslører både de kendte fejltilstande og beredskabet.
2. **"Fortæl om sidste gang opgaven IKKE gik glat. Hvad skete der, hvad så du, og hvad gjorde du?"** - tvinger en konkret episode frem i stedet for en generel forsikring om at "det plejer at gå fint".
3. **"Hvad ville en helt ny medarbejder gøre forkert her, hvis de kun havde trinlisten?"** - nøglepersonen kender faldgruberne bedre end nogen; dette spørgsmål giver dem lov til at være eksperten.
4. **"Er der en gang det gik RIGTIG galt - noget der kostede penge, en kunde eller en weekend?"** - de dyre episoder producerer SOP'ens vigtigste advarsler.
5. **"Hvem ringer du til når du selv er i tvivl - og om hvad?"** - afslører eskaleringsvejen, som SKAL med i SOP'en (vikarens vigtigste trin er at vide hvornår man skal stoppe og spørge).

Hver episode omsættes til et punkt under "Hyppige fejl og faldgruber": symptom (hvordan det ser ud), årsag (hvis kendt), håndtering (hvad man gør), og hvornår man eskalerer i stedet for at fixe selv.

## Tavs viden-signaler

Disse formuleringer er ikke svar - de er gravesteder. Hører du dem, så bor dybere med det viste opfølgningsspørgsmål:

| Signal | Opfølgning |
|---|---|
| "Det plejer jeg bare at gøre" | "Gå med mig igennem sidste gang - skridt for skridt. Hvad klikkede du først?" |
| "Man kan se det med det samme" | "Hvad kigger dine øjne konkret på? Hvilket tal, felt eller farve?" |
| "Det tager jeg på fornemmelsen" | "Hvis du skulle lære en praktikant fornemmelsen på 5 minutter - hvilke 2-3 tegn ville du pege på?" |
| "Det afhænger af situationen" | "Giv mig de to mest almindelige situationer - hvad gør du forskelligt i dem?" |
| "Det ved [navn] alt om" | Notér det: enten skal [navn] med i interviewet, eller også er dét trin en selvstændig del-SOP med [navn] som ejer. |
| "Sådan har vi altid gjort" | "Ved du hvorfor? Hvis nej, markerer vi trinnet, så ejeren kan vurdere om det stadig er nødvendigt." |

## Stopkriterier og spørgebudget

**Interviewet er færdigt når alle fire er opfyldt:**

1. Du kan genfortælle opgaven trin for trin uden huller - fra trigger til afsluttet resultat.
2. Hvert beslutningspunkt har et kriterium og begge udfald.
3. Du har mindst 2 undtagelser med håndtering og en navngiven eskaleringsvej.
4. Du ved for hvert kritisk trin hvordan "godt" ser ud.

**Spørgebudget:** en typisk opgave kræver 10-20 spørgsmål. Runder du 25 spørgsmål og der stadig er huller, så stop interviewet: sammenfat hvad du HAR, list hullerne som `[ÅBENT SPØRGSMÅL]` og foreslå enten (a) at fortsætte en anden dag, eller (b) at splitte opgaven i del-SOP'er - et interview der trækker så langt ud er ofte tegn på at "opgaven" reelt er tre opgaver.

Genér aldrig brugeren med spørgsmål for protokollens skyld: er en del allerede dækket af et tidligere svar eller af virksomhedsprofilen, så spring den over og sig hvorfor.
