# systemoversigt.md - skabelon og vedligehold

Oversigten er denne skills levende hovedartefakt. Den er ét sted, der besvarer tre spørgsmål på én gang: hvem har adgang til hvad, hvad koster det, og hvornår fornyes det. Onboarding skriver ind i den, offboarding lukker ud fra den, og licens-audit tæller på den. Er den forældet, er alle tre spor gætværk.

## Sådan bygger du den første gang

1. Start fra `virksomhedsprofil.md` - den nævner de systemer, virksomheden bruger.
2. Suppler ved at spørge hvor pengene går: gennemgå de seneste kontoudtog/kreditkortposteringer for tilbagevendende SaaS-træk (Microsoft, Google, Adobe, Canva, regnskabssystem, CRM, nyhedsbrevsværktøj, hosting, domæne). Glemte abonnementer gemmer sig netop her.
3. For hvert system: hvem er admin, hvem har brugeradgang, hvor mange licenser er købt, pris pr. måned, og fornyelsesdato.
4. Notér delte adgange separat (fælleskonti, wifi, koder der ligger i en password-manager) - de er dem, der skal skiftes ved en fratrædelse.

Byg den ikke perfekt i første forsøg. En oversigt med de 10 vigtigste systemer i dag slår en komplet oversigt "på et tidspunkt". Markér huller `[MANGLER I OVERSIGT]` og udfyld dem løbende.

## Fast struktur

```
# Systemoversigt - [virksomhed]
Sidst opdateret: [dato] af [hvem]

## Systemer og licenser
| System | Admin-ansvarlig | Hvem har adgang | Licensantal | Pris/md. | Fornyelse | Note |
|---|---|---|---|---|---|---|
| Microsoft 365 | Peter | alle 8 | 8 x Business Std | [pris] | 01-03-2027 | 2 kunne vaere Basic |
| e-conomic | Mette | Mette, Peter | 2 | [pris] | loebende | |
| Canva Team | Sofie | Sofie, Anders | 5 | [pris] | 14-11-2026 | 3 saeder ubrugt |

## Delte adgange (faelleskonti, wifi, koder i password-manager)
| Hvad | Hvor ligger koden | Hvem kender den | Skift ved fratraeden? |
|---|---|---|---|
| Info-mailboks | password-manager | Mette, Peter | ja |
| Kontor-wifi | password-manager | alle | ja hvis medarb. kendte den |

## AEndringslog
[dato] - [tildelt/lukket] - [system] - [person] - [hvem udfoerte]
```

## Kolonneregler

- **Hvem har adgang**: navngivne personer eller "alle N" - aldrig "diverse". Det er denne kolonne, offboarding tjekkes imod.
- **Pris/md.**: skriv `[pris]` som pladsholder og anvis opslag hos leverandøren, hvis du ikke har tallet - hardcod aldrig et pristal fra hukommelsen, det forældes.
- **Fornyelse**: en dato eller "løbende (opsiges med [varsel])". Fornyelsesdatoer inden for 90 dage er dem, licens-audit skal fange.
- **Note**: her lever audit-observationer ("3 sæder ubrugt", "kunne nedgraderes").

## Vedligehold: hold den levende

- **Onboarding** tilføjer rækker/navne og skriver i ændringsloggen.
- **Offboarding** fjerner personens navn fra hver adgangskolonne, markerer delte koder til skift, og logger lukningen med dato.
- **Licens-audit** opdaterer priser, fornyelsesdatoer og noter.

Regel: rør aldrig oversigten uden at opdatere "Sidst opdateret" og tilføje en linje i ændringsloggen. En oversigt uden spor på, hvem der ændrede hvad hvornår, mister tilliden hurtigt.

## Følsomhed

Oversigten er et følsomt dokument: den viser, hvem der kan komme ind hvor. Den indeholder aldrig selve adgangskoderne (dem i en password-manager), kun hvor de ligger, og hvem der kender dem. Den deles kun med dem, der driver IT - ikke bredt i virksomheden.
