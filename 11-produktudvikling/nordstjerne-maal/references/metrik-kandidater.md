# Metrik-kandidater - pr. spil og forretningstype

Kandidatbank til trin 3. Tallene er formater, ikke facit - tilpas tæller, nævner og "aktiv"-definition til den konkrete forretning. Rammen bygger på North Star-frameworket (Amplitude/John Cutler m.fl.): ét kundecentreret måltal plus de input der driver det.

## Spillet: Transaktion (webshop, detail, formidling, håndværk pr. opgave)

Kandidater til nordstjerne:
- Gennemførte ordrer/opgaver pr. måned (evt. kun "leveret til aftalt tid")
- Købende kunder pr. måned (unikke - skelner vækst fra få storkunder)
- Genkøbende kunder pr. kvartal (andelen der kommer tilbage - værdibeviset)

Typiske input-metrikker: nye henvendelser/uge, tilbudsrate (tilbud → ordre), leveringstid, reklamationsrate, henvisninger fra eksisterende kunder.

## Spillet: Produktivitet (SaaS, bogholderi, rådgivning, abonnementsservice)

Kandidater til nordstjerne:
- Aktive kunder (brugt/modtaget ydelsen inden for [periode] - definér "aktiv" hårdt)
- Gennemførte kerneleverancer pr. måned (afsluttede sager, afleverede regnskaber, kørte lønkørsler)
- Kunder der har opnået [kerneresultatet] pr. måned (fx "afleverede momsindberetninger til tiden")

Typiske input-metrikker: onboardede kunder inden for X dage, tid fra bestilling til leverance, andel kunder med fuldt setup, supporthenvendelser pr. kunde (faldende = godt), fornyelsesrate.

## Spillet: Opmærksomhed (medier, community, indholdsforretning)

Kandidater til nordstjerne:
- Aktive læsere/lyttere pr. uge (åbnet/afspillet - ikke tilmeldt: tilmeldte er lager, aktive er liv)
- Samlet engageret tid pr. uge
- Tilbagevendende besøg pr. måned

Typiske input-metrikker: nye tilmeldinger, åbningsrate, delinger/henvisninger, udgivelseskadence overholdt.

## Eksempler på oversættelsen (fiktive men realistiske)

| Forretning | Fristende men forkert | Bedre nordstjerne | Hvorfor |
|---|---|---|---|
| VVS-firma | Omsætning | Opgaver leveret til aftalt tid pr. måned | Det er DET, kunderne anbefaler videre på |
| Bogholderi | Antal kunder i kartotek | Regnskaber/indberetninger afleveret til tiden pr. måned | Kartotek er lager; leverancer er værdi |
| Webshop | Besøgende på sitet | Genkøbende kunder pr. kvartal | Trafik er støj; genkøb er dommen over produktet |
| Konsulenthus | Fakturerede timer | Kunder der genbestiller inden for 6 mdr. | Timer måler jeres slid, ikke kundens udbytte |
| Nyhedsbrevsforretning | Tilmeldte i alt | Aktive læsere pr. uge | Listen dør bagfra hvis ingen åbner |

## Faldgruber ved valget

- **Forfængelighedstal:** følgere, besøg, downloads - vokser uden at nogen får værdi. Aldrig nordstjerne.
- **Lagertal vs. strømtal:** "kunder i kartoteket" (lager) føles trygt, men bevæger sig ikke; vælg strømmen ("aktive", "leverede", "genkøbende").
- **Det umålelige ideal:** "kundetilfredshed" uden metode. Enten en konkret måling (fx svar på ét fast spørgsmål efter leverance) eller en anden kandidat.
- **Gennemsnitsfælden:** gennemsnit skjuler fordelingen; antal/andele er oftest ærligere for små tal.
- **For tidligt valg:** før lancering findes ingen kundedata - så er `produkt-etside`s nøglemetrikker nok, og nordstjernen vælges efter de første måneders drift.
