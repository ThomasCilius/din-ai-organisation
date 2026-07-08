# Månedlig revisionsrutine

Kalenderen er et levende dokument. En kalender der ikke revideres, er en ønskeliste - revisionen er dét der gør den til et styringsværktøj. Rutinen køres når brugeren siger "opdater kalenderen" eller når en ny måned skal planlægges og der findes en tidligere kalender.

## Rytme

- **Ugentlig hurtig status (2 min):** opdatér kun statusfeltet på ugens linjer. Ingen ombygning.
- **Månedlig revision (denne rutine):** fuld gennemgang før næste måneds kalender bygges.

## Rutinen - trin for trin

1. **Statusgennemgang linje for linje.** Sæt endelig status på hver linje i den udløbne måned: publiceret / flyttet / droppet. Spørg brugeren linje for linje hvis status er ukendt - gæt aldrig.

2. **Hvorfor-notat på alt der blev flyttet eller droppet.** Én linje pr. stk.: "droppet - casen fik ikke samtykke", "flyttet - messen fyldte mere end ventet". Uden hvorfor'et gentager næste måned de samme fejl.

3. **Læringer.** Spørg: "Hvad fik mest respons (kommentarer, svar, henvendelser)? Hvad faldt fladt?" Findes der en `maaned-rapport-YYYY-MM.md` (fra `marketing-rapport`), så læs den - dens indsigter er det bedste input til næste måneds vinkler. Konkludér forsigtigt: én måneds tal er støj, mønstre over 2-3 måneder er signal.

4. **Parkeringspladsen ryddes op.** Idéer der har stået parkeret i 2+ måneder uden at nogen har savnet dem: slet dem (nævn det). Idéer der blev droppet 2 gange i kalenderen: flyt dem til parkeringspladsen med begrundelse - de skal ikke planlægges en tredje gang uden ny anledning.

5. **Kadence-tjek.** Blev kadencen overskredet (flere linjer flyttet/droppet end publiceret)? To måneder i træk = foreslå lavere kadence i næste måneds ramme. Blev alt publiceret med luft til overs? Spørg om timerne reelt er flere - men foreslå kun opjustering når brugeren selv bekræfter det.

6. **Arkivér.** Flyt den gamle kalender til undermappen `arkiv/` (opret den hvis den mangler) - overskriv ALDRIG. Filnavnet beholdes: `arkiv/content-kalender-YYYY-MM.md`. Historikken er virksomhedens hukommelse om hvad der blev planlagt og hvad der faktisk skete.

7. **Byg næste måned.** Fortsæt i SKILL.md's arbejdsgang fra interviewtrinnet - men spring alt over som revisionen allerede har besvaret (timer, kanaler, kadence bekræftes med ét spørgsmål i stedet for at spørges forfra). Åbne kaskadeled fra den gamle kalender føres ind i den nye.

## Revisionslog

Hver revision tilføjer én blok i den nye kalenders `## Revisionslog`:

```markdown
- 2026-08-01: Månedsrevision af juli. 6/8 linjer publiceret. Droppet: K3-webtekst
  (mangler tal). Flyttet til august: kundecase Fjordblik (samtykke modtaget 28/7).
  Læring: spørgsmålsopslag uge 28 gav 4 henvendelser - mere af det. Kadence holdt.
```

## Beslutningsregler - kort

| Situation | Regel |
|---|---|
| Linje droppet 2 gange | Ud af kalenderen, ind på parkeringspladsen med begrundelse |
| Kadence overskredet 2 måneder i træk | Foreslå lavere kadence - nedjustér planen, ikke ambitionen op |
| Parkeret idé urørt i 2+ måneder | Slet den (og sig det) |
| Status ukendt på en linje | Spørg - gæt aldrig |
| Ingen læringsdata | Notér det som åbent spørgsmål og foreslå `marketing-rapport` næste måned |
