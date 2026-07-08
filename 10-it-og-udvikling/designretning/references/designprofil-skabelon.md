# Skabelon: designprofil.md

Kopiér strukturen nedenfor og udfyld hvert felt. Profilen er både Claudes byggeinstruks (slides, sider, dokumenter, annoncer) OG design-brief til et bureau. Derfor: intet skal kunne misforstås, og intet felt må stå med "TBD". Erstat alt i [kantede parenteser].

Grundkrav til udfyldningen:
- Farver som **hex-koder**, ikke navne.
- Skrifter med **fallback-stak** og **licensnote**.
- Spacing som en **talrække**, ikke "luftigt".
- Do/don't som **konkrete eksempler**, ikke adjektiver.
- Hvert større valg har en **begrundelse** koblet til `virksomhedsprofil.md`.

---

```markdown
# Designprofil - [virksomhed]

_Version [x.x] - [dato] - status: [kladde/godkendt]_

## Den ene ting folk skal huske (styrende princip)
[Én sætning. Alt andet i profilen tjener denne. Fx: "At vi er den grundige
revisor, der forklarer i øjenhøjde - ikke den billigste."]

## Stilretning og begrundelse
- **Retning:** [fx redaktionel/Swiss/varm-menneskelig - se stilretninger.md]
- **Hvorfor denne:** [kobling til branche + målgruppe + prisleje fra
  virksomhedsprofil.md]
- **Signaturtræk:** [1-3 træk der gør retningen genkendelig på tværs af flader]

## Farver (60-30-10, hex + kontrast)
| Rolle | Andel | Navn | Hex | Bruges til |
|---|---|---|---|---|
| Dominerende | 60 % | [fx Papir] | #FFFFFF | Baggrund, store flader |
| Sekundær | 30 % | [fx Blæk] | #1A1A1A | Overskrifter, tekst |
| Accent | 10 % | [fx Okker] | #C08A2D | CTA, links, fremhævning |

Neutraler/gråtoner: [#..., #..., #...]
Semantiske farver (hvis relevant): succes #..., advarsel #..., fejl #...

**Kontroller (udfyld målte forhold - se tilgaengelighed-og-kontrast.md):**
- Brødtekst [hex] på [baggrund-hex]: [x,x]:1 (krav ≥ 4,5:1) - [OK/ikke OK]
- Accent [hex] på [baggrund-hex]: [x,x]:1 (krav ≥ 4,5:1 for tekst, ≥ 3:1 for stor)

## Typografi (skrifter, fallbacks, hierarki, licens)
- **Overskrift:** [Navn] - stak: `"Navn", [fallback], sans-serif` - licens: [fri/køb]
- **Brødtekst:** [Navn] - stak: `"Navn", [fallback], sans-serif` - licens: [fri/køb]
- **Accent (valgfri):** [Navn eller "samme som overskrift i anden vægt"]

Hierarki (skalatrin, ikke tilfældige størrelser):
| Niveau | Størrelse | Vægt | Linjehøjde |
|---|---|---|---|
| H1 | [fx 40px] | 700 | 1,1 |
| H2 | [fx 28px] | 700 | 1,2 |
| Brød | [min. 16px] | 400 | 1,5 |
| Småt | [fx 14px] | 400 | 1,4 |

Regler: maks. 2 skriftfamilier; brødtekst min. 16px på web; læselinjelængde 45-75 tegn.

## Spacing og layoutprincip
- **Spacing-skala:** [fx 4, 8, 16, 24, 32, 48, 64] px
- **Layoutprincip:** [fx "12-kolonne-grid, generøs margen, ét blikfang pr. skærm"]
- **Radius/skygger:** [ét sæt, fx radius 8px, én blød skygge - ikke fem forskellige]

## Do og don't
| Gør | Undgå |
|---|---|
| [konkret: "Én accentfarve pr. skærm"] | [konkret: "Tre kort med hver sin farve"] |
| [konkret] | [konkret] |
| [konkret] | [konkret] |

## Tilgængelighed (WCAG AA-krav)
- Kontrast: brødtekst ≥ 4,5:1, stor tekst (≥ 24px eller ≥ 18,66px fed) ≥ 3:1.
- Betydning bæres aldrig af farve alene (også ikon/tekst/mønster).
- Brødtekst min. 16px; klikmål min. 24x24px (helst større på mobil).
- [Hvis offentligt rettet:] Omfattet af webtilgængelighedsloven - kræver
  tilgængelighedserklæring. Slå aktuel lovtekst og frist op.

## Antagelser og åbne spørgsmål
- [ANTAGELSE: ...] - bekræftes af [hvem]
- [ÅBENT: ...]

## Kilder
- virksomhedsprofil.md (branche, målgruppe, prisleje)
- voice-profil.md (skrivestemme)
- [eksisterende materialer/logo]
- [skrift-licenskilde, fx Google Fonts / foundry]

## Smagshistorik (valg og fravalg)
_designvarianter skriver her, når varianter vælges - så næste opgave kender
smagen. Fx: "2026-07-07: valgt 'Rolig', fravalgt 'Markant' (for hård til B2B-kunder)."_
```

---

## Kvalitetstjek af den udfyldte profil

Før du kalder profilen færdig:
- Ingen felter med "TBD", "afklares" eller tomme parenteser.
- Alle farver er hex, alle skrifter har fallback + licensnote.
- Mindst tre do/don't-par, alle konkrete.
- Alle kontrastforhold er udfyldt med målte tal, ikke "OK".
- Hvert stort valg (retning, skrifter, hovedfarve) har en begrundelse.
