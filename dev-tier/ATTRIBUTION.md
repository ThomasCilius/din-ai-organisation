# Udvikler-lag: oprindelse og licens

Indholdet i `dev-tier/` er **kurateret og videredistribueret under MIT** (se
`LICENSE`), fra to kilder:

**ECC (everything-claude-code)** af affaan-m, https://github.com/affaan-m/ECC
- Udsnit: de udvikler-orienterede skill-moduler (framework-language,
  workflow-quality, database, devops-infra, swift-apple) samt de kuraterede
  dev-agenter, commands og rules. Forretnings-, marketing- og domæne-specifikt
  indhold er bevidst udeladt.

**gstack** af Garry Tan, https://github.com/garrytan/gstack
- Udsnit: engineering-håndværket i `rules/engineering-craft/` (kode-review,
  root-cause, sikkerhedsaudit), destilleret fra gstacks review-, investigate- og
  cso-skills. Kun det bærbare håndværk er beholdt; gstacks runtime (config,
  brain-sync, artifacts, plan-filer) er strippet.
- Design-håndværket under `10-it-og-udvikling/designbygger/references/`
  (html-motor, designsystem, anti-slop-review) er ligeledes tilpasset fra gstack;
  hver fil bærer sin egen attribution-linje.

Dette lag er **valgfrit** og installeres kun med `udvikler`-profilen eller ved
`./install.sh aktiver-udvikler`. Operatør-profilen rører det ikke.

De 65 danske operatør-skills i pakkens afdelingsmapper er derimod original
kursusindhold og hører ikke under denne attribution.
