# Triage-drejebog: diagnose pr. fejltype

Slå op her, når fejltypen ikke er oplagt, eller når du skal isolere en fejl systematisk. Hver type har sin egen håndtering - de tre første kræver ikke leverandøren.

## Indhold

1. Isolationsteknik: de fire nøglespørgsmål
2. Type 1: Brugerfejl
3. Type 2: Dataproblem (de danske klassikere)
4. Type 3: Kode- og opsætningsfejl
5. Type 4: Leverandørens system nede
6. Grænsetilfælde: når typen er uklar

---

## 1. Isolationsteknik: de fire nøglespørgsmål

Stil dem i rækkefølge, før du gætter på noget. De indsnævrer fejlen fra "alt er i stykker" til et konkret sted:

1. **Hvornår virkede det sidst?** Sæt en tidsgrænse. Alt før den grænse er uskyldigt.
2. **Hvad er ændret siden?** Opdatering, nyt plugin, ny integration, ny data, ny bruger, ny browser, udløbet licens eller betaling, udløbet domæne/certifikat. Fejlen bor næsten altid i ændringen.
3. **Hvem og hvor rammer det?** Alle brugere eller én? Alle browsere eller én? Alle poster eller bestemte? Jo smallere ramt, jo tættere på årsagen.
4. **Kan det reproduceres bevidst?** En fejl du kan fremkalde på kommando, kan du diagnosticere. En der "sker nogle gange", skal først gøres reproducerbar - find mønsteret (bestemt input, bestemt tidspunkt, bestemt rækkefølge).

Regel: skift kun én ting ad gangen, når du afprøver. Ændrer du to ting og fejlen forsvinder, ved du ikke hvad der virkede - og fejlen kan komme snigende tilbage.

---

## 2. Type 1: Brugerfejl

**Kendetegn:** Virker for andre og i andre browsere. Kun én person eller én maskine er ramt. Ofte en forkert fremgangsmåde eller en lokal tilstand.

**Diagnose-trin:**
- Bed brugeren vise de præcise skridt - se efter et spring eller et oversprunget felt.
- Prøv samme handling i en anden browser eller på en anden enhed. Virker den dér, er fejlen lokal.
- Ryd cache og cookies, eller prøv et privat/inkognito-vindue - gammelt gemt indhold er en hyppig synder.
- Tjek det banale: er brugeren logget ind, har rettighederne, er offline, har et fyldt drev, kører en meget gammel browserversion.

**Håndtering:** Vis den rette fremgangsmåde, og notér i `fejllog.md` om vejledningen bør gøres tydeligere - gentagne "brugerfejl" er ofte et design- eller instruktionsproblem, ikke en dum bruger.

**Kræver leverandør?** Nej.

---

## 3. Type 2: Dataproblem (de danske klassikere)

**Kendetegn:** Fejlen opstår kun ved bestemte poster eller bestemte input, ikke ved alle. Virker for de fleste, fejler for nogle få.

**Diagnose-trin:** Isolér det konkrete input der udløser fejlen, og hold det op mod et input der virker. Forskellen er sporet. Danske data udløser en fast liste af klassikere - tjek dem først:

- **æ, ø, å** i navne, adresser, filnavne og URL'er - tegn der forsvinder, bliver til ? eller Ã¦, eller vælter et upload/eksport.
- **Decimalkomma vs. punktum** - "1.234,50" mod "1234.50". Beløb der bliver 1000 gange for store/små, eller afvises som ugyldige.
- **Datoformat** - dd-mm-åååå mod mm-dd-åååå mod åååå-mm-dd. En dato som 03-04 der tolkes som forkert måned.
- **CVR og CPR** - forventet cifferantal, bindestreg eller ej, foranstillede nuller der falder væk.
- **Telefonnumre** - mellemrum, +45-præfiks, landekode.
- **Tomme felter** - hvad sker der når et forventet felt er tomt? Mange fejl er en tom værdi et sted, koden regnede med var udfyldt.
- **Dubletter** - to poster med samme nøgle (mail, CVR, ordrenummer) der kolliderer.
- **For lange værdier** - et navn eller en tekst længere end feltet tillader.

