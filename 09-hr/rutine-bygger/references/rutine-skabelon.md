# Rutine-skabelon - feltvejledning og eksempler

Læs denne fil før du skriver din første rutine-fil, og genbesøg eksemplerne når et felt driller.

## Indhold

1. [Skabelonen](#skabelonen)
2. [Feltvejledning](#feltvejledning)
3. [Eksempel 1: Morgenens mailudkast (daglig, kalendertrigger)](#eksempel-1-morgenens-mailudkast)
4. [Eksempel 2: Natportner-kørsel (natlig, kalendertrigger)](#eksempel-2-natportner-koersel)
5. [Eksempel 3: Ugestatus (ugentlig, kalendertrigger med baglæns-beregning)](#eksempel-3-ugestatus)
6. [Hyppige fejl](#hyppige-fejl)

## Skabelonen

```markdown
# Rutine: [navn - kort, sigbart, fx "mandagsbrief"]

## Trigger
[Kalender: ugedag(e) + klokkeslæt. Eller hændelse: "når [konkret, observerbar betingelse]".]

## Input
[Punktliste over navngivne kilder: filer, mapper, indbakke, kalender. Rutinen læser KUN disse.]

## Udfører
[Skill-navn + eventuelle særlige instruktioner til kørslen, fx "max 10 mails pr. kørsel".]

## Bevis-artefakt
[Filnavn med dato-mønster + placering, fx rutiner/artefakter/brief-[åååå-mm-dd].md.
Læser: [navngivet person] - læser det [hvornår].]

## Eskalering
[Punktliste: navngivne situationer hvor rutinen stopper og spørger i stedet for at gætte.]

## Log
[Én linje pr. kørsel i rutiner/rutinelog.md - se format i vagtplan-og-rutinelog.md.]

## Antagelser og åbne spørgsmål
[Altid med - også når tom: skriv "ingen". [ANTAGELSE]-markeringer fra escape hatch står her.]
```

## Feltvejledning

**Trigger.** Vælg kalendertrigger som udgangspunkt - den er forudsigelig, og "hver mandag kl. 06:00" kan aldrig misforstås. Hændelsestrigger ("når en ny ansøgning lander i mappen `ansøgninger/`") bruges til det episodiske, men kun når hændelsen er observerbar i en fil, mappe eller indbakke. "Når der er behov" er ikke en trigger.

**Input.** Skriv kilderne så en fremmed kan pege på dem: fuld sti, mappenavn, hvilken indbakke. Rutinen må ikke gå på opdagelse uden for sine input - det er både et kvalitets- og et fortrolighedshegn (personaledata og regnskabstal skal ikke ind i rutiner der ikke er bygget til dem).

**Udfører.** Én rutine, én skill. Skal to skills køre efter hinanden, er det to rutiner - eller én rutine der udfører den første skill og efterlader et artefakt som den anden rutines input. Kædede kæmperutiner er umulige at fejlfinde.

**Bevis-artefakt.** Tre krav: (1) navn med dato-mønster så kørsler kan skelnes, (2) fast placering så læseren aldrig leder, (3) en navngiven læser - mennesket der skal bruge filen. En rutine uden læser er støj fra dag ét. Artefaktet skrives OGSÅ når der intet var at lave: "ingen nye ansøgninger siden sidst" er et resultat, tavshed er det ikke.

**Eskalering.** Skriv konkrete situationer, ikke "ved tvivl". Gode eskaleringsudløsere: manglende eller tomt input, personfølsomt indhold (sygdom, klager, personsager), beløb over en aftalt grænse, modstridende oplysninger, alt der ligner jura. Reglen i kørslen er altid: stop, skriv hvad du ville have gjort, og spørg - gæt aldrig.

**Log.** Feltet gentager bare kontrakten: én linje pr. kørsel i `rutiner/rutinelog.md`, også ved tomgang og fejl. Se `vagtplan-og-rutinelog.md`.

## Eksempel 1: Morgenens mailudkast

```markdown
# Rutine: mail-morgen

## Trigger
Hverdage kl. 06:30 - færdig før Thomas åbner indbakken kl. 08:00.

## Input
- Indbakken (mails modtaget siden sidste kørsel)
- voice-profil.md (tone til udkastene)

## Udfører
`mail-i-min-stil` - udkast til svar på mails der kræver svar; max 10 pr. kørsel,
resten listes til manuel behandling.

## Bevis-artefakt
rutiner/artefakter/mails-[åååå-mm-dd].md - udkast øverst, "kræver dig"-listen nederst.
Læser: Thomas - læser den kl. 08:00 sammen med indbakken.

## Eskalering
- Mail der ligner en personsag, klage eller sygemelding: intet udkast, kun flag.
- Mail der nævner beløb, tilbud eller kontraktvilkår: flag til manuel behandling.
- Tom indbakke: artefakt med "ingen nye mails" - ingen eskalering.

## Log
Én linje pr. kørsel i rutiner/rutinelog.md.

## Antagelser og åbne spørgsmål
Ingen.
```

Bemærk: rutinen SENDER intet. Udkastene ligger i artefaktet og i mailprogrammets kladdemappe - afsendelsen er menneskets.

## Eksempel 2: Natportner-kørsel

```markdown
# Rutine: natportner

## Trigger
Alle dage kl. 02:00 - færdig længe før arbejdsdagen starter.

## Input
- Arbejdsområdets rodmapper (nye/ændrede filer siden sidste kørsel)

## Udfører
`natportner` (Viden & Data) - foreslår arkivering, navngivning og oprydning.

## Bevis-artefakt
rutiner/artefakter/natportner-[åååå-mm-dd].md - forslagsliste med begrundelser.
Læser: Thomas - skimmer den ved morgenkaffen; godkendte forslag udføres derefter.

## Eskalering
- Filer der ligner personaledata eller regnskabsbilag: rør dem ikke, flag dem kun.
- Mere end 20 forslag på én nat: stop ved 20 og notér at der er flere.

## Log
Én linje pr. kørsel i rutiner/rutinelog.md.

## Antagelser og åbne spørgsmål
Ingen.
```

Bemærk: portneren FLYTTER og SLETTER intet selv - den foreslår. Oprydning uden godkendelse er jernlovsbrud, uanset hvor rodet mappen er.

## Eksempel 3: Ugestatus

Baglæns-beregning i praksis: Thomas vil have ugestatus "i løbet af fredagen". Gravespørgsmålet afslører at den reelt bruges til mandagsmødet kl. 9 - men fredag før frokost kan ugen stadig huskes, og der er luft til at rette. Landingstidspunkt: fredag kl. 11:00.

```markdown
# Rutine: ugestatus

## Trigger
Fredage kl. 11:00 - klar til gennemsyn før frokost, bruges på mandagsmødet kl. 09:00.

## Input
- Ugens artefakter i rutiner/artefakter/ (mails, triage, pipeline)
- Kalenderen (ugens afholdte og kommende møder)

## Udfører
`ugestatus` (Sekretariatet).

## Bevis-artefakt
rutiner/artefakter/ugestatus-[åååå-uu].md (år-ugenummer).
Læser: Thomas - retter fredag, bruger den mandag kl. 09:00.

## Eskalering
- Manglende input (ingen artefakter fra ugen): skriv status ud fra kalenderen alene
  og markér tydeligt hvad der mangler - opfind aldrig aktivitet.

## Log
Én linje pr. kørsel i rutiner/rutinelog.md.

## Antagelser og åbne spørgsmål
Ingen.
```

## Hyppige fejl

| Fejl | Konsekvens | Ret til |
|---|---|---|
| Trigger = "løbende" | Rutinen kan aldrig komme for sent og bliver aldrig savnet | Konkret ugedag + klokkeslæt |
| Intet artefakt ved tomgang | Tavshed og nedbrud ligner hinanden | "Intet nyt" skrives også |
| Ingen navngiven læser | Støj fra dag ét; Nedlukningsreglen rammer den om en måned | Navngiv læseren og hvornår de læser |
| Eskalering = "ved tvivl" | Rutinen gætter, for alt kan bortforklares som "ikke tvivl" | Navngivne situationer |
| To skills i én rutine | Umulig at fejlfinde når den fejler | Split i to rutiner |
| Frister/satser skrevet ind i rutinen | Forælder stille og roligt | "Slå aktuel frist op på skat.dk/virk.dk" |
