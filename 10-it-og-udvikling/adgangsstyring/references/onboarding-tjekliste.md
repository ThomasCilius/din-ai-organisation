# Onboarding-adgange - fuld tjekliste

Målet: den nye medarbejder kan arbejde fra første minut på dag 1, har kun adgang til det, jobbet kræver, og hver adgang er dokumenteret, så den kan lukkes igen den dag, hun stopper. Det, du dokumenterer her, bliver hendes offboarding-liste.

## Princip: rollen styrer adgangen

Giv adgang efter mindsteprivilegie-princippet - kun det, opgaven kræver, ikke "samme som alle andre". Bind hver adgang til en opgave. Det tager fem minutter mere nu og sparer en uoverskuelig offboarding og et unødigt stort databrud senere.

Byg et lille rollebaseret adgangssæt ud fra virksomhedens roller. Eksempel (tilpas til `virksomhedsprofil.md`):

| Rolle | Typiske systemer (mindsteprivilegie) |
|---|---|
| Bogholder/økonomi | regnskabssystem, bank, Outlook/mail, delt økonomimappe |
| Sælger | CRM, mail, kalender, tilbudsmapper |
| Marketing | mail, Canva/designværktøj, nyhedsbrevsværktøj, CMS-redaktør (ikke admin) |
| Leder | ovenstående for teamet + relevante rapporter |

Admin-rettigheder er ikke en standardadgang - de gives kun til den, der faktisk administrerer systemet, og noteres særskilt i oversigten.

## Tjekliste (rækkefølge)

**Før første arbejdsdag (bestil i god tid):**
- [ ] Kortlæg adgangssættet ud fra rollen (se tabellen) - system for system - opgave: [hver adgang bundet til en opgave]
- [ ] Bestil/opret konti, så de er klar før dag 1 - system: [navn] - ansvarlig: [navn]
- [ ] Tildel licenser fra ledige sæder først (tjek oversigten) før der købes nye
- [ ] Klargør udstyr (pc, telefon) og notér serienr./aktiv i oversigten

**MFA fra dag 1:**
- [ ] Aktivér multifaktor-godkendelse (MFA) på hver konto før første login - system: [navn]
- [ ] Vis medarbejderen, hvordan MFA-app'en bruges

**Adgangskoder og delte konti:**
- [ ] Opret personlig konto frem for at dele en eksisterende (personlige konti kan lukkes rent ved fratræden)
- [ ] Giv adgang til virksomhedens password-manager, hvis relevant - del aldrig koder på mail/chat
- [ ] Skriv delte koder personen får kendskab til, ind i oversigtens "Delte adgange"

**Dokumentér (dette ER offboarding-listen):**
- [ ] Skriv hver tildelt adgang ind i `systemoversigt.md` med dato
- [ ] Tilføj personen i "Hvem har adgang"-kolonnen pr. system
- [ ] Log i ændringsloggen: [dato] - tildelt - [system] - [navn]

## Aldrig her

- Giv ikke admin "for en sikkerheds skyld" - opgrader senere, hvis behovet opstår.
- Del ikke en eksisterende medarbejders login med den nye - opret altid en egen konto.
- Skriv aldrig den faktiske adgangskode ind i tjeklisten eller oversigten.

## Afleveringstjek

- [ ] Hver adgang på listen er bundet til en konkret opgave.
- [ ] MFA er på hver konto.
- [ ] Alt tildelt er skrevet ind i `systemoversigt.md` - ellers kan det ikke lukkes igen.
