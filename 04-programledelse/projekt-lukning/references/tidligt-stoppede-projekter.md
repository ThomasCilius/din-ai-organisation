# Tidligt stoppede projekter - lukning uden zombie

Læses når lukningstypen er B (besluttet stop) eller C (projektet er fiset ud). Et droppet projekt uden formel lukning bliver en zombie: det dukker op i møder ("skulle vi ikke..."), reserverer mental kapacitet hos deltagerne, efterlader leverandører og kunder i uvished - og dets erfaringer går tabt. Derfor: samme lukning som et fuldført projekt, med fire tilføjelser.

## Indhold

1. [Hvad er anderledes](#1-hvad-er-anderledes)
2. [Genbrugskataloget](#2-genbrugskataloget)
3. [Formel afblæsning - skabeloner](#3-formel-afblaesning---skabeloner)
4. [Type C: projektet der fes ud](#4-type-c-projektet-der-fes-ud)
5. [Teamet og tonen](#5-teamet-og-tonen)

## 1. Hvad er anderledes

Evalueringens struktur fra SKILL.md bruges uændret, med disse justeringer:

- **Succeskriterier måles til stoppunktet.** Hvert kriterium får stadig sin række - faktisk-kolonnen viser status ved stop. "Ikke nået fordi stoppet" er et gyldigt svar; udeladelse er ikke.
- **Stop-begrundelsen dokumenteres.** Hent den fra prioriteringsoplægget (`projekt-prioritering`) eller beslutningsloggen (`risiko-issue-log`): hvem besluttede, hvornår, på hvilket grundlag, og hvilke alternativer der blev fravalgt. Findes den ingen steder: rekonstruér den med brugeren og markér den [BEKRÆFTES AF PROJEKTEJER]. Uden dokumenteret begrundelse starter diskussionen forfra om et halvt år.
- **Forbrug til dato noteres råt** - timer og kroner brugt frem til stop, mod det oprindelige budget. Ingen kommentarer, ingen retfærdiggørelse. Det er kalibreringsdata, og sunk cost er allerede afholdt uanset hvad der står i evalueringen.
- **Genbrugskataloget tilføjes** som ekstra sektion i evalueringen, lige efter afslutningstjeklisten (afsnit 2).

Afslutningstjeklistens fem punkter gælder stadig - "leverancer accepteret" bliver til "delleverancer gjort op: hvad er færdigt, halvfærdigt, ikke påbegyndt".

## 2. Genbrugskataloget

Det brugte arbejde er kun spildt hvis det også smides væk. Gennemgå projektets delresultater og byg en tabel:

| Aktiv | Tilstand | Kan genbruges til | Ejer (navn) | Placering |
|---|---|---|---|---|
| Kravspecifikation | Færdig | Genstart eller lignende projekt | ... | ... |
| Leverandøranalyse | Færdig | Næste indkøb i kategorien | ... | ... |
| Halvfærdig integration | 60 % - udokumenteret | Kun med samme udvikler | ... | ... |

Spørg konkret: "Hvad blev der faktisk lavet - dokumenter, analyser, kode, aftaler, kontakter?" Alt får en ejer og en placering, ellers er kataloget en ønskeliste. Vær ærlig i tilstandskolonnen: halvfærdigt arbejde uden dokumentation har ofte negativ genbrugsværdi, og det skal stå der.

Kontrakter kræver særlig opmærksomhed: kan de opsiges, skal der betales for at komme ud, eller kan de overdrages? Ved kontraktuelle spørgsmål: stop og henvis til projektejer/advokat (Aldrig-regel 5).

## 3. Formel afblæsning - skabeloner

Alle beskeder afleveres som KLADDER - brugeren sender selv (Aldrig-regel 3). Læs `voice-profil.md` før du skriver til eksterne. Tilpas frit, men behold de tre elementer: klar besked, kort begrundelse uden dramatik, og hvem man fremover kontakter.

**Intern (team og kolleger):**

> Emne: [Projekt] afsluttes pr. [dato]
>
> Hej alle
>
> Vi har besluttet at stoppe [projekt] pr. [dato]. Baggrunden er [én linje - fx "at vi prioriterer kapaciteten på X i stedet"]. Det er en prioriteringsbeslutning, ikke en dom over arbejdet - [konkret delresultat] bliver gemt og kan genbruges.
>
> Det betyder: [projektmøderne udgår / opgaverne lukkes / eventuel overdragelse].
> Spørgsmål: kontakt [navn].

**Ekstern (leverandør/samarbejdspartner):**

> Emne: [Projekt] - formel afslutning af samarbejdet pr. [dato]
>
> Kære [navn]
>
> Vi skriver for formelt at orientere om at [virksomhed] stopper [projekt] pr. [dato]. Vi vil gerne takke for samarbejdet indtil nu.
>
> I forhold til vores aftale betyder det: [afregning af udført arbejde / opsigelse jf. aftalens pkt. X / [AFKLARES]]. [Navn] vender tilbage om de praktiske detaljer senest [dato].

Udestående økonomi med eksterne markeres altid [AFKLARES] i kladden medmindre brugeren har oplyst præcis hvad der gælder - gæt aldrig på kontraktvilkår.

## 4. Type C: projektet der fes ud

Ingen har besluttet stop - projektet er bare holdt op med at bevæge sig. Her er selve evalueringen en anledning til at få beslutningen truffet:

1. Konstatér det neutralt: "Sidste aktivitet var [dato/milepæl]. Der er ikke truffet nogen stop-beslutning."
2. Kør lukningen som ved type B, men indstillingen til projektejer får et eksplicit valg øverst: **beslut formelt stop, eller beslut genstart med ny plan** - status quo (udefineret pause) er ikke en mulighed i indstillingen, for det er netop zombie-tilstanden.
3. Skal genstart overvejes op mod andre projekter, så henvis til `projekt-prioritering` - denne skill anbefaler ikke selv fortsæt/stop.

## 5. Teamet og tonen

At stoppe et projekt i tide er god styring, ikke fiasko - virksomheder der aldrig stopper projekter, prioriterer ikke, de akkumulerer. Skriv evalueringen i den tone:

- Stoppet omtales som en beslutning ("vi prioriterede kapaciteten anderledes"), aldrig som et sammenbrud - og uden at pynte: de rå tal og de ikke-nåede kriterier står der stadig.
- Jernloven gælder skærpet: ved stoppede projekter er fristelsen til at finde en skyldig størst. Årsagerne er proces og rammer - som ved alle andre retrospektiver.
- Læringerne er ofte mere værdifulde end ved fuldførte projekter: "hvornår vidste vi reelt at det ikke ville lykkes - og hvad forsinkede beslutningen?" giver typisk den bedste regel til laeringslog.md (fx "når et projekt misser to milepæle i træk, så tag fortsæt/stop-beslutningen eksplicit på næste ledelsesmøde").
