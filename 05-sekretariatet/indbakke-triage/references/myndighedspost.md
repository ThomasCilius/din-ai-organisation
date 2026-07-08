# Myndighedspost - hvad den betyder, og hvad det koster at overse den

Reference for `indbakke-triage`. Læs den når dagens overblik indeholder post fra en myndighed, bank, forsikring eller advokat. Formålet er dømmekraft: at kunne skrive en præcis Straks-anbefaling pr. brev - ikke at gengive lovtekst.

**Grundregel for hele filen:** frister, satser og gebyrer ændrer sig. Skriv ALDRIG et konkret beløb eller en lovfrist fra hukommelsen i overblikket - citér brevet, eller skriv "slå den aktuelle frist/sats op på [kilde]".

## Indhold

1. [Digital Post - adviseringen er ikke brevet](#1-digital-post---adviseringen-er-ikke-brevet)
2. [SKAT / Skattestyrelsen / Gældsstyrelsen](#2-skat--skattestyrelsen--gaeldsstyrelsen)
3. [Erhvervsstyrelsen](#3-erhvervsstyrelsen)
4. [Kommunen](#4-kommunen)
5. [Domstole, advokater og inkasso](#5-domstole-advokater-og-inkasso)
6. [Banken](#6-banken)
7. [Forsikring og pension](#7-forsikring-og-pension)
8. [Konsekvenstrappen - hvorfor Straks-sektionen findes](#8-konsekvenstrappen---hvorfor-straks-sektionen-findes)
9. [Anbefalingsformat for Straks-sektionen](#9-anbefalingsformat-for-straks-sektionen)

## 1. Digital Post - adviseringen er ikke brevet

Danske virksomheder modtager myndighedspost i Digital Post (læses via virk.dk, mit.dk eller e-Boks). Det der lander i mailindbakken, er typisk kun en ADVISERING: "Du har fået ny post fra Skattestyrelsen."

- Adviseringen indeholder næsten aldrig fristen - den står i selve brevet.
- Triagér adviseringen i Straks med anbefalingen "åbn brevet i Digital Post i dag" og markér [AFKLAR: frist ukendt indtil brevet er åbnet].
- Juridisk gælder brevet fra det er tilgængeligt i Digital Post - ikke fra hvornår adviseringen læses. Derfor kan en uåbnet advisering allerede have en løbende frist.
- Vær opmærksom på phishing der efterligner Digital Post-adviseringer - tjek afsenderdomænet, og se `svindel-tjekliste.md` ved tvivl.

## 2. SKAT / Skattestyrelsen / Gældsstyrelsen

Typisk post og hvad den kræver:

| Brevtype | Kræver typisk | Haster fordi |
|---|---|---|
| Momsangivelse/-frist | Angivelse og betaling inden frist | For sen angivelse udløser afgift pr. angivelse; gentagelser eskalerer |
| A-skat/AM-bidrag | Indberetning og betaling | Samme gebyrmekanik; rammer også medarbejderforhold |
| Forslag til afgørelse/agterskrivelse | SVAR inden anført frist - ellers træffes afgørelsen som foreslået | Tavshed = accept i praksis |
| Kontrolsag/materialeindkaldelse | Indsendelse af materiale inden frist | Manglende svar kan udløse skønsmæssig ansættelse og tvangsbøder |
| Rykker/gæld overdraget til Gældsstyrelsen | Betaling eller kontakt | Renter og inddrivelsesskridt løber |

Anbefaling i overblikket: citér brevets frist, og skriv "tjek aktuel sats/frist på skat.dk". Ved agterskrivelser og kontrolsager: tilføj "overvej revisor" - det er en eskaleringstrigger, ikke en rutineopgave.

## 3. Erhvervsstyrelsen

- **Årsrapport:** indsendelsesfristen er lovbestemt. Overskridelse udløser afgifter til ledelsen personligt, og i sidste ende oversendelse til tvangsopløsning. Al post om årsrapportfrister er Straks - uanset hvor rutinepræget den ser ud.
- **Påkrav/varsel om tvangsopløsning:** højeste alarmniveau i denne fil. Anbefaling: "kontakt revisor/advokat i dag".
- **Registreringsændringer og frister for lovpligtige indberetninger** (fx reelle ejere): manglende registrering kan koste bøder og i grove tilfælde tvangsopløsning.

## 4. Kommunen

- **Partshøringer og afgørelser:** svarfristen står i brevet - efter fristen træffes afgørelsen uden virksomhedens input.
- **Tilladelser og tilsyn** (byggesag, miljø, fødevarer, alkoholbevilling): frister for udbedring eller dokumentation; manglende svar kan koste tilladelsen.
- **Opkrævninger** (ejendomsskat, affaldsgebyrer m.m.): rykkergebyrer og renter løber automatisk.

## 5. Domstole, advokater og inkasso

Alt fra domstole og modparters advokater er pr. definition Straks + eskalering til ejeren:

- **Betalingspåkrav og stævninger:** svarfristerne er korte, og konsekvensen af tavshed er udeblivelsesdom - dvs. sagen tabes uden at være ført. Anbefaling: "kontakt advokat i dag".
- **Advokatbreve** (krav, ophævelse, misligholdelsesindsigelse): svarfrist i brevet; manglende svar bruges imod virksomheden senere.
- **Inkassovarsler:** både dem virksomheden modtager, og dem der vedrører egne kunder. Reagér inden fristen - gebyrtrappen løber.
- **Forældelse:** krav kan forældes ved passivitet. Nævn det som risiko, men angiv aldrig fristen fra hukommelsen - "afklar forældelsesfrist med advokat".

## 6. Banken

Bankpost er den sværeste kategori, fordi den spænder fra ren markedsføring til juridisk kritisk. Skeln sådan:

| Banken skriver om | Triage |
|---|---|
| Dokumentationskrav (KYC/hvidvaskoplysninger, legitimation, ejerforhold) | **Straks** - manglende svar kan føre til blokerede konti eller opsigelse af engagementet |
| Kortudløb, ændrede vilkår med varselsfrist, kreditgennemgang | **Straks** hvis dato/frist er nævnt, ellers Handl nu/Kan vente efter indhold |
| Investeringsnyt, produkttilbud, "book et møde" | Til orientering - dette er den ENESTE bankpost der må forlade Straks |

Ved tvivl om en bankmail er ægte (betalingsoplysninger, "din konto er spærret"-beskeder): se `svindel-tjekliste.md` - bankphishing er blandt de hyppigste svindelformer.

## 7. Forsikring og pension

- **Fornyelser og præmieopkrævninger:** manglende betaling kan betyde at dækningen bortfalder - netop når den skal bruges.
- **Skadesager:** anmeldelses- og dokumentationsfrister står i policen/brevet; for sent = afvist skade.
- **Opsigelses- og ændringsvarsler:** kræver aktiv stillingtagen inden varslet udløber.

## 8. Konsekvenstrappen - hvorfor Straks-sektionen findes

Fra billigst til dyrest - brug den til at formulere HVORFOR i anbefalingen:

1. Rykkergebyrer og renter (kommune, opkrævninger, inkasso)
2. Faste afgifter pr. forsømmelse (moms- og skatteangivelser, årsrapport)
3. Skønsmæssige ansættelser og tvangsbøder (kontrolsager uden svar)
4. Retstab - afgørelser og domme afsagt uden virksomhedens input (partshøring, agterskrivelse, udeblivelsesdom)
5. Eksistenstruende skridt - tvangsopløsning, opsagt bankengagement, bortfaldet forsikringsdækning

Pointen for triagen: selv trin 1 er en unødvendig omkostning, og afsendertypen afslører ikke altid trinnet - derfor åbnes og vurderes AL myndighedspost, altid.

## 9. Anbefalingsformat for Straks-sektionen

Hver linje i Straks skal indeholde: afsender, hvad brevet kræver, fristen (citeret eller [AFKLAR]), og konsekvensen i få ord.

- SKIDT: "Brev fra Skattestyrelsen - bør ses på."
- GODT: "Skattestyrelsen: materialeindkaldelse i momskontrol - svar senest 14/7 (citeret fra brevet); ubesvaret risikerer skønsmæssig ansættelse. Anbefaling: send til revisor i dag."

Eskaleringstriggere der altid skal stå eksplicit i anbefalingen: agterskrivelse/kontrolsag → revisor; stævning/betalingspåkrav/advokatbrev → advokat; varsel om tvangsopløsning → revisor OG advokat, i dag.
