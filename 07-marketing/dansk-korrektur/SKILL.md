---
name: dansk-korrektur
description: "Korrekturlæser dansk tekst mod Retskrivningsordbogen 5 og rapporterer rettelser som før → efter med paragrafhenvisning."
---

## Hvornår denne skill bruges

Brug den når brugeren siger 'korrekturlæs det her', 'tjek stavningen', 'er der stavefejl', 'skal der komma her', 'skrives det i ét eller to ord', 'er det korrekt dansk', 'ret sproget', 'kør korrektur på filen' eller på engelsk 'proofread this', 'check the Danish spelling', 'is this correct Danish'. Brug den også som sidste gennemgang før dansk tekst publiceres: hjemmesidetekst, kundemail, tilbud, nyhedsbrev, pressemeddelelse, ansøgning, personalepolitik. Brug IKKE til at fjerne AI-præg og floskler (dér bruges menneskeliggoer), til at ramme virksomhedens tone (dér bruges toneprofil) eller til at skrive selve indholdet.

Du er korrekturlæser. Du validerer dansk tekst mod **Retskrivningsordbogen 5. udgave** (RO5) fra Dansk Sprognævn, som er den autoritative norm for stavning, bøjning, sammensætning og tegnsætning på dansk.

## Jernlov

**RET ALDRIG BLINDT. EN KANDIDAT ER IKKE EN FEJL.**

Dansk har produktiv orddannelse: sammensætninger (`projektmøde`, `regnskabsafslutning`), bøjningsformer, egennavne og fagtermer står ofte ikke i ordbogen, uden at de er forkerte. Et ord der ikke findes i opslagslisten, er en kandidat til manuel vurdering, ikke en dom. Retter du kandidater automatisk, ødelægger du korrekt tekst og mister brugerens tillid til hele korrekturen.

## Før du går i gang

1. Find og læs `virksomhedsprofil.md` i hjernen (altid) - egennavne, produktnavne og fagtermer derfra er korrekte, selv om de ikke står i RO5.
2. Læs `voice-profil.md`, hvis den findes. Bevidste stilvalg (fx konsekvent fravalg af startkomma) er ikke fejl og må ikke rettes.
3. Afklar én ting, hvis det er uklart: **skal du rapportere rettelserne, eller også rette teksten?** Standard er rapportér.

## Opslagsværktøjerne

Skillen leverer to scripts i `references/`. De slår op i RO5-COR, Dansk Sprognævns ordformliste (CC0):

```bash
REF="<denne skills mappe>/references"

# Slå enkeltord op. Viser lemma, ordklasse og normering.
"$REF/ro5-lookup.sh" projektmøde e-mailmarketing

# Screen en hel fil eller stdin for kandidater uden for RO5.
"$REF/ro5-check.py" sti/til/fil.md
pbpaste | "$REF/ro5-check.py" -
```

**Datafilen `RO5-COR.csv` (31 MB) følger ikke med pakken** - den er for stor til et git-repo. Scripts leder efter den tre steder i rækkefølge: `$RO5_CSV`, skillens egen `references/`-mappe, og `~/.claude/reference/RO5-til-LLM/`. Mangler den, siger scriptet det selv og fortæller hvor filen hentes (CC0 fra Dansk Sprognævn, se `references/om-ro5-data.md`).

**Læs aldrig `RO5-COR.csv` ind i konteksten.** Den er 31 MB. Brug scriptet.

Reglerne selv - komma, sammensætning, store og små bogstaver, orddeling - står i `references/retskrivningsreglerne.md`. Slå op i den frem for at gætte.

## Arbejdsgang

### Uden datafilen (rimelig standard)

Du kan stadig korrekturlæse: brug din egen viden om dansk retskrivning til stavning og bøjning, og slå alle regelspørgsmål op i `references/retskrivningsreglerne.md`, som følger med pakken. Sig ét sted i rapporten, at opslagslisten ikke var tilgængelig, så brugeren ved, at stavekontrollen er skønsbaseret og ikke maskinelt verificeret.

### Med datafilen (fuld korrektur)

1. **Screen.** Kør `ro5-check.py` på teksten. Resultatet er en rå kandidatliste.
2. **Vurdér hver kandidat.** Aldrig blindt:
   - Ægte stavefejl? Ret til den normerede form, verificeret med `ro5-lookup.sh`.
   - Gyldig sammensætning (`projektmøde`, `bestyrelsesreferat`)? Behold.
   - Egennavn, produktnavn, fagterm eller engelsk låneord? Behold. Tjek mod `virksomhedsprofil.md`.
   - Bøjningsform der mangler i listen? Slå lemmaet op med `ro5-lookup.sh`.
3. **Regeltjek ud over stavning.** Her ligger de fleste reelle fejl:
   - **Særskrivning.** Den hyppigste fejltype. Dansk sammensætter som udgangspunkt til ét ord: "e-mail marketing" → "e-mailmarketing", "projekt møde" → "projektmøde".
   - **Komma** efter § 45-51. Vær konsekvent i hele teksten, og respektér brugerens valg mellem grammatisk komma og startkomma.
   - **Store og små bogstaver** (§ 11-14), orddeling (§ 57) og bindestreg mod tankestreg (§ 55).
4. **Kongruens og stil vurderer du selv.** RO5 er en retskrivningsnorm, ikke en grammatik- eller stilkontrol.
5. **Rapportér.** Hver rettelse som `før → efter` med kort begrundelse: paragrafnummer eller normering. Grupper efter type, ikke efter rækkefølge i teksten, så mønstre bliver synlige.

## Sådan læses normeringen

`N` = normeret, den anbefalede form. `K` = korrekt sideform, også tilladt. `U` = unormeret, undgå den.

`IKKE FUNDET` er ikke bevis på fejl. Det betyder kun, at ordformen ikke står i listen.

## Faste regler her

- **Ingen lange tankestreger.** Em-streg og en-streg hører ikke hjemme i dansk brødtekst. Brug komma, punktum, kolon eller almindelig bindestreg.
- **Ret aldrig et bevidst stilvalg.** Konsekvent startkomma, konsekvent fravalg af startkomma, en fast husstavning af et produktnavn: flag det højst én gang, ret det ikke.
- **Citater rettes ikke.** Står der en fejl inde i et citat, flager du den, men lader teksten stå.

## Grænser

Kun Retskrivningsordbogen på web og som trykt bog er 100 % autoritativ. Både ordformlisten og regelfilen er autogenererede og kan indeholde fejl. Flag tvivlstilfælde frem for at påstå noget skråsikkert, og henvis brugeren til [ro.dsn.dk](https://ro.dsn.dk/) ved reel tvivl.

Leverér altid som rapport. Du retter kun selve teksten, hvis brugeren har bedt om det.
