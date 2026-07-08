# Spam- og samtykkeregler for nyhedsbreve (markedsføringslovens § 10 + GDPR-dømmekraft)

Læs denne fil FØR du svarer, når brugerens liste eller samtykkegrundlag er uklart, eller når et rødt flag fra interviewet er udløst. Reglerne her er Jernlovens fundament.

## Indhold

1. [Hovedreglen: § 10 i klart sprog](#1-hovedreglen--10-i-klart-sprog)
2. [Hvad tæller som gyldigt samtykke](#2-hvad-taeller-som-gyldigt-samtykke)
3. [Undtagelsen: eksisterende kundeforhold](#3-undtagelsen-eksisterende-kundeforhold)
4. [Afmelding - kravene til hvert eneste brev](#4-afmelding---kravene-til-hvert-eneste-brev)
5. [Røde flag og svarscript](#5-roede-flag-og-svarscript)
6. [Den klassiske fælde: "vi spørger dem bare om lov på mail"](#6-den-klassiske-faelde-vi-spoerger-dem-bare-om-lov-paa-mail)
7. [GDPR-dømmekraft i indholdet](#7-gdpr-doemmekraft-i-indholdet)
8. [Konsekvenser ved brud](#8-konsekvenser-ved-brud)
9. [Eskalation](#9-eskalation)
10. [Kilder til opslag](#10-kilder-til-opslag)

## 1. Hovedreglen: § 10 i klart sprog

Markedsføringslovens § 10 (spamforbuddet): en virksomhed må IKKE sende elektronisk post med markedsføring - e-mail, sms, beskeder i apps - til nogen, der ikke på forhånd har bedt om det. Reglen gælder både forbrugere og erhvervskunder, og den gælder pr. modtager: at 95 % af listen har samtykket, redder ikke de sidste 5 %.

"Markedsføring" fortolkes bredt. Et nyhedsbrev ER markedsføring, også når det mest indeholder faglig viden - det fremmer afsætningen af virksomhedens produkter. Antag altid at nyhedsbrevet er omfattet.

## 2. Hvad tæller som gyldigt samtykke

Alle fire betingelser skal være opfyldt:

- [ ] **Aktivt afgivet.** Modtageren har selv gjort noget: udfyldt en formular, sat et kryds, sagt ja. Et forudafkrydset felt, en passiv accept af handelsbetingelser eller "de gav os deres visitkort" er IKKE samtykke til nyhedsbreve.
- [ ] **Specifikt.** Samtykket dækker det, der faktisk sendes. Samtykke til "ordrebekræftelser og servicebeskeder" dækker ikke et salgsnyhedsbrev.
- [ ] **Informeret.** Modtageren vidste hvad de sagde ja til: hvem der sender, og hvad slags indhold.
- [ ] **Dokumenterbart.** Virksomheden kan vise hvornår og hvordan samtykket blev givet (tilmeldingsformularens log, dobbelt opt-in-kvittering, dato i CRM). Kan det ikke dokumenteres, skal det behandles som om det ikke findes.

Dobbelt opt-in (bekræftelsesmail med link) er ikke et lovkrav i Danmark, men det er branchens standard, fordi det leverer dokumentationen af sig selv. Anbefal det altid ved nye tilmeldingsformularer.

## 3. Undtagelsen: eksisterende kundeforhold

§ 10, stk. 2 tillader markedsføring uden forudgående samtykke, når ALLE fire betingelser er opfyldt samtidig:

- [ ] E-mailadressen blev afgivet af kunden selv **i forbindelse med et køb** af et produkt eller en ydelse.
- [ ] Der markedsføres kun virksomhedens **egne, tilsvarende** produkter eller ydelser (samme kategori som det købte - fortolkes snævert).
- [ ] Kunden fik **klar og tydelig mulighed for at sige nej** til markedsføring, allerede da adressen blev indsamlet.
- [ ] Kunden får **let og gebyrfri mulighed for at frabede sig** i hver eneste efterfølgende henvendelse.

Fejler bare én betingelse, gælder hovedreglen: intet samtykke, ingen udsendelse. Typisk SMV-fejl: "de er jo kunder hos os" bruges som carte blanche, selvom nej-muligheden ved indsamlingen aldrig fandtes. Spørg altid ind til den tredje betingelse - det er den, der mangler i praksis.

## 4. Afmelding - kravene til hvert eneste brev

- Afmeldingslink (eller tilsvarende let metode) er obligatorisk i HVERT brev - også det første.
- Afmelding skal være gratis og let: 1-2 klik, ingen login-krav, ingen "skriv en mail til os og forklar hvorfor".
- Afmeldinger skal effektueres hurtigst muligt - modtager personen det næste brev også, er det et nyt brud.
- Footeren skal desuden identificere afsenderen tydeligt: virksomhedens navn og kontaktoplysninger.

Skillen skriver ikke selve footeren (den ligger i udsendelsesværktøjets skabelon), men udsendelsesnoten skal ALTID minde om kravene, og du skal flage det, hvis brugerens skabelon mangler dem.

## 5. Røde flag og svarscript

Udløsende fraser fra brugeren - reagér på dem alle, også når de nævnes i forbifarten:

| Frasen der udløser | Hvorfor det er et problem |
|---|---|
| "vi har købt en liste" | Købte adresser har aldrig samtykket til DENNE virksomhed. Ulovligt at sende til. |
| "skrabet fra nettet" / "fundet deres mails online" | Offentligt tilgængelig adresse er ikke samtykke. Ulovligt. |
| "eksporteret fra LinkedIn" | Forbindelser har accepteret at netværke, ikke at modtage nyhedsbreve. Ulovligt. |
| "visitkort fra messen" | Kun gyldigt hvis personen aktivt og dokumenterbart sagde ja til nyhedsbrevet - "tog imod kortet" er ikke nok. |
| "en gammel liste fra det gamle system" | Samtykke uden dokumentation skal behandles som fraværende. Kan ikke bruges. |
| "vores CRM-kontakter" / "alle vi har mailet med" | Korrespondance er ikke samtykke. Tjek undtagelsen i afsnit 3 - som regel fejler betingelse 3. |

Svarscript (følg rækkefølgen, én gang - gentag ikke advarslen i hvert efterfølgende svar):

1. **Flag klart og roligt:** "Stop lige her: den liste må I ikke sende nyhedsbreve til. Markedsføringslovens § 10 kræver aktivt samtykke fra hver modtager, og [købt liste/skrabede adresser/...] opfylder det ikke."
2. **Nævn konsekvensen kort:** bøder fra Forbrugerombudsmanden + ødelagt afsender-omdømme (spamfiltre).
3. **Tilbyd det lovlige alternativ:** byg permission-listen op i stedet - tilmeldingsformular på hjemmesiden, afkrydsning ved køb/tilbud, en lead-magnet (guide, tjekliste) som folk tilmelder sig for at få, opfordring i e-mail-signaturer og på LinkedIn.
4. **Fortsæt kun med den lovlige delmængde:** kan brugeren udpege den del af listen der HAR dokumenteret samtykke, skriver du gerne brevet til dén.

Insisterer brugeren efter ét klart flag ("send nu bare"): nægt at hjælpe med selve udsendelsen til den ulovlige liste, sig det én gang uden omsvøb, og tilbyd i stedet at skrive brevet til den lovlige delmængde eller bygge tilmeldingsflowet. Jernloven har ingen escape hatch.

## 6. Den klassiske fælde: "vi spørger dem bare om lov på mail"

En "re-permission-kampagne" - at maile den udokumenterede liste og spørge "vil du modtage vores nyhedsbrev?" - er SELV elektronisk markedsføring og kræver selv samtykke. Man kan ikke maile sig til lov til at maile. Flag det hver gang idéen dukker op, og henvis til de lovlige indsamlingskanaler i svarscriptets punkt 3 (hjemmeside, køb, telefon, fysisk møde med aktiv tilmelding).

## 7. GDPR-dømmekraft i indholdet

Samtykke til at MODTAGE nyhedsbrevet er én ting; hvad der står I brevet er en anden:

- **Navngivne kunder, medarbejdere eller cases:** kræver bekræftet, skriftligt samtykke fra den omtalte, før navnet bliver stående. Flag navnet i udkastet og spørg om samtykket findes. Er hovedhistorien en kundecase, så brug `kundecase`-skillen - den har godkendelsestrinnet indbygget.
- **Segmentering:** foreslå kun segmenter på kategoriniveau ("kunder med serviceaftale", "tilmeldt via webinar"). Aldrig formuleringer der afslører viden om enkeltpersoners adfærd eller forhold ("dig der kiggede på prislisten i torsdags" - teknisk muligt i mange værktøjer, men ubehageligt og datatungt).
- **Persondata i eksempler:** anonymisér ("en kunde i transportbranchen") medmindre samtykke foreligger.
- **Modtagerlisten er i sig selv persondata:** den skal fremgå af virksomhedens GDPR-fortegnelse - henvis til `gdpr-fortegnelse`-skillen (03-viden-og-data), hvis brugeren ikke har styr på det.

## 8. Konsekvenser ved brud

- Forbrugerombudsmanden håndhæver § 10 og politianmelder grove sager; bøder udmåles typisk pr. ulovlig henvendelse og vokser med antallet. Nævn ALDRIG konkrete beløb fra hukommelsen - bødepraksis ændrer sig; henvis til aktuel praksis på forbrugerombudsmanden.dk.
- Den kommercielle straf kommer først: udsendelse til kolde lister giver spamklager, spamklager ødelægger domænets afsender-omdømme, og derefter lander også de lovlige mails i spam hos alle. Det tager måneder at genoprette.

## 9. Eskalation

Stop og henvis til menneskelig afklaring (ejer, DPO eller advokat) når:

- samtykkegrundlaget for en eksisterende liste er uklart og brugeren vil sende alligevel,
- undtagelsen i afsnit 3 skal vurderes konkret ("er det her et 'tilsvarende produkt'?"),
- der er modtaget en klage eller henvendelse fra Forbrugerombudsmanden eller Datatilsynet,
- brevet indeholder påstande om sundhed, økonomi/investering eller konkurrencer med købsbetingelse - dér gælder særregler, som denne skill ikke dækker.

Du vurderer og flager - du afgør aldrig jura endeligt.

## 10. Kilder til opslag

- Markedsføringsloven (aktuel lovtekst): retsinformation.dk - søg "markedsføringsloven", se § 10.
- Forbrugerombudsmandens spamvejledning og bødepraksis: forbrugerombudsmanden.dk.
- Datatilsynet om samtykke og direkte markedsføring: datatilsynet.dk.

Citér den relevante kilde, hver gang du gengiver en regel over for brugeren.
