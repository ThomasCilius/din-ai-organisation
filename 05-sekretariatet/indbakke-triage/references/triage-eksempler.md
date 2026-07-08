# Triage-eksempler - et fuldt overblik og de svære kald

Reference for `indbakke-triage`. Læs den når du er i tvivl om formatet, eller når en mail ikke falder naturligt i én kategori. Eksemplet er fiktivt (VVS-virksomheden "Byens VVS ApS", 8 ansatte) men mønstrene er de typiske.

## Indhold

1. [Fuldt eksempel: et færdigt overblik](#1-fuldt-eksempel-et-faerdigt-overblik)
2. [De svære kald - og hvorfor de faldt sådan ud](#2-de-svaere-kald---og-hvorfor-de-faldt-saadan-ud)
3. [Skidt/godt-begrundelser](#3-skidtgodt-begrundelser)

## 1. Fuldt eksempel: et færdigt overblik

```markdown
# Indbakke-triage - 2026-07-07

**Overblik:** 12 mails gennemgået - 2 kræver handling i dag, 3 udkast klar til
mail-i-min-stil, 2 kan vente, 3 til orientering. Plus 1 i Straks og 1 i Advarsel.

## Straks: myndigheds- og fristpost (altid med - skriv "Ingen" hvis tom)

- **Digital Post-advisering - "Ny post fra Skattestyrelsen"** (modtaget 6/7)
  → Åbn brevet i Digital Post i dag - adviseringen viser ikke fristen, og
  frister løber fra brevet blev tilgængeligt. [AFKLAR: frist ukendt indtil
  brevet er åbnet]
- **Danske Bank - "Vi mangler dokumentation (hvidvaskoplysninger)"**
  (modtaget 3/7) → Svar med ejerdokumentation [FRIST: "senest 20. juli",
  citeret] - ubesvaret kan blokere kontoen. Læg dokumenterne til Karin.

## Advarsel: mulig svindel (altid med - skriv "Ingen" hvis tom)

- **"Faktura 2214" fra grossisten VVS-Partner** (modtaget 6/7) → Kontonummeret
  afviger fra fakturaen betalt i maj - ring til Jesper (VVS-Partner) på det
  kendte nummer FØR betaling. Rør ikke mailen, klik intet.

## Handl nu

- **Fru Østergaard - "Vand i kælderen IGEN"** (modtaget i morges kl. 6.12)
  → Ring inden kl. 9 - akut skade hos fast kunde, tredje henvendelse i tråden.
  [SLA TRUET]
- **Lars (montør) - "Kan ikke komme i morgen, syg"** (modtaget i går aftes)
  → Omlæg morgendagens to opgaver nu - kunderne skal have besked i dag.

## Lav udkast (klar til mail-i-min-stil)

- **Mette Holm (NovoLog) - "Pris på udskiftning af varmtvandsbeholdere?"**
  (modtaget 4/7) → Svar med pris i dag - lead til rammeaftale, ca. 80.000 kr.
  på spil, tråden er 3 dage gammel. [SLA BRUDT: 2 dage over lead-fristen]
- **Kenneth Byg A/S - "Rykker 2: mangler jeres timesedler for juni"**
  (modtaget 5/7) → Send timesedlerne med kort undskyldning - to ubesvarede
  rykkere fra største samarbejdspartner skader relationen.
- **Ny henvendelse via hjemmesiden - "Tilbud på badeværelse, Vanløse"**
  (modtaget i morges kl. 7.40) → Kvittér og book besigtigelse - nyt lead,
  svarfrist < 4 timer. [FRIST: SLA kl. 11.40]

## Kan vente

- **Grossisten - "Leveringsstatus uge 29"** (modtaget 6/7) → Ingen spørgsmål
  til os - læs ved ugeplanlægningen torsdag.
- **Revisor - "Skal vi mødes om halvårstal i august?"** (modtaget 3/7)
  → Foreslå datoer senere på ugen - intet presser før august. [SLA TRUET:
  intern/rådgiver-frist på 48 timer er tæt på]

## Til orientering - arkivér selv

- **Dansk Byggeri-nyhedsbrev uge 28** → Ingen handling.
- **Kvittering - værktøjsbestilling hos Grossisten** → Ingen handling; gem
  til bogholderiet (brug journalisering ved månedens bilagsrunde).
- **Danske Bank - "Invester dit overskud"** → Markedsføring, ingen handling.
  (Bankpost UDEN frist/dokumentationskrav er den eneste bankpost uden for
  Straks.)

## Antagelser og åbne spørgsmål (altid med)

- [ANTAGELSE] NovoLog er regnet som lead, ikke kunde - står ikke i
  virksomhedsprofil.md's kundeliste.
- [AFKLAR] Skattestyrelsens brev: frist og indhold kendes først når brevet
  åbnes i Digital Post.
```

## 2. De svære kald - og hvorfor de faldt sådan ud

**Bankmail nr. 1 vs. bankmail nr. 2.** Samme afsender, to kategorier: hvidvaskdokumentation har en citeret frist og en juridisk konsekvens (blokeret konto) → Straks. Investeringsreklamen er markedsføring → Til orientering. Reglen: bankpost sorteres på INDHOLD, ikke afsender - men ved tvivl vinder Straks.

**Fakturaen fra den kendte grossist.** Afsenderadressen var ægte, tonen normal - men kontonummeret afveg fra maj-fakturaen. Indholdsflag slår afsendertillid (kompromitterede leverandørkonti er fakturasvindlens motor), så: Advarsel, aldrig "Lav udkast" eller "Til orientering".

**Nyhedsbrevet fra kundens direktør.** Var der et personligt nyhedsbrev fra en VIP-kundes direktør, ville det stadig være Til orientering - MEN med en anbefaling om at skimme det før næste møde med kunden. Relation løfter prioriteten inden for kategorien, ikke kategorien selv, når ingen handling kræves.

**Rykker 2 fra Kenneth Byg.** Ikke myndighedspost og ingen kroner i selve mailen - men to ubesvarede rykkere fra den vigtigste samarbejdspartner er et relationssignal der løfter mailen til toppen af "Lav udkast". Var der kommet en tredje rykker, var det "Handl nu: ring i stedet for at skrive".

**Den syge montør.** Ligner en intern besked (48-timers SLA), men konsekvensen rammer kunder i morgen - derfor "Handl nu". Kategorien styres af konsekvensens frist, ikke af afsenderens type.

**Digital Post-adviseringen.** Fristen kendes ikke, så fristen kan ikke citeres - men netop derfor er den Straks med [AFKLAR], aldrig "Kan vente". Ukendt frist fra en myndighed behandles som en kort frist.

## 3. Skidt/godt-begrundelser

Begrundelsen skal bære beslutningen alene - navn, hvorfor, hvornår:

- SKIDT: "Mail fra kunde, virker vigtig." → GODT: "Ring Fru Østergaard inden kl. 9 - akut vandskade, tredje henvendelse uden svar."
- SKIDT: "Lead, bør besvares." → GODT: "Svar Mette (NovoLog) i dag - hun venter på pris for at kunne bestille, ca. 80.000 kr., tråden er 3 dage gammel."
- SKIDT: "Brev fra banken, tjek det." → GODT: "Send hvidvaskdokumentation senest 20/7 (citeret) - ubesvaret kan blokere kontoen."
- SKIDT: "Måske spam." → GODT: "Kontonummer ændret ift. maj-fakturaen - ring Jesper på kendt nummer før betaling."
