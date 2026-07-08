# 13-ugers likviditetsskabelon

Skabelon og metode for det 13-ugers likviditetsark. Læs denne fil før arket bygges (trin 4 i arbejdsgangen).

## Indhold

1. [Arkets struktur](#arkets-struktur)
2. [Regnereglerne](#regnereglerne)
3. [Metode: betalingsadfærd for indbetalinger](#metode-betalingsadfaerd-for-indbetalinger)
4. [Faste og variable udbetalinger](#faste-og-variable-udbetalinger)
5. [Kolonnevejledning til typiske eksporter](#kolonnevejledning-til-typiske-eksporter)
6. [Statusnotat-skabelon](#statusnotat-skabelon)
7. [Eksempel (uddrag)](#eksempel-uddrag)

## Arkets struktur

Én kolonne pr. uge, 13 uger frem fra startbeholdningens dato. Rækkerne i fast rækkefølge:

| Række | Indhold |
|---|---|
| Uge | ISO-ugenummer + datointerval (fx "Uge 37: 07.09-13.09") |
| Primobeholdning | Ugens startsaldo = forrige uges ultimo |
| **Indbetalinger** | |
| - Debitorer | Åbne kundefakturaer, placeret efter forventet betalingsuge |
| - Andet ind | Momsrefusion, tilskud, ejerindskud m.m. - altid med kilde |
| Indbetalinger i alt | Sum |
| **Udbetalinger** | |
| - Løn (netto + A-skat/AM-bidrag) | Fast gentagelse pr. lønkørsel |
| - Skat og moms | Fra skattekalenderen (references/skattekalender.md) |
| - Kreditorer | Åbne leverandørfakturaer, på forfaldsdato (udbetalinger styrer man selv - her gælder forfald) |
| - Faste omkostninger | Husleje, leasing, abonnementer, forsikring - gentagelser |
| - Variable (estimat) | Gennemsnit fra bankhistorik, markeret [ANTAGELSE] |
| Udbetalinger i alt | Sum |
| Nettobevægelse | Ind i alt − ud i alt |
| **Ultimobeholdning** | Primo + nettobevægelse |
| Disponibel likviditet | Ultimo + uudnyttet kassekredit |
| Status | GRØN (over buffer) / RØD (under buffer) |

Bemærk asymmetrien: indbetalinger placeres efter forventet ADFÆRD, udbetalinger efter FORFALD. Man kan ikke styre hvornår kunder betaler, men man bestemmer selv hvornår man betaler - og arket skal vise det dyreste realistiske scenarie, ikke det pæneste.

## Regnereglerne

- Primo uge 1 = startbeholdningen fra interviewet (beløb + dato bekræftet af brugeren).
- Ultimo uge n = primo uge n + indbetalinger uge n − udbetalinger uge n.
- Primo uge n+1 = ultimo uge n. Ingen undtagelser - stemmer kæden ikke, er der en fejl.
- Buffer-tærskel: 1 måneds faste omkostninger, medmindre andet er aftalt. Status sættes på ULTIMO-saldoen, ikke på disponibel likviditet - kassekreditten er en reserve, ikke en indtægt.
- Runway = antal hele uger fra i dag til den første røde uge. Ingen røde uger: skriv "runway: over 13 uger".

## Metode: betalingsadfaerd for indbetalinger

Formålet er at placere hver åben kundefaktura i den uge hvor pengene realistisk kommer - ikke i forfaldsugen.

1. **Byg kundens mønster fra bankhistorikken.** Match de seneste 3-6 indbetalinger fra kunden mod fakturaernes forfaldsdatoer og beregn gennemsnitlig forsinkelse i dage. Eksempel: kunde har betalt 12, 9 og 15 dage efter forfald - brug +12 dage.
2. **Ingen historik?** Brug forfaldsdato + 10 dage og markér posten [ANTAGELSE].
3. **Allerede forfaldne fakturaer** placeres ALDRIG i uge 1 pr. automatik. Spørg brugeren: er der en aftale, en rykker i gang eller en tvist? Uden konkret svar: placer beløbet 2 uger ude og markér [ANTAGELSE]. Ved tvist: hold fakturaen HELT ude af prognosen og nævn den i notatet - et bestridt krav er ikke likviditet.
4. **Store enkeltfakturaer** (over ca. 10 % af periodens samlede indbetalinger) markeres særskilt i notatet - falder den ene betaling, falder prognosen.
5. Afrund til hele uger; en betaling "den 12." lander i den uge den 12. falder i.

## Faste og variable udbetalinger

- **Faste** (løn, husleje, leasing, abonnementer, forsikringer): læg ind som gentagelser med fast beløb og dato hen over alle 13 uger. Tjek at kvartalsposter (fx forsikring, acontoskat) ikke kun rammer første måned.
- **Variable** (varekøb, brændstof, småindkøb): beregn et ugegennemsnit fra de seneste 8-12 ugers bankhistorik, læg det ind i alle uger og markér rækken [ANTAGELSE]. Kendte større engangsudgifter (maskinkøb, deposit) lægges ind som enkeltposter efter interviewet.
- **Lønkørsel** er typisk outsourcet (DataLøn, Zenegy, revisor) - men udbetalingen rammer stadig kontoen. Husk at A-skat/AM-bidrag ofte hæves på en anden dato end nettolønnen; se skattekalenderen.

## Kolonnevejledning til typiske eksporter

Typiske kolonnenavne - brug dem til at tolke filerne, og spørg ved tvivl (maks. 2 tolkningsforsøg, derefter vis 5 rækker og spørg):

- **Bankeksport** (de fleste danske netbanker): Dato / Bogføringsdato, Tekst, Beløb (negativ = udbetaling), Saldo. Saldokolonnens seneste værdi skal stemme med brugerens oplyste startbeholdning - gør den ikke, så flag afvigelsen.
- **Debitorliste** (e-conomic: "Åbne poster, debitor"; Dinero: "Ubetalte fakturaer"; Billy: "Fakturaoversigt, ubetalte"): Fakturanr., Kunde, Fakturadato, Forfaldsdato, Beløb (typisk inkl. moms - det er bruttobeløbet der rammer banken), evt. Restbeløb. Brug Restbeløb hvis den findes.
- **Kreditorliste**: Leverandør, Fakturanr., Forfaldsdato, Beløb. Mangler kreditorlisten helt, så estimer fra bankhistorikkens leverandørbetalinger og markér [ANTAGELSE].

## Statusnotat-skabelon

Maks. 15 linjer, i denne rækkefølge:

1. **Konklusion i første linje** - kan løn, skat og kreditorer dækkes i hele perioden: ja/nej/kun hvis.
2. **Laveste punkt**: uge, ultimosaldo, og hvad der driver den (navngivne poster med beløb).
3. **Runway** i hele uger.
4. **De 2-3 største usikkerheder** (store enkeltfakturaer, uverificerede frister, estimater).
5. **Første handling** - én konkret, navngiven handling med beløb og deadline. Ved røde uger: hentet fra references/handlingskatalog.md.

Skriv beløb, uger og navne - aldrig "ser fornuftig ud" eller "værd at holde øje med". Se skidt/godt-kontrasten i SKILL.md.

## Eksempel (uddrag)

| | Uge 37 | Uge 38 | Uge 39 |
|---|---|---|---|
| Primo | 310.000 | 262.000 | 41.000 |
| Debitorer | 85.000 | 40.000 | 190.000 |
| Andet ind | 0 | 0 | 0 |
| Løn | -95.000 | 0 | -95.000 |
| Skat og moms | 0 | -180.000 | -38.000 |
| Kreditorer | -20.000 | -63.000 | -12.000 |
| Faste | -12.000 | -12.000 | -12.000 |
| Variable [ANTAGELSE] | -6.000 | -6.000 | -6.000 |
| **Ultimo** | **262.000** | **41.000** | **68.000** |
| Disponibel (kassekredit 200.000) | 462.000 | 241.000 | 268.000 |
| Status (buffer 120.000) | GRØN | RØD | RØD |

Alle tal i eksemplet er opdigtede - de viser kun strukturen. Uge 38 er rød selv om disponibel likviditet er positiv: bufferen måles på ultimosaldoen.
