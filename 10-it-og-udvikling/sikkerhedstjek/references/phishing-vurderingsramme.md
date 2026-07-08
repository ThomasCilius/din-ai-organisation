# Phishing-vurderingsramme

Dybden bag de fem tjekpunkter i SKILL.md. Læs den, når du vurderer en konkret mail, og især når den rører ved penge, adgange eller ændrede betalingsoplysninger.

## Indhold
- [De fem tjekpunkter i dybden](#de-fem-tjekpunkter-i-dybden)
- [De to toptrusler mod danske SMV'er](#de-to-toptrusler-mod-danske-smver)
- [Verifikationsprotokol: ændrede betalingsoplysninger](#verifikationsprotokol-ændrede-betalingsoplysninger)
- [Sådan læser du afsender og URL uden at klikke](#sådan-læser-du-afsender-og-url-uden-at-klikke)
- [Konklusionsskala og anbefaling](#konklusionsskala-og-anbefaling)
- [To gennemgåede eksempler](#to-gennemgåede-eksempler)
- [Slå op](#slå-op)

## De fem tjekpunkter i dybden

**1. Afsender: domæne vs. vist navn.** Det viste navn ("Bogholderiet", "Jens fra DHL", direktørens navn) kan skrives frit og beviser intet. Kig på selve adressen efter @. Røde flag: fremmed domæne bag et kendt navn; lookalike-domæne der ligner med små ændringer (rn i stedet for m, tal i stedet for bogstav, ekstra bindestreg, .net i stedet for .dk); gratis mailkonto (gmail.com, outlook.com) hvor en virksomhed ellers bruger eget domæne; svar-til-adresse (Reply-To) der afviger fra afsenderen.

**2. Pres: hast, trusler, fortrolighed.** Social engineering virker ved at fjerne betænkningstid. Røde flag: "haster", "inden i dag", "sidste rykker", "din konto lukkes", "hold det fortroligt", "ring ikke til nogen først", "jeg er i møde, klar det bare". Ægte samarbejdspartnere presser sjældent på med hemmeligholdelse.

**3. Link vs. faktisk adresse.** Den blå linktekst kan sige ét og pege et andet sted hen. Røde flag: hover afslører et fremmed domæne; forkortet URL (bit.ly, tinyurl) i en forretningsmail; login-side hvor domænet ikke er tjenestens eget (microsoft-login.secure-xyz.ru); QR-kode i stedet for et synligt link. Se afsnittet om sikker læsning nedenfor.

**4. Ændrede betalingsoplysninger.** Det dyreste røde flag. Nyt kontonummer, "vi har skiftet bank", "brug denne konto fremover", anmodning om gavekort, kryptovaluta eller hastende bankoverførsel. Behandl ENHVER ændring af betalingsoplysninger som mistænkelig, indtil den er verificeret pr. telefon - se protokollen nedenfor.

**5. Uventet vedhæftning.** Røde flag: uventet faktura eller "leveringsdokument"; filtyper som .zip, .html, .exe, .iso; Office-fil der beder om at "aktivere makroer/redigering for at se indholdet"; dobbelt filendelse (faktura.pdf.exe). Åbn aldrig en vedhæftning for at afgøre, om den er farlig - selve åbningen kan være angrebet.

## De to toptrusler mod danske SMV'er

**Faktura-svindel (fakturamanipulation).** Angriberen udgiver sig for en kendt leverandør og sender en faktura med et nyt kontonummer - enten en falsk faktura eller en kopi af en ægte med kontonummeret byttet. Ofte efter at en mailkonto er blevet kompromitteret, så mailen ser ud til at komme fra den rigtige adresse i en rigtig tråd. Tells: "ændret kontonummer", let ændret beløb, presset på betaling, svar-adresse der afviger. Forsvar: verificér altid nyt kontonummer pr. telefon på et kendt nummer.

**CEO-fraud / direktørsvindel.** En mail der ser ud til at komme fra chefen/ejeren beder en medarbejder om en hastende, fortrolig overførsel eller indkøb af gavekort. Spiller på autoritet + hast + hemmeligholdelse. Tells: gratis mailkonto eller lookalike-domæne bag direktørens navn; "jeg er optaget, ring ikke"; usædvanlig anmodning uden om normale procedurer; sprog der er lidt ved siden af. Forsvar: bekræft altid ansigt til ansigt eller på et kendt nummer - uanset hvor travlt der lyder.

## Verifikationsprotokol: ændrede betalingsoplysninger

Ved enhver mail der ændrer betalingsoplysninger eller beder om en usædvanlig betaling:
1. Svar ikke på mailen og ring ikke til et nummer i den.
2. Find kontaktpersonens nummer et andet sted: en tidligere faktura, en tidligere mailtråd, virksomhedens officielle hjemmeside, dit eget kontaktkartotek.
3. Ring og få bekræftet ændringen mundtligt af en kendt person.
4. Først derefter må betalingen ændres - af brugeren, ikke af dig.

Dette ene skridt stopper både faktura-svindel og direktørsvindel. Spring det aldrig over, uanset hvor troværdig mailen ser ud.

## Sådan læser du afsender og URL uden at klikke

- **Læs den fulde afsenderadresse**, ikke kun det viste navn. På mobil skal man ofte trykke på navnet for at se adressen.
- **Læs et domæne bagfra:** det registrerbare domæne er de to led lige før første skråstreg. I `login.microsoft.secure-xyz.ru/konto` er domænet `secure-xyz.ru` - ikke microsoft. Alt før det er underdomæne og siger intet.
- **Hover uden at klikke:** hold musen over linket, og læs adressen i statuslinjen eller i det lille pop op. Bed brugeren gøre det og læse adressen op - du klikker aldrig selv (Jernloven).
- **Pas på homoglyffer:** rn ligner m, 0 ligner O, l ligner I, ekstra bindestreger og domæner der er "næsten rigtige".
- Kan adressen ikke ses uden at åbne noget, så behandl mailen som mistænkelig, indtil det modsatte er bevist.

## Konklusionsskala og anbefaling

- **Sandsynligvis phishing/svindel:** åbn ikke, klik ikke, svar ikke. Flyt til karantæne eller spam (slet ikke - bevis). Advar kolleger om mønstret. Er der udbetalt penge eller klikket, så skift til Spor C (hændelsesrespons).
- **Mistænkelig - skal verificeres:** bekræft afsenderen ad en anden kanal (telefon på kendt nummer) før nogen handling. Meld tvivl som mistanke, ikke som "sikkert falsk" eller "sikkert ægte".
- **Sandsynligvis ægte:** rører den ved penge eller adgange, så kør verifikationsprotokollen alligevel. En ægte-udseende mail er aldrig bevis for at en betalingsændring er ægte.

## To gennemgåede eksempler

**Faktura-svindel.** Afsender: `Leverandør A/S <faktura@leverandor-as.net>` (ægte domæne er `leverandoras.dk`). Emne: "Opdateret kontonummer - betal venligst i dag". Analyse: domænet er et lookalike (.net + bindestreg), presset er "i dag", og kernen er et nyt kontonummer (punkt 1, 2 og 4 er røde). Konklusion: sandsynligvis svindel. Anbefaling: betal ikke, ring til leverandøren på nummeret fra en tidligere faktura og bekræft; flyt mailen til karantæne.

**Direktørsvindel.** Afsender: `Direktør Mette Hansen <mette.hansen.dir@gmail.com>` (Mette bruger normalt @firma.dk). Emne: "Diskret opgave - er du der?". Tekst: beder om køb af gavekort for 8.000 kr., "jeg er i møde, ring ikke, send koderne på mail". Analyse: gratis mailkonto bag et kendt navn, autoritet + hast + hemmeligholdelse, usædvanlig anmodning (punkt 1 og 2 er røde). Konklusion: sandsynligvis direktørsvindel. Anbefaling: køb intet, bekræft med Mette ansigt til ansigt eller på hendes kendte nummer.

## Slå op

Trusselsbilledet skifter. Slå aktuelle svindelmønstre og råd op frem for at antage dem:
- **sikkerdigital.dk** - myndighedernes aktuelle råd mod phishing og svindel.
- **politi.dk** - aktuelle svindeltendenser og anmeldelse af bedrageri på nettet.
- **Bankens erhvervssider** - de fleste banker har en side om faktura- og direktørsvindel og et nummer til deres bedrageri-team.
