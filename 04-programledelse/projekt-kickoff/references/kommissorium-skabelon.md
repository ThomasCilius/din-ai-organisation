# Kommissorium-skabelon med vejledning

Skabelon og element-for-element-vejledning til `kommissorium-[projekt].md`. Læs denne fil FØR kommissoriet skrives.

## Indhold

1. [Grundprincipper](#grundprincipper)
2. [Skabelonen](#skabelonen)
3. [Vejledning pr. element](#vejledning-pr-element)
4. [Succeskriterie-formlen](#succeskriterie-formlen)
5. [Udfyldt mini-eksempel](#udfyldt-mini-eksempel)
6. [Kvalitetstest før aflevering](#kvalitetstest-foer-aflevering)

## Grundprincipper

- **1-2 sider.** Kommissoriet er et styringsdokument, ikke en rapport. Skal noget skæres, skær i prosa - aldrig i succeskriterier eller afgrænsning.
- **Alt uoplyst markeres [AFKLARES].** Et synligt hul tvinger en beslutning frem; et gættet tal skjuler at beslutningen aldrig blev truffet.
- **Skrevet til en udenforstående.** Dokumentet skal kunne læses af en ny medarbejder, banken eller en ekstern konsulent uden mundtlig forklaring.

## Skabelonen

```markdown
# Kommissorium: [projektnavn]

Dato: [aar-md-dag] | Status: KLADDE - afventer projektejerens godkendelse

## Baggrund og formaal

[3-6 linjer: hvad er situationen, hvorfor gør vi noget nu, og hvilket af
virksomhedens mål (fra virksomhedsprofil.md) understøtter projektet.]

## Maal og succeskriterier

**Effektmaal** (det projektet skal føre til):
- [effekt med tal + målemetode + måletidspunkt + baseline + måleansvarlig]

**Leverancemaal** (det projektet afleverer):
- [leverance med accepteret-af og seneste dato]

## Leverancer

- [konkret leverance 1]
- [konkret leverance 2]

## Afgraensning - det laver vi IKKE

- [fravalg 1]
- [fravalg 2]
- [fravalg 3]

## Organisation

| Rolle | Navn | Ansvar |
|---|---|---|
| Projektejer | [navn eller [AFKLARES]] | Kan sige stop; godkender ændringer i mål, tid, økonomi |
| Projektleder | [navn eller [AFKLARES]] | Driver projektet i hverdagen; rapporterer til ejer |
| Deltagere | [navne] | [hvad de bidrager med] |
| Styregruppe | [navne / "= projektejer"] | [kun hvis relevant] |

## Tidsramme og oekonomi

- Sluttermin: [dato] ([bundet af X / valgt frit])
- Budgetramme: [beløb eller [AFKLARES]]
- Reel kapacitet: [timer/uge pr. deltager - se milepaelsplanen]

## Forudsaetninger og kendte risici

- Forudsætning: [hvad vi regner med holder]
- Risiko: [overskrift - foldes ud i risikologgen, ikke her]

## Interessenter

[Kun handlingskrævende interessenter - se references/interessent-og-governance.md]

## Antagelser og aabne spoergsmaal

- [AFKLARES]: [hvad, og hvem der skal svare]
- [ANTAGELSE]: [hvad der er antaget, og hvorfor]
```

## Vejledning pr. element

**Baggrund og formål.** Svar på "hvorfor nu?" i almindeligt sprog. Koblingen til virksomhedens mål skal være eksplicit: "understøtter målet om [X] fra virksomhedsprofilen". Kan koblingen ikke laves, skriv det som åbent spørgsmål - det er projektejerens problem at løse, ikke dit at skjule.

**Mål og succeskriterier.** Effektmål og leverancemål holdes fysisk adskilt under hver sin overskrift, så de aldrig blandes. Se formlen nedenfor. Højst 2-3 effektmål - flere betyder som regel at ingen af dem er tænkt igennem.

**Leverancer.** Konkrete ting nogen kan modtage og acceptere: et system i drift, en underskrevet aftale, et uddannet team. "Bedre processer" er ikke en leverance.

**Afgrænsning.** Dokumentets mest undervurderede sektion. Mindst 2-3 punkter der aktivt fravælger noget nærliggende ("vi oversætter IKKE sitet til engelsk i dette projekt"). Hvert punkt her er en scope-diskussion projektet slipper for senere. En tom afgrænsning betyder at diskussionen bare er udskudt til det værst tænkelige tidspunkt.

**Organisation.** Alle roller med navne. Projektejeren er den vigtigste linje i hele dokumentet: én navngiven person der kan sige stop. "Ledelsen" kan ikke sige stop - det kan kun et menneske. Se governance-kalibreringen i `references/interessent-og-governance.md`.

**Tidsramme og økonomi.** Slutterminens binding noteres altid (kontrakt, sæson, lovkrav - eller frit valgt). Budgetrammen er den ramme projektejeren har oplyst - aldrig et estimat du selv har regnet dig frem til uden at markere det som [ANTAGELSE].

**Forudsætninger og kendte risici.** Kun overskrifter - fx "afhængighed af eneleverandør", "nøgleperson på deltid". Den fulde risikolog med scoring og mitigering hører hjemme i `risiko-issue-log`, ikke i kommissoriet. Relevante læringer fra `laeringslog.md` skrives ind her som forudsætninger.

**Antagelser og åbne spørgsmål.** Samlingspunktet for alle [AFKLARES] og [ANTAGELSE] i begge dokumenter, med angivelse af hvem der skal lukke hvert punkt. Denne sektion er projektejerens huskeliste ved godkendelsen.

## Succeskriterie-formlen

Hvert succeskriterium skal kunne indsættes i denne sætning uden at noget mangler:

> "[Tal/tilstand], målt [hvordan/i hvilket system], pr. [dato], baseline [nuværende niveau], måleansvarlig [navn]."

Mangler ét led, er kriteriet ikke færdigt:

| Manglende led | Konsekvens |
|---|---|
| Tal | "Flere kunder" kan altid erklæres opfyldt - eller aldrig |
| Målemetode | Diskussionen om HVORDAN der måles kommer når resultatet er ubelejligt |
| Måletidspunkt | Effekten "kommer nok senere" - i al evighed |
| Baseline | "20 % flere" i forhold til hvad? |
| Måleansvarlig | Ingen måler, og kriteriet dør stille |

Effektmål der først kan måles efter projektafslutning (de fleste), får måletidspunkt EFTER slutterminen plus en navngiven måleansvarlig - så lever de videre selv om projektet er lukket. `projekt-lukning` samler dem op i evalueringen.

## Udfyldt mini-eksempel

Fiktiv SMV: VVS-firma med 12 ansatte vil have onlinebooking.

```markdown
# Kommissorium: Onlinebooking til serviceaftaler

Dato: 2026-07-07 | Status: KLADDE - afventer Mettes godkendelse

## Baggrund og formaal
Kontoret bruger dagligt 1-2 timer på telefonbooking af servicebesøg, og vi
mister aftaler uden for åbningstid. Projektet understøtter årets mål om at
frigøre kontortid til fakturerbart arbejde (virksomhedsprofil, mål 2).

## Maal og succeskriterier
**Effektmaal:**
- 50 % af servicebookinger sker online, målt i bookingsystemet, pr. 1/3 2027,
  baseline 0 %, måleansvarlig: Mette.
- Telefontid til booking halveret (fra ca. 7,5 til under 4 timer/uge), målt
  ved stikprøve-uge, pr. 1/3 2027, måleansvarlig: Mette.

**Leverancemaal:**
- Onlinebooking i drift på hjemmesiden, accepteret af Mette, senest 1/11 2026.
- De to kontoransatte oplært, senest 15/11 2026.

## Leverancer
- Bookingmodul integreret på eksisterende hjemmeside
- Opdateret arbejdsgang for kontoret (én side)

## Afgraensning - det laver vi IKKE
- Ingen ny hjemmeside - kun bookingmodul på den eksisterende
- Ingen onlinebetaling i dette projekt
- Akutte opgaver bookes fortsat kun telefonisk

## Organisation
| Rolle | Navn | Ansvar |
|---|---|---|
| Projektejer | Mette (medejer) | Kan sige stop; godkender ændringer |
| Projektleder | Mette | Driver projektet |
| Deltagere | Jonas (kontor), [AFKLARES: leverandør] | Test og oplæring |

## Tidsramme og oekonomi
- Sluttermin: 15/11 2026 (valgt frit - før vintersæsonens spidsbelastning)
- Budgetramme: [AFKLARES - Mette afklarer med banken/budgettet]
- Reel kapacitet: Mette 4 t/uge, Jonas 3 t/uge (begge har drift ved siden af)

## Forudsaetninger og kendte risici
- Forudsætning: nuværende hjemmesideplatform kan integrere et bookingmodul
- Risiko: leverandørvalg trækker ud; Jonas' kapacitet i spidsbelastning

## Antagelser og aabne spoergsmaal
- [AFKLARES]: budgetramme - Mette, inden leverandørkontakt
- [AFKLARES]: leverandør af bookingmodul - Mette + Jonas, milepæl 2
```

Bemærk hvad eksemplet gør: effekt og leverance adskilt, alle succeskriterier med tal + metode + tidspunkt + baseline + ansvarlig, afgrænsningen fravælger tre nærliggende ting, budgettet er IKKE gættet, og styregruppen er droppet fordi ejeren er nok.

## Kvalitetstest foer aflevering

2-minutters-testen: giv dokumentet til en udenforstående (eller læs det med friske øjne). Efter 2 minutter skal vedkommende kunne svare på:

1. Hvorfor findes projektet?
2. Hvornår er det en succes?
3. Hvem bestemmer?

Kan ét af de tre spørgsmål ikke besvares, er kommissoriet ikke færdigt - uanset hvor pænt det ser ud.
