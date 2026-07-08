# Kvartalsvis licens-audit

Målet: hver måned betales der kun for licenser, en aktiv bruger faktisk har brug for. Ubrugte licenser er en direkte, ren besparelse - der er ingen risiko ved at fjerne et sæde, ingen bruger. Kør denne audit hvert kvartal (hver 3. måned) og hold den op mod `systemoversigt.md`.

## Metode

1. **Tæl købte sæder mod aktive brugere pr. system.** Kilden er leverandørens admin-panel (antal licenser + hvornår hver bruger sidst loggede ind) sammenholdt med oversigtens "Hvem har adgang".
2. **Marker hver licens i én af tre bunker:** aktivt brugt / ubrugt (ingen eller inaktiv bruger) / overdimensioneret (bruges, men en billigere plan ville dække).
3. **Regn besparelsen pr. måned og pr. år** for hver anbefalet nedskæring - årsbeløbet gør beslutningen let at træffe.
4. **Tjek fornyelser inden for 90 dage** - opsig eller nedgrader FØR fornyelsen, ikke efter, ellers bindes endnu en periode.

Aktuelle priser og planniveauer slås op hos den enkelte leverandør - hardcod dem aldrig. Skriv `[pris]` som pladsholder, hvis du ikke har tallet.

## Typiske SMV-syndere (kig her først)

- **Microsoft 365-planer over behov.** Alle sidder på Business Standard/Premium, men flere bruger reelt kun mail og Teams (ville klare sig med en billigere plan). Tjek, om nogen kan nedgraderes.
- **Adobe-sæder, ingen bruger.** Creative Cloud er dyrt pr. sæde - et sæde tildelt til en, der er holdt op med at designe (eller er fratrådt), er ren spild.
- **Glemte SaaS-abonnementer.** Værktøjer købt til ét projekt og aldrig opsagt: gamle projektstyringsværktøjer, dubletter (to nyhedsbrevsværktøjer), trials der blev til betalt abonnement. De findes ved at gennemgå kontoudtog/kreditkortposteringer for tilbagevendende træk, ikke kun oversigten.
- **Dobbelt dækning.** To værktøjer, der gør det samme (fx både Dropbox og OneDrive betalt), eller en funktion, der allerede indgår i en eksisterende plan.
- **Fratrådte, der stadig har licens.** Krydstjek mod at offboarding faktisk frigav sædet - ellers betales der for en, der er gået.

## Fast artefakt

```
# Licens-audit - [aaaa-Qn]
Kilde: leverandoernes admin-paneler + systemoversigt.md + kontoudtog

## Pr. system
| System | Koebte saeder | Aktive brugere | Pris/md. | Vurdering |
|---|---|---|---|---|
| Adobe CC | 3 | 1 | [pris] | 2 saeder ubrugt |
| Microsoft 365 | 8 | 8 | [pris] | 2 kan nedgraderes til Basic |

## Anbefalede nedskaeringer
| System | Handling | Besparelse/md. | Besparelse/aar | Fornyelse foer? |
|---|---|---|---|---|
| Adobe CC | fjern 2 saeder | [beloeb] | [beloeb] | tjek dato |

## Fornyelser inden for 90 dage
[system] - [dato] - [beslut: forny / nedgrader / opsig]

## Antagelser og aabne spoergsmaal

## Kilder
```

## Aldrig her

- Opsig eller nedgrader aldrig selv et abonnement - du leverer anbefalingen med besparelse, brugeren beslutter og udfører.
- Antag aldrig en pris - slå den op hos leverandøren, eller lad den stå `[pris]`.
- Anbefal aldrig at fjerne et sæde uden at have tjekket, at det faktisk er inaktivt (sidste login) - en aktiv, men sjælden bruger må ikke miste adgangen.
