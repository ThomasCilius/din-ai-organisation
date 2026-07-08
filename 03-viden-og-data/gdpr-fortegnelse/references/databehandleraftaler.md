# Databehandlere, dataansvarlige og databehandleraftaler (artikel 28)

Indhold:

1. [Databehandler eller dataansvarlig: testen](#1-databehandler-eller-dataansvarlig-testen)
2. [Kravet om databehandleraftale](#2-kravet-om-databehandleraftale)
3. [Tjekliste: typiske SMV-databehandlere](#3-tjekliste-typiske-smv-databehandlere)
4. [Tredjelandsoverførsler](#4-tredjelandsoverforsler)
5. [Skabelon: databehandleroversigt](#5-skabelon-databehandleroversigt)

## 1. Databehandler eller dataansvarlig: testen

Stil ét spørgsmål pr. leverandør: **Hvem bestemmer formål og midler - os eller dem?**

- Behandler leverandøren KUN efter virksomhedens instruks og til virksomhedens formål: **databehandler** - der skal findes en databehandleraftale.
- Bestemmer leverandøren selv formålet med behandlingen: **selvstændigt dataansvarlig** - ingen databehandleraftale, men noteres som modtager i fortegnelsen.

Typiske klassificeringer (bekræft altid konkret - roller kan variere med aftalen):

| Leverandør | Typisk rolle | Hvorfor |
|---|---|---|
| Lønbureau/lønsystem | Databehandler | Behandler kun efter instruks |
| Mail- og kontorpakke (Microsoft 365, Google Workspace) | Databehandler | Hoster jeres data til jeres formål |
| CRM, nyhedsbrevsværktøj, helpdesk | Databehandler | Samme |
| Hjemmesidehost/webbureau med adgang til data | Databehandler | Samme |
| Revisor | Typisk selvstændigt dataansvarlig | Lovreguleret erhverv med eget ansvar |
| Advokat | Selvstændigt dataansvarlig | Samme |
| Bank | Selvstændigt dataansvarlig | Egne formål og forpligtelser |
| Skattestyrelsen og andre myndigheder | Selvstændigt dataansvarlig | Lovbestemte formål |
| Sociale medier (fx virksomhedsside) | Ofte fælles dataansvar | Særlig kategori - henvis til Datatilsynets vejledning ved tvivl |

## 2. Kravet om databehandleraftale

Artikel 28 kræver en skriftlig aftale med enhver databehandler. Aftalen skal blandt andet fastlægge: behandling kun efter dokumenteret instruks, fortrolighed, sikkerhedsforanstaltninger, regler for underdatabehandlere, bistand til den dataansvarlige (anmodninger, brud), sletning eller tilbagelevering ved ophør, og revisions-/dokumentationsret.

Praktisk SMV-virkelighed - og skillens vigtigste besked til brugeren:

- **Store cloudleverandører har allerede en databehandleraftale** som del af standardvilkårene (ofte kaldet "Data Processing Agreement/Addendum" eller "DPA"). Opgaven er at FINDE den, gemme et link eller en kopi og notere dato - ikke at skrive en ny.
- **Små lokale leverandører** (webbureau, IT-supportfirma, lokalt lønbureau) har ofte INGEN aftale på plads - her er fundet "mangler", og næste skridt er at bede leverandøren om deres standardaftale eller bruge Datatilsynets skabelon til databehandleraftaler som udgangspunkt.
- Skillen udpeger hvor aftaler mangler og henviser til Datatilsynets skabelon - den skriver ikke selv juridisk bindende aftaler, og gennemgang af en konkret aftales vilkår hører til i `kontrakt-tjek`.

## 3. Tjekliste: typiske SMV-databehandlere

Gennemgå listen med brugeren i interviewet - den fanger de leverandører folk glemmer:

- [ ] Lønsystem/lønbureau (fx Danløn, Zenegy, Salary, Proløn)
- [ ] Mail- og kontorpakke (Microsoft 365, Google Workspace)
- [ ] Bogføringssystem (fx e-conomic, Dinero, Billy)
- [ ] CRM (fx HubSpot, Pipedrive, webCRM)
- [ ] Nyhedsbrevs-/marketingværktøj (fx Mailchimp, MailerLite, ActiveCampaign)
- [ ] Hjemmesidehost og webbureau (hvis de har adgang til data eller drift)
- [ ] Analyse-/statistikværktøj på hjemmesiden
- [ ] Fillagring/backup (fx Dropbox, OneDrive, ekstern backupleverandør)
- [ ] Tidsregistrering/vagtplan
- [ ] Rekrutteringssystem eller jobportal med kandidatdata
- [ ] Helpdesk-/supportsystem
- [ ] IT-supportleverandør med fjernadgang til maskiner og servere
- [ ] AI-værktøjer der behandler persondata (herunder denne slags assistenter) - tjek leverandørens databehandlervilkår

For hver afkrydset: notér i databehandleroversigten om aftalen findes, mangler eller er ukendt. "Ukendt" er et legitimt midlertidigt svar - men det skal på listen over åbne spørgsmål.

## 4. Tredjelandsoverførsler

Behandler leverandøren data uden for EU/EØS (typisk amerikanske cloudtjenester), skal fortegnelsen notere landet og overførselsgrundlaget. Mulige grundlag er blandt andet en tilstrækkelighedsafgørelse fra EU-Kommissionen (fx rammeaftaler med USA), EU's standardkontraktbestemmelser (SCC) eller andre garantier i kapitel V.

**Hardkod aldrig status.** Overførselsgrundlag til USA har historisk skiftet flere gange (Safe Harbor og Privacy Shield blev begge underkendt). Skriv altid: "overførselsgrundlag: [leverandørens angivelse] - verificér aktuel status på datatilsynet.dk/EDPB før der disponeres efter det".

Praktisk fremgangsmåde pr. leverandør: slå leverandørens egen DPA/privacy-side op - store leverandører angiver selv overførselsgrundlag og underdatabehandlere. Notér hvad der står, med dato.

## 5. Skabelon: databehandleroversigt

Brug præcis disse kolonner i `gdpr-fortegnelse.md` under "Databehandleroversigt":

```markdown
| Leverandør | System/ydelse | Hvilke persondata | Rolle | Databehandleraftale | Tredjeland + grundlag | Sidst tjekket |
|---|---|---|---|---|---|---|
| [navn] | [fx lønsystem] | [fx medarbejderdata inkl. CPR] | Databehandler | Findes (link/dato) / Mangler / Ukendt | Nej / [land + grundlag] / [MANGLER] | [dato] |
```

Sortér med "Mangler" øverst - det er handlingslisten. Kilde: Datatilsynets vejledning om dataansvarlige og databehandlere samt Datatilsynets skabeloner (datatilsynet.dk) - slå den aktuelle udgave op og citér den i fortegnelsens kildeafsnit.
