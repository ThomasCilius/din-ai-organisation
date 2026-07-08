# Description-håndværk - jobopslaget der bliver fundet

Læs denne fil hver gang du skriver eller retter en description (arbejdsgangens trin 3-5). Description er skillens jobopslag: Claude sammenligner brugerens ord med den, og kun ved match bliver medarbejderen kaldt på arbejde. En perfekt SKILL.md med et dårligt jobopslag er en dygtig medarbejder ingen ringer til.

## Indhold

1. [De hårde krav](#de-haarde-krav)
2. [Triggerfraser: brugerens ord, ikke dine](#triggerfraser-brugerens-ord-ikke-dine)
3. [Vær pågående - Claude undertrigger](#vaer-paagaaende---claude-undertrigger)
4. [Negativ afgrænsning mod naboskills](#negativ-afgraensning-mod-naboskills)
5. [Aldrig workflow-resumé](#aldrig-workflow-resume)
6. [Kontrastpar-samling](#kontrastpar-samling)
7. [Retteteknik under prøvetiden](#retteteknik-under-proevetiden)

## De hårde krav

- Max 1024 tegn - tæl efter.
- Tredje person: "Skriver en rykker...", aldrig "Jeg skriver..." eller "Du kan...".
- Struktur der virker: [hvad den gør, én sætning] + [ordrette triggerfraser DA] + [ordrette triggerfraser EN] + [bredere situation, "brug den også når..."] + [negativ afgrænsning, "Brug IKKE til..."].
- Både danske og engelske fraser - brugere blander sprog, og pakken skal virke uanset.

## Triggerfraser: brugerens ord, ikke dine

Kilden er interviewets spørgsmål "hvilke ord ville du bruge til en kollega?". Skriv fraserne ORDRET som brugeren sagde dem - ikke oversat til fagsprog.

| Brugeren siger | Skriv i description | Skriv IKKE |
|---|---|---|
| "de har ikke betalt" | 'de har ikke betalt' | 'initiér debitoropfølgning' |
| "vi skal ansætte en sælger" | 'vi skal ansætte en...' | 'igangsæt rekrutteringsproces' |
| "hvad skal der stå om sygemelding?" | 'hvad skal der stå om sygemelding' | 'udarbejd fraværspolitik' |

Medtag 4-6 fraser: et par direkte kommandoer ("skriv en rykker"), et par situationsbeskrivelser ("kunde X skylder os stadig") og 1-2 engelske. Variation i frasetype fanger flere formuleringer end seks omskrivninger af samme kommando.

## Vær pågående - Claude undertrigger

Standardfejlen er ikke overtriggering men undertriggering: skillen ligger installeret og bliver aldrig brugt. Modtrækket er en "brug den også når..."-sætning der beskriver situationen bag ordene:

> "Brug den også når brugeren beskriver en opgave de løser på samme måde igen og igen - også selvom de aldrig bruger ordet skill."

Den sætning fanger brugeren der ikke kender terminologien. Uden den trigger skillen kun for de indviede.

## Negativ afgrænsning mod naboskills

Hver naboskill der kunne forveksles, får én linje: "Brug IKKE til [område] - dér bruges [naboskill]." Find naboerne ved at spørge: hvilken anden skill i pakken ville en bruger med et NÆSTEN identisk behov skulle have fat i? Typiske forvekslingspar:

- Skriv nyt dokument vs. gennemgå eksisterende (fx `tilbud` vs. `kontrakt-tjek`)
- Til mennesker vs. til AI (fx `procedure-skriver` vs. `skill-opskrift`)
- Enkeltsag vs. overblik (fx `kundesvar` vs. `kundegennemgang`)
- Opskriften vs. skemaet (fx `skill-opskrift` vs. `rutine-bygger`)

Uden afgrænsningen trigger begge skills på samme prompt, og hvilken der vinder bliver tilfældigt.

## Aldrig workflow-resumé

Description må KUN indeholde triggerbetingelser - aldrig et resumé af arbejdsgangen. Skriver du "interviewer brugeren, laver en brief og skriver derefter dokumentet" i description, følger Claude resuméet og springer kroppen over - inklusive hard gates og aldrig-regler. Én sætning om HVAD skillen gør er nødvendig for matchning; HVORDAN den gør det hører hjemme i kroppen. Grænsetilfælde: "afslutter altid med prøvetiden" er acceptabelt når det er skillens definerende løfte - "stiller først 4 spørgsmål og sammenfatter så en brief" er det aldrig.

## Kontrastpar-samling

**Fejltype 1: fagsprog i stedet for hverdagssprog**
- SKIDT: "Faciliterer struktureret debitoropfølgning i henhold til virksomhedens kreditpolitik."
- GODT: "Skriver en venlig men bestemt rykker. Brug den når brugeren siger 'skriv en rykker', 'de har ikke betalt' eller 'send a payment reminder'."

**Fejltype 2: workflow-resumé i stedet for triggere**
- SKIDT: "Interviewer brugeren om kandidaten, opsummerer i en brief og genererer derefter et afslagsbrev i virksomhedens tone."
- GODT: "Skriver et kort, venligt afslag til en jobkandidat. Brug den når brugeren siger 'skriv et afslag', 'vi går videre med en anden' eller 'reject a candidate politely'."

**Fejltype 3: ingen negativ afgrænsning**
- SKIDT: "Hjælper med alt omkring møder."
- GODT: "Forbereder et møde: dagsorden, deltagerbrief og talepunkter. Brug den når brugeren siger 'forbered mit møde med...'. Brug IKKE til referat EFTER mødet - dér bruges referat."

## Retteteknik under prøvetiden

Når en prøvetidstest falder forkert ud, ret målrettet - én årsag, én rettelse:

| Symptom | Diagnose | Rettelse |
|---|---|---|
| Bør-trigge-prompt trigger ikke | Prompten bruger ord der ikke står i description | Tilføj brugerens formulering som ordret frase |
| Trigger kun på kommandoer, ikke situationer | Ingen "brug den også når..."-sætning | Tilføj situationsbeskrivelsen |
| Bør-ikke-trigge-prompt trigger alligevel | Description for bred, eller naboafgrænsning mangler | Stram "hvad den gør"-sætningen; tilføj "Brug IKKE til..." |
| To skills slås om samme prompt | Overlappende jobopslag | Afgræns BEGGE descriptions mod hinanden |

Efter hver rettelse: kør ALLE 6 prompts igen, ikke kun den der fejlede - en rettelse der fikser én test, kan vælte en anden. Max 3 iterationer, jf. prøvetidsprotokollen.
