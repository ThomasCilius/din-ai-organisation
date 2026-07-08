# Slettefrister: danske udgangspunkter og sletteliste-skabelon

Indhold:

1. [Princippet: opbevaringsbegrænsning](#1-princippet-opbevaringsbegraensning)
2. [Hård regel: udgangspunkter, aldrig facit](#2-hard-regel-udgangspunkter-aldrig-facit)
3. [Danske udgangspunkter pr. datatype](#3-danske-udgangspunkter-pr-datatype)
4. [Skabelon: sletteliste](#4-skabelon-sletteliste)
5. [Kvartalsrutinen: sletteplan](#5-kvartalsrutinen-sletteplan)

## 1. Princippet: opbevaringsbegrænsning

Artikel 5, stk. 1, litra e: personoplysninger må kun opbevares så længe det er nødvendigt for formålet. Der findes ingen universel GDPR-frist - fristen følger formålet:

- Kræver anden lovgivning opbevaring (fx bogføringsloven), er DEN fristen.
- Ellers: så længe der er et dokumenterbart, aktivt behov - og en begrundelse i slettelisten.
- "Det kunne være rart at have" er ikke et formål. Uden formål: slet eller anonymisér.

Slettelisten er broen fra princip til drift: hver datatype får en frist, en kilde, en ansvarlig og en metode - så gennemgangen kan gøres på en time i kvartalet i stedet for at være et evigt dårligt samvittighedspunkt.

## 2. Hård regel: udgangspunkter, aldrig facit

**Alle frister i afsnit 3 er UDGANGSPUNKTER fra dansk praksis - de SKAL verificeres i Datatilsynets aktuelle vejledninger på datatilsynet.dk, før de skrives ind som gældende.** Lovgivning og praksis ændrer sig, og denne fil bliver ikke automatisk opdateret. Derfor:

- Skriv aldrig en frist uden kilde og uden feltet "verificeret: [dato]".
- Er fristen ikke verificeret endnu, står der "verificeret: [MANGLER]" - og punktet ryger på listen over åbne spørgsmål.
- Ved modstrid mellem denne fil og Datatilsynets aktuelle vejledning vinder Datatilsynet altid.

## 3. Danske udgangspunkter pr. datatype

| Datatype | Udgangspunkt | Kilde at verificere | Bemærk |
|---|---|---|---|
| Bogføringsmateriale (bilag, fakturaer, lønsedler) | 5 år fra udgangen af regnskabsåret | Bogføringsloven - verificér på datatilsynet.dk/virk.dk | Lovkrav om opbevaring: må IKKE slettes før tid |
| Jobansøgninger (afslag) | Typisk 6 måneder efter afslag | Datatilsynets praksis | Længere kræver typisk samtykke fra ansøgeren |
| Personalesager efter fratræden | Typisk op til 5 år efter fratræden | Datatilsynets vejledning + forældelsesregler | Differentiér: ikke alt i mappen behøver samme frist |
| Kunde- og kontraktdata efter ophør | Typisk 3-5 år efter sidste aktivitet | Forældelsesloven (3 år som pejlemærke) + bogføringskrav | Afhænger af reklamations- og forældelsesrisiko |
| Nyhedsbrevsdata efter afmelding | Slettes hurtigt; dokumentation for samtykke/afmelding gemmes dog en periode | Datatilsynet + Forbrugerombudsmandens praksis | Afmelding er ikke det samme som "slet alt" - dokumentationspligt |
| Videoovervågning | Typisk kort frist (dage/uger) | Tv-overvågningsloven + Datatilsynet | Særregler; skiltning og formål skal være på plads |
| Sygefravær/helbredsdokumenter | Kortest muligt i forhold til formålet | Datatilsynets vejledning om ansættelsesforhold | Følsomt: strammere krav end resten af personalesagen |
| Hjemmesidestatistik/cookies | Følger cookie-samtykket og leverandørens vilkår | Cookiebekendtgørelsen + Datatilsynet | Ofte styret i cookieværktøjet, ikke manuelt |

Dømmekraftsregler:

- **Lovpligtig opbevaring slår sletteønske.** En kunde der kræver alt slettet, kan ikke kræve bogføringsbilag slettet før bogføringslovens frist - se references/anmodninger-og-brud.md.
- **Anonymisering er et alternativ til sletning** hvor statistik skal bevares: fjernes enhver kobling til personen, er data ikke længere persondata. Men halvhjertet "pseudonymisering" tæller ikke som sletning.
- **Én frist pr. formål, ikke pr. system.** Samme kundedata i CRM og bogføring kan have to forskellige frister - det er korrekt, ikke en fejl.

## 4. Skabelon: sletteliste

Brug præcis disse kolonner i `slettefrister.md`:

```markdown
| Datatype/aktivitet | System | Frist (udgangspunkt) | Hjemmel/kilde | Verificeret (dato) | Ansvarlig | Metode | Status |
|---|---|---|---|---|---|---|---|
| [fx jobansøgninger, afslag] | [fx mail + rekrutteringsmappe] | [fx 6 mdr. efter afslag] | [fx Datatilsynets praksis] | [dato eller MANGLER] | [navn/rolle] | Sletning / anonymisering | OK / forfalden / [MANGLER] |
```

Hver række skal kunne besvares med ja/nej til: "Ved vi hvor det ligger, hvornår det skal væk, hvem der gør det, og hvordan?" Kan et felt ikke udfyldes, står der [MANGLER] - aldrig et gæt.

## 5. Kvartalsrutinen: sletteplan

Ved kvartalsgennemgang producerer skillen en **sletteplan** - et kladdeafsnit i `slettefrister.md` under "Næste gennemgang":

1. List alle rækker hvor fristen er overskredet eller forfalder inden næste kvartal.
2. Angiv pr. række: hvad, hvor, hvor meget (estimat), og hvem der skal udføre det.
3. Ejeren godkender og UDFØRER selv sletningerne - skillen sletter aldrig data, og den markerer først status "OK" når ejeren har bekræftet udførelsen.
4. Notér gennemgangen i ændringsloggen i `gdpr-fortegnelse.md` med dato.

Så bliver "sletterutiner: gennemgang af data mod slettefrister" en overskuelig, tilbagevendende opgave med et dokumenteret spor - præcis det Datatilsynet spørger efter.
