# Rubrikker pr. leverancetype

Hver rubrik siger to ting: hvilke tre kritikere du læser udkastet med i trin 3,
og hvilke mekaniske checks du kører i trin 5. Kritikerrollernes arbejdsmåde står
i `kritikerroller.md`.

Rubrikken "Al dansk tekst" gælder oven i alle de øvrige.

---

## Al dansk tekst

Hårde regler, ufravigelige:

- **Retskrivning.** Slå tvivlsomme ord op frem for at gætte. Skal hele teksten
  screenes, kalder du skillen `dansk-korrektur`.
- **Bindestreger ( - ), aldrig lange tankestreger (—, –).**
- **Ret aldrig et bevidst stilvalg.** Konsekvent startkomma eller konsekvent
  fravalg af det er et valg, ikke en fejl. Flag det højst én gang.
- **AI-kliché-scan.** Ud med "i en verden hvor", "det er vigtigt at bemærke",
  "lad os dykke ned i", tomme punchlines og symmetriske tre-opremsninger, der
  lugter af sprogmodel. Er der meget af det, kalder du `menneskeliggoer`.
- **Kildehenvisninger peger på primærkilden.** "Studier viser" uden navn ryger ud.

**Kritikerpanel:** modtageren · sprogrøgteren · redaktøren.

**Mekaniske checks:** ingen tankestreger · ingen pladsholdere tilbage
(`[navn]`, `xx`, `TODO`) · alle tal og datoer stemmer med kilden · teksten er
læst igennem én gang fra ende til anden efter sidste rettelse.

---

## Indhold til egne kanaler (blog, nyhedsbrev, LinkedIn, opslag)

1. **Kilder før skrivning.** Skriv aldrig i blinde om et emne, du ikke har
   materiale på. Har virksomheden en kanalspecifik stilfil, læses den først.
2. **Én pointe pr. stykke indhold.** Kan du ikke sige den i én sætning, er
   emnet for bredt til formatet.
3. **Hooken skal kunne stå alene.** Første linje afgør, om resten læses.
4. **Figurer og tabeller verificeres visuelt** før publicering. Tekst må aldrig
   overlappe akser eller data.

**Kritikerpanel:** modtageren · redaktøren · sprogrøgteren.

**Mekaniske checks:** links virker og peger det rigtige sted · billeder har
alt-tekst · længden passer kanalen · én tydelig CTA, ikke tre.

---

## Salgs- og marketingcopy (landingsside, salgsmail, annonce, kampagnetekst)

Det strategiske lag ligger før linjerne. Ret ikke kommaer i en tekst, hvis
bærende idé ikke holder.

- **Bærende idé og mekanisme.** Hvorfor virker tilbuddet - ikke bare hvad det er.
- **Bevidsthedstrin.** Møder teksten læseren dér, hvor vedkommende faktisk står,
  eller taler den til en, der allerede er overbevist?
- **Tilbud og CTA.** Ét tilbud, ét næste skridt.
- **Emotionel rød tråd** fra hook til CTA, uden spring.

**Kritikerpanel:** copychefen · linjelæseren · sprogrøgteren.

**Mekaniske checks:** hver påstand har belæg (markedsføringslovens § 5) ·
kunstig knaphed er fjernet · priser og vilkår står korrekt · alle links testet.

**Verdikt til brugeren:** parathed 1-10 · de 3 ændringer, der flytter mest ·
hvad der allerede virker · kill-listen.

---

## Strategi- og beslutningsoplæg

**Kritikerpanel:** djævelens advokat · økonomen · operatøren.

**Krav til leverancen:**

- **ÉN anbefaling**, ikke et katalog med fire lige gode muligheder.
- **Tal hvor de findes**, og en åben markering hvor de ikke gør.
- **En eksplicit linje: "det her ville ændre min konklusion: ..."** Kan du ikke
  skrive den, har du ikke tænkt beslutningen igennem.

**Mekaniske checks:** alle tal sporet til en kilde · opportunity cost nævnt ·
tidsforbruget er vurderet mod den kapacitet, der faktisk findes.

Skal beslutningen dokumenteres skriftligt til bestyrelse, bank eller investor,
afleverer du videre til `beslutningsgrundlag`.

---

## Kundemateriale (tilbud, slides, mails til kunder)

- Modtagerens navn, virksomhed og kontekst er korrekte og konkrete. Ingen
  skabelonrester.
- **Pris og scope står eksplicit.** Intet "efter aftale", medmindre brugeren
  udtrykkeligt har bedt om det.
- **Præcis ét tydeligt næste skridt** for modtageren.
- Læs den danske tekst "højt" for tone: ville afsenderen sige den sætning i et
  møde med kunden?

**Kritikerpanel:** modtageren · copychefen · redaktøren.

**Mekaniske checks:** navne og firmanavne stavet rigtigt · beløb og moms stemmer ·
acceptfrist og forbehold står der · vedhæftninger er faktisk vedhæftet.

Er det et bindende tilbud, skrives det med `tilbud` og køres derefter gennem
dette loop.

---

## Kode

- Match eksisterende konventioner i projektet. Minimal diff. Ingen "forbedringer"
  af naboliggende kode, som opgaven ikke bad om.
- Ny logik får tests først, hvor det er praktisk (rød → grøn).
- **"Færdig" kræver: build, lint og typecheck grønt - kørt og vist, ikke antaget.**
- Kør en kodegennemgang på ændringen før aflevering. Kritiske og høje fund rettes.

**Kritikerpanel:** angriberen · operatøren · redaktøren (læsbarhed).

**Mekaniske checks:** build grønt · tests grønne · ingen debug-udskrifter ·
ingen hemmeligheder i diffen.
