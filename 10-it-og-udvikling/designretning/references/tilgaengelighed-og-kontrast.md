# Tilgængelighed og kontrast (WCAG 2.1 AA)

Tilgængelighed er en **gate, ikke et tilvalg**. En smuk palet, ingen kan læse, er en fejl - ikke en stilbeslutning. Byg kravene ind i designprofil.md, så alt output (slides, sider, dokumenter) arver dem.

## Indhold
1. Kontrastkrav (tal)
2. Sådan måler du kontrast
3. Farve alene bærer aldrig betydning
4. Størrelser og klikmål
5. Webtilgængelighedsloven (offentligt rettede løsninger)
6. Tjekliste

## 1. Kontrastkrav (tal)

WCAG 2.1 AA - de tal du skal ramme:

| Element | Minimumskontrast |
|---|---|
| Brødtekst (under 24px) | **4,5:1** |
| Stor tekst (≥ 24px, eller ≥ 18,66px/14pt fed) | **3:1** |
| Grafik og UI-komponenter (knapkant, ikon, inputfelt) | **3:1** |
| Ren dekoration (ingen betydning) | intet krav |

Kontrast er et forhold mellem to farvers relative luminans, fra 1:1 (ens) til 21:1 (sort på hvid). Højere = mere læsbart.

## 2. Sådan måler du kontrast

- Regn ikke i hovedet - forholdet afhænger af luminans, ikke af hvor "mørk" farven ser ud.
- Brug et kontrasttjek (fx WebAIM Contrast Checker eller browserens udviklerværktøj). Slå det aktuelle værktøj op frem for at gætte et tal.
- Indfør de **målte** forhold i profilen, ikke "OK". Et tal kan efterprøves; "OK" kan ikke.
- Typisk faldgrube: en accentfarve (okker, lysegrøn, gul) på hvid har ofte under 4,5:1 og duer derfor til store overskrifter eller knapflader, men **ikke** til brødtekst. Vælg en mørkere variant til tekst.

## 3. Farve alene bærer aldrig betydning

Ca. 8 % af mænd er farveblinde. Derfor:
- Links markeres med mere end farve (understregning eller vægt).
- Status (fejl/succes) får ikon eller tekst, ikke kun rød/grøn.
- Grafer får mønster, label eller direkte påskrift, ikke kun farvekodning.

## 4. Størrelser og klikmål

- Brødtekst **min. 16px** på web (mindre tvinger folk til at zoome).
- Læselinjelængde 45-75 tegn - længere linjer taber læseren.
- Klikmål min. 24x24px (WCAG AA); sigt efter større på mobil, så fingeren rammer (Fitts' lov).

## 5. Webtilgængelighedsloven (offentligt rettede løsninger)

Er løsningen offentligt rettet - offentlig myndighed, eller en privat aktør der løser offentlige opgaver eller er finansieret offentligt - kan den være omfattet af **lov om tilgængelighed af offentlige organers websteder og mobilapplikationer** (webtilgængelighedsloven), som kræver WCAG 2.1 AA og en **tilgængelighedserklæring**.

Der er desuden nye tilgængelighedskrav på vej til visse **private** produkter og tjenester (via EU's tilgængelighedsdirektiv). Om og hvornår det rammer den konkrete virksomhed afhænger af branche og dato.

**Regel:** Flag relevansen, men **slå aktuel lovtekst, omfang og frister op** på Digitaliseringsstyrelsen/tilgængeligt.dk (eller hos en jurist) - hardcode aldrig paragraffer eller datoer, de forældes. AI flager, mennesket og kilden afgør.

## 6. Tjekliste

- [ ] Brødtekst mod baggrund ≥ 4,5:1 (målt tal indført)
- [ ] Stor tekst og UI-elementer ≥ 3:1
- [ ] Accentfarve testet både som tekst og som flade - brugt korrekt
- [ ] Ingen betydning båret af farve alene
- [ ] Brødtekst ≥ 16px, klikmål ≥ 24px
- [ ] Offentligt rettet? Webtilgængelighedsloven flagget + kilde henvist
