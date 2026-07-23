# Prioriteringsframeworks - når 2x2 ikke er nok

Husets standard for PORTEFØLJEN er og bliver værdi/indsats-matricen (`references/vaerdi-indsats-scoring.md`) - simpel, efterprøvelig, beslutbar på ét møde. Denne reference bruges i to situationer: (a) brugeren beder eksplicit om et navngivet framework, eller (b) der prioriteres FEATURES eller kundeønsker inden for ét produkt, hvor lidt mere granularitet kan betale sig. Vælg ét framework og sig hvorfor - skift aldrig framework midt i en prioritering.

## Grundprincip

Prioritér problemer og effekter, ikke ønskesedler. Kunder er eksperter i deres problem, ikke i jeres løsningskatalog - et højtråbende featureønske er data om et problem, ikke en bestilling.

## De fem mest brugbare

### Opportunity Score (Dan Olsen) - til kundeproblemer

Spørg kunder pr. behov: hvor VIGTIGT er det (1-10), og hvor TILFREDS er du med løsningen i dag (1-10)?

**Score = vigtighed × (10 - tilfredshed)** (høj vigtighed + lav tilfredshed = guldgruben)

Bedst når der findes kundedata (fx fra `kundeinterview`-referater). Uden data: brug ikke frameworket - gæt i et finere framework er stadig gæt.

### ICE - til hurtig idé-triage

**Score = Impact × Confidence × Ease** (hver 1-10)

Confidence tvinger ærlighed om evidens: en høj impact med confidence 2 er en antagelse, ikke en prioritet - send den til test (`antagelses-tjek`-logik) frem for til toppen af listen.

### RICE - når rækkevidde skal adskilles

**Score = (Reach × Impact × Confidence) / Effort**

Som ICE, men Reach (hvor mange kunder rammes pr. periode) trækkes ud som sin egen faktor. Mest værd når featurene rammer meget forskelligt store kundegrupper. Kræver flere tal - brug den kun hvis tallene findes.

### Kano - til at FORSTÅ forventninger (ikke at rangordne)

Sorterer features i: **basisbehov** (mangler de, er kunden vred; opfyldes de, siger ingen tak), **jo-mere-jo-bedre** (konkurrenceparametre) og **begejstring** (uventede plusser). Brug den til at afgøre HVILKEN SLAGS værdi en feature giver - og husk: begejstring i år er basisbehov om tre år.

### MoSCoW - til leverancer med fast deadline

Must / Should / Could / Won't. Bedst til at skære en aftalt leverance til (fx med et bureau, jf. `byggebrief`) - ikke til at sammenligne på tværs af projekter. Won't-listen er den vigtigste: det er dét, der er valgt fra, og den skal stå på skrift.

## Hurtig vælger

| Situation | Framework |
|---|---|
| Portefølje af projekter | **2x2 værdi/indsats** (husets standard - gå tilbage til den) |
| Kundeproblemer med interviewdata | Opportunity Score |
| Bunke af idéer, hurtig triage | ICE |
| Features med meget forskellig rækkevidde og gode tal | RICE |
| Forstå hvad kunderne forventer vs. begejstres af | Kano |
| Skære en fast leverance til | MoSCoW |

## Advarsler

- **Scoren beslutter ikke.** Alle frameworks producerer et oplæg - ejerlederen beslutter. Præcise decimaler på gættede input er falsk tryghed: markér gæt [ANTAGELSE], og rund hellere af end at imponere.
- **Max ét framework pr. prioritering.** Skiftes model undervejs, kan ingen efterprøve resultatet.
- **12-kriterie-modeller er stadig bandlyst** (jf. Prioriteringsregel 2) - flytter diskussionen fra projekterne til vægtene.
