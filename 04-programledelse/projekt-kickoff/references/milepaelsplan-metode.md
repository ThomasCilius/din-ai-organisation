# Milepaelsplan-metoden

Metode og skabelon til `milepaelsplan-[projekt].md`. Læs denne fil FØR planlægningen.

## Indhold

1. [Baglaens planlaegning](#baglaens-planlaegning)
2. [Milepaele som tilstande](#milepaele-som-tilstande)
3. [Estimeringsdisciplin og buffer](#estimeringsdisciplin-og-buffer)
4. [Rullende planlaegning](#rullende-planlaegning)
5. [Skabelon](#skabelon)

## Baglaens planlaegning

Planlæg fra slutterminen og bagud - ikke fra i dag og fremad. Forlæns planlægning fylder kalenderen med aktiviteter og opdager først til sidst at tiden ikke rækker; baglæns planlægning afslører det på dag ét.

Fremgangsmåde:

1. Start ved slutterminen. Notér dens binding (kontrakt, sæson, lovkrav - eller frit valgt). En bunden dato er et vilkår; en frit valgt dato må planen gerne flytte.
2. Spørg bagud: "Hvad skal være SANDT umiddelbart før slutmilepælen kan nås?" Det er næstsidste milepæl. Gentag til du står ved i dag.
3. Sæt dato på hver milepæl - stadig bagfra. Datoerne skal respektere den reelle kapacitet (se estimeringsdisciplin nedenfor).
4. Rækker kæden ikke tilbage til i dag uden at datoerne kolliderer, har du opdaget et umuligt projekt FØR det startede. Det er planens største gave: sig det højt, og lad projektejeren vælge mellem senere sluttermin, færre leverancer eller flere ressourcer. Vælg aldrig selv - og "pres bare planen" er ikke en løsning, det er en udskydelse af sammenstødet.

## Milepaele som tilstande

5-10 milepæle. Færre giver ingen styring mellem start og slut; flere er en aktivitetsplan i forklædning.

Hver milepæl formuleres som en TILSTAND - noget der ER sandt eller ikke sandt. Testen: kan spørgsmålet "er milepælen nået?" besvares med ja eller nej uden diskussion? Aktiviteter kan man altid "være i gang med" - tilstande kan man ikke forhandle om. Det er forskellen på et statusmøde der styrer, og et der lytter til stemninger.

| SKIDT (aktivitet) | GODT (tilstand) |
|---|---|
| Arbejde med kontrakt | Kontrakt underskrevet |
| Udvikling af modul | Modul testet og accepteret af [navn] |
| Dialog med leverandører | Leverandør valgt og bekræftet |
| Oplæring i gang | Alle brugere har gennemført oplæring |
| Se på integrationen | Integration i drift uden kendte fejl |

Hver milepæl får desuden en dato og en navngiven ansvarlig. En milepæl uden ansvarlig er et håb.

## Estimeringsdisciplin og buffer

**Reel kapacitet, ikke teoretisk.** SMV-medarbejdere har drift ved siden af projektet. Regn med 20-50 % reel projekttid - aldrig 100 %. Er svaret "Jonas er fuldtid på projektet", så spørg hvem der tager Jonas' drift imens; kan ingen svare, regn med 50 % og notér det som [ANTAGELSE].

**Synlig buffer, ikke skjult luft.** Læg én samlet, synlig buffer som selvstændig post sidst i planen (tommelfingerregel: 15-25 % af den samlede varighed, mere ved mange ubekendte). Aldrig skjult luft i hver enkelt aktivitet. Hvorfor: en synlig buffer er en fælles ressource ledelsen kan disponere og følge ("vi har brugt halvdelen af bufferen, og vi er halvvejs - fint"). Skjult luft i hver aktivitet bliver derimod bare brugt - arbejde udvider sig til den tid der er afsat - og når noget så faktisk går galt, er der intet tilbage.

**Bufferen er ikke pynt.** Æder de første faser af bufferen, er det et tidligt faresignal der skal nævnes i statusrapporteringen - ikke noget der tyst omdøbes.

**Estimater er antagelser.** Datoer der bygger på dine egne skøn og ikke på brugerens oplysninger, markeres [ANTAGELSE]. Ved projektlukning sammenlignes estimat og faktisk - det er virksomhedens kalibreringsdata til næste projekt (`projekt-lukning` samler op i `laeringslog.md`).

## Rullende planlaegning

Detaljeplan (opgaver, hvem, hvornår) laves KUN for nærmeste fase - frem til næste eller næstnæste milepæl. Resten af projektet står som milepæle med datoer og ansvarlige.

Hvorfor: detaljer om fase 4 lagt på dag 1 er gæt der skal vedligeholdes eller - mere realistisk - ignoreres. Rullende planlægning giver præcision hvor den kan bruges, og ro hvor den ikke kan. Ved hver nået milepæl detaljeplanlægges næste fase - det er en naturlig opgave til projektets statusrytme.

## Skabelon

```markdown
# Milepaelsplan: [projektnavn]

Dato: [aar-md-dag] | Status: KLADDE - afventer projektejerens godkendelse

## Sluttermin og binding

Sluttermin: [dato]. Binding: [kontrakt/saeson/lovkrav/valgt frit].

## Milepaele

| # | Milepael (tilstand) | Dato | Ansvarlig |
|---|---|---|---|
| 1 | [tilstand] | [dato] | [navn] |
| 2 | [tilstand] | [dato] | [navn] |
| ... | | | |
| n | [slutmilepael - projektets leverancer accepteret] | [dato] | [navn] |
| B | Buffer ([X uger] - faelles, disponeres af projektejer) | [periode] | [projektejer] |

## Detaljeplan for naermeste fase (frem til milepael [#])

| Opgave | Hvem | Faerdig senest |
|---|---|---|
| [opgave] | [navn] | [dato] |

Naeste detaljeplan laegges naar milepael [#] er naaet.

## Kapacitetsgrundlag

| Deltager | Timer/uge (reel projekttid) | Bemaerkning |
|---|---|---|
| [navn] | [timer] | [drift ved siden af / [ANTAGELSE]] |

## Antagelser og aabne spoergsmaal

- [ANTAGELSE]: [estimat/kapacitet der bygger paa skoen]
- [AFKLARES]: [dato eller ressource der mangler beslutning]
```
