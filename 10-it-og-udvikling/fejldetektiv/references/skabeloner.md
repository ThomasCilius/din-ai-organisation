# Skabeloner: fejllog og fejlrapport

Brug disse skabeloner ordret, så felterne bliver komplette. `fejllog.md` er til dig selv (voksende vidensbase). Fejlrapporten er til leverandøren (sparer supportrunder på timepris).

## Indhold

1. fejllog.md - post-skabelon
2. Fejlrapport til leverandør - skabelon
3. Udfyldt eksempel: god fejlrapport
4. Modeksempel: hvorfor den vage rapport koster penge

---

## 1. fejllog.md - post-skabelon

Tilføj en ny, dateret post øverst under overskriften. Overskriv aldrig tidligere poster - loggen er en vidensbase, hvor gamle fejl gør nye hurtigere at løse.

```markdown
# Fejllog

## [ÅÅÅÅ-MM-DD] [kort symptom-titel]
**Fejltype:** brugerfejl / dataproblem / kode-opsætning / leverandør nede
**System:** hvilket system/side/funktion
**Symptom:** hvad brugeren konkret oplever
**Reproduktionsskridt:**
1. ...
2. ...
3. ...
**Forventet vs. faktisk:** hvad skulle ske / hvad skete i stedet
**Fejlbesked (ordret):** kopiér teksten præcist, eller "ingen"
**Isolation:** hvornår virkede det sidst + hvad er ændret siden
**Afprøvede hypoteser:**
- H1: ... -> afkræftet fordi ...
- H2: ... -> afkræftet fordi ...
- H3: ... -> bekræftet
**Diagnose (bevist årsag):** den præcise årsag + hvorfor den giver netop dette symptom
**Rettelse:** hvad blev ændret - ELLER: fejlrapport sendt til [leverandør] den [dato]
**Verifikation:** hvordan det blev bekræftet rettet (genskabte skridt, fejl væk, intet andet brudt)
**Åbne spørgsmål:** hvad der stadig er uafklaret, eller "ingen"
```

Ramte 3-forsøgs-stopklodsen uden en bevist diagnose? Log posten alligevel med de tre afprøvede hypoteser og "Diagnose: ikke fundet - rullet tilbage til [tilstand], eskaleret til [leverandør]". Det er stadig værdifuld viden for næste forsøg.

---

## 2. Fejlrapport til leverandør - skabelon

En leverandør kan først rette en fejl, de kan reproducere. Alt der mangler her, køber en runde spørgsmål tilbage - på timepris. Udfyld hvert felt.

```markdown
# Fejlrapport: [kort beskrivelse]

**System/side:** hvor fejlen er (fx URL, modul, funktion)
**Hvornår begyndte det:** dato + hvad der eventuelt skete lige før (opdatering, ny data)
**Hvor ofte:** hver gang / nogle gange (beskriv mønsteret) / kun for bestemte brugere eller data

## Miljø
- Browser + version: (fx Chrome 126)
- Enhed + styresystem: (fx Windows 11-pc / iPhone, iOS 17)
- Bruger/rolle: (hvilken konto eller rettighed)

## Reproduktion (skridt for skridt)
1. ...
2. ...
3. ...

## Forventet resultat
Hvad SKULLE der ske.

## Faktisk resultat
Hvad der reelt sker.

## Fejlbesked (ordret)
Kopiér teksten præcist, eller skriv "ingen synlig fejlbesked".

## Vedhæftet
- Skærmbillede (helst med fejlen og evt. konsol/fejlbesked synlig)
- Evt. skærmoptagelse hvis fejlen er svær at beskrive

## Hvad vi allerede har udelukket
Fx: sker i flere browsere; sker for flere brugere; ikke løst af cache-rydning.
```

Aflever ALTID som udkast til brugeren. Du sender ikke rapporten selv.

---

## 3. Udfyldt eksempel: god fejlrapport

```markdown
# Fejlrapport: Kontaktformular sender ikke

**System/side:** thomascilius.dk/kontakt
**Hvornår begyndte det:** 5. juli, efter WordPress-plugin-opdatering samme morgen
**Hvor ofte:** hver gang, for alle testede brugere

## Miljø
- Browser + version: Chrome 126 og Safari 17
- Enhed + styresystem: Windows 11-pc og MacBook
- Bruger/rolle: ikke-indlogget besøgende

## Reproduktion (skridt for skridt)
1. Gå til /kontakt
2. Udfyld navn, e-mail og besked
3. Tryk "Send"

## Forventet resultat
Kvitteringsside vises, og vi modtager mailen i indbakken.

## Faktisk resultat
Knappen skifter til "Sender..." og fryser. Ingen kvittering, ingen mail modtages.

## Fejlbesked (ordret)
I browserens konsol: "500 (Internal Server Error) - POST /api/contact"

## Vedhæftet
- Skærmbillede af frossen knap + konsolfejl

## Hvad vi allerede har udelukket
Sker i både Chrome og Safari, på to maskiner, for tre forskellige testpersoner. Cache-rydning løste det ikke. Begyndte præcist ved plugin-opdateringen kl. 08.
```

Hvorfor den virker: leverandøren kan reproducere fejlen og har allerede det stærkeste spor (opdateringen kl. 08) uden at spørge om noget.

---

## 4. Modeksempel: hvorfor den vage rapport koster penge

> "Hej. Hjemmesiden virker ikke, kontaktformularen er død. Det haster, kan I fikse det hurtigst muligt?"

Hvad leverandøren nu MÅ spørge om, før de kan begynde - hver linje er en supportrunde på timepris:
- Hvilken side, hvilken formular?
- Hvad betyder "død" - fejlbesked, fryser, forsvinder?
- Hvilken browser og enhed?
- Sker det for alle eller kun dig?
- Hvornår begyndte det, og skete der noget lige før?

Resultatet: en dags forsinkelse og en regning for fejlsøgning, du selv kunne have sparet med fem minutters udfyldning af skabelonen i afsnit 2.
