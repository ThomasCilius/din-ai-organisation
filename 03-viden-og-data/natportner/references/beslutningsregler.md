# Beslutningsregler for natportneren

Portnerens faglighed: journaliseringsprincippet fra klassisk arkivpraksis oversat til brain-mappen. Læs hele filen før du afgør den første note i en kørsel.

## Indhold

1. Journaliseringsprincippet
2. Beslutningstræet - én beslutning pr. note
3. Regler for nye videnfiler
4. Fletteregler
5. Kassationskriterier
6. Konflikthåndtering
7. Kildeangivelse
8. Persondata-tjekliste

## Journaliseringsprincippet

Klassisk arkivpraksis - den samme disciplin en kontorleder eller journalfører bruger på papirpost - hviler på tre regler:

1. **Ét indgangspunkt.** Alt løst lander i `inbox/`. Noter der ligger spredt andre steder, hører ikke under portneren - nævn dem i rapporten under "Til afgørelse", men behandl dem ikke.
2. **Hver sag afgøres én gang.** En note der er rørt, skal også være afgjort. Halvbehandlede noter er arkivets død: ingen ved længere hvad der er gjort.
3. **Sporbarhed.** Enhver afgørelse kan findes igen i natterapporten: hvad skete der, hvorfor, og hvor blev videnindholdet af.

Grunden til at princippet virker: beslutningsomkostningen betales én gang, samlet, i stedet for hver gang nogen senere falder over noten og skal gætte dens status.

## Beslutningstræet

Kør hver note gennem træet fra toppen. Første ja afgør noten.

1. **Ligger noten i `inbox/behandlet/`?** → Spring over (idempotens). Tæl den ikke med i rapporten.
2. **Indeholder noten persondata fra tjeklisten nederst?** → Stop for denne note: den bliver i inboxen, markeres i rapporten under "Konflikter/Til afgørelse", og ejeren henvises til `gdpr-fortegnelse`. Skriv INTET af indholdet ind i videnfiler.
3. **Er indholdet uden varig værdi?** (se Kassationskriterier) → **Kassér:** flyt til `inbox/behandlet/` med én linjes begrundelse i rapporten. Aldrig uden begrundelse.
4. **Modsiger noten en eksisterende videnfil eller `virksomhedsprofil.md`?** → **Konflikt:** følg Konflikthåndtering. Noten bliver i inboxen.
5. **Findes der allerede en videnfil om emnet?** → **Flet:** følg Fletteregler, flyt derefter noten til `inbox/behandlet/`.
6. **Ellers** → **Ny videnfil:** følg Regler for nye videnfiler, flyt derefter noten til `inbox/behandlet/`.

Dækker en note flere emner (fx et mødereferat med både en kundeaftale og en procesændring), er beslutningen stadig ÉN pr. note: "flet - fordelt på kunder/maersk.md og processer/fakturering.md". Rapportér hver destination på samme linje.

## Regler for nye videnfiler

Formatet er identisk med det `videnfil-interview` producerer - brain-mappen skal se ens ud uanset hvem der har skrevet:

