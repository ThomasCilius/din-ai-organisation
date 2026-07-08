# Leverandør-godkendelse: protokol, mangelliste og betalingsgate

Læs denne fil i leverandør-sporet (leverancen er lavet af et bureau eller en freelancer). Det er her danske SMV'er reelt taber penge: de godkender og betaler en bureau-leverance uden systematisk test, og opdager først manglerne når regningen er betalt og leverandøren er videre. Denne protokol lukker det hul.

## Indhold
1. Grundreglen: match mod kravspec, ikke mod leverandørens demo
2. Godkendelsesprotokol punkt for punkt
3. Betalingsgate - hvornår må der godkendes og betales
4. Mangelliste-udkast til leverandøren (skabelon)
5. Overdragelse ved godkendelse: kode, data, domæne, adgange
6. Juridik og GDPR ved godkendelse
7. Eskalering - hvornår mennesket/rådgiveren skal ind

## 1. Grundreglen

Test **leverancen mod byggebrief.md punkt for punkt** - ikke mod den demo leverandøren selv viser frem. En demo er leverandørens happy path; den viser det der virker. Din opgave er at afprøve hvert færdig-kriterie som slutbrugeren, med bevis (se `uat-metode.md`), og notere hvad der IKKE er med.

Det billigste tilbud er ofte det der har udeladt mest. Kravspecen er din målestok - hold leverancen op mod den, linje for linje.

## 2. Godkendelsesprotokol punkt for punkt

1. **Gennemgå hvert færdig-kriterie fra byggebrief.md** mod den leverede løsning. Status + bevis pr. punkt (som i selvbygget-sporet).
2. **Notér hvad der mangler i forhold til kravspec** - ikke bare fejl i det leverede, men manglende leverancer ("v1 skulle rumme eksport til Excel - findes ikke").
3. **Tjek det leverandøren lovede skriftligt** (tilbud, byggebrief, ændringslog) mod det faktiske. Mundtlige løfter tæller ikke - kun det der står skrevet.
4. **Kør skabelon- og tilgængelighedstjek** mod designprofil.md (se `skabelon-og-tilgaengelighedstjek.md`).
5. **Kategorisér hver afvigelse:** blokerende / skal rettes / kan vente.
6. **Skriv mangellisten** (skabelon nedenfor) som et udkast brugeren kan sende.
7. **Sæt betalingsgaten:** ingen slutbetaling før alle blokerende er lukket og genafprøvet.

## 3. Betalingsgate - hvornår må der godkendes og betales

Reglen brugeren skal have gengivet, hver gang:

> **Godkend og betal (slutbeløbet) først når alle blokerende mangler er lukket og genafprøvet med bevis.**

- **Blokerende åben** -> IKKE KLAR. Godkend ikke, betal ikke slutbeløbet.
- **Kun "skal rettes" / "kan vente" tilbage** -> kan godkendes betinget, hvis brugeren og leverandøren aftaler skriftligt hvornår de lukkes (dateret). Betaling kan frigives efter brugerens beslutning.
- **Alt bestået** -> KLAR til brugerens endelige godkendelse.

Advar hvis leverandøren presser på for betaling før blokerende er lukket, eller kræver 100 % forudbetaling - det er et rødt flag. Slå aktuelle, rimelige danske betalingsvilkår og et eventuelt tilbageholdt slutbeløb (garantiperiode) op frem for at hardcode en procentsats her; vilkårene skal stå i den oprindelige aftale.

## 4. Mangelliste-udkast til leverandøren (skabelon)

Skriv listen så leverandøren kan handle på den uden at spørge tilbage. Ét fund pr. punkt, med reproduktion og bevis (se fund-skabelonen i `uat-metode.md`).

```
Emne: Mangelliste - [leverance], gennemgang [dato]

Hej [leverandør],

Vi har gennemgået leverancen mod den aftalte kravspec (byggebrief).
Nedenfor er manglerne i tre kategorier. De blokerende skal lukkes,
før vi kan godkende og frigive slutbetaling; de øvrige aftaler vi en
frist for.

BLOKERENDE (skal lukkes før godkendelse)
1. [titel] - [sådan genskabes] - forventet: [kravspec] - faktisk: [x] - bevis vedhæftet.

SKAL RETTES
2. ...

KAN VENTE
3. ...

Vi genafprøver de rettede punkter og vender tilbage med en opdateret status.

Venlig hilsen
[navn]
```

Denne skill **skriver udkastet, men sender det aldrig selv** - brugeren afsender.

## 5. Overdragelse ved godkendelse: kode, data, domæne, adgange

Før en leverance godkendes som "klar", skal ejerskabet være på plads - ellers står SMV'en fanget hos leverandøren. Tjek (og skriv manglende punkter i mangellisten):

- **Kildekode / adgang til systemet:** har virksomheden selv adgang, eller ligger alt hos leverandøren?
- **Domæne og hosting-konti:** står de i virksomhedens eget navn og under virksomhedens egen konto? (Leverandøren der ejer domænet er et klassisk gidsel-scenarie.)
- **Data:** kan data eksporteres ud i et brugbart format? Er der en backup?
- **Adgange og passwords:** er admin-adgang overdraget til virksomheden? (Koordinér on-/offboarding med `adgangsstyring`.)
- **Dokumentation:** findes der en kort vejledning i at drifte/opdatere løsningen?

Manglende ejerskab er som minimum "skal rettes" og ofte blokerende - en leverance man ikke ejer eller kan flytte, er ikke reelt færdig.

## 6. Juridik og GDPR ved godkendelse

- **Behandler løsningen persondata?** Så skal der være en databehandleraftale (GDPR art. 28) med leverandøren på plads FØR go-live. Mangler den, er det blokerende. Slå det aktuelle indhold og krav op frem for at gengætte.
- **Dataminimering og sletning:** indsamler løsningen kun det den skal, og kan data slettes igen?
- **Cookies/samtykke** på offentligt tilgængelige web-løsninger: er der styr på samtykke?
- **Offentligt rettede løsninger** kan være omfattet af webtilgængelighedsloven - flag relevansen, slå aktuel status op.

Du er ikke jurist. Flag disse punkter som fund; ved reel tvivl eller konflikt henvis til rådgiver.

## 7. Eskalering - hvornår mennesket/rådgiveren skal ind

Stop og henvis brugeren videre, i stedet for at dømme selv, når:

- Der er **uenighed/tvist** med leverandøren om hvad der var aftalt.
- Der er **mistanke om persondatabrud** eller manglende hjemmel - GDPR-forhold hører hos ejer/DPO/advokat.
- Beløbet eller det kontraktlige er stort nok til at en fejlvurdering er dyr - få en rådgiver til at læse med.
- Leverandøren nægter at udlevere data, kode eller adgange.

I alle tilfælde: du leverer den dokumenterede mangelliste og indstilling som grundlag - **beslutningen og forhandlingen er brugerens.**
