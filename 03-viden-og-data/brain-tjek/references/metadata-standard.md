# Metadata-standard for videnfiler

Læses når du skal foreslå et konkret metadata-format, afgøre om en fil overhovedet er en videnfil, eller vurdere grænsetilfælde.

## Standard-metadata-blok

Hver videnfil afsluttes med denne blok (tre linjer, nederst i filen):

```
---
Kilde: [person], [aar-mm-dd]
Revideret: [aar-mm-dd]
Status: gældende
```

- **Kilde** er den person der står inde for indholdet, plus datoen for hvornår viden blev afgivet. Det er den dato forældelsesvurderingen regner fra, hvis Revideret mangler.
- **Revideret** opdateres KUN når nogen faktisk har læst filen igennem og bekræftet eller rettet indholdet - aldrig som ren dato-opfriskning. En revisionsdato uden reelt review er værre end ingen, fordi den giver falsk tryghed.
- **Status** er `gældende` eller `udgået`. Udgåede filer hører hjemme i `/arkiv` - en fil med status: udgået der stadig ligger i den aktive mappe, er et fund.

Denne standard håndhæves også af `videnfil-interview` (der skriver blokken ved oprettelse) og `natportner` (der kræver kilde ved journalisering). brain-tjek er bagstopperen der fanger filerne hvor det glippede.

## Hvad er en videnfil - scope for tjekket

**I scope:**

- Videnfiler (én fil = ét emne, maks. 10 linjer + metadata-blok)
- `virksomhedsprofil.md` (læses som autoritativ kilde; markeres, men rettes aldrig af brain-tjek)
- Procedurer og arbejdsinstruktioner der ligger i brain-mappen
- Voice- og designprofiler (tjekkes kun for metadata og forældelse, ikke for indhold)

**Uden for scope:**

- `/inbox` og alt deri - det er natportnerens område; ubehandlede noter er ikke fund
- `/arkiv` og alt deri - arkivet ER slutstationen; gamle filer dér er ikke forældede, de er arkiverede
- Rapporter og logfiler: `natterapport*.md`, `brain-tjek-rapport-*.md` og lignende kørselsartefakter - de er dokumentation af kørsler, ikke viden, og skal ikke have metadata-blok
- Filer brugeren eksplicit har bedt dig holde dig fra

Er du i tvivl om en fil er i scope, så spørg - medregn den ikke bare stiltiende.

## Grænsetilfælde

| Situation | Vurdering |
|---|---|
| Kilde angivet, men ingen dato | Forældreløs (delvist) - datoen er det brain-tjek navigerer efter. Foreslå: spørg kilden og tilføj dato. |
| Dato i filnavnet, ingen metadata-blok | Tæl datoen som kildedato i denne kørsel, men markér som skabelon-uensartet: datoen skal ind i blokken. |
| Metadata i toppen i stedet for bunden | Ikke et fund - placering er smag. Felterne og indholdet er kravet. |
| Kilden er fratrådt | Filen er IKKE automatisk forældet, men markér den som fund: indholdet bør bekræftes af en nuværende medarbejder, som overtager som kilde. |
| Kilden er "internettet", et AI-svar eller ukendt | Forældreløs. En kilde skal være en person (eller et navngivet autoritativt opslagsværk, fx "datatilsynet.dk, [dato]") - "det stod et sted" tæller ikke. |
| Status mangler, men filen er tydeligt i brug | Markér som skabelon-uensartet (LAV), ikke forældreløs - hvis kilde og dato ellers er på plads. |
| Auto-genereret indhold (fx udtræk fra systemer) | Kilde = systemnavn + udtræksdato. Gyldigt, men markér som fund hvis udtrækket er ældre end 6 måneder. |

## Én regel over dem alle

Opfind aldrig metadata. Hvis du ikke ved hvem kilden er, så er svaret "ingen kilde" - og det er et fund, ikke et hul du udfylder med et kvalificeret gæt. Et gæt skrevet ind i en metadata-blok bliver til "fakta" i næste kørsel, og så er hele systemets troværdighed væk.
