# Politik-skabelon og to udfyldte eksempler

Bruges i arbejdsgangens trin 4. Skabelonen er fast: alle sektioner skal med i hver politik - også når indholdet er kort. En genkendelig struktur på tværs af hele håndbogen gør at medarbejderen altid ved hvor reglen og proceduren står, og at hver politik kan revideres for sig. De to eksempler viser detaljeniveauet: kopiér dem aldrig som indhold, brug dem som kalibrering af tone og skarphed.

## Indhold

1. [Skabelonen](#skabelonen)
2. [Udfyldningsregler](#udfyldningsregler)
3. [Udfyldt eksempel: sygemelding (rører lov)](#udfyldt-eksempel-sygemelding)
4. [Udfyldt eksempel: AI-brug (virksomhedens eget valg)](#udfyldt-eksempel-ai-brug)

## Skabelonen

```markdown
# Politik: [emne]

## Formål
[2-3 sætninger: hvorfor findes politikken, forankret i den situation der udløste den.]

## Regel
[Hvad gælder. Højst 7 punkter. Kan reglen ikke siges i 7 punkter, er det to politikker.]

## Procedure
[Hvem gør hvad hvornår. Navngivne roller, konkrete frister og kanaler.]

## Ansvarlig
[Én navngiven rolle der ejer politikken og svarer på spørgsmål.]

## Ikrafttræden og revision
Træder i kraft: [dato]. Revideres senest: [dato, højst 12 måneder frem].

## Lovtjek foer ikrafttraeden
[Alle [LOVTJEK]-flag samlet, hvert med navngiven lov og opslagssted. "Ingen" hvis politikken
er rent virksomhedsvalg uden lovberøring.]

## Antagelser og aabne spoergsmaal
[Alt der er antaget eller mangler afklaring - [ANTAGELSE] / [AFKLAR]. "Ingen" hvis alt er afklaret.]

---
Denne politik er et udkast. Gennemgaa den med jurist eller arbejdsgiverorganisation
(fx DI, Dansk Erhverv, SMVdanmark) foer ikrafttraeden.
```

## Udfyldningsregler

- **Formålet forankres i situationen.** "Fordi vi bør have en politik" er ikke et formål. Skriv hvad politikken skal forhindre eller gøre lettere, ud fra den udløsende situation fra interviewet.
- **Reglen kan afkrydses.** Hvert punkt skal være så konkret at man kan se om det er overholdt. "Udvis ansvarlig adfærd" kan ikke overtrædes og styrer derfor ingenting - se skidt/godt i SKILL.md.
- **Proceduren har hvem + hvad + hvornår i hver linje.** En procedure uden ansvarlig og frist er en hensigt, ikke en procedure.
- **Lov og virksomhedsvalg holdes adskilt.** Et lovkrav får et [LOVTJEK]-flag med kilde. Virksomhedens eget valg (betalingsfrist, antal hjemmearbejdsdage, om der gives løn under barsel) står som almindelig regel - det ejer virksomheden selv.
- **Satser, ugetal og frister anvises, aldrig indsættes.** Skriv "slå den aktuelle sats op på borger.dk" - ikke tallet. Virksomhedens egne valg må gerne stå som tal.
- **Sproget følger voice-profilen:** "du"-form, sætninger på højst 20 ord, ingen kancellisprog. 1-2 sider pr. politik.
- **Revisionsdatoen sættes altid.** En politik uden revisionsdato forældes i stilhed - især på lovtunge områder.

## Udfyldt eksempel: sygemelding

Et eksempel hvor politikken både gengiver et lovkrav (sygefraværssamtalen) og lægger virksomhedens egne valg oven på (hvordan man melder sig syg). Bemærk hvordan lovdelen er flaget, mens sygemeldingsmåden er skarp og konkret.

```markdown
# Politik: Sygemelding og sygefravær

## Formål
Så alle ved præcis hvad de skal gøre ved sygdom, og så ingen sygemelding forsvinder i
en besked til en tilfældig kollega. Politikken kom til efter to sygemeldinger blev
håndteret forskelligt i foråret 2026.

## Regel
1. Er du syg, giver du besked FØR arbejdsdagens start - ikke i løbet af formiddagen.
2. Du melder dig rask igen på samme måde, så din leder ved du er tilbage.
3. Ved sygdom ud over 3 sammenhængende dage kontakter din leder dig for en kort snak
   om, hvordan det går, og hvornår du regner med at være tilbage.
4. Vi beder først om lægelig dokumentation, hvis der er en saglig grund - og vi siger
   altid hvorfor.

## Procedure
- Sygemelding: ring til din nærmeste leder ([navn]) inden kl. 9.00. En sms eller en
  besked til en kollega tæller ikke som sygemelding.
- Kan du ikke få fat i din leder: ring til [backup-navn].
- Sygefraværssamtale: ved længere sygdom indkalder [leder] til en personlig samtale om
  tilbagevenden, som udgangspunkt senest 4 uger efter første sygedag.
- Registrering: fraværet noteres i [system] af [ansvarlig] og behandles fortroligt.

## Ansvarlig
Nærmeste leder ejer den daglige håndtering; [HR/ejer] ejer selve politikken.

## Ikrafttræden og revision
Træder i kraft: 2026-08-01. Revideres senest: 2027-08-01.

## Lovtjek foer ikrafttraeden
- [LOVTJEK] Sygefraværssamtalens frist (som udgangspunkt 4 uger) følger sygedagpengeloven -
  verificér den aktuelle frist og krav på borger.dk.
- [LOVTJEK] Krav om lægeerklæring/friattest skal have hjemmel og være rimeligt -
  afklar med arbejdsgiverorganisation.
- Registrering af sygefravær er helbredsoplysninger - se virksomhedens GDPR-fortegnelse.

## Antagelser og aabne spoergsmaal
- [ANTAGELSE] Nærmeste leder er rette modtager af sygemelding - bekræft rollen.

---
Denne politik er et udkast. Gennemgaa den med jurist eller arbejdsgiverorganisation
(fx DI, Dansk Erhverv, SMVdanmark) foer ikrafttraeden.
```

## Udfyldt eksempel: AI-brug

Et eksempel på en politik der næsten udelukkende er virksomhedens eget valg - men som stadig rører GDPR og tavshedspligt, og derfor har ét flag. Bemærk at reglen er konkret nok til at en medarbejder kan afgøre om de er inden for eller uden for.

```markdown
# Politik: Brug af AI-værktøjer

## Formål
Så vi kan bruge AI til at arbejde hurtigere og bedre, uden at kundedata, personoplysninger
eller forretningshemmeligheder havner et forkert sted. Politikken kom, efter en medarbejder
kom til at indsætte en kundeliste i et gratis AI-værktøj.

## Regel
1. Du må bruge de godkendte AI-værktøjer på listen i [system] til dit arbejde.
2. Du må ALDRIG indsætte personoplysninger, kundedata, kontrakter eller andet fortroligt
   i et AI-værktøj, der ikke står på listen.
3. Du er ansvarlig for det du sender ud: AI-output tjekkes af et menneske, før det bruges
   over for en kunde eller lægges i et system.
4. Er du i tvivl om et værktøj eller en opgave, spørger du [ansvarlig] FØR du bruger det.

## Procedure
- Ny værktøjsønske: skriv til [ansvarlig], der vurderer databehandling og sætter det på
  listen, hvis det er i orden.
- Godkendte værktøjer og hvad de må bruges til står i [system] og opdateres af [ansvarlig].
- Ved mistanke om at data er havnet forkert: sig det straks til [ansvarlig] - hellere én
  gang for meget end en fortielse.

## Ansvarlig
[IT-ansvarlig/ejer] ejer værktøjslisten og politikken.

## Ikrafttræden og revision
Træder i kraft: 2026-08-01. Revideres senest: 2027-02-01 (kortere interval, feltet ændrer sig hurtigt).

## Lovtjek foer ikrafttraeden
- [LOVTJEK] Behandling af personoplysninger i AI-værktøjer kræver lovligt grundlag og ofte
  en databehandleraftale - koordinér med virksomhedens GDPR-fortegnelse (`gdpr-fortegnelse`).
- Tavshedspligt og fortrolighed følger af ansættelsesaftalen - henvis til den, gengiv den ikke.

## Antagelser og aabne spoergsmaal
- [AFKLAR] Hvem ejer værktøjslisten i praksis - IT, ejer eller en udpeget person?

---
Denne politik er et udkast. Gennemgaa den med jurist eller arbejdsgiverorganisation
(fx DI, Dansk Erhverv, SMVdanmark) foer ikrafttraeden.
```

Bemærk hvad de to eksempler gør: reglen kan i begge afkrydses (ringede nogen inden kl. 9? stod værktøjet på listen?), proceduren har navngivne roller og kanaler, lovdelen er flaget med kilde i stedet for hardcodet, virksomhedens egne valg står som klare regler virksomheden selv ejer, revisionsdatoen er sat (kortere på det felt der ændrer sig hurtigt), og jurist-footeren står nederst urørt.
