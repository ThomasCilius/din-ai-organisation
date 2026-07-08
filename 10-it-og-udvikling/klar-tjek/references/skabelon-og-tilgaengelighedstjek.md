# Skabelon- og tilgængelighedstjek

Læs denne fil i trin 4: når leverancen skal holdes op mod `designprofil.md`, og når du kører de tilgængelighedstjek en ikke-udvikler selv kan lave. Alle punkter her er noget en almindelig bruger kan verificere med øjnene, tastaturet og en telefon - der kræves ingen kode.

## 1. Skabelontjek mod designprofil.md

Find `designprofil.md` og hold leverancen op mod den. Er der ingen designprofil, så notér det og spring de profil-specifikke punkter over (men kør stadig tilgængelighedstjekket nedenfor).

- **Farver:** bruger leverancen de definerede farver (hex-koder) fra profilen? Er 60-30-10-fordelingen nogenlunde holdt, eller er der pludselig nye accentfarver?
- **Skrifter:** samme skriftfamilier og hierarki (overskrift/brød/accent) som profilen foreskriver? Er der sneget en fremmed systemskrift ind?
- **Spacing:** følger afstande den faste spacing-skala, eller er der tilfældig luft?
- **Logo og identitet:** er det rigtige logo brugt, i rigtig størrelse og med luft omkring?
- **Do/don't:** overtræder leverancen nogen af de eksplicitte don'ts i profilen?

Afvigelser er typisk "skal rettes" (forkert brug af brand) eller "kan vente" (mindre kosmetik) - sjældent blokerende, medmindre teksten er direkte ulæselig (se kontrast nedenfor).

## 2. Tilgængelighedstjek en ikke-udvikler selv kan lave

Tilgængelighed er en gate, ikke pynt: en løsning brugere ikke kan læse eller betjene, er ikke færdig. Målestokken er WCAG 2.1 niveau AA - slå den nyeste version og de præcise krav op frem for at stole på hukommelsen, men de bærende punkter her ændrer sig ikke:

**Kontrast (læsbarhed):**
- Er brødtekst tydeligt læsbar mod baggrunden? AA kræver mindst **4,5:1** for normal tekst og **3:1** for stor tekst.
- Lys grå tekst på hvid baggrund er den klassiske synder - flag den.
- Bærer farve alene betydning? (Fx "røde rækker er forsinkede" uden andet tegn.) Det fejler - betydning må aldrig hvile på farve alene, fordi farveblinde brugere så mister den.
- Praktisk tjek: kan du læse teksten med skærmen skruet ned i lysstyrke, eller på en telefon i sollys?

**Tastaturbetjening:**
- Kan du gennemføre kernefunktionen **kun med tastaturet** (Tab mellem felter, Enter/mellemrum for at aktivere)? Test det.
- Er der en synlig markering af hvor "fokus" er, når du tabber rundt?
- Kan du komme ud af en menu/pop-op med Esc, eller sidder du fast?

**Mobil og tekststørrelse:**
- Virker leverancen på en telefonskærm? Kan man ramme knapper og links med en finger (ikke for små, ikke for tæt)?
- Brødtekst bør være mindst **16px** på web.
- Kan brugeren forstørre teksten (zoom til 200 %) uden at indhold forsvinder eller overlapper?

**Struktur og hjælpetekster:**
- Har billeder en beskrivende alt-tekst (så skærmlæsere og søgemaskiner forstår dem)?
- Har formularfelter tydelige labels - ikke kun en grå pladsholdertekst der forsvinder når man skriver?
- Er fejlbeskeder forståelige på dansk, ikke tekniske koder?

## 3. Kategorisering af tilgængelighedsfund

- **Blokerende:** tekst er reelt ulæselig (kontrast langt under kravet), kernefunktion kan ikke betjenes, eller en offentligt rettet løsning omfattet af webtilgængelighedsloven fejler grovt.
- **Skal rettes:** kontrast lige under kravet, manglende fokusmarkering, manglende labels, for små klikmål på mobil.
- **Kan vente:** enkelte manglende alt-tekster på pyntebilleder, mindre afvigelser.

## 4. Kort huskeliste

- [ ] Farver, skrifter, spacing matcher designprofil.md.
- [ ] Brødtekst er læsbar (kontrast mindst 4,5:1) og mindst 16px.
- [ ] Betydning bæres ikke af farve alene.
- [ ] Kernefunktionen kan betjenes med tastaturet, med synligt fokus.
- [ ] Leverancen virker og kan betjenes på en telefon.
- [ ] Teksten kan forstørres uden at knække.
- [ ] Billeder har alt-tekst, felter har labels, fejl er forståelige.

Er du i tvivl om et punkt rammer en lovpligtig grænse (offentligt rettede løsninger, webtilgængelighedsloven): flag det som fund og slå den aktuelle retsstatus op frem for at gætte.
