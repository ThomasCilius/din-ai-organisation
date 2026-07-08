# Danske kanttilfælde - fast tjekliste

Kanttilfælde (grænsetilfælde) er de input en løsning møder i virkeligheden, men sjældent i udviklerens test. Udenlandske skabeloner og "happy path"-test antager engelsk-amerikansk virkelighed: ASCII-bogstaver, punktum som decimaltegn, måned-først-datoer. Dansk data brydes på præcis de punkter - og det sker på dag ét, ikke i en fjern v2.

Brug listen som et fast tjek i enhver plan der behandler **tekst, tal, datoer, lister eller id-numre**. For hvert relevant punkt: notér i dommen om planen håndterer det, og gør et åbent punkt til et fund (mindst GO-med-ændringer).

## Indhold

1. Æøå i tekst og tegnsæt (UTF-8)
2. Æøå i filnavne og URL'er
3. Decimalkomma vs. punktum
4. Beløb, øre og afrunding
5. Datoformat dd-mm-åååå
6. CVR- og CPR-formater
7. Tom liste
8. Dubletter
9. Forkert og ondsindet input

## 1. Æøå i tekst og tegnsæt (UTF-8)

- **Test med:** navne som "Søren Ågaard", "Bjørn", "Nykøbing Falster", en adresse med "é" (fx "Allé").
- **Brækker typisk:** bogstaver bliver til "SÃ¸ren" eller "?" når systemet ikke bruger UTF-8 hele vejen (import, database, eksport, mail).
- **GO-kriterium:** æøå vises korrekt hele vejen fra input til output OG i eksport/CSV. Kræv UTF-8 eksplicit i planen - "det plejer at virke" er ikke et svar.

## 2. Æøå i filnavne og URL'er

- **Test med:** en fil døbt "Årsrapport-2025-Søren.pdf", et upload med mellemrum og æøå i navnet.
- **Brækker typisk:** download fejler, linket knækker, eller filen kan ikke findes igen, fordi æøå/mellemrum ikke er håndteret i stien.
- **GO-kriterium:** planen normaliserer filnavne (eller håndterer æøå/mellemrum bevidst), så upload -> gemning -> download virker med et dansk filnavn.

## 3. Decimalkomma vs. punktum

- **Test med:** "1.234,56" (dansk) og "1,234.56" (engelsk) som samme beløb.
- **Brækker typisk:** dansk "1.234,56" læses som 1,234 eller 1 - eller import stopper. Punktum er tusindtalsskiller på dansk, komma er decimaltegn; det er omvendt af engelsk.
- **GO-kriterium:** det er afklaret hvilket format input KOMMER i, og løsningen konverterer korrekt. Vis et konkret eksempel på ind- og udformat i planen.

## 4. Beløb, øre og afrunding

- **Test med:** en momsberegning der giver brøkører (fx 25 % af 99,95), og en sum af mange småbeløb.
- **Brækker typisk:** afrunding driver, så summen er 1 øre ved siden af - kritisk i regnskab, fakturaer og betalinger.
- **GO-kriterium:** afrundingsregel er defineret (hvor mange decimaler, hvornår der rundes), og beløb behandles som øre/decimaltal, ikke flydende tal der driver. Ved regnskab: flag at tal skal kunne afstemmes.

## 5. Datoformat dd-mm-åååå

- **Test med:** "03-04-2025".
- **Brækker typisk:** læses som 4. marts (mm-dd) i stedet for 3. april - fejlen er usynlig indtil dag > 12, så den slipper gennem test.
- **GO-kriterium:** datoformatet er entydigt fastlagt (helst ISO åååå-mm-dd internt, dansk dd-mm-åååå i visning), og tidszone/sommertid er tænkt igennem hvis klokkeslæt indgår.

## 6. CVR- og CPR-formater

- **Test med:** CVR "12345678" (8 cifre), CPR "010203-1234" (med og uden bindestreg).
- **Brækker typisk:** validering afviser gyldige numre, gemmer dem forskelligt (med/uden bindestreg), eller ganger ikke kontrolcifret igennem.
- **GO-kriterium:** format og validering er defineret. **CPR er personfølsomt** - er der overhovedet hjemmel til at behandle det, og hvor gemmes det? Et rødt flag hvis CPR håndteres uden begrundet behov (dataminimering).

## 7. Tom liste

- **Test med:** nul rækker, ingen kunder, en tom søgning.
- **Brækker typisk:** siden er blank uden forklaring, en beregning dividerer med nul, eller eksporten laver en tom/ugyldig fil.
- **GO-kriterium:** der er en defineret tom-tilstand ("Ingen resultater endnu") og beregninger tåler nul poster.

## 8. Dubletter

- **Test med:** samme kunde to gange, samme mail i to rækker, en import kørt to gange.
- **Brækker typisk:** dobbelt oprettelse, dobbelt mail, forkerte totaler.
- **GO-kriterium:** det er afklaret hvad der gør en post unik (mail? CVR?), og hvad der sker ved dublet (afvis, flet eller markér).

## 9. Forkert og ondsindet input

- **Test med:** bogstaver i et talfelt, en tom påkrævet værdi, et 10.000-tegns notat, en fil af forkert type.
- **Brækker typisk:** løsningen går ned eller gemmer skrald i stedet for at afvise pænt.
- **GO-kriterium:** input valideres ved grænsen med en forståelig fejlbesked - løsningen stoler aldrig blindt på data udefra.
