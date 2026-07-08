# GDPR og ejerskab i byggebriefen

To ting, der er billige at skrive ind i briefen nu og dyre at rette senere: hvordan løsningen behandler persondata, og hvem der ejer den, når den er bygget. Denne fil giver dig tjekpunkterne til begge. Du er ikke advokat - du flager, hvad der skal afklares, og henviser tvivl videre.

## Del A: Persondata (GDPR)

### Behandler løsningen persondata?

Persondata er enhver oplysning om en identificerbar person: navn, mail, telefon, adresse, CPR, kundehistorik, medarbejderdata, IP-adresser, fotos. "Kun almindelige oplysninger" er stadig persondata. Svaret ja/nej skal stå i briefens GDPR-felt.

Følsomme oplysninger (helbred, fagforening, race, religion, seksualitet, strafbare forhold) og CPR-numre kræver ekstra hjemmel og forsigtighed - flag dem særskilt og henvis brugeren til at få dem vurderet af en, der har ansvaret for databeskyttelse.

### Databehandleraftale (GDPR art. 28)

Bruger løsningen en ekstern leverandør, der behandler persondata på virksomhedens vegne - et bureau, en hosting-udbyder, et SaaS-værktøj, en automatiseringsplatform - så kræver GDPR art. 28 en skriftlig databehandleraftale mellem jer (dataansvarlig) og leverandøren (databehandler). Skriv i briefen som et krav: "Databehandleraftale skal være på plads før driftsstart."

Underdatabehandlere (leverandørens egne underleverandører, fx en cloud-udbyder) skal fremgå af aftalen. Flag det som et spørgsmål til leverandøren, ikke som noget du selv afgør.

### Dataminimering

Skriv kun de datafelter ind i kravspecen, som formålet faktisk kræver. Hvert ekstra felt, løsningen indsamler "for en sikkerheds skyld", er en fremtidig risiko og en oprydningsopgave. Stil kontrolspørgsmålet ved hvert felt: "Bruger løsningen det her til noget konkret i et flow?" Hvis nej, hører det ikke med i v1.

Skriv også en kort linje om, hvad der sker med data over tid: hvor længe gemmes de, og hvad sletter løsningen automatisk. Det behøver ikke være udtømmende i v1, men fraværet skal være et bevidst valg, ikke en forglemmelse.

### Regler slås op - hardcodes aldrig

Konkrete frister, Datatilsynets aktuelle praksis og status på regler som NIS2 ændrer sig. Skriv i briefen "slå aktuel praksis op på datatilsynet.dk / sikkerdigital.dk" frem for at skrive et tal ind, der forældes. Ét fast punkt er dog værd at kende som eskaleringstrigger: ved brud på persondatasikkerheden gælder en kort anmeldelsesfrist til Datatilsynet - flag det som noget, der skal håndteres straks, og henvis til den ansvarlige.

### GDPR-tjekliste til briefen

- [ ] Ja/nej på om løsningen behandler persondata står i briefen.
- [ ] Følsomme oplysninger og CPR er flaget særskilt, hvis de optræder.
- [ ] Databehandleraftale (art. 28) er krævet, hvis en ekstern leverandør rører persondata.
- [ ] Kun nødvendige datafelter er med (dataminimering); overflødige felter er flyttet til IKKE-med-i-v1.
- [ ] En linje om opbevaring og sletning er med, eller fraværet er et bevidst valg.
- [ ] Frister og regelstatus er markeret "slå op på [kilde]", ikke hardcodet.

## Del B: Ejerskab (bestiller-mode)

Bestiller I hos et bureau eller en freelancer, er ejerskab det, der afgør, om I står frit bagefter eller er låst inde. Skriv hvert punkt eksplicit ind i briefen som et krav - så bureauet byder på det, og I ikke opdager hullet, når samarbejdet slutter.

### Hvad skal have en navngiven ejer

- **Kildekoden:** Hvem ejer koden, når den er bygget - jer eller leverandøren? Får I den udleveret? Uden dette kan I ikke skifte leverandør.
- **Dataene:** Ejer og kan I eksportere alle data i et brugbart format? Kan I tage dem med, hvis I flytter?
- **Domænet:** Står domænet registreret i virksomhedens eget navn, eller i leverandørens? Domæner registreret hos bureauet er en klassisk fælde.
- **Hosting- og platformskonti:** Er servere, hosting og tredjepartskonti (analytics, betalingsløsning, mail) oprettet i jeres navn med jeres adgang - eller i leverandørens?
- **Adgange og logins:** Har I admin-adgang fra dag ét, eller kun leverandøren?

### Exit og overdragelse

Skriv ind, hvad der sker, hvis samarbejdet stopper: hvordan overdrages kode, data, adgange og dokumentation, og hvad koster en overdragelse? En løsning uden en aftalt exit er en løsning, I ikke reelt ejer.

### Ejerskabstjekliste til briefen

- [ ] Kildekode: ejer og udlevering er skriftligt aftalt.
- [ ] Data: I ejer dem og kan eksportere i brugbart format.
- [ ] Domæne: registreret i virksomhedens eget navn.
- [ ] Hosting/platformskonti: oprettet i jeres navn med jeres adgang.
- [ ] Admin-adgange: I har dem fra start.
- [ ] Exit/overdragelse: proces og pris er beskrevet.

Disse punkter går igen i `plan-tjek` (review af leverandørforslag) og `tilbudssammenligning` (sammenligning af tilbud) - jo skarpere de står i briefen, jo lettere er de at holde et tilbud op imod.
