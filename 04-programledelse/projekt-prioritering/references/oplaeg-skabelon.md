# Skabelon: prioriteringsoplæg

Indhold:
1. [Skabelonen](#1-skabelonen)
2. [Udfyldt eksempel](#2-udfyldt-eksempel)

Brug skabelonens sektioner præcis som de står. Eksemplet i afsnit 2 viser niveauet: kort, konkret og med tal ejerlederen kan beslutte på - hele oplægget skal kunne læses på 5 minutter.

## 1. Skabelonen

```markdown
# Prioriteringsoplæg [kvartal/anledning]

**AI anbefaler - mennesket beslutter.**

Udarbejdet [dato] på baggrund af [kilder]. Beslutning træffes af [navn/ejerleder].

## Kapacitet

- Projektkapacitet i kvartalet: [X] timer (mellemregning: se tabel/antagelser)
- Brandslukningsandel sidste kvartal: [Y] % - [er/er ikke] indregnet
- Sum af resttimer, alle aktive + bankende projekter: [Z] timer
- Overtegningsfaktor før prioritering: [Z/X] - efter indstillingen: [ny faktor]

## Projektliste og scoring

| Projekt | Ejer | Resttimer | Restkroner | Værdi (1-4) | Indsats (1-4) | Bunke |
|---|---|---|---|---|---|---|
| ... | | | | | | |

## Indstilling: fortsæt / pausér / stop

**Fortsæt** ([sum] timer af [kapacitet]):
- [Projekt] - [én linjes begrundelse med score og mål-henvisning]

**Pausér:**
- [Projekt] - [begrundelse] - genstartsbetingelse: [dato eller hændelse]

**Stop:**
- [Projekt] - [begrundelse baseret på restværdi mod restindsats - aldrig på det allerede forbrugte]

## Frigjort kapacitet

[X] timer frigøres. De bruges på: [navngivet formål - typisk at gøre fortsæt-projekterne hurtigere færdige eller synlig buffer til brandslukning].

## Følsomhed

Anbefalingen vælter hvis: [nøgleperson rejser, antagelse om kapacitet skrider, kunde/marked ændrer sig - 2-4 konkrete punkter].

## Beslutningsspørgsmål (ja/nej)

1. [Spørgsmål med tal - fx "Stopper vi X og flytter 140 timer til Y?"]
2. ...

## Antagelser og åbne spørgsmål

- [ANTAGELSE] ...
- [AFKLARES] ... (hvem ved svaret?)

## Kilder

- [virksomhedsprofil.md, portefoljestatus-*.md, brugerens svar af [dato], ...]
```

## 2. Udfyldt eksempel

```markdown
# Prioriteringsoplæg Q3 2026

**AI anbefaler - mennesket beslutter.**

Udarbejdet 2026-07-01 på baggrund af portefoljestatus-juni.md, virksomhedsprofil.md
og interview med Mette 2026-07-01. Beslutning træffes af Mette (ejerleder).

## Kapacitet

- Projektkapacitet i Q3: 340 timer (4 personer, 6-10 projekttimer/uge, 10-11 effektive uger)
- Brandslukningsandel sidste kvartal: 30 % - indregnet i tallet ovenfor
- Sum af resttimer, 5 projekter: 720 timer
- Overtegningsfaktor før prioritering: 2,1 - efter indstillingen: 0,5

## Projektliste og scoring

| Projekt | Ejer | Resttimer | Restkroner | Værdi | Indsats | Bunke |
|---|---|---|---|---|---|---|
| Webshop-relancering | Mette | 120 | 40.000 | 4 | 3 | Fortsæt |
| ISO 9001-recertificering | Jan | 60 | 15.000 | bundet | 2 | Fortsæt |
| Nyt ERP | Thomas | 280 | 200.000 | 3 | 4 | Pausér |
| Butiksombygning | Mette | 140 | 90.000 | 1 | 3 | Stop |
| Ny hjemmesidetekst | Lars | 40 | 0 | 2 | 2 | Pausér |

## Indstilling: fortsæt / pausér / stop

**Fortsæt** (180 timer af 340):
- Webshop-relancering - værdi 4: bærer årets mål om onlinesalg +30 %; 120 resttimer til lancering.
- ISO 9001 - bundet: rammeaftalen med største kunde kræver gyldigt certifikat 1/9.

**Pausér:**
- Nyt ERP - værdi 3, men 280 resttimer sprænger kapaciteten; genstartsbetingelse: webshop lanceret.
- Ny hjemmesidetekst - fyld; genstartsbetingelse: ledige timer efter 1/9.

**Stop:**
- Butiksombygning - restværdi 1 (understøtter ingen af årets tre mål) mod 140 resttimer
  og 90.000 kr. Restindsatsen alene finansierer webshoppens færdiggørelse.

## Frigjort kapacitet

460 timer frigøres. 120 øremærkes til at gøre webshoppen FÆRDIG i Q3 i stedet for at fem
projekter kravler; resten er synlig buffer til brandslukning (målt: 30 %) og ERP-genstart i Q4.

## Følsomhed

- Jan er alene om ISO - sygdom dér truer den bundne deadline 1/9.
- Kapaciteten er et [ANTAGELSE]-estimat (ingen timeregistrering); skrider den 20 %, ryger bufferen.
- ERP-leverandøren har varslet prisstigning ved genstart efter nytår - tjek vilkår før Q4.

## Beslutningsspørgsmål (ja/nej)

1. Stopper vi Butiksombygning og flytter de 140 timer til webshoppen? Ja/nej
2. Pauser vi ERP med genstart når webshoppen er lanceret? Ja/nej
3. Accepterer vi 30 % brandslukningsandel som vilkår i Q3 - eller skal den ned (kræver egen beslutning)? Ja/nej

## Antagelser og åbne spørgsmål

- [ANTAGELSE] Kapacitet 340 timer - estimeret med Mette, kalibreret mod 3 nåede milepæle i Q2.
- [AFKLARES] Butiksombygning: er der bestilt materialer med bindende leverandøraftale? (Jan ved det.)

## Kilder

- virksomhedsprofil.md (årets tre mål), portefoljestatus-juni.md, interview med Mette 2026-07-01.
```

Bemærk i eksemplet: ERP-projektets allerede forbrugte 350.000 kr. optræder ingen steder som argument - kun rest mod rest. Og stop-forslaget på Butiksombygning har et [AFKLARES] om kontraktlige forpligtelser, som SKAL afklares før beslutningen (eskalationstrigger).
