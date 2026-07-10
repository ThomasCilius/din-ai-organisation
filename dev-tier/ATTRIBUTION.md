# Udvikler-lag: oprindelse og licens

Indholdet i `dev-tier/` er **kurateret og videredistribueret under MIT** (se
`LICENSE`), fra to kilder:

**ECC (everything-claude-code)** af affaan-m, https://github.com/affaan-m/ECC
- Udsnit: de udvikler-orienterede skill-moduler (framework-language,
  workflow-quality, database, devops-infra, swift-apple) samt de kuraterede
  dev-agenter, commands og rules. Forretnings-, marketing- og domæne-specifikt
  indhold er bevidst udeladt.
- Anden bølge (2026-07-10): skillsene `frontend-a11y` (fletning af ECC's
  frontend-a11y + accessibility) og `codebase-onboarding`, agenten
  `a11y-architect`, hook-mønstrene bag `dev-gateguard.js` (fakta-tvang,
  destilleret fra gateguard-fact-force) og `dev-accumulate.js`/`dev-batch.js`
  (accumulate + batch ved Stop), samt designbygger-referencerne `polering.md`
  (make-interfaces-feel-better) og `motion.md` (motion-ui).

**gstack** af Garry Tan, https://github.com/garrytan/gstack
- Udsnit: engineering-håndværket i `rules/engineering-craft/` (kode-review,
  root-cause, sikkerhedsaudit), destilleret fra gstacks review-, investigate- og
  cso-skills. Kun det bærbare håndværk er beholdt; gstacks runtime (config,
  brain-sync, artifacts, plan-filer) er strippet.
- Design-håndværket under `10-it-og-udvikling/designbygger/references/`
  (html-motor, designsystem, anti-slop-review) er ligeledes tilpasset fra gstack;
  hver fil bærer sin egen attribution-linje.
- Anden bølge (2026-07-10), samme destillat-princip: `arkitektur-review.md`
  (plan-eng-review), `qa-loop.md` (qa/qa-only/benchmark, suppleret med ECC's
  browser-qa), `ship-canary.md` (ship/land-and-deploy/canary),
  `beslutningsprotokol.md` (autoplan + decision-briefs, suppleret med ECC's
  orch-pipeline size-classifier) og `redaktionsvagt.md` (redaction guard).
  Operatør-skillen `grafiker` bygger på design-motorens brief- og
  selvkritik-håndværk, og `ide-stresstest`-referencen forcing-questions.md
  på office-hours.

**management-consulting** af gcamilo, https://github.com/gcamilo/management-consulting (MIT)
- Udsnit (2026-07-10): evidensstandarden
  (`01-direktionen/beslutningsgrundlag/references/evidensstandard.md`),
  KILL CONDITIONS-/output-kontrakten og "vinder-ved-default"-værnet, destilleret
  ind i operatør-skillsene beslutningsgrundlag, etsides-strategiplan,
  second-opinion og problemknuser.

**claude-skill-management-consultant-B1** af DogInfantry,
https://github.com/DogInfantry/claude-skill-management-consultant-B1 (Apache 2.0)
- Udsnit (2026-07-10): problemløsnings-funnel'en, hypotese-invaliderings-
  disciplinen (antagelsesstige, pre-mortem), indsigt-til-handling-værktøjerne
  (første handling inden 5 hverdage, ejer, eskalering), scenario-varsler med
  forhåndsbesluttede modtræk, regressionsevals-mønstret og omkostningsjagt-
  tjeklisten - destilleret ind i problemknuser, ide-stresstest, konkurrent-radar,
  skill-opskrift, budgetopfoelgning og company-brain-prompten. Konsulent-
  karrierelaget (caseinterview, honorar, MBB-vertikaler) er bevidst udeladt.
- NOTICE (bevaret jf. Apache 2.0): "claude-skill-management-consultant-B1,
  Copyright (c) 2026 DogInfantry. Original repository:
  https://github.com/DogInfantry/claude-skill-management-consultant-B1".

*(aapersh/strategy-skills-for-claude er bevidst IKKE genbrugt - repoet har
ingen licens; kun offentligt kendte metode-idéer er beskrevet med egne ord.)*

Dette lag er **valgfrit** og installeres kun med `udvikler`-profilen eller ved
`./install.sh aktiver-udvikler`. Operatør-profilen rører det ikke.

De danske operatør-skills i pakkens afdelingsmapper er original kursusindhold;
hvor en skill bygger på destilleret craft fra kilderne ovenfor, bærer dens
referencefil sin egen kildelinje.
