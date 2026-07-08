# Natterapport - skabelon og eksempel

Rapporten er portnerens kvittering til ejeren. Målet er skimbarhed: ejeren skal på 2 minutter kunne se hvad der skete, og kun skulle tænke over det der står under "Konflikter" og "Til afgørelse".

## Linjeformatet

Hver note får præcis én linje: **filnavn → handling → én linjes begrundelse → kilde.**

- Én linje pr. note - aldrig afsnit, aldrig punktlister under punktlister.
- Begrundelsen svarer på "hvorfor denne beslutning", ikke "hvad stod der i noten".
- Tomme sektioner skrives med "- ingen" - så ejeren kan se at kategorien er tjekket, ikke glemt.
- Antal i parentes i hver sektionsoverskrift, så totalen kan tælles med et blik.

## Skabelonen

Ny kørsel indsættes ØVERST i `natterapport.md`. Tidligere kørsler bevares nedenunder - rapporten er samtidig logbog.

```markdown
## Kørsel [ÅÅÅÅ-MM-DD kl. TT:MM]

**[X] noter behandlet, [Y] konflikter til afgørelse, [Z] afventer.**

### Behandlet ([antal] noter)
- [samlet linje: hvor mange læst, hvor mange sprunget over som allerede behandlet]

### Oprettet (nye videnfiler)
- [notefil] → ny fil [sti/videnfil.md]: [begrundelse]. Kilde: [person/filnavn], [dato].

### Flettet (ind i eksisterende videnfiler)
- [notefil] → flettet ind i [sti/videnfil.md]: [hvad blev tilføjet]. Kilde: [person/filnavn], [dato].

### Konflikter (til afgørelse - noten bliver i inboxen)
- [notefil] MODSIGER [videnfil]:
  Eksisterende: "[ordret citat]" ([fil], kilde: [kilde, dato])
  Ny note:      "[ordret citat]" ([notefil], [dato])
  Afgør: [det konkrete spørgsmål ejeren skal svare på]

### Kasseret (flyttet til behandlet med begrundelse)
- [notefil]: [begrundelse - fx "ren to-do, hører i opgavesystemet"].

### Til afgørelse og næste skridt (altid med)
- [åbne punkter: afventende noter, persondata-markeringer, forslag til nye undermapper, to-do'er fundet i kasserede noter]
```

## Udfyldt eksempel

En kørsel hos et opdigtet VVS-firma med seks noter i inboxen:

```markdown
## Kørsel 2026-07-07 kl. 08.42

**6 noter behandlet, 1 konflikt til afgørelse, 1 afventer.**

### Behandlet (6 noter)
- 8 filer i inbox: 6 behandlet, 2 sprunget over (lå allerede i behandlet fra kørsel 2026-06-30).

### Oprettet (nye videnfiler)
- note-akut-vagtplan.md → ny fil processer/akutvagt.md: fast procedure for vagttelefon uden eksisterende fil om emnet. Kilde: Karin, 2026-07-02.

### Flettet (ind i eksisterende videnfiler)
- moedenote-novo-0703.md → flettet ind i kunder/novo-byggeri.md: ny kontaktperson (Jens Holm, drift) tilføjet. Kilde: Thomas, 2026-07-03.
- leverandoer-tilbud-broedrene-dahl.md → flettet ind i leverandoerer/broedrene-dahl.md: ny rabataftale på fittings. Kilde: notens filnavn, 2026-07-01.

### Konflikter (til afgørelse - noten bliver i inboxen)
- prisnote-0705.md MODSIGER virksomhedsprofil.md:
  Eksisterende: "Timepris service: 695 kr. ekskl. moms" (virksomhedsprofil.md, kilde: Thomas, 2026-04-11)
  Ny note:      "timepris op til 745 fra august?" (prisnote-0705.md, 2026-07-05)
  Afgør: er prisstigningen besluttet? Hvis ja: opdatér profilen via skillen virksomhedsprofil - jeg retter aldrig profilen selv.

### Kasseret (flyttet til behandlet med begrundelse)
- husk-ringe-revisor.md: ren to-do, hører i opgavesystemet - gengivet under næste skridt.

### Til afgørelse og næste skridt (altid med)
- sygemelding-note.md AFVENTER: indeholder helbredsoplysninger om en medarbejder - skrives ikke ind i videnfiler; se gdpr-fortegnelse. Noten ligger urørt i inboxen.
- To-do fra kasseret note: "ring til revisor om momsafregning".
- Konflikten om timeprisen skal afgøres før næste kørsel, ellers genlistes den.
```

Læg mærke til hvad eksemplet gør: overskriftslinjen opsummerer i tal, hver linje bærer sin begrundelse og kilde, konflikten citerer begge versioner ordret og stiller ét konkret spørgsmål, og persondata-noten er markeret med kategori uden at gengive indholdet.
