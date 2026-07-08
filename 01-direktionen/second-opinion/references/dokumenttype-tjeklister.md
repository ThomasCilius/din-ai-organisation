# Dokumenttype-tjeklister

Læs denne fil når dokumentet under review IKKE er et tilbud (tilbud har sin egen fil: `tilbuds-tjekliste.md`). Find dokumenttypen nedenfor og gennemgå dens punkter som passage 3 i arbejdsgangen. Rød tråd-testen og modtageranalysen fra SKILL.md gælder oven i - disse lister er tillæg, ikke erstatning.

## Vigtig mail (kunde, bank, myndighed, samarbejdspartner)

- **Ét formål.** Hvad skal modtageren gøre eller beslutte efter at have læst mailen? Kan du ikke pege på det i én sætning, er det et KRITISK fund.
- **Handlingen står tydeligt** - helst til sidst som konkret næste skridt med dato ("Kan du bekræfte senest fredag den [dato]?").
- **Hovedbudskabet står i de første to linjer.** Travle modtagere læser resten diagonalt.
- **Screenshot-testen:** kan et hvilket som helst afsnit tages ud af sammenhæng og videresendes uden at skade? Mails til utilfredse kunder, myndigheder og modparter læses af flere end modtageren.
- **Tonen matcher relationen og voice-profilen** - hverken stivere eller mere kammeratlig end virksomheden er.
- **Ingen vrede afsendt varm.** Er mailen skrevet i frustration, skal dommen som udgangspunkt være "send ikke" med forslag om en afkølet version - konflikten eskalerer skriftligt, og teksten kan ikke trækkes tilbage.
- **Fakta, beløb og datoer er korrekte** og stemmer med tidligere korrespondance.

## Plan og beslutningsoplæg (internt eller til partner)

- **Målet er målbart.** "Bedre onboarding" er en retning; "nye kunder i gang på 5 dage i stedet for 14 inden 1. oktober" er et mål.
- **Ansvar er navngivet.** Hver leverance har en person - "vi" er ingen.
- **Deadline og ressourcer står der** - timer, kroner og hvad der nedprioriteres for at gøre plads.
- **Fravalget er eksplicit.** Hvad gør planen IKKE? En plan uden fravalg er en ønskeliste.
- **De 2-3 største risici er nævnt** med et ord om håndtering - ellers ser læseren dem selv og mister tillid til resten.
- **Første skridt kan tages i morgen.** Kan det ikke, er planen ikke færdig.

## Byggebrief (til udvikler, bureau eller Claude Code)

- **Formål og målgruppe:** hvad skal det byggede opnå, for hvem - ikke kun hvad det skal indeholde.
- **Must-have er adskilt fra nice-to-have.** En brief hvor alt er lige vigtigt bliver dyr.
- **Acceptkriterier:** hvordan ser "færdigt og godkendt" ud? Konkrete, testbare kriterier - "brugeren kan X uden hjælp", ikke "det skal være intuitivt".
- **Afgrænsning:** hvad er bevidst udeladt af version 1?
- **Eksisterende materiale er nævnt** (designprofil, kodebase, eksempler) så modtageren ikke opfinder noget der allerede findes.
- **Budget- eller tidsramme** - ellers kommer estimatet som en overraskelse.

## Præsentation og pitch

- **Én pointe pr. slide,** og pointen står i overskriften - ikke "Baggrund" men "Vi taber 3 af 4 leads på svartid".
- **Rækkefølgen bærer en beslutning:** situation → problem → løsning → hvad vi beder om. Slutter præsentationen uden en klar "ask", er det et KRITISK fund.
- **Tal har kilde og år** på slides - publikum fotograferer og videresender.
- **Læsetesten:** kan en fraværende modtager forstå præsentationen uden taleren? Hvis den skal sendes efterfølgende, skal den kunne stå alene.

## Bestyrelses- og bankmateriale (review-vinkel)

Skal materialet PRODUCERES, så brug skillen `bestyrelsespakke` - denne liste er kun til review af et færdigt udkast:

- **Beslutningspunkter er skarpt adskilt fra orienteringspunkter,** og hvert beslutningspunkt har en indstilling: hvad bedes bestyrelsen/banken konkret godkende?
- **Hver væsentlig afvigelse mod budget er forklaret** - hvad, hvorfor, hvad gør vi.
- **Alle tal har kilde** (regnskabssystem, bank, pipeline) - tal uden kilde til bestyrelse eller bank eskaleres til `beslutningsgrundlag` frem for at blive stående.
- **Materialet tier ikke om presset likviditet.** Udeladte dårlige nyheder er det alvorligste fund i denne dokumenttype - bestyrelsen har tilsynspligt, og banken opdager det alligevel.
- **Udsendelsestidspunkt:** bestyrelsesmateriale bør være ude 5-7 dage før mødet - flag hvis udkastet først færdiggøres dagen før.