- **Ét emne pr. fil.** Hellere to små filer end én blandet.
- **Maks 10 linjer.** Destillér: undtagelser, tommelfingerregler og "hvad gør vi når det går galt" er vigtigere end lykkelige procestrin.
- **Aktiv form.** "Ring til Jens ved hastesager" - ikke "det kan overvejes at kontakt eventuelt tages".
- **Kebab-case-filnavn** der beskriver emnet: `maersk-kontaktpersoner.md`, ikke `note7.md`.
- **Rette emneundermappe.** Findes der ingen passende undermappe, så foreslå én i planen - opret den kun efter godkendelse.
- **Kildeangivelse nederst** (se [Kildeangivelse](#kildeangivelse)).

## Fletteregler

1. **Læs hele den eksisterende videnfil først.** Du kan ikke flette ind i noget du ikke har læst.
2. **Dublettjek før alt andet:** står oplysningen der allerede, skriver du intet - notér "allerede kendt" i rapporten og flyt noten til behandlet. Det er dét der gør dobbeltkørsler ufarlige.
3. **Tilføj - omskriv ikke.** Eksisterende linjer og deres kildeangivelser står urørt. Du føjer til og opdaterer kun kildelinjen med den nye kilde.
4. **Overskrides de 10 linjer** efter fletning: destillér filen i planen (vis før/efter), eller foreslå at dele den i to emnefiler. Udfør først efter godkendelse - en destillation ændrer eksisterende indhold og er derfor aldrig en "sikker handling".
5. **Modsiger det nye det gamle:** stop - det er ikke en fletning men en konflikt. Gå til Konflikthåndtering.

## Kassationskriterier

Kassér (= flyt til `inbox/behandlet/` uden at skrive noget ind) når noten er:

- **En ren to-do** ("husk at ringe til revisor") - opgaver hører i opgavesystemet, ikke i brain-mappen. Nævn den under "Til afgørelse" så den ikke drukner.
- **En forældet engangsbesked** ("mødet i tirsdags er flyttet til kl. 14") - uden værdi efter datoen.
- **En dublet** af viden der allerede står i en videnfil (og noten ikke tilføjer noget nyt).
- **Et ulæseligt fragment** ("jens - torsdag - 4500??") - kan intet sikkert udledes, kassér med begrundelsen "ulæseligt fragment" og nævn den under "Til afgørelse", så ejeren kan redde den hvis den var vigtig.

Altid med én linjes begrundelse i rapporten. Er du i tvivl om varig værdi: kassér IKKE - markér noten "afventer" og lad ejeren afgøre. Tvivl er menneskets domæne.

## Konflikthåndtering

En konflikt er samme faktum med forskellig værdi: priser, satser, navne, ansvar, frister, procedurer. "Ny oplysning om nyt emne" er ikke en konflikt - det er en fletning.

Når du finder en konflikt:

1. **Citér begge versioner ordret** i rapporten - den eksisterende linje (med fil og kilde) og notens version (med kilde og dato).
2. **Overskriv aldrig automatisk.** Heller ikke når noten er nyere - nyere er ikke altid rigtigere (noten kan referere et forslag, ikke en beslutning).
3. **`virksomhedsprofil.md` vinder** ved faktakonflikt om stamdata, ydelser, priser eller positionering: notens version indskrives IKKE, konflikten rapporteres, og ejeren henvises til skillen `virksomhedsprofil` hvis profilen skal opdateres.
4. **Noten bliver i inboxen** indtil ejeren har afgjort konflikten. Ved næste kørsel genlistes den under Konflikter med "(gentaget fra kørsel [dato])" - analysér den ikke forfra.
5. **Efter ejerens afgørelse** (typisk i næste tur): udfør afgørelsen, opdatér kildeangivelsen og flyt noten til behandlet.

Rapportformat pr. konflikt:

```
- [notefil] MODSIGER [videnfil]:
  Eksisterende: "Betalingsfrist 30 dage" (kunder/maersk.md, kilde: Thomas, 2026-03-12)
  Ny note:      "Betalingsfrist 14 dage" (moedenote-0705.md, 2026-07-05)
  Afgør: hvilken gælder? Noten bliver i inboxen indtil svar.
```

## Kildeangivelse

Hver oplysning der skrives ind i en videnfil, får en kildelinje:

```
Kilde: [person, hvis noten nævner ophav; ellers notens filnavn], [notens dato; ellers dags dato]
```

Reglen er ufravigelig, fordi `brain-tjek` bruger kilde + dato til at vurdere forældelse. En videnfil uden kilde er et fund ved næste dokumentreview - så portneren afleverer aldrig en uden.

Er ophavet ukendt, er notens filnavn en gyldig kilde. Et gæt på en person er ikke.

## Persondata-tjekliste

Stop-kategorier - skrives ALDRIG ind i videnfiler, uanset hvad noten siger:

- CPR-numre
- Helbredsoplysninger (sygemeldinger, diagnoser, fravær med årsag)
- Løn og lønforhandling på navngivne enkeltpersoner
- Fagforeningsforhold
- Adgangskoder og API-nøgler (adgange må gerne noteres som LISTE over hvad der findes - aldrig selve koden)
- Persondata om tredjepart (kunders kunder, pårørende)

Handling: noten bliver i inboxen, rapporten markerer den med kategori (skriv ikke selve indholdet i rapporten), og ejeren henvises til `gdpr-fortegnelse`. Ved mistanke om databrud (data er set af uvedkommende, sendt forkert, lækket): eskalér STRAKS til ejeren med henvisning til 72-timers-anmeldelsesfristen - vurder aldrig selv at "det nok ikke er alvorligt".
