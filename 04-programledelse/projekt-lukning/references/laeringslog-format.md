# Læringslog-format - regler der kan genbruges

`laeringslog.md` er virksomhedens fælles hukommelse på tværs af projekter. `projekt-kickoff` læser den ved hver ny projektstart - derfor skal hver læring kunne handles på af én der IKKE var med i det gamle projekt. Det er hele testen.

## Indhold

1. [Filformat](#1-filformat)
2. [Regel-formens anatomi](#2-regel-formens-anatomi)
3. [Eksempelsamling - gode læringer](#3-eksempelsamling---gode-laeringer)
4. [Skidt til godt - omskrivninger](#4-skidt-til-godt---omskrivninger)
5. [Vedligehold af loggen](#5-vedligehold-af-loggen)

## 1. Filformat

Én fælles fil for hele virksomheden: `laeringslog.md` i brain-mappen/arbejdsområdet - ikke én pr. projekt (så bliver den aldrig læst). Nye læringer TILFØJES nederst i deres kategori; eksisterende linjer overskrives aldrig (Aldrig-regel 6: plan godkendes før du skriver).

Strukturér loggen med kategorioverskrifter og én læring pr. punkt:

```
# Læringslog

> Læses af projekt-kickoff ved hver projektstart. Én læring pr. linje, i regel-form.

## Estimering
- [2026-03] [webshop-projektet] Når vi estimerer opgaver med eksterne integrationer, så gang estimatet med 2 - begge integrationer i webshoppen tog det dobbelte. (aktiv)

## Leverandører og kontrakter
- ...

## Scope og ændringer
- ...

## Kommunikation og møder
- ...

## Økonomi
- ...

## Teknik og værktøjer
- ...
```

Felter pr. læring: **[år-måned] [projekt] regel (status)**. Datoen og projektet gør det muligt at spore reglen tilbage; status er `aktiv` eller `forældet` (afsnit 5).

Findes filen ikke: foreslå at oprette den med skelettet ovenfor (tomme kategorier udelades), og få planen godkendt før du skriver.

## 2. Regel-formens anatomi

En læring har tre led:

1. **Situation:** "Når vi [genkendelig situation næste projekt også kan stå i]..."
2. **Handling:** "...så [konkret handling nogen kan udføre]..."
3. **Begrundelse:** "...- [én linje: hvad skete der i dette projekt]."

Testen: kan `projekt-kickoff` GØRE noget med reglen ved næste projektstart uden at spørge nogen? Hvis ikke, er det ikke en læring - det er en anekdote.

Krav:
- Højst 2 linjer pr. læring. Kan den ikke siges kort, er reglen ikke fundet endnu.
- 3-5 læringer pr. projekt, aldrig flere. Ti læringer betyder at ingen af dem er vigtige.
- Ingen navne på personer (jernloven gælder også her). Roller er fint: "projektejeren", "leverandøren".
- Ingen satser, priser eller lovhenvisninger fra hukommelsen - står der et tal, kommer det fra projektets egne data.

## 3. Eksempelsamling - gode læringer

Brug disse som kalibrering af niveau og form - ikke som indhold der kopieres:

**Estimering**
- Når projektdeltagere har drift ved siden af, så regn med højst 50 % reel projekttid og skriv timetallet ind i aftalen med nærmeste leder - vi planlagde med fuld tid og gled 2 måneder.
- Når vi estimerer noget vi aldrig har prøvet før, så indlæg en synlig buffer sidst i planen i stedet for luft i hver aktivitet - bufferen blev styrbar, luften forsvandt bare.

**Leverandører og kontrakter**
- Når vi køber software, så kræv en testperiode på mindst 14 dage i kontrakten - demoen viste ikke de fejl testperioden fandt.
- Når en leverandør er eneleverandør på en kritisk leverance, så aftal en fast ugentlig statuskadence skriftligt fra dag 1 - vi opdagede forsinkelsen 3 uger for sent.

**Scope og ændringer**
- Når nogen ønsker en ændring midt i projektet, så saml ændringer op og beslut dem samlet ved næste milepæl - løbende småændringer kostede os 20 % af tiden uden at nogen besluttede det.

**Kommunikation og møder**
- Når projektet har flere end 3 deltagere, så hold 15-minutters ugentlig status frem for lange månedsmøder - de korte møder fangede problemer mens de var små.

**Økonomi**
- Når projektet tegner abonnementer eller licenser, så før dem på en liste fra dag 1 med ejer og opsigelsesfrist - vi betalte for to værktøjer et halvt år efter projektslut.

**Teknik og værktøjer**
- Når en leverance skal overdrages til drift, så skriv driftsvejledningen mens vi bygger, ikke bagefter - dokumentation skrevet efter hukommelsen manglede halvdelen.

## 4. Skidt til godt - omskrivninger

| SKIDT (referatprosa/anekdote) | GODT (regel) |
|---|---|
| "Kommunikationen med leverandøren var udfordrende i perioder" | "Når en leverandør er kritisk for tidsplanen, så aftal fast ugentlig skriftlig status i kontrakten - vi manglede varsling om forsinkelser" |
| "Vi burde have testet noget mere" | "Når vi bygger noget kunder skal bruge, så test løbende ved hver milepæl i stedet for til sidst - fejl fundet sent kostede 3 ugers omarbejde" |
| "Projektet viste at estimering er svært" | "Når vi estimerer integrationer til systemer vi ikke kender, så indhent leverandørens dokumentation FØR estimatet afgives - begge integrationsestimater var sat 50 % for lavt" |

Mønstret i alle tre: fra vurdering ("udfordrende", "burde", "svært") til situation + handling + hvad det kostede.

## 5. Vedligehold af loggen

- **Dubletter:** siger den nye læring det samme som en eksisterende, så foreslå at bekræfte den gamle (tilføj "[bekræftet i [projekt], år-måned]") i stedet for at tilføje en dublet. To projekter med samme læring er et stærkt signal - det bør nævnes i evalueringens indstilling.
- **Forældelse:** modsiger virkeligheden en gammel regel, så foreslå at markere den `(forældet - [år-måned], se [projekt])` - aldrig at slette den. Historikken er en del af læringen.
- **Størrelse:** vokser loggen forbi ca. 50 aktive læringer, så foreslå brugeren en årlig oprydning hvor forældede regler arkiveres nederst i filen. Det er brugerens beslutning, ikke din.
- Alle ændringer i loggen følger Aldrig-regel 6: fremlæg planen (præcis hvilke linjer, hvor), få den godkendt, og tilføj - overskriv aldrig.
