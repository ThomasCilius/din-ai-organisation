# Nøgletal og faldgruber pr. kanal

Læs denne fil FØR du fortolker tal og skriver indsigter. Den dækker hvad de enkelte tal faktisk måler, hvor de systematisk vildleder, og hvilke domme der gælder på tværs af kanaler.

## Indhold

1. [Tværgående regler](#tvaergaaende-regler)
2. [GA4 / hjemmesidetal](#ga4--hjemmesidetal)
3. [LinkedIn](#linkedin)
4. [Meta (Facebook/Instagram)](#meta-facebookinstagram)
5. [Nyhedsbrev](#nyhedsbrev)
6. [Betalt annoncering generelt](#betalt-annoncering-generelt)
7. [Hurtig opslagstabel: pynt vs. effekt](#hurtig-opslagstabel-pynt-vs-effekt)

## Tværgående regler

**Aktivitet → pynt → effekt.** Konklusioner og anbefalinger bygger KUN på effekt-tal (klik, henvendelser, tilmeldinger, salg). Pynt-tal (visninger, rækkevidde, følgere, likes) rapporteres som retning. Aktivitet (antal opslag, udsendelser) viser om planen blev fulgt.

**Små tal er støj.** Tommelfingerregler:

- Grundtal under ca. 100: vis absolutte tal, ikke kun procenter. "+25 %" på 12 → 15 leads lyder som en trend, men er 3 personer.
- Under ca. 20 hændelser (leads, svar, salg): skriv eksplicit at udsving kan være tilfældige, og konkludér ikke på én måneds bevægelse.
- Et mønster skal typisk holde 2-3 måneder i træk, før det bærer en beslutning om at skalere eller droppe noget.

**Sæson slår trend.** Sammenlign altid også med samme måned sidste år hvor tallet findes. Dansk SMV-sæson der typisk skævvrider: juli (industriferie), december (jul), januar (budgetår), påskeugen. Nævn sæson eksplicit når den er en sandsynlig forklaring.

**Organisk og betalt adskilles.** Blandet sammen kan ingen se om resultater er optjent eller købt - og om et fald skyldes at annoncerne blev slukket. Kan platformens tal ikke skilles ad, skrives det som forbehold i rapporten.

**Ingen benchmarks fra hukommelsen.** "Normal klikrate er X %" forældes og varierer voldsomt med branche og listestørrelse. Mål mod virksomhedens egne mål og egen historik. Insisterer brugeren på et benchmark: bed dem slå et aktuelt op hos deres platform eller brancheorganisation og citér kilden i rapporten.

**Tracking-ændringer forklarer ofte "udviklingen".** Spørg ved store udsving: er der ændret noget i opsætningen (nyt samtykkebanner, ny hjemmeside, nye UTM-koder, slettet pixel)? Et fald på 40 % i "trafik" er oftere en målefejl end en markedsbevægelse.

## GA4 / hjemmesidetal

Hvad tallene måler:

- **Brugere vs. sessioner:** én bruger kan have flere sessioner. Vælg ét af dem som gennemgående tal og bland dem ikke.
- **Engagerede sessioner** er GA4's forsøg på at frasortere "ramte siden og forsvandt" - mere ærligt end rå sessioner.
- **Konverteringer/nøglehændelser** (formular sendt, klik på telefonnummer) er effekt-tal - men kun hvis de faktisk er sat op. Spørg hvad der er defineret som hændelse.

Faldgruber:

- **Samtykkebanneret æder trafik:** besøgende der afviser cookies, tælles ikke eller kun delvist (afhængigt af consent mode-opsætning). GA4-tal er derfor et UNDERKANTSSKØN af den reelle trafik - og en ændring af banneret kan flytte tallene uden at virkeligheden ændrede sig.
- **Direkte trafik er en rodekasse:** "direct" indeholder alt hvor kilden gik tabt (apps, mails uden UTM, cookieafvisning) - byg aldrig en indsigt på at "direkte trafik steg".
- **Kildefordeling kræver UTM-disciplin:** klik fra nyhedsbrev og SoMe krediteres kun korrekt hvis linkene har UTM-koder. Mangler de: notér forbeholdet.
- Sammenlign hele måneder med hele måneder - en måned med 31 dage "vokser" 3 % mod en med 30.

## LinkedIn

Hvad tallene måler:

- **Visninger (impressions):** hvor mange gange opslaget blev vist i et feed - ikke hvor mange der læste det. Pynt.
- **Klik til sitet:** effekt - men LinkedIns eget kliktal indeholder også klik på "se mere" og på profilen. Klik målt i GA4 (med UTM) er det ærlige tal; brug LinkedIns tal som retning.
- **Følgere:** pynt. Langsom vækst er normalt og ikke en indsigt.

Faldgruber:

- **Personprofil-data er svært tilgængelige:** LinkedIn giver kun fuld statistik på virksomhedssider. Poster ejeren fra sin personprofil (hvilket ofte når længst ud), må tallene aflæses manuelt pr. opslag - notér som [UBEKRÆFTET] hvis de er aflæst fra hukommelsen.
- **Rækkevidde belønner algoritme-adfærd,** ikke forretningsværdi: et morsomt opslag kan få 10× visninger og 0 henvendelser. Derfor konkluderes aldrig på visninger.
- Kommentarer og delinger er det mest ærlige af engagement-tallene (koster afsenderen noget) - men stadig pynt, ikke effekt.

## Meta (Facebook/Instagram)

Hvad tallene måler:

- **Rækkevidde vs. visninger:** rækkevidde er unikke personer, visninger tæller gentagelser. Vælg én og vær konsekvent.
- **Resultater/konverteringer i Ads Manager** er effekt-tal - men se faldgruben om attribution.

Faldgruber:

- **Attributionsvinduet puster tallene op:** Meta krediterer sig selv for salg/leads i op til 7 dage efter klik og 1 dag efter visning (standard). En "konvertering" kan altså være en kunde der alligevel var kommet. Sammenhold altid med hvad brugeren selv kan se i den anden ende (formularer, ordrer).
- **iOS-sporingsbegrænsninger** gør Metas konverteringstal delvist modellerede (estimerede) - de er retning, ikke facit.
- **Boost-knappen** optimerer mod engagement (pynt), ikke mod leads - et "vellykket" boost kan være rent pynt-køb. Spørg hvad der blev boostet og med hvilket mål.
- Frekvens over ~3-4 i en lille målgruppe betyder at de samme personer ser annoncen igen og igen - budgettet arbejder ikke længere.

## Nyhedsbrev

Hvad tallene måler:

- **Klikrate** (klik pr. leveret mail): nyhedsbrevets ærligste standardtal. Effekt-nært.
- **Svar på brevet:** stærkeste signal overhovedet - notér antal og indhold.
- **Afmeldinger:** normalt lille og sundt; en pludselig stigning efter ét bestemt brev er en indsigt.
- **Listevækst:** nye tilmeldinger minus afmeldinger - kun organisk/reel permission tæller (jf. `nyhedsbrev`-skillens § 10-regel).

Faldgruber:

- **Åbningsrate er upålidelig efter Apple Mail Privacy Protection** (fra 2021): Apple Mail forhåndsåbner mails maskinelt, så åbninger overrapporteres kraftigt - og skævt (afhænger af hvor mange modtagere der bruger Apple Mail). Åbningsrate må ALDRIG være konklusionsgrundlag i rapporten. Skriv det eksplicit, hvis brugeren beder om at få den med.
- **Leveringsrate vs. indbakkeplacering:** "leveret" betyder ikke "landede i indbakken" - mails i spamfanen tæller som leveret. Faldende klik på tværs af alle breve kan være et leveringsproblem, ikke et indholdsproblem.
- Klikrate afhænger af antal links: ét brev med én CTA kan ikke sammenlignes 1:1 med et brev med 12 links.

## Betalt annoncering generelt

- Rapportér altid **pris pr. effekt** (pris pr. lead/henvendelse), ikke kun klikpris - billige klik der ikke konverterer, er dyre.
- **Sammenlign aldrig organisk og betalt effekt direkte** i samme sætning uden at nævne udgiften.
- Kampagneperioder skævvrider månedstal: kørte annoncerne kun halvdelen af måneden, skal det stå i forbeholdene.
- Platformenes "anbefalede" optimeringer og automatiske udvidelser tjener platformen først - en pludselig ændring i tallene kan skyldes en accepteret anbefaling. Spørg.

## Hurtig opslagstabel: pynt vs. effekt

| Tal | Niveau | Må bære en konklusion? |
|---|---|---|
| Henvendelser, leads, tilmeldinger, salg | Effekt | Ja |
| Klik til sitet (GA4/UTM-målt) | Effekt | Ja, som mellemled |
| Svar på nyhedsbrev | Effekt | Ja |
| Klikrate (nyhedsbrev) | Effekt-nært | Ja, med forbehold for links/små tal |
| Pris pr. lead (betalt) | Effekt | Ja |
| Visninger, rækkevidde | Pynt | Nej - kun retning |
| Følgere, likes | Pynt | Nej |
| Åbningsrate | Upålidelig | NEJ (Apple MPP) |
| Antal opslag/udsendelser | Aktivitet | Nej - viser kun om planen blev fulgt |
