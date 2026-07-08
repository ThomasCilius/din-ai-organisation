# ICP-scoringsmodel 1-10

Modellen bag scoren i `kundeemner`. Læs den FØR du scorer første emne - forankringspunkterne er det der gør to kørsler sammenlignelige.

## Indhold

- [Princippet](#princippet)
- [De fire dimensioner med forankringspunkter](#de-fire-dimensioner-med-forankringspunkter)
- [Timing-signalkatalog](#timing-signalkatalog)
- [Sammenvejning til én score](#sammenvejning-til-én-score)
- [Krav til begrundelsen](#krav-til-begrundelsen)
- [Kalibrering over tid](#kalibrering-over-tid)

## Princippet

En score er en påstand om sandsynlighed: "hvor sandsynligt er det at netop dette emne bliver en god kunde, hvis vi kontakter dem nu?" Derfor scores fire ting hver for sig og vejes sammen - aldrig én mavefornemmelse omsat til et tal. Vægtene godkendes i briefen; standardvægtene er:

| Dimension | Standardvægt |
|---|---|
| Branche-fit | 30 % |
| Størrelse | 20 % |
| Timing-signaler | 30 % |
| Adgang til beslutningstager | 20 % |

Justér vægtene når brugerens virkelighed kræver det - fx timing op til 40 % for ydelser der kun købes ved anledninger (flytning, vækst, nyansættelser), eller adgang op for meget relationsbårne brancher. Notér ændrede vægte i briefen og i artefaktets Grundlag-sektion.

## De fire dimensioner med forankringspunkter

Scor hver dimension 1-10. Brug forankringspunkterne - de forhindrer at alt lander på 6-7.

### Branche-fit (matcher branchen jeres bedste kunder?)

- **1-2:** Branche uden berøring med jeres ydelser; I har aldrig løst en opgave i den.
- **3-4:** Tilstødende branche - jeres ydelse KAN bruges, men I har ingen referencer og skal oversætte alt.
- **5-6:** Samme overordnede branche som eksisterende kunder, men andet segment eller anden værdikæde-position.
- **7-8:** Samme branchekode/segment som flere eksisterende kunder; referencer kan nævnes i samtalen.
- **9-10:** Klon af jeres bedste kunder - samme branche, samme problemer, og I har en stærk, navngiven reference.

Kilde: branchekode fra CVR + virksomhedens egen beskrivelse af sig selv på hjemmesiden. Stol mere på hjemmesiden end på branchekoden - koder er ofte forældede eller for brede.

### Størrelse (inden for ICP-intervallet?)

- **1-2:** Langt uden for intervallet i begge retninger - for lille til at betale eller for stor til at nå.
- **3-4:** Uden for intervallet, men i bevægelse mod det (vækst eller fokusering).
- **5-6:** I kanten af intervallet.
- **7-8:** Solidt inden for intervallet på den ene måleenhed (ansatte ELLER omsætning).
- **9-10:** Inden for intervallet på både ansatte og omsætning.

Kilde: ansatte-interval fra CVR; omsætning fra seneste årsregnskab hvis oplyst (klasse B-virksomheder oplyser ofte ikke omsætning - så brug bruttofortjeneste eller ansatte som proxy og skriv hvilken proxy du brugte). Husk dateringsflaget: regnskabsdata er 6-18 måneder gamle.

### Timing-signaler (er der et åbent vindue NU?)

- **1-2:** Ingen signaler fundet, og virksomheden viser tegn på stilstand eller tilbagegang.
- **3-4:** Ingen signaler fundet, men researchen var grundig ("ingen signaler" er kun gyldigt efter reelt at have ledt: jobopslag, nyheder, regnskab, LinkedIn).
- **5-6:** Ét svagt eller ældre signal (fx nyt regnskab med vækst, men 10 måneder gammelt).
- **7-8:** Ét stærkt og aktuelt signal (under 3 måneder gammelt) fra kataloget nedenfor.
- **9-10:** Flere aktuelle signaler der peger samme vej - fx både jobopslag og nyhed om ny ordre.

### Adgang til beslutningstager (kan de nås?)

- **1-2:** Beslutningstager kan ikke identificeres; stor organisation med centralt omstillingsbord.
- **3-4:** Titel kendt, navn ukendt - eller navn kendt men ingen vej ind.
- **5-6:** Navn og titel identificeret (CVR-ledelse eller LinkedIn), ingen relation.
- **7-8:** Identificeret + realistisk kanal: aktiv på LinkedIn, lille organisation hvor direktøren tager telefonen, eller branchefællesskab.
- **9-10:** Fælles forbindelse der kan nævnes, tidligere kontakt, eller beslutningstageren har selv vist interesse (fulgt, liket, mødt på messe).

## Timing-signalkatalog

Signaler der åbner et vindue, med typisk kilde og styrke:

| Signal | Typisk kilde | Styrke |
|---|---|---|
| Jobopslag inden for jeres fagområde | Jobindex, virksomhedens site, LinkedIn | Stærkt - de har erkendt behovet og sat budget af |
| Ny direktør/ledelsesændring | CVR (ledelsesændring), LinkedIn, presse | Stærkt - nye ledere revurderer leverandører de første 6-12 måneder |
| Nyt årsregnskab med markant vækst | CVR/Proff | Middel - vækst skaber behov, men tallet kan være gammelt |
| Flytning/nye lokaler | Presse, CVR-adresseændring, LinkedIn | Stærkt for stedbundne ydelser, middel ellers |
| Opkøb/fusion/nye ejere | Presse, CVR | Stærkt - alt er i spil, men beslutningsveje kan være frosset |
| Stor ny ordre/kontrakt omtalt | Branchemedier, virksomhedens nyheder | Stærkt - kapacitetspres følger |
| Ny lovgivning/branchekrav der rammer dem | Branchemedier | Middel til stærkt - afhænger af deadline |
| Aktivitet på LinkedIn om et relevant problem | LinkedIn | Middel - vindue til en naturlig åbner |

Hvert signal i artefaktet noteres med kilde og dato som alle andre datapunkter. Signaler over 6 måneder gamle nedjusteres eksplicit i begrundelsen.

## Sammenvejning til én score

1. Scor de fire dimensioner 1-10 med forankringspunkterne.
2. Gang med vægtene og læg sammen; afrund til én decimal eller nærmeste halve.
3. **Overstyringsregel:** Adgang til beslutningstager på 1-2 lægger loft på totalscoren ved 5 uanset resten - et perfekt emne ingen kan nå, er ikke et emne, det er en drøm. Notér loftet i begrundelsen.
4. Vis regnestykket kort i begrundelsen, fx: "Branche 8, størrelse 7, timing 9, adgang 6 → vægtet 7,7".

## Krav til begrundelsen

En score uden begrundelse er værdiløs. Begrundelsen er 2-4 sætninger og skal:

- nævne mindst to konkrete datapunkter (med kilde allerede noteret i datapunktslisten),
- nævne det der trak NED, ikke kun det der trak op - en begrundelse uden modvægt er et salgsargument, ikke en vurdering,
- ende med det vigtigste "hvorfor nu"-signal, for det er det sælgeren bruger i åbneren.

## Kalibrering over tid

Modellen bliver bedre af feedback. Foreslå brugeren efter 4-6 uger: "Hvilke af de højt scorede emner blev til møder? Hvilke lavt scorede overraskede?" Justér vægtene derefter og notér ændringen i `virksomhedsprofil.md` (kun hvis brugeren beder om det - skriv aldrig til brainen uopfordret). Typisk læring i danske SMV'er: timing undervurderes og størrelse overvurderes i starten.
