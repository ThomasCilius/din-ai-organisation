# Skrifter og licens

Maks. **2 skriftfamilier**. Vælg efter opgaven (skærmlæsning, tryk, autoritet, varme), ikke efter hvad der er nyt. Og flag altid licens: en skrift der kræver køb, koster penge pr. bruger eller pr. site og bliver et skjult gebyr i profilen.

## Indhold
1. Licens-dømmekraft
2. Frie skrifter der altid virker
3. Skriftpar efter stilretning
4. Fallback-stak
5. Røde flag: skrifter der koster penge

## 1. Licens-dømmekraft

- **Foretræk frie skrifter:** Google Fonts (langt de fleste er SIL Open Font License - fri til alt, også kommercielt) og systemskrifter (følger med styresystemet, koster intet).
- **Flag købslicens:** Beder brugeren om en foundry-skrift (fx Helvetica Neue, Gotham, Proxima Nova, Circular, Founders Grotesk, Neue Haas), så sig det højt: den kræver købslicens pr. platform, og prisen stiger med antal brugere/visninger. Foreslå et frit alternativ med samme udtryk.
- **Tjek altid licensen** før du anbefaler - en skrift kan være gratis at downloade, men ikke gratis til kommerciel brug. Ved tvivl: vælg en SIL OFL-skrift, så er der frit lejde.
- Systemskrifter er den mest driftssikre bund: de indlæses øjeblikkeligt, findes på alle enheder og koster aldrig noget.

## 2. Frie skrifter der altid virker

Alle nedenfor er frie (SIL OFL via Google Fonts) eller systemskrifter.

**Sans-serif (skærm, brød, UI):** Inter, Source Sans 3, IBM Plex Sans, Work Sans, Libre Franklin, Public Sans, Figtree, Manrope. System: -apple-system/Segoe UI.

**Serif (autoritet, tryk, redaktionelt):** Source Serif 4, Lora, Merriweather, Spectral, IBM Plex Serif, EB Garamond. System: Georgia.

**Karakterskrifter (kun til overskrifter, aldrig brød):** Fraunces, Playfair Display, Space Grotesk, DM Serif Display, Bricolage Grotesque.

**Monospace (tal, kode, teknisk):** IBM Plex Mono, JetBrains Mono, Space Mono.

## 3. Skriftpar efter stilretning

Vælg parret der matcher stilretningen (se stilretninger.md), ikke smagen:

| Stilretning | Overskrift | Brødtekst | Signal |
|---|---|---|---|
| Redaktionel/magasin | Fraunces / Playfair Display | Source Serif 4 / Lora | Redaktionel tyngde, indhold i centrum |
| Swiss/International | Inter / Libre Franklin | Inter / Source Sans 3 | Klar, neutral, systematisk |
| Varm/menneskelig | Bricolage Grotesque / Fraunces | Figtree / Work Sans | Imødekommende, ikke steril |
| Teknisk/B2B-SaaS | Space Grotesk / IBM Plex Sans | IBM Plex Sans / Inter | Præcis, moderne, datatung |
| Klassisk/tillid (revisor, jura) | Source Serif 4 | Source Sans 3 | Soliditet, læselighed, autoritet |
| Driftssikker/systemskrift | Segoe UI / -apple-system | samme | Nul indlæsningstid, nul licens |

Én skrift kan bære det hele: brug fx Inter til både overskrift og brød med vægt- og størrelseskontrast. Det er ofte det stærkeste og mest driftssikre valg.

## 4. Fallback-stak

Skriv altid en fallback-stak, så teksten ser ordentlig ud selv hvis hovedskriften ikke indlæses:

```
"Inter", -apple-system, "Segoe UI", Roboto, sans-serif   (til en sans)
"Source Serif 4", Georgia, "Times New Roman", serif        (til en serif)
```

Rækkefølge: ønsket skrift → nærmeste systemskrift → generisk familie til sidst.

## 5. Røde flag: skrifter der koster penge

Sig fra og foreslå et frit alternativ, hvis en af disse dukker op uden en betalt licens i hånden:

| Købsskrift | Frit alternativ med samme udtryk |
|---|---|
| Helvetica / Helvetica Neue | Inter, Libre Franklin |
| Gotham | Montserrat, Manrope |
| Proxima Nova | Figtree, Work Sans |
| Circular | Manrope, Figtree |
| Founders/Neue Haas Grotesk | Space Grotesk, Inter |
| Avenir | Nunito Sans, Manrope |

Er brandets betalte skrift allerede købt og en del af identiteten: respektér den (se aldrig-regel om eksisterende identitet), men noter licenskilden i profilen.
