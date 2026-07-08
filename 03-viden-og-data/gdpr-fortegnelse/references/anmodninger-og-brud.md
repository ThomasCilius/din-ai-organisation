# Indsigts- og sletteanmodninger samt databrud

Indhold:

1. [Indsigtsanmodning (artikel 15)](#1-indsigtsanmodning-artikel-15)
2. [Fristen: 1 måned (artikel 12)](#2-fristen-1-maned-artikel-12)
3. [Skabelon: svar på indsigtsanmodning](#3-skabelon-svar-pa-indsigtsanmodning)
4. [Sletteanmodning (artikel 17)](#4-sletteanmodning-artikel-17)
5. [Databrud (artikel 33 og 34)](#5-databrud-artikel-33-og-34)
6. [Skabelon: brudlog](#6-skabelon-brudlog)

## 1. Indsigtsanmodning (artikel 15)

Den registrerede har ret til at få at vide OM virksomheden behandler oplysninger om dem, og i så fald få:

- en kopi af oplysningerne, og
- metadata: formål, kategorier af oplysninger, modtagere (særligt i tredjelande), forventet opbevaringsperiode (eller kriterierne for den), retten til berigtigelse/sletning/begrænsning/indsigelse, retten til at klage til Datatilsynet, oplysningernes kilde (hvis ikke indsamlet hos personen selv), og om der sker automatiske afgørelser/profilering.

Bemærk: metadata-listen er stort set fortegnelsens pligtfelter. En vedligeholdt fortegnelse gør et indsigtssvar til en overkommelig opgave - det er et af de stærkeste praktiske argumenter for overhovedet at have den.

Arbejdsgang:

1. **Notér modtagedatoen** - fristen løber fra den (se afsnit 2). Tidskritisk fra minut ét.
2. **Identitet:** ejeren skal være rimeligt sikker på at anmoderen er den person det handler om. Proportionalt: kendte kunder kræver ikke pas - en ukendt mailadresse der beder om "alt om Hans Hansen" gør. Ved tvivl: [MANGLER - ejeren afklarer identitet].
3. **Find data via fortegnelsen:** gennemgå hver behandlingsaktivitet og hvert system og notér hvad der findes om personen. Husk frittekst: mails, CRM-noter, supportsager.
4. **Udkast svaret** efter skabelonen i afsnit 3 - som kladde i `svar-anmodning-[aar-md-dag].md`.
5. **Ejeren gennemgår og sender.** Skillen sender aldrig. Tredjeparters oplysninger i materialet (fx en anden kunde nævnt i samme mail) markeres til ejerens stillingtagen før udlevering.

## 2. Fristen: 1 måned (artikel 12)

Udgangspunktet er svar **uden unødig forsinkelse og senest 1 måned** efter modtagelsen. Fristen kan forlænges med yderligere 2 måneder ved komplekse eller mange anmodninger - men KUN hvis personen får besked om forlængelsen og begrundelsen inden for den første måned. Verificér de præcise regler i Datatilsynets vejledning om registreredes rettigheder ved hver konkret sag.

Praktisk regel for skillen: beregn og skriv fristdatoen øverst i svarudkastet, og foreslå ejeren en intern deadline mindst en uge før.

## 3. Skabelon: svar på indsigtsanmodning

```markdown
# Svar på indsigtsanmodning - [navn] - KLADDE

Modtaget: [dato] | Svarfrist: [dato + 1 måned] | Intern deadline: [frist minus 7 dage]

Kære [navn]

Tak for din henvendelse af [dato]. Vi bekræfter at vi behandler følgende
oplysninger om dig:

## Oplysninger vi behandler
[Pr. behandlingsaktivitet: hvilke oplysninger - vedlæg kopi]

## Formål og grundlag
[Fra fortegnelsen, i almindeligt sprog]

## Modtagere
[Kategorier af modtagere, særskilt bemærkning ved tredjelande]

## Opbevaring
[Frist eller kriterier - fra slettefrister.md]

## Dine rettigheder
Du kan bede om berigtigelse, sletning eller begrænsning og gøre indsigelse.
Du kan klage til Datatilsynet (datatilsynet.dk).

## Kilde
[Hvor oplysningerne stammer fra, hvis ikke fra dig selv]

---
INTERNT (fjernes før afsendelse): åbne spørgsmål, tredjepartsdata til
stillingtagen, systemer der IKKE er gennemsøgt endnu.
```

## 4. Sletteanmodning (artikel 17)

Retten til sletning er IKKE absolut. De vigtigste undtagelser i SMV-praksis:

- **Retlig forpligtelse:** bogføringsmateriale kan ikke kræves slettet før bogføringslovens frist.
- **Retskrav:** oplysninger der er nødvendige for at fastlægge eller forsvare et retskrav (fx en verserende tvist) kan bevares.
- **Fortsat kontraktopfyldelse:** data der er nødvendige for en løbende aftale.

Korrekt svar er derfor ofte **delvis sletning**: slet det der kan slettes (fx markedsføringsdata), bevar det der skal bevares, og forklar personen præcis hvad der blev slettet, hvad der bevares og med hvilken hjemmel. Skillen udkaster svaret og en sletteplan - ejeren beslutter, udfører sletningen og sender svaret. Ved tvist eller tvivl om undtagelserne: henvis til advokat/DPO.

## 5. Databrud (artikel 33 og 34)

**Et databrud er ethvert brud på sikkerheden der fører til utilsigtet eller ulovlig tilintetgørelse, tab, ændring eller uautoriseret videregivelse af eller adgang til personoplysninger.** Hverdagseksempler der ER brud: mail med persondata til forkert modtager, mistet/stjålet bærbar uden kryptering, ransomware, en tidligere medarbejder med fortsat adgang, en kundeliste delt med et forkert link.

Reglerne:

- **Artikel 33:** anmeldelse til Datatilsynet **uden unødig forsinkelse og om muligt senest 72 timer** efter at virksomheden er blevet bekendt med bruddet - medmindre bruddet sandsynligvis ikke indebærer en risiko. Den risikovurdering er ejerens/rådgiverens, ALDRIG skillens. Kan anmeldelsen ikke nå alt inden for 72 timer, kan den ske trinvist.
- **Artikel 34:** ved sandsynlig HØJ risiko skal også de berørte personer underrettes.
- **Intern dokumentationspligt:** ALLE brud dokumenteres internt - også dem der vurderes ikke at skulle anmeldes. Det er brudloggens funktion.

Skillens rolle ved mistanke om brud - i denne rækkefølge:

1. **Eskalér til ejeren med det samme** med henvisning til 72-timersfristen. Ingen analyse først. Sig aldrig "det er nok ikke alvorligt".
2. **Hjælp med at dokumentere fakta** i brudloggen (afsnit 6) - fakta, ikke vurderinger.
3. **Henvis** til Datatilsynets anmeldelsesvejledning og -formular på datatilsynet.dk samt til advokat/DPO for risikovurderingen.
4. **Anmeld aldrig selv**, og udkast kun underretninger til berørte som kladde på ejerens udtrykkelige anmodning.

## 6. Skabelon: brudlog

```markdown
# Brudlog - [kort titel] - [dato]

| Felt | Indhold |
|---|---|
| Opdaget (dato + klokkeslæt) | [72-timersfristen løber herfra - notér præcist] |
| Hvad skete der (fakta) | [kun konstaterbart - ingen vurderinger] |
| Hvilke oplysninger er berørt | [kategorier, herunder evt. følsomme/CPR] |
| Hvor mange personer (estimat) | |
| Straksforanstaltninger | [hvad er allerede gjort: spærret adgang, tilbagekaldt mail...] |
| Eskaleret til ejeren | [dato + klokkeslæt] |
| Ejerens beslutning | [anmeldes / anmeldes ikke + begrundelse - EJERENS ord] |
| Anmeldt til Datatilsynet | [dato eller "ikke anmeldt"] |
| Berørte underrettet | [ja/nej/ikke relevant] |
| Kilder | [Datatilsynets vejledning om brud, opslagsdato] |
```

Kilde for hele filen: Datatilsynets vejledninger om registreredes rettigheder og om håndtering af brud på persondatasikkerheden (datatilsynet.dk) - slå den aktuelle udgave op ved hver konkret sag, og citér den i svarudkastets kildeafsnit.
