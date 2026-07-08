# Étsides-skabelonen: felt for felt

Indhold:
1. [Formatkrav](#formatkrav)
2. [Blok 1: Kerneforretning](#blok-1-kerneforretning)
3. [Blok 2: Pejlemærke 3 år](#blok-2-pejlemaerke-3-aar)
4. [Blok 3: Kernekunde](#blok-3-kernekunde)
5. [Blok 4: Must-win battles](#blok-4-must-win-battles)
6. [Blok 5: Fravalg](#blok-5-fravalg)
7. [Blok 6: Nøgletal](#blok-6-noegletal)
8. [Blok 7: Ejerskab og budgetstatus](#blok-7-ejerskab-og-budgetstatus)
9. [Komplet udfyldt eksempel](#komplet-udfyldt-eksempel)

## Formatkrav

- Max én A4-side ved normal skriftstørrelse - i praksis max ca. 450 ord i selve planen (statuslinje, antagelser og ændringslog tæller ikke med).
- Alle 7 blokke skal med. Kan planen ikke være på én side, er der truffet for få valg - skær battles eller detaljer, aldrig fravalgene.
- Øverst altid: `Status: UDKAST | Version: [dato] | Godkendes af: [navn/organ]`.
- Planen skrives så en medarbejder uden ledelsesbaggrund kan genfortælle den efter én gennemlæsning.

## Blok 1: Kerneforretning

Én sætning: hvem tjener vi penge på at hjælpe med hvad. Ikke en mission i festtale-format - en beskrivelse ejeren kunne sige til en fremmed i et forsamlingshus.

- Mønster: "Vi hjælper [kernekunde] med [problem/opgave] ved at [hvordan vi tjener penge på det]."
- Godt: "Vi holder produktionslinjer kørende for mellemstore fødevarevirksomheder i Jylland gennem serviceaftaler og akut maskinreparation."
- Skidt: "Vi skaber værdi for vores kunder gennem innovative totalløsninger."

## Blok 2: Pejlemaerke 3 aar

Hvor er virksomheden om 3 år - i tal og konkret adfærd. Pejlemærket er ikke et budgetmål men en tilstand man kan se med det blotte øje.

- Skal indeholde mindst ét tal (omsætningsandel, antal kunder, antal medarbejdere, geografisk dækning).
- Skal kunne modbevises: kan ingen afgøre om I nåede det, er det ikke et pejlemærke.
- Godt: "Om 3 år kommer 60 % af omsætningen fra faste serviceaftaler, vi er 30 medarbejdere, og ingen enkeltkunde udgør over 15 % af omsætningen."
- Skidt: "Vi vil være markedets foretrukne partner."

## Blok 3: Kernekunde

Navngivet segment: branche, størrelse, geografi, situation. Og lige så vigtigt: hvem vi accepterer at miste. En kernekunde-beskrivelse der passer på alle er ingen beskrivelse.

- Mønster: "[Branche/type] med [størrelse] i [geografi], der [situation/behov]. Vi accepterer at miste [modsatte type]."
- Spørg altid: "Hvis to kunder ringer samtidig og I kun kan tage én - hvem vælger I?" Svaret ER kernekunden.

## Blok 4: Must-win battles

3-5 kampe der SKAL lykkes i år for at pejlemærket rykker nærmere. Aldrig flere end 5 - flere battles er det hyppigste dødskriterium for SMV-eksekvering.

Hvert battle skal have:
- **Testbart mål:** kan besvares ja/nej den 31. december. Se testbarhedskravet i `sprogregler-og-testbarhed.md`.
- **Én navngiven ejer:** en person, aldrig "teamet", aldrig to navne. Delt ejerskab er intet ejerskab.
- **Budgetstatus:** post i budgettet eller markeringen UFINANSIERET.

Battle-format på planen (én linje pr. battle):

```
B1: [Testbart mål] - Ejer: [navn] - Budget: [post / UFINANSIERET]
```

Sortering: vigtigste først. Battles der reelt er drift ("levere god service") hører ikke hjemme her - flag dem og foreslå at de udgår.

## Blok 5: Fravalg

Mindst lige så mange eksplicitte fravalg som battles - det er planens hårdeste kvalitetskrav. Fravalg er aktive nej'er, ikke fravær af omtale.

Formuleringsmønstre:
- "Vi byder ikke på [opgavetype/udbud] i [periode]."
- "Vi åbner ikke [marked/afdeling/produktlinje] i år."
- "Vi siger nej til kunder under [størrelse/beløb] medmindre [undtagelse]."
- "Vi udvikler ikke [produkt/feature] selvom kunder spørger."
- "Vi ansætter ikke i [funktion] før [betingelse]."

Røde flag (tæller IKKE som fravalg):
- "Vi fokuserer mere på X" - implicit fravalg forpligter ingen.
- "Vi nedprioriterer Y" - hvad betyder det mandag morgen? Omskriv til et konkret nej.
- Fravalg af ting virksomheden alligevel aldrig ville gøre ("vi åbner ikke i Kina") - gratis fravalg tæller ikke; fravalget skal gøre ondt på nogen i ledergruppen.

Personfølsomme fravalg (lukke en afdeling, udfase en persons område): markér UAFKLARET og henvis til ejerlederen - de besluttes aldrig i denne skill, og de kommer ALDRIG i medarbejderversionen (se `medarbejderversion.md`).

## Blok 6: Noegletal

5-7 tal der viser om strategien virker - ikke virksomhedens fulde rapporteringspakke. Vælg tal der kobler direkte til pejlemærket og battles.

Standardkandidater for dansk SMV (vælg og tilpas ud fra virksomhedsprofilen):
- Omsætning pr. kundesegment (viser om kernekunde-valget slår igennem)
- Dækningsgrad (samlet eller pr. segment)
- Kundeafgang/genkøbsrate
- Ordrebeholdning/pipeline
- Andel af omsætning fra faste aftaler (hvis pejlemærket handler om gentagen omsætning)
- Medarbejderomsætning
- Største kundes andel af omsætningen (afhængighedsrisiko)

Hvert nøgletal angives med: nuværende niveau (med kilde), mål ved årets udgang, og hvor tallet hentes (regnskab, CRM, økonomisystem). Kendes nuværende niveau ikke: skriv [MANGLER TAL] - gæt aldrig.

## Blok 7: Ejerskab og budgetstatus

Ejerskab står på selve battle-linjen (se blok 4), men saml status her som overblik:

- Hver ejer skal have accepteret ejerskabet - er det ikke sket endnu, markér "(afventer accept)".
- UFINANSIEREDE battles listes eksplicit og flagges til ejerlederen som det første i afleveringen: et battle uden penge er et ønske, og ejerlederen skal aktivt vælge at finansiere det, gøre det gratis (nogen får det som opgave i stedet for noget andet) eller droppe det.

## Komplet udfyldt eksempel

Fiktiv virksomhed: Møllegaard Maskinservice A/S, 22 ansatte, Horsens. Bruges som kalibrering af detaljeniveau og tone - kopiér aldrig indholdet.

```markdown
# Strategiplan Møllegaard Maskinservice 2027
> Status: UDKAST | Version: 2026-11-14 | Godkendes af: Jens Møllegaard (ejer)

## Kerneforretning
Vi holder produktionslinjer kørende for mellemstore fødevarevirksomheder i
Jylland gennem faste serviceaftaler og akut maskinreparation.

## Pejlemaerke 3 aar
I 2029 kommer 60 % af omsætningen fra faste serviceaftaler (i dag: 31 %,
kilde: økonomisystem 2026), vi er 30 medarbejdere, og ingen enkeltkunde
udgør over 15 % af omsætningen (i dag: Danish Crown-koncernen 28 %).

## Kernekunde
Fødevareproducenter med 30-250 ansatte i Jylland med eget produktionsudstyr
og krav om hurtig responstid. Vi accepterer at miste små værksteds- og
landbrugskunder uden aftalepotentiale.

## Must-win battles
B1: 12 nye serviceaftaler med fødevareproducenter inden 31/12 - Ejer: Pia
    (salgsansvarlig) - Budget: 180.000 kr. (salgs- og messebudget)
B2: Responstid på akutte kald under 4 timer i 95 % af tilfældene, målt fra
    Q2 - Ejer: Karsten (serviceleder) - Budget: ny servicebil, 420.000 kr.
B3: Vagtplans- og bookingsystem i drift inden 1/9 - Ejer: Mette (kontor) -
    Budget: UFINANSIERET
B4: Danish Crown-koncernens andel af omsætningen under 22 % (via vækst hos
    andre, ikke opsigelse) - Ejer: Jens (ejer) - Budget: dækkes af B1

## Fravalg
1. Vi byder ikke på offentlige udbud under 500.000 kr.
2. Vi åbner ikke afdeling på Fyn i 2027 - genvurderes på strategidagen 2027.
3. Vi siger nej til rene engangsreparationer for kunder uden for kernesegmentet,
   medmindre ordren overstiger 50.000 kr.
4. Vi udvikler ikke eget reservedelslager til andre mærker end de tre vi
   servicerer i dag.

## Noegletal
| Tal | Nu (kilde) | Maal 2027 | Hentes i |
|---|---|---|---|
| Andel omsætning fra aftaler | 31 % (økonomisys. 2026) | 40 % | Økonomisystem |
| Antal aktive serviceaftaler | 41 (CRM) | 53 | CRM |
| Responstid akutkald < 4 t | [MANGLER TAL] | 95 % | Nyt bookingsystem (B3) |
| Dækningsgrad service | 38 % (årsregnskab 2025) | 41 % | Økonomisystem |
| Største kundes andel | 28 % (økonomisys. 2026) | 24 % | Økonomisystem |
| Medarbejderomsætning | 2 fratrådt 2026 (HR) | Max 2 | HR-oversigt |

## Antagelser og aabne spoergsmaal
- B3 er UFINANSIERET - Jens beslutter: finansiér, omprioritér eller drop.
- Responstid måles først fra Q2 fordi målingen kræver B3 - accepteret afhængighed.
- [ANTAGELSE] Messedeltagelse i foodtech-messen er regnet ind i B1's budget.

## Kilder og aendringslog
- Strategidag-referat 2026-11-07; årsregnskab 2025; økonomisystem-udtræk
  2026-10; CRM-udtræk 2026-11.
- 2026-11-14: Første udkast (denne version).
```

Bemærk i eksemplet: 4 battles, 4 fravalg (reglen holdt), alle battles testbare ja/nej, én ejer pr. battle, UFINANSIERET flagget øverst i antagelserne, [MANGLER TAL] i stedet for gæt, og alle tal med kilde.
