# Hændelsesrespons light

Det haster-spor (Spor C). Læs den, når nogen HAR klikket, betalt en falsk faktura, eller der er mistanke om ransomware eller databrud. Prioritér handling over dokumentation - men slet aldrig beviser, og handl aldrig på brugerens vegne: du guider, brugeren udfører.

## Indhold
- [Umiddelbare skridt (første time)](#umiddelbare-skridt-første-time)
- [Ved mistanke om ransomware](#ved-mistanke-om-ransomware)
- [Databrud og GDPR art. 33](#databrud-og-gdpr-art-33)
- [Forsikring og politianmeldelse](#forsikring-og-politianmeldelse)
- [NIS2-opmærksomhed](#nis2-opmærksomhed)
- [Eskalationsdømmekraft](#eskalationsdømmekraft)
- [Slå op](#slå-op)

## Umiddelbare skridt (første time)

1. **Isolér.** Afbryd den ramte enhed fra netværket (træk netværkskablet, slå wi-fi fra) - men sluk den ikke nødvendigvis, hvis en specialist skal undersøge den. Isolering begrænser spredning.
2. **Skift adgangskoder fra en REN enhed.** Er der klikket og indtastet en adgangskode, så skift den straks - og skift den på alle konti hvor samme kode er genbrugt. Brug en anden, ubetroet-fri enhed, ikke den mistænkte.
3. **Aktivér/verificér MFA** på de berørte konti, så en stjålet adgangskode ikke er nok.
4. **Ring til it-leverandøren.** De fleste SMV'er skal have en specialist ind ved en reel hændelse - jo før, jo mindre skade.
5. **Bevar beviser.** Slet ikke mails, log ikke af på må og få, og "ryd ikke op". Mail, skærmbilleder og logfiler er beviser til forsikring og politi.
6. **Ved betalt falsk faktura:** kontakt banken STRAKS - en overførsel kan nogle gange stoppes eller tilbagekaldes, hvis I er hurtige. Bevar mailen som bevis.

## Ved mistanke om ransomware

Tegn: filer kan ikke åbnes, filnavne er ændret/krypteret, en løsesumsbesked vises. Så:
- Isolér de(n) ramte enhed(er) fra netværk og delte drev straks - ransomware spreder sig via netværket.
- Sluk ikke ukritisk; koordinér med it-leverandør/specialist.
- **Betal ikke løsesum uden professionel rådgivning** - betaling giver ingen garanti og kan have juridiske konsekvenser.
- Ring til it-leverandør/specialist og til forsikringens hotline.
- Tjek om den offline/offsite-backup er intakt (den der ikke kunne rammes fra netværket) - det er her en testet 3-2-1-backup redder virksomheden.

## Databrud og GDPR art. 33

Er persondata kompromitteret (læk, tyveri, kryptering, uautoriseret adgang), kan det være et brud på persondatasikkerheden. Så gælder GDPR art. 33: den dataansvarlige skal anmelde bruddet til Datatilsynet **uden unødig forsinkelse og om muligt inden 72 timer** efter at være blevet bekendt med det - medmindre bruddet sandsynligvis ikke indebærer en risiko for de registreredes rettigheder. Ved høj risiko skal de berørte personer også underrettes (art. 34).

Ikke enhver hændelse er et anmeldelsespligtigt brud - det kræver en konkret vurdering. Men uret starter, når I opdager bruddet, så vent ikke med at afklare det. Slå Datatilsynets aktuelle vejledning og anmeldelsesformular op på **datatilsynet.dk** - antag ikke frister eller tærskler fra hukommelsen. Ved tvivl om et brud er anmeldelsespligtigt: henvis til rådgiver/DPO frem for at afgøre det selv.

## Forsikring og politianmeldelse

- **Cyber-/erhvervsforsikring:** tjek om virksomheden har en cyberforsikring eller en erhvervsforsikring med cyberdækning. Mange har en hotline med akut hjælp og krav om anmeldelse inden for en frist - overhold den, ellers kan dækningen falde bort.
- **Politianmeldelse:** økonomisk svindel og cyberkriminalitet anmeldes til politiet. Bevar alle beviser (mails, kontonumre, kvitteringer, skærmbilleder). Slå aktuel fremgangsmåde for anmeldelse op på **politi.dk**.

## NIS2-opmærksomhed

NIS2 er EU's skærpede krav til cyber- og informationssikkerhed. Det rammer visse brancher direkte (bl.a. dele af energi, transport, sundhed, digital infrastruktur, visse leverandører) og mange SMV'er indirekte: som underleverandør kan man blive mødt med sikkerhedskrav i kontrakter fra kunder der selv er omfattet. Flag relevansen, hvis virksomheden er i eller leverer til en omfattet branche - men slå den aktuelle danske implementeringsstatus og hvem der konkret er omfattet op på **sikkerdigital.dk / Erhvervsstyrelsen**. Antag ikke tidslinje eller omfang fra hukommelsen; det er under indfasning.

## Eskalationsdømmekraft

| SMV'en kan selv | Kræver it-leverandør/specialist |
|---|---|
| Skifte adgangskoder, aktivere MFA | Undersøge og rense en kompromitteret maskine |
| Tjekke og prøvegendanne backup | Genopretning efter ransomware |
| Awareness og meldeveje | Netværks- og firewall-forhold, segmentering |
| Kontakte bank ved betalt falsk faktura | Forensik og bevissikring på enheder |
| Anmelde til forsikring og politi | Vurdering af NIS2-forpligtelser og teknisk efterlevelse |

Grundreglen: alt der handler om at ændre adgangskoder, tjekke backup og informere mennesker, kan SMV'en selv. Alt der handler om netværk, genopretning, forensik og forhandling med angribere, kræver specialist - ring hellere en gang for meget end en for lidt.

## Slå op

- **datatilsynet.dk** - aktuel vejledning om databrud, art. 33/34 og anmeldelsesformular.
- **sikkerdigital.dk** - hændelseshjælp, ransomware-råd og NIS2-status.
- **politi.dk** - anmeldelse af bedrageri og cyberkriminalitet.
- **Forsikringspolicen** - hotline og anmeldelsesfrist ved cyberhændelse.
