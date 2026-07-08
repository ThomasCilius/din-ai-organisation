# Kundestatus - skabelon og udfyldt eksempel

Læs denne fil FØR du skriver en kundestatus. Formålet med en kundestatus er at vise fremdrift og VÆRDI og fastholde tillid - ikke at dokumentere alt hvad der er sket. Kunden skal kunne læse den på ét minut og vide: hvor er vi, hvad kommer, hvad skal jeg gøre.

## Indhold

1. [Kundestatussens fem regler](#kundestatussens-fem-regler)
2. [Skabelon](#skabelon)
3. [Udfyldt eksempel](#udfyldt-eksempel)
4. [Mailudkastet](#mailudkastet)
5. [Typiske fejl i kundestatus](#typiske-fejl-i-kundestatus)

## Kundestatussens fem regler

1. **Værdi før aktivitet.** Skriv hvad kunden HAR FÅET, ikke hvad I har lavet. "Rapportmodulet er klar til jeres test" slår "vi har arbejdet på rapportmodulet".
2. **Internt rod holdes hjemme.** Sygdom, bemandingsproblemer, interne fejl og leverandørbøvl omtales som "håndteres" eller slet ikke - kunden skal se konsekvensen (ny dato) og afbødningen, ikke maskinrummet. Det er ikke løgn; det er professionel afgrænsning.
3. **Men lyv aldrig om tilstanden.** Forsinkelser, røde spor og skred meldes ærligt og TIDLIGT med ny dato og afbødende handling. Reglen om internt rod gælder årsagens detaljer - aldrig selve forsinkelsen.
4. **Blokeringer er kun kundens.** Medtag kun blokeringer kunden selv kan løsne (input, adgang, beslutning, testdeltagere). Interne blokeringer er jeres problem - kunden ser kun konsekvensen hvis den rammer planen.
5. **Beslutninger med frist.** Hvert beslutningspunkt formuleres som et spørgsmål kunden kan svare ja/nej eller a/b på, med svarfrist og konsekvens af intet svar ("uden svar senest torsdag skubbes leverancen en uge").

## Skabelon

```markdown
# Ugestatus - uge [uu], [aaaa] - [kunde]

## Trafiklys-overblik

| Spor | Farve | Begrundelse (én sætning) | Sidste uge |
|---|---|---|---|
| [spor 1] | Grøn/Gul/Rød | [hvorfor] | [farve / "ny"] |

Ugens hovedbudskab: [én sætning - det vigtigste kunden skal vide].

## Fremdrift siden sidst

- [leverance/milepæl - hvad kunden har fået, konkret og efterprøvbart]
- [.. maks 5 punkter; detaljer hører til i projektværktøjet, ikke her]

## Planen for næste uge

- [punkt formuleret så det kan tjekkes af næste uge - med dato hvor muligt]

## Blokeringer - og hvad vi behøver fra jer

- [blokering] - vi behøver: [konkret handling] fra [navn] senest [dato]
- (Ingen blokeringer denne uge.)

## Beslutninger der kræves

- [spørgsmål der kan besvares ja/nej eller a/b] - svar senest [dato]; uden svar: [konsekvens]
- (Ingen beslutninger kræves denne uge.)

## Opfølgning fra sidste uge

- "[punkt fra sidste uges plan]" - Gjort/Skredet (ny dato + hvorfor)/Droppet (hvorfor)

## Mailudkast

[se afsnittet Mailudkastet nedenfor]

## Kilder og aabne huller

- [spor 1]: referat-[dato].md, opfoelgningsliste-[uge].md
- [MANGLER INPUT: spørg X] - [hvad der mangler, og hvem der kan svare]
```

## Udfyldt eksempel

(Eksempel på FORMEN - virksomhed, navne og tal er opdigtede. En kundestatus fra et konsulentfirma "Broager Digital" til kunden "NordVent A/S", implementering af nyt kundeportal-projekt.)

```markdown
# Ugestatus - uge 28, 2026 - NordVent A/S

## Trafiklys-overblik

| Spor | Farve | Begrundelse (én sætning) | Sidste uge |
|---|---|---|---|
| Kundeportal (fase 2) | Gul | Testdata kom onsdag i stedet for fredag i sidste uge - leverance 2 er 4 dage forsinket, slutdato holder | Grøn |
| Datamigrering | Grøn | 3 af 4 datasæt migreret og valideret mod jeres stikprøver | Grøn |
| Undervisningsmateriale | Grøn | Første modul godkendt af Mette mandag, produktion af modul 2 i gang | Ny |

Ugens hovedbudskab: Leverance 2 skrider 4 dage, men slutdatoen 1/9 holder fordi bufferen i uge 30 tages i brug.

## Fremdrift siden sidst

- Rapportmodulet er klar til jeres test - adgang sendt til Mette og Jonas torsdag.
- 3 af 4 datasæt er migreret og validerede; kun ordrehistorik udestår.
- Undervisningsmodul 1 godkendt uden rettelser.

## Planen for næste uge

- Ordrehistorik migreret og valideret senest onsdag d. 16.
- Leverance 2 (selvbetjeningsflowet) klar til jeres test fredag d. 18.
- Udkast til undervisningsmodul 2 sendt til Mette senest torsdag d. 17.

## Blokeringer - og hvad vi behøver fra jer

- Test af rapportmodulet: vi behøver at Mette og Jonas gennemfører testen senest onsdag d. 16, ellers skubbes fejlretningen ind i uge 30-bufferen.

## Beslutninger der kræves

- Skal ordrehistorik ældre end 5 år med i migreringen (a) eller arkiveres som udtræk (b)? Svar senest torsdag d. 17 - uden svar migrerer vi alt, hvilket koster ca. 2 ekstra dage.

## Opfølgning fra sidste uge

- "Rapportmodul klar til test onsdag" - Gjort (adgang sendt torsdag, én dag senere end lovet pga. sluttest).
- "Datasæt 3 valideret" - Gjort (referat-2026-07-08-nordvent.md).
- "Leverance 2 påbegyndt" - Skredet: testdata modtaget onsdag i stedet for fredag i sidste uge; ny dato fredag d. 18.
```

Bemærk hvad eksemplet IKKE siger: at forsinkelsen på testdata skyldtes at kundens egen it-afdeling leverede for sent OG at konsulentens ene udvikler var syg to dage. Det første kan nævnes neutralt hvis kunden spørger; det andet er internt rod og omtales ikke. Konsekvensen (4 dage, buffer i brug, slutdato holder) er det kunden har brug for.

## Mailudkastet

Mailen er en KORT følgetekst til statussen, ikke en gentagelse af den. Skelet:

1. Hovedbudskabet i første sætning (også når det er dårligt nyt).
2. De 1-2 ting modtageren SKAL gøre, med frist.
3. Henvisning til den fulde status.
4. Brugerens egen hilsen og afslutning fra voice-profil.md.

Eksempel (matcher statussen ovenfor):

> Emne: Ugestatus uge 28 - leverance 2 skrider 4 dage, slutdato holder
>
> Hej Mette
>
> Leverance 2 er 4 dage forsinket fordi testdata først kom onsdag - ny dato er fredag d. 18, og slutdatoen 1/9 holder fordi vi bruger bufferen i uge 30.
>
> To ting vi behøver fra jer:
> 1. Test af rapportmodulet senest onsdag d. 16 (adgang er sendt til dig og Jonas).
> 2. Svar på om ordrehistorik ældre end 5 år skal migreres eller arkiveres - senest torsdag d. 17.
>
> Fuld status er vedhæftet. Sig til hvis noget skal uddybes.
>
> [brugerens afslutning]

Emnelinjen bærer hovedbudskabet - "Ugestatus uge 28" alene er en emnelinje ingen åbner først.

## Typiske fejl i kundestatus

| Fejl | Hvorfor den skader |
|---|---|
| Aktivitetsliste i stedet for leverancer | Kunden kan ikke se om der er skabt værdi - "arbejdet på" kan betyde alt |
| Dårligt nyt gemt i bunden eller i en bisætning | Kunden føler sig ført bag lyset når det opdages - og det opdages |
| Interne detaljer som forklaring ("vores udvikler var syg") | Skaber bekymring om bemanding uden at kunden kan handle på det |
| Grøn på alt, hver uge | Farverne mister betydning - første gule spor udløser så panik |
| Beslutningspunkter uden frist og konsekvens | Kunden svarer ikke, og forsinkelsen bliver "jeres skyld" uden dokumentation |
| Status der ikke besvarer sidste uges plan | Kunden læser gamle statusser igennem og finder de glemte løfter |
