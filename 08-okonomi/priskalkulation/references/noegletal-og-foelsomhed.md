# Nøgletal og følsomhed - formler, rabatfælden og prisstignings-regnestykket

Indhold:

1. [Nøgletallene og deres formler](#1-noegletallene-og-deres-formler)
2. [Følsomhedsvisning: ±10 % pris vs. ±10 % volumen](#2-foelsomhedsvisning-10--pris-vs-10--volumen)
3. [Rabatfælden - hvad en rabat kræver i mersalg](#3-rabatfaelden---hvad-en-rabat-kraever-i-mersalg)
4. [Prisstignings-regnestykket - hvor mange kunder må man miste](#4-prisstignings-regnestykket---hvor-mange-kunder-maa-man-miste)
5. [Sådan præsenteres følsomheden i artefaktet](#5-saadan-praesenteres-foelsomheden-i-artefaktet)

---

## 1. Nøgletallene og deres formler

Disse fire vises i ENHVER kalkulation - de kobler prisen til om forretningen løber rundt:

```
Dækningsbidrag (DB)   = omsætning − variable omkostninger
Dækningsgrad (DG)     = DB ÷ omsætning
Nulpunktsomsætning    = faste omkostninger ÷ DG
Sikkerhedsmargin      = (omsætning − nulpunktsomsætning) ÷ omsætning
```

Fortolkning til anbefalingsnotatet:

- **DB** er det beløb der er tilbage til at betale faste omkostninger og skabe overskud.
- **DG** er forretningens motorstørrelse: ved DG 40 % skaber hver ny omsætningskrone 40 øre til faste omkostninger og bundlinje.
- **Nulpunktsomsætningen** er årets minimumssalg - alt derunder er tab.
- **Sikkerhedsmarginen** siger hvor meget salget kan falde før der er underskud. Under 10-15 % er forretningen sårbar over for selv små udsving.

## 2. Følsomhedsvisning: ±10 % pris vs. ±10 % volumen

Pointen med denne visning: **prisændringer rammer bundlinjen langt hårdere end volumenændringer** - fordi en prisændring går ubeskåret i DB, mens en volumenændring trækker variable omkostninger med sig. Det er argumentet for at turde hæve prisen og for at frygte rabatten.

Gennemregnet eksempel - udgangspunkt:

| Post | Basis |
|---|---|
| Omsætning | 2.000.000 kr. |
| Variable omkostninger | 1.200.000 kr. |
| DB (DG 40 %) | 800.000 kr. |
| Faste omkostninger | 600.000 kr. |
| **Resultat** | **200.000 kr.** |

De fire scenarier (standardtabellen - genskab den med brugerens tal):

| Scenarie | Omsætning | Variable | DB | Resultat | Ændring i resultat |
|---|---|---|---|---|---|
| Basis | 2.000.000 | 1.200.000 | 800.000 | 200.000 | - |
| Pris +10 % | 2.200.000 | 1.200.000 | 1.000.000 | 400.000 | **+100 %** |
| Pris −10 % | 1.800.000 | 1.200.000 | 600.000 | 0 | **−100 %** |
| Volumen +10 % | 2.200.000 | 1.320.000 | 880.000 | 280.000 | +40 % |
| Volumen −10 % | 1.800.000 | 1.080.000 | 720.000 | 120.000 | −40 % |

Læsningen der skal med i notatet: i dette eksempel FORDOBLER 10 % højere pris resultatet, mens 10 % rabat på alt udsletter det fuldstændigt. Volumen betyder noget - men kun 40 % så meget som prisen. Jo lavere DG, desto mere ekstremt bliver forholdet.

## 3. Rabatfælden - hvad en rabat kræver i mersalg

Når prisen sænkes, falder DB pr. enhed - så der skal sælges flere enheder bare for at stå stille:

```
Nødvendig volumenstigning = rabat ÷ (DG − rabat)
```

(rabat og DG som decimaltal af salgsprisen)

| DG | 5 % rabat kræver | 10 % rabat kræver | 20 % rabat kræver |
|---|---|---|---|
| 30 % | +20 % salg | +50 % salg | +200 % salg |
| 40 % | +14 % salg | +33 % salg | +100 % salg |
| 50 % | +11 % salg | +25 % salg | +67 % salg |

Brug tabellen aktivt når brugeren overvejer rabat: "10 % rabat ved jeres DG på 40 % kræver 33 % flere solgte enheder bare for at bevare det nuværende DB - tror I på det mersalg?" Er svaret nej, er rabatten en ren overførsel fra bundlinjen til kunden.

## 4. Prisstignings-regnestykket - hvor mange kunder må man miste

Spejlbilledet, og det stærkeste argument i "tør vi hæve prisen"-samtalen:

```
Acceptabelt volumentab = prisstigning ÷ (DG + prisstigning)
```

| DG | +5 % pris tåler | +10 % pris tåler | +20 % pris tåler |
|---|---|---|---|
| 30 % | −14 % salg | −25 % salg | −40 % salg |
| 40 % | −11 % salg | −20 % salg | −33 % salg |
| 50 % | −9 % salg | −17 % salg | −29 % salg |

Formuleret til notatet: "Ved DG 40 % kan I miste hver femte kunde på en prisstigning på 10 % og stadig tjene det samme - mister I færre, tjener I mere. Hvor mange kunder tror I reelt forsvinder?" De fleste ejerledere overvurderer kundeflugten markant; regnestykket gør frygten målbar.

## 5. Sådan præsenteres følsomheden i artefaktet

1. Vis altid firescenarie-tabellen (afsnit 2) med brugerens egne tal.
2. Fremhæv den hårdeste faktor i én sætning ("prisen slår ca. 2,5 gange hårdere end volumen i jeres tal").
3. Overvejes rabat: tilføj rabatfælde-beregningen (afsnit 3) med brugerens DG.
4. Overvejes prisstigning: tilføj tåle-beregningen (afsnit 4) med brugerens DG.
5. Slut med den antagelse der flytter resultatet mest, og hvordan brugeren kan efterprøve den (tælle timer, tjekke sidste kvartals salg, ringe til de tre største kunder).

Alle procenter i tabellerne er matematik, ikke satser - de forældes ikke. Men de tal de anvendes på (DG, faste omkostninger), skal komme fra brugerens egne data eller stå som [ANTAGELSE].
