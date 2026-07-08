# Planlagt kørsel - når portneren skal arbejde om natten

Standarddriften er manuel: ejeren siger "kør natportneren" og godkender planen undervejs. Denne fil gælder KUN når brugeren aktivt beder om at få portneren sat op som fast rutine - foreslå det ikke selv før brugeren har kørt manuelt et par gange og stoler på rapporterne.

## Princippet: ubemandet = kun sikre handlinger

I en planlagt kørsel er der intet menneske til at godkende planen. Derfor skrumper mandatet:

**Sikre handlinger (må udføres ubemandet):**
- Oprette ny videnfil fra en note (med kildeangivelse).
- Ren fletning uden konflikt (dublettjek først, tilføj uden at omskrive).
- Flytte færdigbehandlede noter til `inbox/behandlet/`.
- Kassere oplagte tilfælde (ren to-do, forældet engangsbesked, ren dublet) med begrundelse.

**Venter ALTID på mennesket (uanset opsætning):**
- Alle konflikter - noten bliver i inboxen, begge versioner i rapporten.
- Kassationer i tvivl - markeres "afventer" i stedet.
- Alt med persondata fra stop-kategorierne i `beslutningsregler.md`.
- Destillation eller opdeling af videnfiler der overskrider 10 linjer (ændrer eksisterende indhold).
- Oprettelse af nye emneundermapper (ændrer arkivets struktur).

Natterapporten bliver kontrakten: ejeren læser den næste morgen og afgør de ventende punkter. En planlagt kørsel der efterlader alt uafklaret som "afventer", er stadig en vellykket kørsel - den har sorteret, og mennesket beslutter.

## Opsætning

1. **Verificér at manuel drift fungerer:** mindst to manuelle kørsler hvor ejeren har godkendt planer og læst rapporter, før automatik overhovedet foreslås.
2. **Aftal kadence:** natligt er sjældent nødvendigt i en SMV - ugentligt (fx søndag nat) passer de fleste. Spørg, foreslå ugentligt som standard.
3. **Opsæt den planlagte kørsel** i Claude/Cowork (scheduled tasks). Følg den aktuelle vejledning i appen - menuer og navne ændrer sig, så beskriv princippet og lad brugeren klikke. Promptteksten til den planlagte opgave skal indeholde: "Kør natportner-skillen i ubemandet tilstand: kun sikre handlinger, alt andet afventer i rapporten."
4. **Aftal morgenrutinen:** ejeren skimmer `natterapport.md` og afgør punkterne under Konflikter og Til afgørelse. Uden den vane hober afventende noter sig op, og inboxen sander til igen.

## Idempotens er forudsætningen

En planlagt kørsel kan ramme en inbox der allerede er halvt behandlet, eller køre to gange efter en fejl. Derfor gælder skærpet:

- Noter i `inbox/behandlet/` springes altid over.
- Fletninger dublettjekker altid før der skrives.
- Konflikter genlistes med "(gentaget fra kørsel [dato])" - de analyseres ikke forfra og eskaleres ikke hårdere for hver kørsel.
- Hver kørsel får sin egen dateret sektion øverst i `natterapport.md` - der overskrives aldrig en tidligere rapport.

## Fejltilstand

Fejler en planlagt kørsel halvvejs, er skaden nul pr. design: viden skrives ind FØR noten flyttes, så en afbrudt kørsel efterlader højst en note i inboxen hvis indhold allerede står i en videnfil - og næste kørsels dublettjek fanger det. Rapportér afbrydelsen i næste kørsels rapport under "Til afgørelse".
