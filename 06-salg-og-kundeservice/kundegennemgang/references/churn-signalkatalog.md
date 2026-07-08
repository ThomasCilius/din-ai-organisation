# Churn-signalkatalog

Gennemgå kataloget signal for signal mod kundens data i brainen. Notér KUN signaler du kan dokumentere med kilde - et signal uden kilde er en fornemmelse, og fornemmelser hører til i "Antagelser og aabne spoergsmaal", ikke i signaloversigten.

## Indhold

1. [Sådan bruges kataloget](#saadan-bruges-kataloget)
2. [Signalkataloget](#signalkataloget)
3. [Reaktionstrappen](#reaktionstrappen)
4. [Hvornår eskaleres til ejeren](#hvornaar-eskaleres-til-ejeren)

## Sådan bruges kataloget

1. Gennemgå hvert signal i tabellen mod fakturahistorik, mailtråde, referater og CRM-noter.
2. Fundne signaler noteres i artefaktet med: signal, kilde (med dato), prioritet, anbefalet modtræk.
3. Tæl høj-prioritetssignaler og slå op i reaktionstrappen - den afgør hvor alvorligt situationen skal præsenteres for brugeren.
4. Et enkelt signal er sjældent alarm; mønstre er. Tre svage signaler samme kvartal vejer tungere end ét stærkt signal for to år siden.

## Signalkataloget

| Signal | Sådan ser det ud i data | Typisk kilde | Prioritet | Anbefalet modtræk |
|---|---|---|---|---|
| Faldende ordrefrekvens | Længere mellemrum mellem ordrer end kundens egen historik | Fakturahistorik | Høj | Ring - spørg åbent til deres situation før du sælger noget |
| Faldende ordrestørrelse | Samme frekvens, mindre beløb pr. ordre | Fakturahistorik | Høj | Afdæk om behovet er ændret eller en konkurrent har taget en del |
| Længere svartider | Mails besvares efter dage/uger hvor det før var timer; møder udskydes | Mailtråde, kalender | Mellem | Skift kanal: telefon frem for mail; foreslå kort fysisk møde |
| Nyt kontaktled hos kunden | Vores kontakt er fratrådt, forflyttet eller cc'er pludselig en ny beslutningstager | Mails, LinkedIn | Høj | Bed om introduktionsmøde med den nye - hurtigt; nye chefer genvurderer leverandører i de første 90 dage |
| Udbudsrunde / benchmarking | Kunden beder om priser "til sammenligning", nævner udbud eller beder om dokumentation af leverancen | Mails, referater | Høj | Behandl det som en genforhandling: læs `genforhandlingsforberedelse.md` og byg værdiargumenterne FØR kunden spørger |
| Ubetalte fakturaer | Forfaldne poster ud over kundens normale betalingsmønster | Fakturahistorik, bogholderi | Mellem | Notér som restpunkt og signal her; selve rykkeren håndteres af `rykker-runde` i Økonomi - bland aldrig rykker og statusmøde i samme mail |
| Stigende klager/reklamationer | Flere henvendelser om fejl, forsinkelser eller misforståelser end normalt | Kundeservice-sager, mails | Mellem | Løs restpunkterne synligt før mødet; åbn mødet med status på dem |
| Reduceret brug af det leverede | Licenser/timer/aftalte ydelser bruges ikke (hvor målbart) | Leverancedata, referater | Mellem | Afdæk hvorfor: manglende onboarding er en mersalgsmulighed, manglende behov er et churn-varsel |
| Ejerskifte/opkøb/omstrukturering hos kunden | Nyheder, CVR-ændringer, ny koncernstruktur | Nyheder, CVR | Mellem | Research den nye ejers leverandørpolitik; bed kontakten om at pejle internt |
| Tavshed | Ingen kontakt i længere tid end den normale rytme for denne kunde | Alle kilder | Lav-Mellem | Book statusmødet - tavshed er i sig selv grunden |

Prioriteten i tabellen er udgangspunktet - flyt den op hvis kunden er en A-kunde, eller hvis signalet er nyt og brat (et pludseligt fald på 50 % vejer tungere end et langsomt skred).

## Reaktionstrappen

| Fund | Situationens navn | Anbefaling til brugeren |
|---|---|---|
| 0 høj-signaler, 0-1 mellem | Stabil | Almindeligt statusmøde; fokus på mersalg og relation |
| 1 høj-signal ELLER 2+ mellem | Opmærksomhed | Statusmødet fremrykkes; signalet adresseres åbent på mødet |
| 2+ høj-signaler | Risiko | Mødets primære formål ændres til at redde relationen - mersalg parkeres; forbered spørgsmål, ikke pitch |
| Høj-signaler + A-kunde | Kritisk | Anbefal at ejeren/ledelsen selv deltager i mødet (se eskalering) |

Skift aldrig selv mødets formål - præsentér trappen for brugeren og lad dem beslutte.

## Hvornår eskaleres til ejeren

Anbefal eksplicit at ejeren/ledelsen inddrages FØR mødet når:

- kunden udgør en meget stor del af omsætningen (koncentrationsrisiko - tommelfingerregel: over ca. 30 %),
- der er tegn på tvist, trussel om advokat eller misligholdelsesdiskussion,
- signalerne peger på at kunden er i økonomiske vanskeligheder (betalingsstandsninger, mange forfaldne poster, negative nyheder) - her handler det om virksomhedens egen risiko, ikke kun om relationen.

Skriv eskaleringen ind i artefaktets resumé - den må ikke gemme sig i et bilag.
