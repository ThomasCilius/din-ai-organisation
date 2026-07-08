# Exit-protokol: vidensoverdragelse når en medarbejder stopper

Læs denne fil når brugeren nævner at en medarbejder stopper, er opsagt eller har sagt op. Fratræden er den vigtigste anledning til videnfil-arbejde i en SMV - og den har en hård deadline.

## Indhold

1. [Trin 0: deadline og tidsbudget](#1-trin-0-deadline-og-tidsbudget)
2. [Prioriteret rækkefølge - de fem områder](#2-prioriteret-raekkefoelge---de-fem-omraader)
3. [Spørgsmål pr. område](#3-spoergsmaal-pr-omraade)
4. [Adgangsliste - UDEN koder](#4-adgangsliste---uden-koder)
5. [Følsomhed under exit-interview](#5-foelsomhed-under-exit-interview)
6. [Oversigtsfilen](#6-oversigtsfilen)
7. [Tidsnød: hvad du skærer fra først](#7-tidsnoed-hvad-du-skaerer-fra-foerst)

## 1. Trin 0: deadline og tidsbudget

Spørg som det allerførste - ét spørgsmål ad gangen:

1. "Hvornår er sidste arbejdsdag?"
2. "Hvor mange interviewsessioner a cirka 30 minutter kan I realistisk nå inden da?"

Regn baglæns: hvert af de fem områder nedenfor kræver typisk én session. Er der færre sessioner end områder, så dæk områderne i prioriteret rækkefølge og notér resten som udestående huller i oversigtsfilen. Sig det højt til brugeren: "Vi når 1-3 - område 4 og 5 bliver huller medmindre I finder en session mere."

Interviewet kan føres med den fratrædende selv eller med ejeren/kollegaen der kender området - notér i kildelinjen hvem der faktisk svarede.

## 2. Prioriteret rækkefølge - de fem områder

Fast prioritering - begrund aldrig en anden rækkefølge med at noget "er nemmere at tage først":

1. **Igangværende sager** - de forsvinder eller fejler inden for uger hvis ingen tager over.
2. **Kundeaftaler og -historik** - uskrevne rabataftaler, særlige ønsker, hvem man ringer til hos kunden.
3. **Leverandørkontakter** - hvem man bruger, hvem man undgår, og hvorfor.
4. **Hvor tingene ligger** - filer, mapper, systemer, fysiske nøgler og papirer.
5. **Uskrevne aftaler** - alt det der "bare er sådan": interne kutymer, stiltiende aftaler med kunder og kolleger.

Rækkefølgen følger forfaldstid: det øverste koster penge først. Hvert emne inden for et område bliver sin egen videnfil (skabelonen fra SKILL.md, maks. 10 linjer, kildelinje med person + dato).

## 3. Spørgsmål pr. område

Ét spørgsmål pr. besked - listerne her er din huskeliste, ikke en byge.

**1. Igangværende sager**
- "Nævn de sager/opgaver du har åbne lige nu - bare overskrifter." (lav derefter én videnfil pr. væsentlig sag)
- Pr. sag: "Hvad er næste skridt, og hvornår skal det ske?"
- "Hvad har du lovet kunden som ikke står skrevet nogen steder?"
- I mål når: hver åben sag har næste skridt + deadline + kontaktperson.

**2. Kundeaftaler og -historik**
- "Hvilke kunder har særaftaler - rabatter, betalingsfrister, faste leverancer?"
- "Hvem ringer du til hos kunden, og hvem skal man IKKE ringe til?"
- "Hvilken kunde er mest på vippen - og hvorfor?"
- I mål når: hver særaftale har kunde + indhold + evt. hvor den er (eller ikke er) dokumenteret.

**3. Leverandørkontakter**
- "Hvilke leverandører bruger du fast - og hvem er din kontaktperson?"
- "Er der leverandører du er holdt op med at bruge? Hvorfor?"
- "Hvad gør du når den faste leverandør ikke kan levere?"
- I mål når: navn + kontaktperson + hvorfor netop dem + plan B.

**4. Hvor tingene ligger**
- "Hvilke mapper og systemer arbejder du i dagligt - klik dig ind og læs stierne op."
- "Er der noget der KUN ligger lokalt på din maskine eller i din indbakke?" (kritisk - det forsvinder med kontoen)
- "Fysiske ting: nøgler, papirer, udstyr - hvor er de?"
- I mål når: alt personbåret er lokaliseret, og lokalt/indbakke-indhold er markeret til flytning.

**5. Uskrevne aftaler**
- "Hvad ville din efterfølger blive overrasket over efter en måned?"
- "Er der noget du gør anderledes end den officielle måde - fordi det virker bedre?"
- "Hvilke interne kutymer skal man kende for ikke at træde nogen over tæerne?"
- I mål når: mindst 2-3 konkrete kutymer/afvigelser med begrundelse.

## 4. Adgangsliste - UDEN koder

Adgange noteres som liste over HVAD der findes, ALDRIG med selve koderne. Koder overdrages via password-manager eller mundtligt mellem mennesker - aldrig i en tekstfil.

Skabelon (indgår i oversigtsfilen):

```markdown
## Adgange (uden koder)
| System/sted | Kontotype | Hvem har ellers adgang | Handling før sidste dag |
|---|---|---|---|
| e-conomic | personlig bruger | Lise (admin) | overdrag sager, luk bruger |
| Fælles indbakke info@ | delt kodeord | hele kontoret | skift kodeord efter fratræden |
| Alarmkode kontor | fysisk kode | ejer | skift kode |
```

Kolonnen "Handling før sidste dag" er anbefalinger til ejeren - skillen udfører aldrig lukning eller ændring af adgange selv.

## 5. Følsomhed under exit-interview

- Skriv aldrig vurderinger af personen, konflikter, sygdom eller årsager til fratrædelsen ind i videnfiler eller oversigtsfil. Kommer det op: lyt kort, udelad det, og henvis til at det tages mundtligt med ejeren.
- Er fratrædelsen konfliktfyldt (bortvisning, tvist, fritstilling under uenighed): stop interviewet og bed ejeren afklare rammerne først - evt. med rådgiver. Fortsæt kun efter grønt lys.
- Nævner medarbejderen kundedata eller persondata der måske er håndteret forkert: notér det IKKE i videnfilen - eskalér direkte til ejeren og henvis til `gdpr-fortegnelse`.

## 6. Oversigtsfilen

Én fil pr. fratræden: `brain/overdragelse-[navn]-[aar-mm-dd].md` (datoen er sidste arbejdsdag). Fast struktur:

```markdown
# Overdragelse: [Navn], sidste arbejdsdag [ÅÅÅÅ-MM-DD]
## Dækkede emner
- [emne] -> [sti til videnfil]
## Adgange (uden koder)
[tabellen fra afsnit 4]
## Udestående huller
- [område/emne der IKKE blev dækket] - [konsekvens + hvem der kan spørges i stedet]
## Kilder
- Interviews med [navn(e)], [datoer]
```

Alle fire sektioner er altid med - en tom "Udestående huller" skrives som "Ingen kendte" frem for at udelades, så ejeren kan se at spørgsmålet er stillet.

## 7. Tidsnød: hvad du skærer fra først

- Skær i dybden, ikke i bredden: hellere fem korte videnfiler om alle åbne sager end én perfekt om den første.
- Område 4 kan delvist erstattes af en skærmdeling hvor medarbejderen læser stier op - hurtigste udbytte pr. minut.
- Område 5 er vigtigst at tage mens medarbejderen stadig VIL fortælle - prioritér det op hvis stemningen er god og ned hvis den er anstrengt.
- Alt der skæres fra skal stå under "Udestående huller" med konsekvens - et hul man kender er en opgave; et hul man ikke kender er en ulykke.
