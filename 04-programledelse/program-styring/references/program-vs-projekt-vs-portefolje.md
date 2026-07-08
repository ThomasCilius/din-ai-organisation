# Program, projekt eller portefølje - SMV-kalibreret

Den hyppigste fejl er at kalde noget et program, som i virkeligheden er ét projekt (så bygger du et tungt partitur til en enkel opgave), eller at bruge program-styring til det, der bare er løbende status (så laver du en plan, hvor du skulle have lavet en rapport). Denne fil skærper skellet, så opgaven havner det rigtige sted.

## Kort definition

| | Program | Projekt | Portefølje |
|---|---|---|---|
| Hvad | Flere afhængige arbejdsstrømme mod ÉT mål | Én afgrænset leverance med ét formål | Alle projekter og programmer set samlet |
| Ejer | Én programejer + én ejer pr. strøm | Én projektejer + én projektleder | Ledelsen |
| Styres med | Partitur: strømme, mapping, overleveringer | Kommissorium + milepælsplan | Trafiklys + prioritering |
| Skill | `program-styring` (denne) | `projekt-kickoff` | `portefolje-status`, `projekt-prioritering` |

## Testen - tre spørgsmål

1. **Kræver det flere afdelinger, der leverer hver sin del?** Nej -> projekt. Ja -> gå videre.
2. **Er delene indbyrdes afhængige (den ene skal vente på den anden)?** Nej, de er uafhængige opgaver, der bare kører samtidig -> det er flere projekter, ikke ét program; brug `projekt-kickoff` pr. stk. og `portefolje-status` til overblik. Ja -> gå videre.
3. **Løber de mod ét fælles, målbart mål?** Nej, hvert ben har sit eget mål -> flere projekter. Ja -> det er et program. Brug denne skill.

Alle tre skal være ja. Er bare ét nej, er det ikke et program.

## Grænsetilfælde

- **Én stor leverance, men mange opgaver** (fx "byg en ny hjemmeside"): stadig ét projekt - opgaverne er delopgaver, ikke tværgående strømme med hver sin afdelingsejer. Brug `projekt-kickoff`, ikke program-styring.
- **Et program, hvor én strøm er et helt projekt** (fx "byg det digitale bookingsystem" som del af "lancer online-booking som ydelse"): normalt. Programmet dirigerer på tværs; den strøm får sit eget kommissorium via `projekt-kickoff`. Program-styring ejer koordineringen, kickoff ejer det enkelte projekts styring.
- **"Vi har alt for meget i gang"**: det er ikke et program - det er en prioritering. Brug `projekt-prioritering`.
- **"Hvordan står det til med det hele?"**: det er status, ikke styring. Brug `portefolje-status`.

## Eksempler fra en SMV

Programmer (flere afhængige strømme, ét mål):

- **Lancer et abonnement som ny ydelse.** Strømme: strategisk beslutning -> prissætning -> juridik/vilkår -> byg af selvbetjening -> salgsmateriale -> lancering. Mål: 30 abonnenter på 6 måneder.
- **Flyt hele virksomheden til et nyt økonomisystem.** Strømme: valg af system -> datamigrering -> procedurer -> oplæring -> parallelkørsel. Mål: gammelt system lukket uden datatab.
- **Åbn en ny afdeling i en anden by.** Strømme: lokaler -> rekruttering -> IT/adgange -> markedsføring -> første kunder. Mål: afdelingen løber rundt efter 12 måneder.

IKKE programmer:

- "Skriv et tilbud til den store kunde" -> opgave for `tilbud`.
- "Lav årets marketingplan" -> `marketing-sparring`.
- "Vi skal have styr på persondata" -> `gdpr-fortegnelse`.
- "Ansæt en ny sælger" -> `rekruttering` (ét projekt, én afdeling).

## Hvorfor skellet er dyrt at få forkert

Et tungt program-partitur til et enkelt projekt bremser en travl ejerleder med koordinering, der ikke er brug for. Og et program, der behandles som ét projekt, taber netop det, programstyring findes for: overleveringerne mellem afdelingerne, hvor initiativer i praksis går i stå. Brug testen, før du bygger partituret.
