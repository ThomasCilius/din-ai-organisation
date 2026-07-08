# Svindel-tjekliste - fakturasvindel, CEO-fraud og phishing i en dansk SMV-indbakke

Reference for `indbakke-triage`. Læs den når en mail rører betalinger, kontonumre eller adgangskoder, eller når et svindelflag fra SKILL.md er udløst. Formålet: at Advarsel-sektionen fanger de rigtige mails med en begrundelse ejeren kan handle på - og at en svindelmail ALDRIG ender som "til orientering".

## Indhold

1. [De fem svindeltyper mod danske SMV'er](#1-de-fem-svindeltyper-mod-danske-smver)
2. [Rød-flag-tjekliste](#2-roed-flag-tjekliste)
3. [Verifikationsprotokol - hvad ejeren skal gøre](#3-verifikationsprotokol---hvad-ejeren-skal-goere)
4. [Hvad triagen skriver i Advarsel-sektionen](#4-hvad-triagen-skriver-i-advarsel-sektionen)
5. [Hvis skaden allerede er sket](#5-hvis-skaden-allerede-er-sket)

## 1. De fem svindeltyper mod danske SMV'er

**1. Fakturasvindel (ændrede betalingsoplysninger).** En ægte eller efterlignet leverandør sender en faktura eller en "opdatering": nyt kontonummer, ny bank, gerne udenlandsk. Ofte er leverandørens rigtige mailkonto kompromitteret, så mailen kommer fra den ÆGTE adresse - indholdet, ikke afsenderen, er alarmen. Ethvert ændret kontonummer verificeres telefonisk, uanset hvor troværdig mailen ser ud.

**2. CEO-fraud / BEC (Business Email Compromise).** En mail der udgiver sig for at være fra ejeren/direktøren, beder en medarbejder om en hastebetaling eller køb af gavekort. Kendetegn: hast, diskretion ("ordn det nu, jeg sidder i møde - sig det ikke til nogen"), afvigende eller privat afsenderadresse, brud på normal godkendelsesproces. Rammer især virksomheder hvor én person både kan oprette og godkende betalinger.

**3. Phishing efter login og MitID.** Falske mails fra "banken", "Skat", "Digital Post", "Microsoft" eller fragtfirmaer med link til en login-side der høster adgangskoder eller MitID-godkendelser. Kendetegn: trussel eller gevinst ("din konto spærres", "du har penge til gode"), link hvis reelle adresse ikke matcher den viste tekst.

**4. Falske fornyelser og katalogfælder.** Faktura eller "fornyelsespåmindelse" for noget virksomheden aldrig har bestilt: domænenavne fra en fremmed "registrar", brancheregistre, varemærkeovervågning. Ligner rutinepost og betales derfor ofte i vanvare - klassisk fordi beløbet er lavt nok til at glide igennem.

**5. Malware-vedhæftninger.** Uventede vedhæftninger ("faktura", "ordrebekræftelse", "CV") med makro-dokumenter eller pakkede filer. Ét klik kan give ransomware. Uventet vedhæftning fra ukendt afsender = Advarsel, aldrig "åbn og se".

## 2. Rød-flag-tjekliste

Gennemgå listen for hver betalings- eller adgangsrelateret mail. Ét flag = Advarsel-sektionen; flere flag = skriv "sandsynlig svindel" i begrundelsen:

- [ ] Kontonummer eller betalingsoplysninger afviger fra tidligere fakturaer fra samme leverandør
- [ ] Hast + diskretion: "nu", "inden kl. 12", "sig det ikke til andre", "jeg kan ikke tages på telefon"
- [ ] Afsenderadresse afviger fra den kendte: privat adresse, bogstavombytning (novolog vs nov0log), ekstra ord eller bindestreg, andet topdomæne (.co, .net i stedet for .dk)
- [ ] Svar-til-adressen (Reply-To) er en anden end afsenderadressen
- [ ] Linkets reelle adresse matcher ikke den viste tekst (hold musen over - klik aldrig)
- [ ] Uventet vedhæftning, især .zip, .html eller dokumenter der beder om at "aktivere makroer"
- [ ] Faktura for en ydelse ingen i virksomheden kan genkende
- [ ] Brud på normal proces: beløb, godkender eller betalingsmåde afviger fra det sædvanlige
- [ ] Sprogtonen afviger fra afsenderens normale mails (pludselig engelsk, usædvanlig formel/uformel, maskinoversat dansk)
- [ ] Beskeden kræver MitID-godkendelse, kortoplysninger eller adgangskode via link

Vigtig undtagelse fra vanetænkning: "afsenderen er kendt og adressen er rigtig" frikender IKKE mailen - kompromitterede konti er netop fakturasvindlens motor. Indholdsflagene (kontonummer, hast, procesbrud) vejer tungere end afsenderflaget.

## 3. Verifikationsprotokol - hvad ejeren skal gøre

Anbefal altid præcis denne rækkefølge - og intet andet:

1. **Rør ikke mailen.** Ikke svare, ikke klikke, ikke åbne vedhæftninger, ikke videresende til kolleger "til orientering".
2. **Verificér via en ANDEN kanal:** ring til leverandøren/kollegaen på et nummer man kender i forvejen (fra tidligere fakturaer, CRM eller hjemmesiden slået op manuelt) - ALDRIG nummeret eller linket i mailen.
3. **Sammenlign betalingsoplysninger** med den seneste betalte faktura fra samme leverandør.
4. **Ved CEO-fraud-mistanke:** spørg "direktøren" mundtligt eller på den kendte interne kanal - aldrig ved at besvare mailen.
5. **Først når verifikationen er på plads,** behandles mailen som normal post (og re-triageres).

## 4. Hvad triagen skriver i Advarsel-sektionen

Format pr. mail: afsender + hvad der udløste flaget + anbefalet verifikation. Anbefalingen skal kunne følges uden at genåbne mailen:

- SKIDT: "Mistænkelig mail - pas på."
- GODT: "'Faktura 2214' fra kendt leverandørs adresse, men kontonummeret er ændret ift. fakturaen fra maj - ring til Jesper på det kendte nummer før betaling."

Regler:

- Svindelmistanke kategoriseres ALDRIG som "Til orientering" og blandes aldrig ind i de fire triagekategorier.
- Claude konkluderer ikke "dette ER svindel" - den flager, begrunder og anbefaler verifikation. Mennesket beslutter.
- Er der tvivl mellem Advarsel og Straks (fx en mulig falsk SKAT-mail): placér den i Advarsel med anbefalingen "verificér ægthed FØR indholdet behandles - log selv ind på skat.dk i stedet for at bruge mailens link".

## 5. Hvis skaden allerede er sket

Er en betaling gennemført eller et login afgivet, er anbefalingerne (i denne rækkefølge, samme dag):

1. Kontakt banken STRAKS via det kendte nummer - bed om at standse/tilbagekalde betalingen.
2. Skift kompromitterede adgangskoder og spær MitID/kort hvis de er afgivet.
3. Anmeld til politiet via deres anmeldelsesportal for it-kriminalitet.
4. Orientér revisor, og internt: advar kollegerne så samme mail ikke rammer flere.

Henvis til aktuel vejledning frem for huskede detaljer: "slå den gældende vejledning op på sikkerdigital.dk (Erhverv) og politi.dk". Procedurer og portaler ændrer sig - kilderne gør ikke.
