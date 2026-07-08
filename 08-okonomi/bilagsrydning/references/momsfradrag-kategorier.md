# Momsfradrag på kategoriniveau - dansk SMV

Fradragstabel, særtilfælde og tvivlstriggere til kategorisering af indgående bilag. Skillen kategoriserer efter denne fil - den afgør aldrig tvivlstilfælde (de flages til bogholder/revisor).

## Indhold

1. [Sådan bruges tabellen](#1-sådan-bruges-tabellen)
2. [Hovedtabel: fradrag pr. udgiftstype](#2-hovedtabel-fradrag-pr-udgiftstype)
3. [Særtilfælde der kræver dømmekraft](#3-særtilfælde-der-kræver-dømmekraft)
4. [EU-køb og reverse charge](#4-eu-køb-og-reverse-charge)
5. [Bilag uden moms](#5-bilag-uden-moms)
6. [Tvivlstriggere - flag til bogholder](#6-tvivlstriggere---flag-til-bogholder)
7. [Kilder](#7-kilder)

## 1. Sådan bruges tabellen

- Find udgiftstypen, notér fradragsprocenten i CSV'ens kategori/fradrag, og gå videre.
- Rammer bilaget et særtilfælde (afsnit 3) eller en tvivlstrigger (afsnit 6): kategorisér efter bedste match og sæt et flag i note-kolonnen - afgør ikke selv.
- Fradragsprocenten er MOMSfradraget (hvor stor en del af momsbeløbet virksomheden kan trække fra) - ikke om udgiften er skattemæssigt fradragsberettiget. De to ting blandes ofte sammen; denne skill tager kun stilling til moms.

## 2. Hovedtabel: fradrag pr. udgiftstype

| Udgiftstype | Momsfradrag | Typiske bilag | Fælder |
|---|---|---|---|
| Varekøb til videresalg/produktion | Fuldt | Leverandørfakturaer, grossist | |
| Materialer og forbrugsvarer | Fuldt | Byggemarked, værktøj, reservedele | Privatlignende køb (havemøbler, TV) → flag |
| Underleverandører (danske, med moms) | Fuldt | Håndværker-, konsulentfakturaer | Omvendt betalingspligt i byggebranchen: faktura uden moms er korrekt → flag som reverse charge, ikke fejl |
| Software og abonnementer | Fuldt | SaaS-fakturaer, licenser | Udenlandsk udbyder uden dansk moms → afsnit 4 |
| Kontorhold og kontorartikler | Fuldt | Kontorforsyning, printerpatroner | |
| Markedsføring og annoncering | Fuldt | Trykkeri, annoncer | Google/Meta-annoncer → afsnit 4 |
| Revisor, advokat, rådgivning | Fuldt | Honorarfakturaer | |
| Telefoni og internet | Fuldt/delvist | Teleudbyder | Bruges abonnementet også privat: delvist fradrag efter skøn → flag |
| Husleje (erhvervslejemål) | Fuldt HVIS udlejer er frivilligt momsregistreret | Huslejeopkrævning med moms | Husleje uden moms er normalt - så er momsbeløbet 0, ikke en fejl |
| Hotelovernatning (erhverv) | Fuldt | Hotelfaktura | Kun overnatningsdelen - se afsnit 3 |
| Restauration og repræsentation | 25 % af momsen | Restaurantregninger, forretningsmiddage | Kræver strengt erhvervsmæssigt formål; notér gerne anledning/deltagere hvis det fremgår |
| Personaleudgifter (kaffe, frugt m.m. i egne lokaler) | Varierer | Supermarked, kantineleverandør | Praksis er nuanceret → flag hvis beløbet er væsentligt |
| Gaver (kunder, forretningsforbindelser) | 0 % | Vinhandel, gavekort | Reklameartikler med logo under bagatelgrænse kan være undtaget → flag og slå grænsen op på skat.dk |
| Bøder, parkeringsafgifter, gebyrer med strafkarakter | 0 % | P-afgift, fartbøde | Der er typisk slet ikke moms på - 0 i momsfelt |
| Private udgifter | 0 % | Alt der ikke vedrører virksomheden | Blandet privat/erhverv → afsnit 3 |

## 3. Særtilfælde der kræver dømmekraft

**Biler.** Fradraget afhænger af nummerplade og anvendelse:

- Gulpladebil der kun bruges erhvervsmæssigt: fuldt fradrag på anskaffelse og drift (brændstof, service).
- Hvidpladebil (personbil): som udgangspunkt 0 % fradrag på både anskaffelse og drift. Der findes særregler for leasing af hvidpladebiler (delvist fradrag af leasingmomsen) - flag leasingfakturaer på personbiler til bogholder frem for at beregne selv.
- Broafgifter og færge: har egne regler afhængigt af biltype → flag.

**Hotel og restaurant på samme faktura.** Overnatning giver fuldt momsfradrag, restaurationsdelen (morgenmad, middag, minibar) kun 25 %. Er fakturaen specificeret: split beløbene i to rækker i CSV'en med reference til samme fil. Er den ikke specificeret: kategorisér som rejser/hotel og flag "usplittet hotel/restauration".

**Mødeforplejning i egne lokaler.** Servering ved konkrete, erhvervsmæssige møder i virksomhedens egne lokaler behandles efter praksis anderledes end restaurationsbesøg og kan give fuldt fradrag. Praksis er nuanceret: kategorisér som repræsentation og flag "mødeforplejning i egne lokaler - bogholder afgør fradrag".

**Blandet privat/erhverv.** Telefon, internet, hjemmekontor, én computer i husstanden: delvist fradrag efter skøn som virksomheden selv skal kunne begrunde. Skillen skønner ALDRIG procenten - den flager bilaget og noterer at bogholder/ejer skal fastsætte den erhvervsmæssige andel.

**Repræsentation vs. personaleudgift.** Julefrokost for medarbejdere, kundemiddag og reception behandles forskelligt. Fremgår anledningen ikke af bilaget: kategorisér efter bedste match og flag "anledning ukendt".

## 4. EU-køb og reverse charge

Kendetegn: udenlandsk leverandør, faktura uden dansk moms (0 % eller "VAT reverse charge"), ofte med dansk CVR/VAT-nummer påtrykt. Klassiske eksempler: Google Ads, Meta, OpenAI, AWS, Adobe, LinkedIn, Canva.

Sådan behandles de:

1. Kategorisér efter udgiftens art (fx software/abonnementer eller markedsføring).
2. Momsbeløb = 0 i CSV'en (der ER ingen dansk købsmoms på bilaget).
3. Flag rækken "EU-køb/reverse charge" i note-kolonnen.
4. Rør aldrig ved beregningen: erhvervelsesmoms/reverse charge beregnes og indberettes af bogholderen i momsangivelsens særlige rubrikker. Behandles et EU-køb fejlagtigt som dansk købsmoms, bliver momsangivelsen forkert i begge ender.

Køb uden for EU (fx amerikansk leverandør uden EU-registrering) og importmoms flages på samme måde, blot med noten "import/ydelseskøb uden for EU".

## 5. Bilag uden moms

Helt normale bilag hvor momsbeløbet korrekt er 0 - de må ikke fejlmarkeres:

- Forsikringer
- Bankgebyrer og renter
- Porto (delvist momsfritaget)
- Lønsumsafgiftsbelagte ydelser (fx visse sundhedsydelser, undervisning, taxa)
- Husleje uden frivillig momsregistrering
- Offentlige gebyrer og afgifter

CSV-behandling: momsbeløb 0, beløb ekskl. = beløb inkl., ingen flag nødvendigt (medmindre det er uventet for udgiftstypen - fx en dansk varefaktura helt uden moms → flag).

## 6. Tvivlstriggere - flag til bogholder

Sæt flag i CSV'ens note-kolonne og medtag bilaget i rapportens "Til manuel gennemgang" eller antagelsesafsnit når:

1. Bilaget mangler momsspecifikation, og det er uklart om der er moms i beløbet.
2. Kvitteringen er en kassebon/forenklet faktura på et større beløb - grænsen for hvornår en fuld faktura kræves, slås op på skat.dk (hardcod den ikke).
3. Købet kan være privat eller blandet privat/erhverv.
4. Bilaget er håndskrevet, ulæseligt eller mangler dato/leverandør.
5. Fakturaen er i udenlandsk valuta uden DKK-beløb.
6. Bilaget vedrører bil, gave, mødeforplejning eller andre særtilfælde fra afsnit 3.
7. Leverandørens CVR-/VAT-nummer mangler på en større faktura.
8. Samme køb optræder på to bilag (ordrebekræftelse + faktura, eller faktura + kontoudtog) - kun fakturaen er bilaget; det andet dokument flyttes til `dubletter/`.

## 7. Kilder

- Momslovens fradragsregler: momsloven §§ 37-42, retsinformation.dk
- Skats praksis: Den juridiske vejledning, afsnit D.A.11 (fradrag), skat.dk
- Aktuelle beløbsgrænser og satser: skat.dk - slå ALTID op, citér aldrig en grænse fra hukommelsen
- Fakturakrav: momsbekendtgørelsen, retsinformation.dk
