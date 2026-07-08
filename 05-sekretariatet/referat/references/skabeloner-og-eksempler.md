# Skabeloner og eksempler

Læs denne fil når du skal producere artefakt-parret (trin 6 i arbejdsgangen). Brug skabelonerne præcis som de står - fast struktur gør referaterne sammenlignelige på tværs af møder, og gør at `opfoelgningsliste` kan høste aktionerne maskinelt.

## Indhold

1. [Skabelon A: Beslutningsreferat](#skabelon-a-beslutningsreferat)
2. [Skabelon B: Protokol (bestyrelsesmøde)](#skabelon-b-protokol-bestyrelsesmoede)
3. [Skabelon C: Opfølgningsmail](#skabelon-c-opfoelgningsmail)
4. [Gennemarbejdet eksempel: transskript → referat-uddrag](#gennemarbejdet-eksempel)

## Skabelon A: Beslutningsreferat

Filnavn: `referat-ÅÅÅÅ-MM-DD-[møde].md`

```markdown
# Referat: [mødenavn] - [ÅÅÅÅ-MM-DD]

## Ramme
- **Dato og format:** [ÅÅÅÅ-MM-DD, fysisk/video, varighed]
- **Deltagere:** [Navn (rolle), Navn (rolle), ...]
- **Afbud:** [Navn eller "ingen"]
- **Referent:** [Claude-udkast; godkendes af NAVN]
- **Referattype:** [Beslutningsreferat/forhandlingsreferat/fuldt referat] - [begrundelse i én sætning]

## Dagsordenspunkter

### 1. [Punktets titel]
[Kort kontekst, 1-2 linjer.]

**BESLUTNING:** [Hvad der blev besluttet, af hvem, med kilde (tidsstempel/linje)] - eller "Ingen beslutning."

**AKTION:** [Hvem gør hvad inden hvornår] - eller udelades hvis ingen.

*Drøftelse/orientering:* [kun hvis nødvendigt, tydeligt markeret som netop det]

### 2. [Næste punkt - samme mønster]

## Aktionsliste

| Hvem | Hvad | Deadline | Kilde |
|---|---|---|---|
| [Navn] | [Konkret handling] | [ÅÅÅÅ-MM-DD] | [Punkt X, tidsstempel] |
| [UAFKLARET - spørg mødedeltagerne] | [Handling uden ejer] | [UAFKLARET] | [Punkt Y, tidsstempel] |

## Aabne spoergsmaal og [UAFKLARET]-punkter
- [Punkt + hvad der mangler + hvor i kilden det står]

## Naeste moede
[Dato/aftale eller [UAFKLARET - ikke aftalt på mødet]]

## Kilder
- [Transskript-/notefil + dato]
- [Evt. lov-/vedtægtshenvisninger med opfordring til opslag på retsinformation.dk]
```

## Skabelon B: Protokol (bestyrelsesmoede)

Filnavn: `referat-ÅÅÅÅ-MM-DD-bestyrelsesmoede-nr-[X].md`. Se kravene i `formelle-moeder-og-protokol.md` FØR du bruger denne.

```markdown
# Protokol for bestyrelsesmøde nr. [X] i [Selskabsnavn A/S/ApS], CVR [nr.]

## Ramme
- **Dato, sted/format:** [...]
- **Tilstedeværende medlemmer:** [Navne]
- **Afbud:** [Navne]
- **Øvrige deltagere (uden underskrift):** [fx direktør, revisor]
- **Dirigent/mødeleder:** [Navn] - **Referent:** [Navn]
- **Beslutningsdygtighed:** Konstateret jf. [vedtægter/forretningsorden §] - [ja/nej]

## Punkter

### 1. [Punktets titel]
Indstilling: [...]

**BESLUTNING:** [Ordlyd. Evt. afstemning: X for, Y imod, Z undlod.]

**DISSENS:** [Medlemmets mening ordret, hvis forlangt - ellers udelades linjen]

**AKTION:** [Hvem/hvad/deadline]

## Aktionsliste
| Hvem | Hvad | Deadline | Kilde |
|---|---|---|---|

## Aabne spoergsmaal og [UAFKLARET]-punkter
[...]

## Naeste moede
[...]

## Kilder
- [Kildemateriale]
- Selskabslovens § 128 (protokolpligt og underskrifter) - slå aktuel ordlyd op på retsinformation.dk.

## Underskrifter
Protokollen underskrives af samtlige tilstedeværende medlemmer, jf. selskabslovens § 128:

_______________________  _______________________  _______________________
[Navn]                   [Navn]                   [Navn]
```

## Skabelon C: Opfoelgningsmail

Filnavn: `opfoelgningsmail-ÅÅÅÅ-MM-DD-[møde].md`. Skrives i ejerens tone fra `voice-profil.md` (hilsen, afslutning, formalitetsniveau). KLADDE - sendes aldrig.

```markdown
# KLADDE - opfølgningsmail (sendes ikke af Claude)

**Til:** [deltagerne]
**Emne:** Opfølgning: [mødenavn] [ÅÅÅÅ-MM-DD] - beslutninger og aktioner

[Hilsen i ejerens stil]

Tak for mødet [i går/i dag]. Kort opsummeret besluttede vi:

1. [Vigtigste beslutning]
2. [Næste beslutning - maks 3]

Aktioner:

| Hvem | Hvad | Deadline |
|---|---|---|
| [Navn] | [Handling] | [Dato] |

[Kun hvis relevant:] Vi mangler afklaring på: [UAFKLARET-punkter i én linje - fx "hvem tager kontakten til X?"]

Fuldt referat er vedhæftet/deles i [placering].

[Afslutning i ejerens stil]
```

Bemærk: mailens aktionstabel udelader Kilde-kolonnen - modtagerne behøver ikke tidsstempler, det gør arkivet.

## Gennemarbejdet eksempel

Transskript-uddrag (Teams-udskrift, ledelsesmøde 2026-07-06):

> [00:18:22] Mette: ...og så er der hjemmesiden. Den er altså for langsom.
> [00:18:31] Jonas: Enig. Jeg har fået tilbud fra to bureauer, det ene ligger på 40.000.
> [00:19:02] Karin: Skal vi ikke også lige overveje at gøre det selv? Anders har jo bygget den slags før.
> [00:19:40] Mette: Det kan vi tale om. Men vi skal have gjort NOGET inden kundekampagnen i september.
> [00:20:05] Jonas: Jeg kan indhente et tredje tilbud og en vurdering fra Anders, så beslutter vi næste gang?
> [00:20:12] Mette: Ja, gør det. Senest til mødet den 20.

SKIDT referat-uddrag (klassikerfejlen - drøftelse forklædt som beslutning, aktioner uden disciplin):

> Punkt 4: Hjemmesiden er for langsom. Det blev besluttet at få den bygget om inden september, muligvis internt ved Anders. Jonas kigger på tilbud.

Tre fejl: (1) der blev IKKE besluttet en ombygning - kun at indhente grundlag; (2) "muligvis internt" er en drøftelse, ikke en beslutning; (3) "kigger på tilbud" mangler både præcision og dato.

GODT referat-uddrag:

> ### 4. Hjemmesidens hastighed
> Sitet er for langsomt i forhold til kundekampagnen i september. To bureautilbud foreligger (det ene på 40.000 kr.); intern løsning via Anders blev nævnt (drøftelse - ingen beslutning, 00:19:02-00:19:40).
>
> **BESLUTNING:** Beslutningsgrundlag indhentes, og valget træffes på mødet den 20. (godkendt af Mette, 00:20:12).
>
> **AKTION:** Jonas indhenter et tredje bureautilbud og en vurdering fra Anders - deadline 2026-07-20.

Og i aktionslisten:

| Hvem | Hvad | Deadline | Kilde |
|---|---|---|---|
| Jonas | Indhenter 3. bureautilbud + vurdering fra Anders vedr. hjemmeside | 2026-07-20 | Punkt 4, 00:20:05 |
