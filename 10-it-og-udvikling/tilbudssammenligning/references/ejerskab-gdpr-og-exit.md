# Ejerskab, databehandleraftale og exit

De tre vilkår SMV'er oftest overser i et tilbud - og hvor det gør mest ondt bagefter. Dette er tjeklister til vurdering, ikke juridisk rådgivning: ved tvivl, tvist eller store beløb henvises til `kontrakt-tjek`, revisor eller advokat.

## Indhold
1. Ejerskab: kode, data, domæne, hosting-konti
2. Databehandleraftale (GDPR art. 28)
3. Exit og overdragelse
4. Hvornår eskaleres

## 1. Ejerskab: hvem ejer hvad efter levering

Et tilbud bør gøre ejerskab eksplicit på fire ting. Står det ikke, er det et hul der skal lukkes skriftligt - ikke antages.

- **Kode:** Ejer virksomheden den færdige kode, eller giver leverandøren kun en brugsret? For skræddersyet arbejde bør kunden eje eller have en tidsubegrænset, overdragelig licens. Ren "vi ejer koden, I lejer den" binder dig til leverandøren for evigt.
- **Data:** Virksomhedens egne data (kunder, bookinger, indhold) tilhører virksomheden. Tjek at data kan eksporteres i et brugbart, åbent format når som helst - ikke kun mens abonnementet løber.
- **Domæne:** Skal stå registreret i virksomhedens eget navn og egen konto. Aldrig i bureauets navn "for nemheds skyld" - så kan du ikke flytte det uden deres samtykke.
- **Hosting-konti:** Server, CMS-login, DNS og lignende skal være virksomhedens egne konti, som virksomheden har admin på. Adgang "gennem bureauet" er en afhængighed der gør et leverandørskifte dyrt eller umuligt.

Rød tråd: alt der kan gøre dig til gidsel efter levering - domæne, hosting, admin-adgange - skal ligge hos virksomheden selv.

## 2. Databehandleraftale (GDPR art. 28)

**Hvornår kræves den?** Når leverandøren behandler persondata på virksomhedens vegne - fx hoster en løsning med kundedata, har adgang til en database med personoplysninger, eller supporterer et system hvor de kan se persondata. Så er virksomheden dataansvarlig og leverandøren databehandler, og en skriftlig databehandleraftale er lovpligtig efter databeskyttelsesforordningens artikel 28.

**Hvad skal den som minimum dække** (overordnet - detaljer og aktuel praksis slås op hos Datatilsynet):
- Formål med og varighed af behandlingen
- Hvilke typer persondata og kategorier af registrerede
- At databehandleren kun handler efter dokumenteret instruks
- Tekniske og organisatoriske sikkerhedsforanstaltninger
- Regler for brug af underdatabehandlere
- Sletning eller tilbagelevering af data ved ophør
- Bistand ved registreredes rettigheder og ved sikkerhedsbrud

**I tilbudsvurderingen:** Behandles der persondata og er der ingen databehandleraftale nævnt, er det et **blokerende** flag. Aftalen skal på plads før løsningen tages i brug - ikke bagefter. Slå aktuel vejledning og skabelon op hos Datatilsynet frem for at antage indholdet.

## 3. Exit og overdragelse

Exit er det man aftaler mens man er venner, så et samarbejdsophør ikke bliver et gidseldrama. Tjek at tilbuddet - eller den kommende kontrakt - svarer på:

- **Adgange:** Får virksomheden alle logins, admin-rettigheder og nøgler ved ophør?
- **Kildekode:** Udleveres den fulde kildekode i et brugbart format?
- **Dokumentation:** Følger der teknisk dokumentation med, så en ny leverandør kan overtage uden at starte forfra?
- **Data:** Kan alle data trækkes ud i åbent format?
- **Overdragelsespris og -tid:** Koster en overdragelse ekstra, og hvor lang varsel kræves?

Mangler exit-vilkår helt, er det et flag på niveau opmærksomhed til blokerende afhængigt af hvor kritisk løsningen er. En løsning der driver kerneforretningen uden exit-plan er en stor risiko.

## 4. Hvornår eskaleres

Denne skill vurderer og flager - den afgør ikke jura. Stop og henvis videre når:
- Der er en reel eller mulig tvist om hvad der er aftalt.
- Kontraktens formuleringer om ansvar, ophavsret eller erstatning skal fortolkes - det er `kontrakt-tjek` (01-direktionen) eller en advokat.
- Beløbet er stort for virksomheden.
- Persondatabehandlingen er kompleks (følsomme data, mange registrerede, overførsel uden for EU).

Skriv eskaleringen ind i outputtet som et konkret næste skridt, ikke som en løs bemærkning.
