# Prøvetidsprotokollen - ansættelsesbeviset

Læs denne fil når skill-mappen er skrevet og prøvetiden skal gennemføres (arbejdsgangens trin 5). Prøvetiden er obligatorisk: ingen skill er fastansat før den er bestået, og `proevetid-log.md` er beviset.

## Indhold

1. [Hvorfor prøvetid](#hvorfor-proevetid)
2. [Design af de 6 prompts](#design-af-de-6-prompts)
3. [Sådan køres testen](#saadan-koeres-testen)
4. [Bedømmelse og iteration](#bedoemmelse-og-iteration)
5. [Testloggens skabelon](#testloggens-skabelon)
6. [Undskyldning vs. virkelighed](#undskyldning-vs-virkelighed)

## Hvorfor prøvetid

En skill fejler næsten aldrig på indholdet - den fejler på triggeringen. Enten bliver den aldrig kaldt (brugeren tror opgaven er dækket, og intet sker), eller den blander sig i samtaler hvor den ikke hører hjemme (støj, forkerte svar, mistillid til hele opsætningen). Begge fejl er usynlige i skrivefasen og billige at fange med 6 testprompts. Derfor: altid prøvetid, altid log.

## Design af de 6 prompts

**3 bør-trigge-prompts** - skal dække tre forskellige veje ind:

1. **Den direkte kommando:** brugerens ordrette frase fra interviewet. Fx "skriv en klage til leverandøren".
2. **Situationsbeskrivelsen uden kommandoord:** brugeren beskriver problemet, ikke løsningen. Fx "varerne fra Jensen & Co. er stadig ikke kommet, og det er tredje gang".
3. **Den skæve formulering:** engelsk, slang, eller en indirekte bøn. Fx "can you draft a complaint to our supplier?" eller "jeg er SÅ træt af det fragtfirma - kan vi gøre noget?".

**3 bør-ikke-trigge-prompts** - skal dække tre forskellige fristelser:

1. **Naboskillens område:** en prompt der hører til den nærmeste naboskill. Fx "en kunde har klaget over os" (hører til `kundesvar`, ikke `leverandoerklage`).
2. **Samme emneord, andet behov:** deler nøgleord med skillen men kræver noget andet. Fx "hvad har vi egentlig aftalt med leverandøren?" (kontraktopslag, ikke klage).
3. **Småsnak/vidensspørgsmål:** emnet nævnes uden ønske om artefaktet. Fx "hvor lang reklamationsfrist har man egentlig i Danmark?".

Skriv prompts som brugeren ville - med tastefejl, følelser og kontekst. Sterile testprompts tester ingenting.

## Sådan køres testen

Prøvetiden kræver at skillen er installeret, og at hver prompt køres i en FRISK samtale - i en igangværende samtale forurener historikken triggervalget.

- **Claude Desktop/Cowork:** læg skill-mappen i arbejdsområdets skills-mappe. Åbn en ny samtale pr. prompt, indsæt prompten, og notér om skillen aktiveres (skill-aktivering vises i svaret/værktøjslinjen - bed evt. brugeren bekræfte hvad de ser).
- **Claude Code:** læg mappen i `.claude/skills/` (projekt) eller `~/.claude/skills/` (globalt). Kør hver prompt i en ny session.
- **Kan du ikke selv køre testen** (du bygger skillen i samme session som den skal bruges i, eller brugeren skal installere først): giv brugeren de 6 prompts som en nummereret testplan, bed dem køre dem én ad gangen i nye samtaler og melde resultatet tilbage. Log status UDSKUDT indtil svarene foreligger - gæt aldrig et testresultat.

Et resultat pr. prompt, tre mulige udfald: TRIGGEDE / TRIGGEDE IKKE / TRIGGEDE FORKERT SKILL (notér hvilken).

## Bedømmelse og iteration

- **Bestået:** alle 6 prompts falder rigtigt ud - 3 trigger, 3 trigger ikke.
- **Ikke bestået:** mindst én falder forkert ud. Ret description efter retteteknikken i `description-haandvaerk.md` (én diagnose, én rettelse), og kør ALLE 6 prompts igen - en rettelse der fikser én test, kan vælte en anden.
- **Iterationsloft: max 3 rettelsesrunder på samme description.** Falder testen stadig forkert ud efter tredje runde, er problemet ikke formuleringen men skillens scope: den er for bred, eller den overlapper en naboskill. Stop, og forelæg brugeren din analyse med to muligheder: (a) indsnævr skillens opgave, eller (b) afgræns naboskillen tilsvarende. Bliv aldrig ved med at polere ord på et strukturproblem.
- Hver rettelse logges: hvad blev ændret, hvorfor, og hvad blev resultatet.

## Testloggens skabelon

Skriv `proevetid-log.md` i skill-mappen - brug præcis denne struktur:

```markdown
# Prøvetidslog: [skill-navn]

## Status
[BESTÅET / IKKE BESTÅET / UDSKUDT] - [dato] - [hvem kørte testen: Claude/brugeren]

## Bør-trigge-tests
| # | Prompt (ordret) | Forventet | Resultat | Runde |
|---|---|---|---|---|
| 1 | "..." | Trigger | TRIGGEDE | 1 |
| 2 | "..." | Trigger | TRIGGEDE IKKE | 1 |
| 3 | "..." | Trigger | TRIGGEDE | 1 |

## Bør-ikke-trigge-tests
| # | Prompt (ordret) | Forventet | Resultat | Runde |
|---|---|---|---|---|
| 4 | "..." | Trigger ikke | TRIGGEDE IKKE | 1 |
| 5 | "..." | Trigger ikke | TRIGGEDE (forkert) | 1 |
| 6 | "..." | Trigger ikke | TRIGGEDE IKKE | 1 |

## Rettelser af description
| Runde | Fejlende prompt | Diagnose | Rettelse | Nyt resultat |
|---|---|---|---|---|
| 1 → 2 | #2, #5 | [årsag] | [hvad blev ændret] | [udfald] |

## Antagelser og aabne spoergsmaal
- [fx: prompt #5 delvist afklaret - genbesøg hvis naboskillen X opdateres]
```

Loggen er ikke bureaukrati - den er svaret næste gang nogen spørger "hvorfor trigger den her skill mærkeligt?", og den er skabelonen når skillen senere skal justeres.

## Undskyldning vs. virkelighed

| Undskyldning | Virkelighed |
|---|---|
| "Skillen er så simpel at test er overflødig" | De simpleste descriptions overtrigger oftest - brede ord som 'møde' og 'mail' rammer alt |
| "Jeg har skrevet description omhyggeligt, den rammer nok" | Triggervalg afgøres af sammenligning på tværs af ALLE installerede skills - det kan ikke forudsiges fra én skill alene |
| "Vi tester bare i den her samtale" | En samtale hvor skillen lige er bygget, trigger på alt - kun friske samtaler tæller |
| "Brugeren har travlt, vi springer loggen over" | Uden log findes der intet bevis, og næste justering starter forfra. Loggen tager 2 minutter |
