# Eksempel: en færdig byggebrief

Et komplet, udfyldt eksempel, så du kan se detaljeringsniveauet. Læg mærke til: nul pladsholdere, hvert færdig-kriterie kan bestås eller dumpes af én person, IKKE-med-i-v1-listen er ikke tom, og satser står som "slå op", ikke som tal. Eksemplet er en lille intern løsning, en håndværkervirksomhed bygger selv. Til sidst vises, hvordan de samme felter ser ud, hvis den i stedet bestilles hos et bureau.

---

# Byggebrief: Kundehenvendelses-log

Status: LÅST 2026-07-07
Spor: bygger selv (med Claude + Google Sheets)

## 1. Formål

Erstatte den fælles Excel-fil, hvor indkommende kundehenvendelser noteres, med en løsning, hvor tre medarbejdere kan registrere en henvendelse på under et minut fra mobilen, uden at overskrive hinandens rækker. Løsningen skal IKKE håndtere fakturering eller tilbudsskrivning - kun registrering og status på henvendelser.

## 2. Brugere og hyppighed

- To montører (registrerer henvendelser fra bilen, mobil, ikke teknisk erfarne) - flere gange dagligt.
- Én kontorassistent (følger op, laptop, øvet i Sheets) - dagligt.
- Ejeren ser kun ugentligt en oversigt over åbne henvendelser.

## 3. Nuværende workaround

Fælles Excel-fil "Henvendelser2026.xlsx" på OneDrive. Kolonner: dato, kundenavn, telefon, adresse, beskrivelse, status, ansvarlig. Problemer: to personer redigerer samtidig og overskriver hinanden; svært at bruge på mobil; ingen kan se, hvad der er fulgt op på.

## 4. Opgaveflows

1. Montør får et opkald, åbner løsningen på mobilen, opretter en henvendelse med kundenavn, telefon, adresse og kort beskrivelse. Status sættes automatisk til "Ny".
2. Kontorassistent ser nye henvendelser øverst, ringer kunden op, ændrer status til "Kontaktet" eller "Booket" og skriver en note.
3. Ejeren åbner en oversigt og ser alle henvendelser, der ikke er "Afsluttet".
4. Afvigelse: mangler telefonnummer, kan henvendelsen stadig oprettes, men markeres synligt som "Mangler tlf.".

## 5. Data ind og ud

- Ind: dato (auto, dd-mm-åååå), kundenavn (tekst med æøå), telefon (8 cifre), adresse, beskrivelse, status, ansvarlig.
- Ud: liste sorteret med nyeste øverst; filtrerbar på status; ugentlig oversigt over ikke-afsluttede.
- Danske tjek: æøå i navne og adresser skal vises korrekt; telefon accepterer mellemrum; tomt telefonfelt tillades med markering.

## 6. Færdig-kriterier (testbare, defineret FØR byg)

- [ ] En montør kan oprette en henvendelse på mobilen på under 60 sekunder uden hjælp.
- [ ] To personer kan oprette hver sin henvendelse samtidig, uden at nogen række overskrives.
- [ ] En henvendelse med kundenavn "Søren Ø. Åberg" vises med korrekte tegn i listen.
- [ ] En henvendelse uden telefonnummer kan gemmes og vises med markeringen "Mangler tlf.".
- [ ] Ejeren kan på under 10 sekunder se en liste med kun ikke-afsluttede henvendelser.

## 7. MoSCoW

- Must: oprette henvendelse, samtidig redigering uden overskrivning, statusfelt, mobilvisning, filtrér på status.
- Should: automatisk påmindelse ved henvendelser uden opfølgning i 2 dage.
- Could: eksport til PDF af ugeoversigt.
- Won't-nu: fakturering, tilbud, kundekartotek med historik.

## 8. IKKE med i v1

Fakturering, tilbudsskrivning, kundehistorik på tværs af henvendelser, SMS-kvittering til kunden, integration til regnskabssystem. Parkeret bevidst - vurderes efter v1 har kørt en måned.

## 9. GDPR og persondata

Behandler persondata: JA (kundenavn, telefon, adresse). Almindelige personoplysninger, ingen følsomme, intet CPR. Data ligger i virksomhedens egen Google Workspace, som der allerede er databehandleraftale på - bekræftes før driftsstart. Dataminimering: ingen felter ud over det, opfølgning kræver. Sletning: henvendelser ældre end 2 år ryddes manuelt hvert kvartal (proces skrives i v1.1).

## 10. [bestiller] Budget, deadline, drift og ejerskab

Ikke relevant - bygges selv. (Se nederst, hvis den i stedet bestilles.)

## 11. Antagelser og åbne spørgsmål

- ANTAGELSE: alle tre brugere har adgang til virksomhedens Google Workspace - bekræftes.
- Åbent: skal ejeren have en notifikation ved nye henvendelser, eller er ugentligt overblik nok? Afklares før v1.1.

## 12. Ændringslog

- 2026-07-07 - Brief oprettet og låst - godkendt af ejer (Mette).

## Kilder

- virksomhedsprofil.md (branche: håndværk, 4 ansatte, Google Workspace).
- Nuværende workaround: Henvendelser2026.xlsx.

---

## Hvis den i stedet bestilles hos et bureau

Samme brief, men afsnit 10 udfyldes - og de tal og vilkår gør briefen til noget, et bureau kan byde på uden at gætte:

## 10. [bestiller] Budget, deadline, drift og ejerskab

- Budgetramme: fast pris, loft 40.000 kr. ekskl. moms. Timepris uden loft accepteres ikke.
- Deadline: v1 i drift senest 1. oktober 2026 (før efterårssæsonens spidsbelastning).
- Drift og support: leverandøren står for drift første 12 måneder til aftalt fast månedspris (slå aktuelt niveau op, hardcod ikke); herefter genforhandles.
- Ejerskab: virksomheden ejer kildekode og data; data kan eksporteres i CSV til enhver tid; domæne og hosting-konto oprettes i virksomhedens eget navn; admin-adgang overdrages ved levering. Exit: ved ophør leveres kode, data og dokumentation inden 10 arbejdsdage mod dokumenteret timeforbrug.
- Databehandleraftale (GDPR art. 28) skal være underskrevet før driftsstart, inkl. oversigt over underdatabehandlere.

Bemærk: intet af dette er "afklares senere". Hvert punkt er et krav, leverandøren skal forholde sig til - og et punkt, `tilbudssammenligning` senere kan holde tilbuddene op imod.
