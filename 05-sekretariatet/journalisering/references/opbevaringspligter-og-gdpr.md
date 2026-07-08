# Opbevaringspligter og GDPR-sletteregler - fuld reference

Indhold:

1. [Sådan bruges denne fil](#saadan-bruges-denne-fil)
2. [Opbevaringstabel pr. dokumenttype](#opbevaringstabel-pr-dokumenttype)
3. [GDPR-sletteregler](#gdpr-sletteregler)
4. [Slettekandidat-listens format](#slettekandidat-listens-format)
5. [Eskalationstriggere - stop og henvis](#eskalationstriggere---stop-og-henvis)

## Sådan bruges denne fil

Reglerne her er **dømmekraft, ikke facit**. De afgør hvad der er en rimelig SLETTEKANDIDAT - men love ændres, frister varierer med sagstypen, og en forkert sletning er uoprettelig. Derfor gælder tre ufravigelige principper:

1. **Slå altid den aktuelle regel op på kilden** før brugeren sletter: retsinformation.dk (lovtekster), datatilsynet.dk (GDPR-vejledning), skat.dk (skatte- og momsdokumentation). Skriv opslagsstedet ved hver kandidat - aldrig en frist som facit fra hukommelsen.
2. **Ved tvivl: gem frem for slet** - og henvis til revisor (regnskabsmateriale) eller advokat (kontrakter, tvister, forældelse).
3. **Claude sletter aldrig selv.** Denne fil producerer kun lister - handlingen er brugerens, efter opslag.

## Opbevaringstabel pr. dokumenttype

Tommelfingerregler pr. medio 2026 - hver enkelt verificeres ved opslag før sletning:

| Dokumenttype | Tommelfingerregel | Lovgrundlag (udgangspunkt) | Slå aktuel regel op på |
|---|---|---|---|
| Regnskabsbilag, fakturaer, kontoudtog | 5 år fra udgangen af regnskabsåret | bogføringsloven | retsinformation.dk + revisor |
| Årsrapporter | som regnskabsmateriale - gem gerne varigt (fylder intet, dokumenterer historik) | bogføringsloven | retsinformation.dk |
| Moms- og skattedokumentation | følger regnskabsmaterialet; visse aktiver har længere krav | bogføringsloven, momsloven | skat.dk |
| Kontrakter (kunde, leverandør, leje) | løbetid + forældelsesfrist - udgangspunkt 3 år efter ophør, men op til 10 år ved visse krav | forældelsesloven | retsinformation.dk + advokat ved tvivl |
| Ansættelseskontrakter og tillæg | under ansættelsen + en periode efter fratræden (dokumentation mod senere krav) | forældelsesloven, bogføringsloven (løndele) | datatilsynet.dk + revisor/advokat |
| Lønbilag og lønsedler | som regnskabsmateriale | bogføringsloven | retsinformation.dk |
| Afslåede jobansøgninger | typisk maks 6 måneder efter afslag, medmindre kandidaten har samtykket til længere | GDPR (formålsbegrænsning) | datatilsynet.dk |
| MUS-notater, personalesager | så længe ansættelsesformålet består - ryd op efter fratræden | GDPR | datatilsynet.dk |
| Myndighedsafgørelser, tilladelser, registreringsbeviser | sagens/tilladelsens levetid - som udgangspunkt gem varigt | forvaltningspraksis | myndighedens egen vejledning |
| Forsikringspolicer og skadesager | løbetid + skadesforældelse | forældelsesloven | forsikringsselskabet + retsinformation.dk |
| Markedsføringsmateriale, udkast, arbejdsfiler | ingen pligt - ryd op efter behov | - | - |

Bemærk mønsteret: **pengespor og myndighedspost har lange pligter, persondata har korte formålsgrænser.** Det er derfor `Oekonomi/` opdeles pr. år (ét år = én fremtidig slettekandidat) og `HR-og-personale/` kræver løbende oprydning.

## GDPR-sletteregler

Grundreglen er formålsbegrænsning: **persondata gemmes kun så længe formålet med behandlingen består.** Der findes ingen generel GDPR-frist - fristen følger formålet:

- **Formålet består:** aktiv kunde, ansat medarbejder, verserende sag → dokumenterne beholdes (og opbevaringspligter kan KRÆVE at de beholdes - opbevaringspligt slår sletteønske).
- **Formålet er ophørt:** afslået ansøger, fratrådt medarbejder (efter dokumentationsperioden), forældet kundesag uden pengespor → filerne er slettekandidater.
- **Typiske fund på et SMV-drev:** gamle ansøgningsrunder med CV'er, deltagerlister med CPR-numre, kopier af pas/sundhedskort, eksporterede kundelister i regneark, "backup af backup"-mapper med persondata. Alle udpeges som kandidater med regelhenvisning.
- **Følsomme oplysninger** (helbred, fagforening, straffedomme, CPR-numre i flæng): flag dem SÆRSKILT i planen - både som slettekandidat-vurdering og som sikkerhedsproblem hvis de ligger på et åbent fællesdrev. Behandl aldrig indholdet videre - markér og henvis til ejeren.

Husk grænsen: denne skill rydder op i konkrete filer. Selve fortegnelsen over behandlingsaktiviteter og virksomhedens slettepolitik hører til skillen `gdpr-fortegnelse` (Viden og data) - foreslå den når oprydningen afslører at politikken mangler.

## Slettekandidat-listens format

Én række pr. fil eller mappe - aldrig løs prosa:

| Fil/mappe | Hvorfor kandidat | Regelhenvisning | Slå op på | Anbefaling |
|---|---|---|---|---|
| `Rekruttering/2024-lagermedarbejder/` | afslået runde, 2 år gammel - formålet ophørt | GDPR, formålsbegrænsning | datatilsynet.dk | slet efter opslag |
| `Oekonomi/2019/` | regnskabsår formentlig uden for opbevaringspligt | bogføringsloven, 5 år fra årets udløb | retsinformation.dk + revisor | bekræft årstal med revisor før sletning |
| `Scanninger/pas-kopi-MJ.pdf` | id-kopi uden aktivt formål, følsom | GDPR | datatilsynet.dk | slet efter opslag + tjek hvorfor den blev gemt |

Anbefalingen er altid formuleret som brugerens næste skridt - aldrig som noget Claude gør.

## Eskalationstriggere - stop og henvis

Udpeg INGEN slettekandidater og fortsæt ikke på egen hånd når ét af disse gælder - markér filerne og henvis:

| Situation | Handling |
|---|---|
| Aktiv tvist, retssag eller advokatkorrespondance i materialet | slet-stop for ALT der kan vedrøre sagen - henvis til advokat |
| Myndighedskontrol (SKAT, Arbejdstilsynet, Datatilsynet) i gang eller varslet | slet-stop for det kontrollerede område - henvis til revisor/advokat |
| Følsomme persondata (helbred, straffedomme) eller store mængder CPR-numre | markér, behandl ikke indholdet videre - henvis til ejeren |
| Usikkerhed om et regnskabsårs frist | henvis til revisor med det konkrete årstal |
| Dokumenter på fremmedsprog eller med uklar juridisk status | `_til-afklaring/` + henvis til ejeren |

En eskalation er ikke en fiasko - den er selve dømmekraften i skillen. Skriv altid eskalationen ind i journaliseringsloggen, så den ikke går tabt til næste kørsel.