**Håndtering:** Ret eller rens den konkrete data. Vurdér samtidig om systemet BURDE kunne håndtere inputtet - hvis ja, er den bagvedliggende fejl en kode-/opsætningsfejl (type 3), og datarettelsen er kun en midlertidig lap.

**Kræver leverandør?** Kun hvis systemet med rimelighed burde tåle inputtet (danske tegn og kommatal bør et dansk system altid tåle).

---

## 4. Type 3: Kode- og opsætningsfejl

**Kendetegn:** Rammer alle brugere. Sker samme sted hver gang. Reproducerbar med faste skridt.

**Diagnose-trin:**
- Reproducér med nummererede skridt, og notér den ordrette fejlbesked. Fejlbeskeden er ikke støj - den peger ofte direkte på stedet.
- Kør isolationsspørgsmålene (afsnit 1): hvad blev ændret omkring det tidspunkt, fejlen begyndte? En opdatering, et nyt plugin, en ændret indstilling, en udløbet nøgle.
- Én hypotese ad gangen. Afprøv den mindst indgribende først (en indstilling) før den mest indgribende (rul en opdatering tilbage).
- I et CMS: deaktivér senest tilføjede plugin/tema-ændring og se om fejlen forsvinder - så er synderen isoleret.

**Håndtering:**
- Byggede brugeren løsningen selv: ret årsagen, ikke symptomet. Verificér ved at genskabe reproduktionsskridtene.
- Byggede en leverandør løsningen: pil ikke selv. Skriv en fejlrapport (`references/skabeloner.md`) - selvgjorte rettelser i en andens system kan bryde support-/garantivilkår og gøre fejlen dyrere at finde.

**Kræver leverandør?** Ja, hvis en leverandør byggede eller vedligeholder løsningen.

---

## 5. Type 4: Leverandørens system nede

**Kendetegn:** Intet virker, ikke bare én funktion. Andre brugere er også ramt. Leverandørens statusside eller driftsmeddelelser bekræfter et nedbrud.

**Diagnose-trin:**
- Tjek leverandørens driftsstatus-/statusside før alt andet.
- Bekræft at det er bredt: er en kollega på en anden forbindelse også ramt? Er tredjepartstjenester (betaling, mail, login via en anden udbyder) nede?
- Skift ikke noget i din egen opsætning under et nedbrud - du risikerer at "rette" noget, der aldrig var i stykker, mens det egentlige problem løser sig selv.

**Håndtering:** Meld fejlen til leverandøren med tidspunkt og hvad der er ramt. Find en midlertidig vej udenom for de vigtigste opgaver. Brænd ikke din egen tid på at reparere et miljø, du ikke ejer - notér det, og arbejd udenom mens det står på.

**Kræver leverandør?** Ja - men det er deres nedbrud. Din opgave er at bekræfte det og melde det, ikke at fixe det.

---

## 6. Grænsetilfælde: når typen er uklar

- **"Virker for mig, ikke for kollegaen"** - start som brugerfejl (type 1), men hold øje med om det i virkeligheden er data (type 2) knyttet til den ene brugers konto/poster.
- **"Begyndte pludselig for alle uden at vi ændrede noget"** - noget ændrede sig alligevel: en automatisk opdatering, en udløbet licens/betaling, et udløbet certifikat/domæne, eller leverandøren ændrede noget i baggrunden (type 3 eller 4).
- **"Nogle gange virker det, andre gange ikke"** - endnu ikke reproducerbart. Find mønsteret (bestemt input, bestemt bruger, bestemt tidspunkt), før du kalder det en type. En ikke-reproducerbar fejl er ikke klar til rettelse.
- **Fejl i regnskabs-, løn- eller betalingssystem** - uanset type: gæt aldrig dig frem her. Bevis diagnosen og henvis til leverandør/revisor, fordi en forkert rettelse har direkte økonomiske konsekvenser.
