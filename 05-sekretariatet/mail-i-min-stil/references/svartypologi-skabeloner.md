# Svartypologi: skabeloner pr. type

Seks svartyper, hver med sin skabelon. Vælg præcis én type pr. mail FØR du skriver, og sig hvilken. Alle eksempler antager en voice-profil med kort, uformel du-form - tilpas altid til den faktiske voice-profil.

## Indhold

1. [Valg af type](#valg-af-type)
2. [Bekræftelse](#1-bekraeftelse)
3. [Afslag/nej-tak](#2-afslagnej-tak)
4. [Forhandling/modforslag](#3-forhandlingmodforslag)
5. [Rykker for svar](#4-rykker-for-svar)
6. [Tak/anerkendelse](#5-takanerkendelse)
7. [Videresendelse med kontekst](#6-videresendelse-med-kontekst)
8. [Markeringer - fælles konventioner](#markeringer)

## Valg af type

| Modpartens mail... | ...og jeres svar er | Type |
|---|---|---|
| Foreslår noget konkret (pris, dato, aftale) | Ja, som foreslået | Bekræftelse |
| Foreslår eller beder om noget | Nej, og relationen skal bevares | Afslag/nej-tak |
| Foreslår vilkår I ikke kan acceptere | Nej til vilkåret, ja til samarbejdet | Forhandling/modforslag |
| - (I venter på svar fra dem) | Venlig påmindelse | Rykker for svar |
| Har leveret, hjulpet eller anbefalet jer | Anerkendelse uden modkrav | Tak/anerkendelse |
| Skal håndteres af en anden end ejeren | Overdragelse eller orientering | Videresendelse med kontekst |

Passer ingen type (fx et rent informationssvar), så sig det og skriv frit - men stadig efter mailkonventionen og voice-profilen.

## 1. Bekræftelse

**Hvornår:** I siger ja til noget veldefineret - et tilbud, en mødedato, en leverance, en pris.

**Kernen:** Gentag præcis HVAD der bekræftes med tal og datoer fra kildematerialet. En bekræftelse der kun siger "det lyder godt", er en fremtidig tvist: om tre måneder er mailen det eneste bevis på hvad der blev aftalt.

**Skelet:**

```text
Emne: [Sag] - bekraeftet, [naeste konkrete skridt]

[Hilsen fra voice-profil]

Tak for [tilbuddet/forslaget]. Vi bekraefter:

- [Ydelse/vare - praecis som beskrevet i kildemailen]
- Pris: [beloeb + moms-status, KUN fra kildematerialet]
- [Dato/frist/opstart, KUN fra kildematerialet]

[Evt. naeste skridt: hvem goer hvad hvornaar]

[Afslutning fra voice-profil]
```

**Faldgruber:**

- Bekræft ALDRIG mere end der står i kildematerialet. Nævner modpartens mail ikke moms, så skriv [AFKLAR: inkl. eller ekskl. moms?] - udfyld ikke selv.
- Afviger jeres accept på bare ét punkt (anden dato, andet omfang), er det IKKE en bekræftelse - det er et modforslag. Skift type.
- En bekræftelse af pris eller kontraktvilkår markeres [KRÆVER DIN VURDERING: pris] - ejeren skal aktivt nikke.

## 2. Afslag/nej-tak

**Hvornår:** I siger nej til et tilbud, en forespørgsel, en invitation eller en ansøgning - og relationen skal overleve afslaget.

**Kernen:** Konklusionen først, én ærlig begrundelse, og kun en åben dør hvis den er reel. Et afslag uden begrundelse føles arrogant; et afslag med tre begrundelser lyder som bortforklaring. Én er rigtig.

**Skelet:**

```text
Emne: [Sag] - vi takker nej

[Hilsen]

Tak for [det konkrete: tilbuddet/invitationen/ansoegningen]. Vi gaar ikke videre denne gang.

[EN aerlig begrundelse: pris/timing/kapacitet/forkert match - fra ejerens input, aldrig opdigtet]

[KUN hvis reel: konkret aaben doer - "vender vi tilbage til X, kontakter jeg dig" / "sig til hvis I laver Y"]

[Afslutning]
```

**Faldgruber:**

- Digt aldrig en begrundelse. Har ejeren ikke givet én, så spørg (enkeltspor) eller skriv [AFKLAR: begrundelse - pris, timing eller andet?] (morgenrutine).
- "Vi ser frem til et fremtidigt samarbejde" uden konkret indhold er fyld - væk, medmindre døren er ægte.
- Afslag på jobansøgninger: kort, venlig, INGEN vurdering af personen ("du var for svag på X" inviterer til diskussion og kan være problematisk). GDPR-note: afslåede ansøgninger har begrænset opbevaringstid - flag det til `journalisering`.
- Afslag til en utilfreds kunde er ikke et afslag - det er en klagesag: [KRÆVER DIN VURDERING: klage].

## 3. Forhandling/modforslag

**Hvornår:** I vil samarbejdet, men ikke på de foreslåede vilkår - pris, frist, omfang, betalingsbetingelser.

**Kernen:** Anerkend det I KAN, afvis det specifikke vilkår (aldrig hele personen/tilbuddet), og giv et konkret modforslag. Et "det er for dyrt" uden tal er ikke en forhandling - det er en klage.

**Skelet:**

```text
Emne: [Sag] - modforslag paa [vilkaaret]

[Hilsen]

Tak for tilbuddet - indholdet ser rigtigt ud, og vi vil gerne videre.

Et punkt skal vi have justeret: [vilkaaret, citeret praecist fra kildemailen].
[Kort hvorfor - fra ejerens input]

Vores forslag: [konkret alternativ - tal, dato eller omfang. Fra ejerens input eller [AFKLAR: hvad er vores smertegraense?]]

Kan I arbejde med det, er vi klar til at [naeste skridt].

[Afslutning]
```

**Faldgruber:**

- Modforslagets tal kommer ALTID fra ejeren - aldrig fra din vurdering af hvad der "lyder rimeligt". Markér [KRÆVER DIN VURDERING: pris/vilkår] øverst.
- Afvis vilkåret, ikke arbejdet: "prisen ligger over vores ramme" - ikke "tilbuddet er for dyrt".
- Ét modforslag ad gangen. Tre samtidige krav i én mail læses som et nej.
- Er der en egentlig forhandling på vej (møde, flere runder, stort beløb), så henvis ejeren til `forhandlings-forberedelse` (01-direktionen) - denne skabelon dækker kun mailrunden.

## 4. Rykker for svar

**Hvornår:** Modparten skylder jer et svar, og fristen (eller rimelig tid) er passeret.

**Kernen:** Dansk rykkerkultur i første runde er venlig og antager det bedste: mailen er druknet, ikke ignoreret. Gør det maksimalt let at svare kort - stil ét lukket spørgsmål. Anden rykker er bestemt med konsekvens; efter to rykkere eskaleres til ejeren i stedet for en tredje.

**Skelet (1. rykker - venlig):**

```text
Emne: [Oprindelig emnelinje] - venlig paamindelse

[Hilsen]

Jeg gaar ud fra min mail fra [dato] er druknet - det sker for os alle.

Kort version: [en linjes resume af hvad I venter svar paa].

Kan du naa at vende tilbage senest [konkret dato]? Et hurtigt "ja/nej/behoever mere tid" er fint.

[Afslutning]
```

**Skelet (2. rykker - bestemt):**

```text
Emne: [Oprindelig emnelinje] - svar udbedes senest [dato]

[Hilsen]

Jeg har ikke hoert fra dig siden [dato for 1. rykker], saa nu saetter jeg en frist:
svarer du ikke senest [konkret dato], saa [konsekvens fra ejerens input: gaar vi videre med anden leverandoer / betragter vi tilbuddet som bortfaldet / ...].

[Afslutning]
```

**Faldgruber:**

- Konsekvensen i 2. rykker skal være reel og komme fra ejeren - en tom trussel underminerer næste rykker. [AFKLAR: hvad sker der hvis de ikke svarer?]
- Ingen passiv aggression ("som tidligere nævnt", "jeg tillader mig endnu en gang...").
- Rykker for BETALING af en faktura er IKKE denne type - det er `rykker-runde` (08-okonomi), som kender rentelovens regler om rykkergebyrer.
- Send aldrig rykkeren selv - kladde, som alt andet.

## 5. Tak/anerkendelse

**Hvornår:** Nogen har leveret godt, hjulpet jer, henvist en kunde eller strakt sig langt.

**Kernen:** Specifik og kort. "Tak for godt samarbejde" er tapet; "tak fordi du fik leverancen ud fredag aften" bliver husket. Ingen modkrav og intet salg i samme mail - så er det ikke en tak længere.

**Skelet:**

```text
Emne: Tak for [det konkrete]

[Hilsen]

[En til to saetninger: praecis hvad personen gjorde, og hvad det betoed for jer - gerne med konkret effekt]

[Afslutning]
```

**Faldgruber:**

- Maks 4-5 linjer. En lang takkemail begynder at handle om afsenderen.
- Kobl aldrig en tjeneste-anmodning på ("...og nu hvor jeg har dig: kunne du..."). Skal der spørges om noget, er det en separat mail.

## 6. Videresendelse med kontekst

**Hvornår:** En tråd skal overtages af eller orientere en tredjepart - en kollega, revisoren, en leverandør.

**Kernen:** Modtageren skal kunne handle UDEN at læse hele tråden. 3-5 linjers resumé øverst: hvad sagen er, hvad status er, hvad modtageren konkret skal gøre og inden hvornår. Og så det vigtigste: GDPR-tjek af hele trådhalen FØR videresendelse.

**Skelet:**

```text
Emne: [Sag] - til [handling/orientering], [frist hvis handling]

[Hilsen]

Jeg sender denne traad videre til dig. Kort version:

- Sagen: [en linje]
- Status: [en linje - hvad er aftalt/uafklaret]
- Din opgave: [praecis hvad modtageren skal goere - eller "kun til orientering"]
- Frist: [konkret dato eller "ingen"]

Traaden ligger nedenfor. [Evt.: "Jeg har fjernet X af hensyn til fortrolighed."]

[Afslutning]
```

**Faldgruber:**

- Gennemgå ALTID hele tråden nedefra før videresendelse: personoplysninger, interne priser, kommentarer om tredjeparter ("kunden er umulig at danse med") må ikke vandre med. Fjern eller anonymisér - og skriv i udkastet HVAD der er fjernet, så ejeren kan godkende det.
- Kan tråden ikke renses meningsfuldt, så anbefal en frisk mail med resumé i stedet for videresendelse.
- "Se nedenfor" uden resumé er ikke en videresendelse - det er at eksportere sit eget arbejde til modtageren.

## Markeringer

Fælles konventioner på tværs af alle typer:

| Markering | Betyder | Placering |
|---|---|---|
| `[AFKLAR: spørgsmål]` | Hul i kildematerialet - ejeren skal udfylde før afsendelse | I brødteksten, præcis hvor hullet er |
| `[ANTAGELSE: hvad]` | Udfyldt hul efter escape hatch - skal efterses | I brødteksten + opsummeret i Antagelser-sektionen |
| `[KRÆVER DIN VURDERING: årsag]` | Pris/jura/personale/klage - ejeren beslutter | Øverst i udkastets Status-sektion + i morgenoversigten |
| `[FØLSOMT - AFVENTER OK]` | Hard gate: helbred/konflikt/personale - intet udkast skrevet endnu | I Status-sektionen; mailen ligger øverst i morgenoversigten |

Alle [AFKLAR] og [ANTAGELSE] samles desuden i udkastfilens sektion "Antagelser og aabne spoergsmaal", så intet hul kan overses.
