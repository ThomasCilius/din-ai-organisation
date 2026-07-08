# Skabelon: bankpakke (spor b)

Indhold:
1. [Bankens briller](#bankens-briller)
2. [Fuld skabelon med vejledning pr. afsnit](#fuld-skabelon)
3. [Covenants og sikkerheder](#covenants-og-sikkerheder)
4. [Bankens typiske spørgsmål](#bankens-typiske-spoergsmaal)

## Bankens briller

Samme tal som bestyrelsespakken - helt anden vinkling. Bestyrelsen spørger "skaber vi værdi?"; banken spørger "får vi vores penge igen?". Banken kreditvurderer på tre ting:

1. **Tilbagebetalingsevne** - kan driften bære ydelsen? (pengestrømme, ikke resultat)
2. **Sikkerheder** - hvad kan banken tage hvis det går galt?
3. **Ledelse og historik** - holder virksomheden hvad den lover? (derfor: vis at tidligere prognoser holdt, eller forklar ærligt hvorfor de ikke gjorde)

Konsekvens for pakken: likviditetsprognosen er hoveddokumentet, resultatopgørelsen er baggrund. En bank der opdager et skjult problem, strammer vilkårene; en bank der får problemet forklaret med en handlingsplan, strækker sig ofte langt. Ærlighed er her også en forhandlingsstrategi.

## Fuld skabelon

Vejledningen i kursiv slettes i det færdige dokument.

---

# Bankpakke [virksomhed] - [dato]

*Formål: [fx forlængelse af kreditramme / ny anlægsfinansiering / årligt engagementsmøde]. Periode: [seneste regnskabsperiode + prognoseperiode].*

## 1. Anmodningen

*Hvad beder vi banken om - præcist. Beløb, type (kassekredit, anlægslån, garanti), løbetid, formål. Én kort sektion, øverst - banken skal ikke gætte sig til ærindet.*

## 2. Virksomheden kort

*5-10 linjer fra virksomhedsprofil.md: hvad sælger vi, til hvem, ejerforhold, antal ansatte, de 2-3 vigtigste udviklinger siden sidste engagementsmøde.*

## 3. Økonomisk udvikling

*Realiseret: seneste 2-3 år + år til dato mod budget. Samme taldisciplin som bestyrelsespakken (se `noegletal-og-afvigelser.md`) men med bankens nøgletal tilføjet: EBITDA, soliditetsgrad, gældsserviceringsevne hvis data findes - ellers `[MANGLER]`. Vis om tidligere prognoser holdt.*

## 4. Likviditetsprognose

*Hoveddokumentet. 12 måneder frem, månedsopdelt: primo-likviditet, indbetalinger, udbetalinger, ultimo-likviditet, træk på kreditramme. Genbrug output fra `likviditetsoverblik` hvis det findes. Marker prognosens antagelser eksplicit (debitordage, ordreindgang, sæson). Vis både forventet forløb og et forsigtigt scenarie - banken laver selv et pessimistisk, så kom den i forkøbet.*

## 5. Tilbagebetalingsevne

*Regnestykket banken selv vil lave: pengestrøm fra drift mod samlede ydelser (renter + afdrag) på eksisterende og ønsket gæld. Vis at der er luft - eller vis ærligt hvor lidt luft der er, og hvad der gøres ved det.*

## 6. Sikkerheder

*Hvad banken har pant i i dag, og hvad der kan tilbydes: virksomhedspant, pant i ejendom/driftsmidler, ejerkaution. Anfør bogførte værdier med kilde - lad banken om at værdiansætte. OBS: personlig kaution er et eskaleringspunkt - se Aldrig-regler i SKILL.md; anbefal aldrig kaution, beskriv kun hvad der evt. allerede er stillet.*

## 7. Covenants og vilkår

*Eksisterende covenants og status mod dem - se tabellen nedenfor. Brud eller forventet brud skjules ALDRIG: flag det, forklar årsag og handlingsplan, og anbefal dialog med banken FØR bruddet indtræffer.*

## 8. Risici og handlingsplaner

*Samme format som bestyrelsespakkens risikoafsnit - banken skal se at ledelsen kender sine risici. Kundekoncentration er særligt vigtig her.*

## Datagrundlag og kilder

## Mangler og antagelser

---

## Covenants og sikkerheder

Covenant-status vises altid i tabel:

| Covenant (fra låneaftale) | Krav | Aktuel status | Margin | Forventning 12 mdr. |
|---|---|---|---|---|
| [fx soliditetsgrad] | [fx min. 20 %] | | | |
| [fx EBITDA-niveau] | | | | |

- Kravene hentes ordret fra låneaftalen/engagementsbrevet - bed brugeren om dokumentet; citér aldrig covenants fra hukommelsen. Findes dokumentet ikke: `[MANGLER: covenant-vilkår fra låneaftale]`.
- Ved brud eller forventet brud inden for 12 måneder: skriv det i afsnit 7 OG i risikoafsnittet, og eskalér til revisor/bankrådgiver-dialog jf. SKILL.md's Aldrig-regler.

## Bankens typiske spoergsmaal

Tjek at pakken svarer på disse FØR den afleveres - det er dem engagementsmødet kommer til at handle om:

1. Hvorfor afveg sidste års realiserede tal fra prognosen I viste os sidst?
2. Hvad sker der med likviditeten hvis jeres største kunde falder væk eller betaler 30 dage senere?
3. Hvilke faste omkostninger kan I skære, og hvor hurtigt?
4. Hvor stor en del af pipelinen er reelt sikker?
5. Hvad skal pengene konkret bruges til, og hvad er planen hvis investeringen ikke giver det forventede afkast?

Kan pakken ikke svare på et af dem, så sig det til brugeren og foreslå at svaret indarbejdes - det er bedre at skrive svaret selv end at improvisere det i mødet.
