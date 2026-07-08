# Offboarding-adgange - fuld tjekliste

Målet: fra og med sidste arbejdsdag har den fratrådte ingen adgang til noget, alle delte koder hun kendte er skiftet, og intet ejerskab (filer, mail, kunder) er efterladt hos en person, der ikke er der længere. En hængende adgang er både et sikkerhedshul og et GDPR-problem - og det er den fejl, SMV'er oftest laver.

## Tidskravet: samme dag

**Personens egne konti lukkes på fratrædelsesdagen - ikke "i næste uge".** Ved ufrivillig fratræden, opsigelse i vrede eller mistanke om illoyalitet: luk ved arbejdsophør samme dag, ikke ved kontraktudløb. Jo længere en adgang står åben efter, personen er gået, jo større er risikoen.

Undtagelse, du planlægger for, men ikke selv udfører: nogle konti skal leve kort tid endnu for at overdrage data (typisk mailboksen). Det håndteres kontrolleret - se `references/mailboks-og-gdpr.md` - ikke ved at lade den stå åben.

## Tjekliste (rækkefølge)

**Samme dag - luk personens egne konti (kør oversigten igennem system for system):**
- [ ] Deaktivér (ikke bare "log ud") hver personlig konto - system: [navn] - ansvarlig: [navn] - frist: [sidste dag]
- [ ] Fjern personen fra hver adgangsgruppe/delt drev
- [ ] Inddrag admin-rettigheder først, hvis personen havde nogen
- [ ] Fjern personen fra "Hvem har adgang" i `systemoversigt.md`

**Samme dag - skift delte koder personen kendte:**
- [ ] Gennemgå oversigtens "Delte adgange": hver kode markeret "skift ved fratræden", som personen kendte, skiftes nu - fælleskonti, wifi, delte SaaS-logins
- [ ] Opdater den nye kode i password-manageren, ikke på mail/papir

**Overdragelse (helst inden sidste dag):**
- [ ] Overdrag ejerskab af delte filer/mapper til navngiven modtager - system: [navn] - fra: [fratrådt] -> til: [modtager]
- [ ] Overdrag kunderelationer i CRM (ejer-felt) til navngiven kollega
- [ ] For hver opgave, kun personen kunne: kør `procedure-skriver` INDEN sidste dag - bagefter er viden væk

**Mailboks og data (altid - se separat reference):**
- [ ] Planlæg autosvar + kontrolleret lukning inden for en begrænset, saglig periode - læs `references/mailboks-og-gdpr.md`, og slå Datatilsynets aktuelle praksis op på datatilsynet.dk

**Udstyr:**
- [ ] Inddrag pc, telefon, nøgler, adgangskort, betalingskort - notér retur i oversigten
- [ ] Fjernslet firmaadgang på personlige enheder (mobil med firmamail), hvis relevant

**Afslut:**
- [ ] Log i ændringsloggen: [dato] - lukket - [system] - [navn] - [hvem udførte]
- [ ] Opdater "Sidst opdateret" i oversigten

## Eskalér - stop og henvis

Ved tvist ved fratræden, mistanke om datatyveri eller sletning af firmadata: stop, og henvis til ejer/jurist, før der lukkes eller slettes noget. Bevar frem for at slette - data kan være bevis. Ved brud på persondatasikkerheden gælder GDPR art. 33 (anmeldelse til Datatilsynet inden 72 timer) - verificér den aktuelle frist på datatilsynet.dk.

## Afleveringstjek

- [ ] Hvert punkt har lukkedato = fratrædelsesdagen (eller en begrundet, kortere frist).
- [ ] Delte koder personen kendte er på skift-listen - ikke kun personens egen konto.
- [ ] Alt ejerskab (filer, mail, kunder) er overdraget til en navngiven, nulevende modtager.
- [ ] Mailboks-afsnittet henviser til datatilsynet.dk for periode og praksis - ingen hardcodet frist.
