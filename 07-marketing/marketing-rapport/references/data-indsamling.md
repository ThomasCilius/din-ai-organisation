# Dataindsamling: hvor finder brugeren tallene?

Brug denne fil når brugeren ikke ved hvor tallene skal komme fra, eller spørger "hvad skal jeg finde?". Guid dem kanal for kanal - ét sted ad gangen - og tilbyd talarket nederst som udfyldningsskema.

Vigtigt: platformenes menuer og knapnavne ændrer sig løbende. Beskriv hvad brugeren skal lede efter (rapportnavn, taltype, periode) frem for præcise klikstier - og bed dem sige til, hvis noget ser anderledes ud.

## Generelle principper

- **Perioden er hele rapportmåneden** (den 1. til den sidste). Bed brugeren indstille datovælgeren eksplicit - platformenes standard er ofte "sidste 28/30 dage", som IKKE er det samme.
- **Skærmbilleder er fine** - bare perioden er synlig i billedet. Uden synlig periode: spørg.
- **Eksportfiler (CSV/Excel) er bedst** - de kan regnes på og gemmes som dokumentation.
- Bed også om **forrige måneds tal og samme måned sidste år**, hvis platformen kan vise dem - ellers markeres de [MANGLER] i rapporten (og findes måske i forrige måneds rapport).
- Gem eksporterne sammen med rapporten, så næste måneds rapport har et arkiv at stå på.

## GA4 (hjemmesiden)

Bed brugeren finde, for rapportmåneden:

- Antal **brugere** (eller sessioner - vælg ét og hold fast i det fremover).
- **Nøglehændelser/konverteringer**: formular sendt, klik på telefon/mail - hvis de er sat op. Er de ikke: notér det; opsætning er en anbefaling til rapporten.
- **Trafik pr. kilde/medie** (organisk søgning, social, mail, direkte) - findes typisk under anskaffelses-/trafikrapporter.

Findes i GA4 under "Rapporter". Tal kan eksporteres eller deles som skærmbillede. Har virksomheden ikke GA4 (eller et alternativ som Matomo/Plausible), noteres hjemmesidetal som [MANGLER].

## LinkedIn

- **Virksomhedsside:** sidens administratorer kan se "Analyse/Statistik" med visninger, klik og følgere pr. periode - kan eksporteres som fil.
- **Personprofil:** der findes ingen samlet eksport. Bed brugeren åbne månedens egne opslag og aflæse pr. opslag: visninger, reaktioner, kommentarer - og notere hvilke opslag der var kundehistorier/faglige/andet, så indsigterne kan kobles til indholdstype.
- Klik til hjemmesiden fra LinkedIn måles mest ærligt i GA4 (kilde: social/linkedin) - især hvis linkene har UTM-koder.

## Meta (Facebook/Instagram)

- **Organisk:** Meta Business Suite har et indblik/insights-område med rækkevidde, besøg og klik pr. periode.
- **Betalt:** Ads Manager viser pr. kampagne: forbrug (kr.), visninger, klik og resultater/konverteringer. Bed altid om FORBRUGET sammen med resultaterne - pris pr. henvendelse er rapportens ærligste betalte tal.
- Bed brugeren notere om der blev boostet opslag, og hvad målet var (jf. faldgruberne i `noegletal-faldgruber.md`).

## Nyhedsbrevssystemet (Mailchimp, MailerLite, ActiveCampaign m.fl.)

Pr. udsendelse i måneden:

- Antal **modtagere** (leverede mails).
- **Klik og klikrate** - rapportens bærende nyhedsbrevstal.
- **Afmeldinger** og **nye tilmeldinger** (listevækst).
- Antal **svar** på brevet, hvis brugeren har dem (aflæses i indbakken, ikke i systemet).
- Åbningsrate: må gerne indsamles, men bruges ikke som konklusionsgrundlag (Apple MPP - se `noegletal-faldgruber.md`).

## Google Business-profil

Relevant for lokale virksomheder: profilens statistik viser visninger i søgning/Maps, opkald og ruteanmodninger pr. periode. Opkald herfra er effekt-tal.

## Effekt-tal uden for platformene

De vigtigste tal ligger ofte helt uden for marketingværktøjerne - spørg altid:

- Henvendelser pr. mail/telefon som ikke spores digitalt (bed om et optælleligt skøn fra indbakke/telefonliste - markeres [UBEKRÆFTET] hvis det er fra hukommelsen).
- Nye kunder/ordrer i måneden og - hvis muligt - hvor de kom fra ("hvor hørte du om os?").
- Tilbud sendt/vundet, hvis salg registrerer det (evt. via `pipeline-gennemgang` i salgsafdelingen).

## Talarket (udfyldningsskema)

Tilbyd brugeren dette skema at udfylde eller diktere fra - det er hurtigere end løse spørgsmål og gør hullerne synlige med det samme:

```
MÅNED: ____  (hele måneden, 1.-31.)

HJEMMESIDE (GA4)
- Brugere: ____   (forrige måned: ____ / samme måned sidste år: ____)
- Nøglehændelser (formular/telefon): ____
- Største trafikkilder: ____

LINKEDIN
- Antal opslag: ____  (heraf kundehistorier: ____)
- Visninger i alt: ____
- Klik til sitet: ____ (helst GA4-tal)

META (hvis aktiv)
- Organisk rækkevidde: ____
- Betalt: forbrug ____ kr. / resultater: ____

NYHEDSBREV
- Udsendelser: ____  Modtagere: ____
- Klik / klikrate: ____
- Til-/afmeldinger: ____  Svar: ____

EFFEKT UDEN FOR PLATFORME
- Henvendelser i alt (formular + mail + telefon): ____
- Nye kunder/ordrer: ____  Kilde hvis kendt: ____

MÅL (fra årshjul/marketingplan)
- Månedens mål var: ____
```

Alt der ikke kan udfyldes, bliver stående som ____ og føres ind i rapporten som [MANGLER] - aldrig som et skøn.
