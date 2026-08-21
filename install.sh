#!/usr/bin/env bash
# Din AI Assistent - ThomasCilius.dk
# Installationen over installationerne.
#
# Én pakke, ingen profiler: hele organisationen installeres samlet, fordi
# afdelingerne haenger sammen. Idempotent, med install-state og ren afinstallation.
# Roerer ALDRIG dine egne skills - kun det, den selv har lagt (ownership: managed).
#
# Ingen konto, intet login, ingen git: ligger pakken ikke ved siden af scriptet,
# hentes den som ét arkiv over almindelig https fra skills.thomascilius.dk.
#
#   ./install.sh plan          vis de fem trin med cirka tidsforbrug (installerer intet)
#   ./install.sh [install]     installer (eller opdater) hele pakken
#   ./install.sh update        hent nyeste + geninstaller (afstemmer skills og hooks)
#   ./install.sh brain <sti>   kobl (eller flyt) company-brain'en - saa indlaeses den ambient
#   ./install.sh status        version + sundhedstjek (hooks, Node, hjerne, hub-filer)
#   ./install.sh uninstall     fjern KUN det installeren lagde
#
# Opgraderer du fra v1 og vil BEHOLDE det gamle udviklerlag (dev-skills, agenter,
# commands og rules/din-ai-org), saa tilfoej --behold-udviklerlaget til install
# eller update. Valget huskes i install-state, saa senere 'update' ogsaa bevarer
# laget. Fortryder du: --drop-udviklerlaget rydder det og glemmer valget igen.
#
# Efter installation ligger scriptet ogsaa i ~/.claude/din-ai-org/install.sh,
# saa opdatering og sundhedstjek altid er ét kald vaek.
#
# CLAUDE_HOME kan overrides (bruges til test): CLAUDE_HOME=/tmp/x ./install.sh
# DIN_AI_PKG_URL kan overrides (bruges til test af arkiv-hentningen).
set -euo pipefail

# Naar scriptet koeres via en pipe (curl ... | bash) findes "$0" ikke som fil.
REPO_ROOT="$(cd "$(dirname "$0")" 2>/dev/null && pwd || printf %s "$PWD")"
CLAUDE_HOME="${CLAUDE_HOME:-$HOME/.claude}"
SKILLS_DIR="$CLAUDE_HOME/skills"
AGENTS_DIR="$CLAUDE_HOME/agents"
COMMANDS_DIR="$CLAUDE_HOME/commands"
RULES_DIR="$CLAUDE_HOME/rules/din-ai-org"
PKG_DIR="$CLAUDE_HOME/din-ai-org"
LEGACY_STASH="$PKG_DIR/udvikler-lager"
STATE="$PKG_DIR/install-state.json"
SETTINGS="$CLAUDE_HOME/settings.json"
HOOKS_SRC="$REPO_ROOT/hooks"
VERSION="2.2.0"
BRAND="Din AI Assistent - ThomasCilius.dk"
PKG_URL="${DIN_AI_PKG_URL:-https://skills.thomascilius.dk/releases/din-ai-organisation.tar.gz}"

# Flag kan staa hvor som helst i kommandolinjen; resten er kommando + argumenter.
KEEP_DEV_FLAG=""      # "1" = behold, "0" = ryd og glem valget, "" = ikke sagt
ARGS=()
for a in "$@"; do
  case "$a" in
    --behold-udviklerlaget|--keep-dev) KEEP_DEV_FLAG=1;;
    --drop-udviklerlaget|--drop-dev)   KEEP_DEV_FLAG=0;;
    *) ARGS+=("$a");;
  esac
done
set -- ${ARGS[@]+"${ARGS[@]}"}

DEPTS=(01-direktionen 02-strategiudvikling 03-viden-og-data 04-programledelse \
       05-sekretariatet 06-salg-og-kundeservice 07-marketing 08-okonomi 09-hr 10-it-og-udvikling \
       11-produktudvikling)

log(){ printf '  %s\n' "$*"; }
die(){ printf 'FEJL: %s\n' "$*" >&2; exit 1; }

# Overskrift - saa det er tydeligt i Claude (og i terminalen), hvad der koerer.
banner(){ printf '\n%s\n%s\n\n' "$BRAND" "$(printf '%*s' ${#BRAND} '' | tr ' ' '-')"; }

# Korte stier i output - "~/.claude/..." er til at laese, den fulde sti er ikke.
short(){ printf '%s' "${1/#$HOME/~}"; }

# De fem trin med cirka tidsforbrug. Vises foer installationen gaar i gang, saa
# ingen bliver overrasket over, at trin 2 og 4 er samtaler og ikke kommandoer.
print_plan(){
  banner
  cat <<'PLAN'
Saadan kommer du i maal - 5 trin, ca. 45-60 minutter i alt.
Du kan holde pause mellem trinene; intet gaar tabt undervejs.

  1  Vaelg hjernens mappe                              ca.  1 min   du vaelger mappen
  2  Byg din company brain - Claude interviewer dig    ca. 20-30 min  medbring 3-5 dokumenter
  3  Installer skills-pakken                           ca.  2 min   én kommando, koerer af sig selv
  4  Udfyld hub-filerne: virksomhed, tone og design    ca. 15-25 min  tre skills, én ad gangen
  5  Sundhedstjek: install.sh status                   ca.  1 min   [OK] / [MANGLER] linje for linje

Trin 2 og 4 er samtaler med Claude - du svarer bare paa spoergsmaalene.
Trin 1, 3 og 5 er hurtige og tekniske. Ingen konto, intet login, ingen git.
PLAN
}

# Pakken skal ligge ved siden af scriptet. Goer den ikke det - fx fordi scriptet
# er hentet alene med curl - henter vi hele pakken som ét arkiv fra sitet.
# Almindelig https: ingen GitHub-konto, intet login, ingen git installeret.
PAYLOAD_TMP=""
cleanup_payload(){ [ -n "$PAYLOAD_TMP" ] && rm -rf "$PAYLOAD_TMP"; return 0; }
trap cleanup_payload EXIT

ensure_payload(){
  local force="${1:-}"
  [ -z "$force" ] && [ -d "$REPO_ROOT/03-viden-og-data" ] && return 0
  command -v curl >/dev/null 2>&1 || die "curl mangler paa maskinen - kan ikke hente pakken"
  command -v tar  >/dev/null 2>&1 || die "tar mangler paa maskinen - kan ikke pakke arkivet ud"
  cleanup_payload
  PAYLOAD_TMP="$(mktemp -d)"
  log "Henter pakken fra ${PKG_URL%/*}/ ..."
  curl -fsSL "$PKG_URL" -o "$PAYLOAD_TMP/pakke.tar.gz" \
    || die "kunne ikke hente pakken ($PKG_URL) - tjek din netforbindelse og proev igen"
  tar -xzf "$PAYLOAD_TMP/pakke.tar.gz" -C "$PAYLOAD_TMP" || die "arkivet kunne ikke pakkes ud"
  local root="$PAYLOAD_TMP"
  [ -d "$PAYLOAD_TMP/din-ai-organisation/03-viden-og-data" ] && root="$PAYLOAD_TMP/din-ai-organisation"
  [ -d "$root/03-viden-og-data" ] || die "arkivet ser forkert ud - proev igen om lidt"
  REPO_ROOT="$root"
  HOOKS_SRC="$REPO_ROOT/hooks"
  log "Pakken hentet - $(all_skills | wc -l | tr -d ' ') skills klar"
}

# Alle skill-mapper i repoet (mapper med en SKILL.md under de 11 afdelinger).
all_skills(){
  local d s
  for d in "${DEPTS[@]}"; do
    [ -d "$REPO_ROOT/$d" ] || continue
    for s in "$REPO_ROOT/$d"/*/; do
      [ -f "${s}SKILL.md" ] || continue
      basename "$s"
    done
  done
}

# Bevares det gamle v1-udviklerlag? Flaget vinder, saa env, saa det valg der
# allerede staar i install-state. Default er nej: en kursist skal ikke slaebe
# rundt paa et lag, kurset ikke laengere bruger.
keep_dev(){
  [ -n "$KEEP_DEV_FLAG" ] && { [ "$KEEP_DEV_FLAG" = "1" ]; return; }
  [ -n "${DIN_AI_KEEP_DEV:-}" ] && { [ "$DIN_AI_KEEP_DEV" != "0" ]; return; }
  [ -f "$STATE" ] || return 1
  python3 -c "import json,sys;sys.exit(0 if json.load(open('$STATE')).get('keepDevLayer') else 1)" 2>/dev/null
}

# Tidligere managed skills fra install-state (tom hvis ingen state).
read_managed(){
  [ -f "$STATE" ] || return 0
  python3 - "$STATE" <<'PY' 2>/dev/null || true
import json,sys
try: print('\n'.join(json.load(open(sys.argv[1])).get("managedSkills",[])))
except Exception: pass
PY
}

# Skriv install-state. Arg: sti-til-fil-med-skill-navne.
write_state(){
  local names_file="$1" keep="0"
  keep_dev && keep="1"
  mkdir -p "$PKG_DIR"
  python3 - "$STATE" "$VERSION" "$names_file" "$keep" <<'STATEPY'
import json,os,sys,datetime
state,version,namesf,keep=sys.argv[1:5]
names=[n.strip() for n in open(namesf) if n.strip()]
prev=json.load(open(state)) if os.path.exists(state) else {}
out={"package":"din-ai-organisation","version":version,
     "installedAt":datetime.datetime.now().isoformat(timespec="seconds"),
     "managedSkills":sorted(set(names))}
# Bevares udviklerlaget, skal listerne blive staaende - ellers ved hverken
# uninstall eller en senere oprydning, hvad der er vores at fjerne.
if keep == "1":
    out["keepDevLayer"]=True
    for k in ("managedDevSkills","managedDevAgents","managedDevCommands","managedDevRules"):
        if prev.get(k): out[k]=prev[k]
json.dump(out, open(state,"w"), indent=2, ensure_ascii=False)
open(state,"a").write("\n")
STATEPY
}

# Wire pakkens hooks ind i settings.json - merge-sikkert. Identificeres paa stien
# 'din-ai-org/hooks/', saa vi kan fjerne praecis vores egne igen uden at roere andres.
wire_hooks(){
  python3 - "$SETTINGS" "$PKG_DIR" <<'PY'
import json, sys, os
settings, pkg = sys.argv[1], sys.argv[2]
d = json.load(open(settings)) if os.path.exists(settings) else {}
hooks = d.setdefault('hooks', {})
marker = 'din-ai-org/hooks/'
def clean(ev):
    hooks[ev] = [g for g in hooks.get(ev, [])
                 if not any(marker in h.get('command','') for h in g.get('hooks', []))]
def add(ev, script, matcher='*'):
    hooks.setdefault(ev, []).append(
        {"matcher": matcher, "hooks": [{"type": "command", "command": f"node '{pkg}/hooks/{script}'"}]})
for ev in ('SessionStart', 'Stop', 'PreToolUse', 'PostToolUse'):
    clean(ev)
add('SessionStart', 'brain-inject.js'); add('SessionStart', 'session-load.js')
add('SessionStart', 'mcp-health.js')
add('Stop', 'session-save.js');         add('Stop', 'notify-done.js')
add('PreToolUse', 'brain-guard.js', 'Write|Edit')
for ev in list(hooks):
    if not hooks[ev]: del hooks[ev]
os.makedirs(os.path.dirname(settings), exist_ok=True)
json.dump(d, open(settings, 'w'), indent=2, ensure_ascii=False); open(settings, 'a').write('\n')
PY
}

unwire_hooks(){
  [ -f "$SETTINGS" ] || return 0
  python3 - "$SETTINGS" <<'PY'
import json, sys, os
settings = sys.argv[1]
d = json.load(open(settings)); hooks = d.get('hooks', {})
marker = 'din-ai-org/hooks/'
for ev in list(hooks):
    hooks[ev] = [g for g in hooks[ev]
                 if not any(marker in h.get('command','') for h in g.get('hooks', []))]
    if not hooks[ev]: del hooks[ev]
if not hooks and 'hooks' in d: del d['hooks']
json.dump(d, open(settings, 'w'), indent=2, ensure_ascii=False); open(settings, 'a').write('\n')
PY
}

install_hooks(){
  mkdir -p "$PKG_DIR/hooks"
  # Ryd tidligere hook-filer, saa udgaaede (fx dev-workflow-hooks fra v1) forsvinder.
  rm -f "$PKG_DIR"/hooks/*.js
  ls "$HOOKS_SRC"/*.js >/dev/null 2>&1 && cp "$HOOKS_SRC"/*.js "$PKG_DIR/hooks/"
  python3 - "$PKG_DIR/config.json" "${DIN_AI_BRAIN:-}" <<'PY'
import json, sys, os
cfgp, brain = sys.argv[1], sys.argv[2]
prev = json.load(open(cfgp)) if os.path.exists(cfgp) else {}
if not brain: brain = prev.get("brainPath", "")   # bevar eksisterende brain-sti ved update
json.dump({"package": "din-ai-organisation", "brainPath": brain},
          open(cfgp, 'w'), indent=2, ensure_ascii=False)
PY
  wire_hooks
}

# Migration fra v1: fjern det gamle udvikler-lag (skills, agenter, commands, rules)
# fra brugerens maskine. Uden det her ville et 'update' efterlade det gamle lag
# liggende for alle, der installerede foer 2.0.0.
purge_legacy_dev(){
  [ -f "$STATE" ] || return 0
  if keep_dev; then
    local k
    k="$(python3 -c "import json;d=json.load(open('$STATE'));print(sum(len(d.get(x,[])) for x in ('managedDevSkills','managedDevAgents','managedDevCommands','managedDevRules')))" 2>/dev/null || echo 0)"
    [ "$k" != "0" ] && log "Beholdt:     $k filer i det gamle udviklerlag (--behold-udviklerlaget)"
    return 0
  fi
  local n=0 p pair key dir
  for pair in "managedDevSkills:$SKILLS_DIR" "managedDevAgents:$AGENTS_DIR" \
              "managedDevCommands:$COMMANDS_DIR" "managedDevRules:$RULES_DIR"; do
    key="${pair%%:*}"; dir="${pair#*:}"
    while IFS= read -r p; do
      [ -n "$p" ] || continue
      [ -e "$dir/$p" ] && { rm -rf "${dir:?}/$p"; n=$((n+1)); }
    done < <(python3 -c "import json,os;d=json.load(open('$STATE')) if os.path.exists('$STATE') else {};print(chr(10).join(d.get('$key',[])))" 2>/dev/null || true)
  done
  [ -d "$RULES_DIR" ] && { rm -rf "$RULES_DIR"; n=$((n+1)); }
  [ -d "$LEGACY_STASH" ] && { rm -rf "$LEGACY_STASH"; n=$((n+1)); }
  [ "$n" -gt 0 ] && log "Ryddet:      $n rester fra det gamle udvikler-lag (v1)"
  return 0
}

# Kobl hjernen: saet brainPath i config.json (idempotent, virker foer OG efter
# at hjernen er bygget). Stien maa gerne pege paa en mappe der foerst bygges senere.
do_brain(){
  local sti="${1:-}"
  [ -n "$sti" ] || die "brug: ./install.sh brain <sti-til-company-brain-mappen>"
  sti="$(python3 -c "import os,sys;print(os.path.abspath(os.path.expanduser(sys.argv[1])))" "$sti")"
  case "$sti" in
    *"Application Support"*|*"/Library/"*) die "hjernen maa ikke ligge i appens data-mappe ($sti) - vaelg en synlig mappe, fx ~/Documents/company-brain";;
  esac
  mkdir -p "$PKG_DIR"
  python3 - "$PKG_DIR/config.json" "$sti" <<'PY'
import json, sys, os
cfgp, brain = sys.argv[1], sys.argv[2]
prev = json.load(open(cfgp)) if os.path.exists(cfgp) else {}
prev.update({"package": "din-ai-organisation", "brainPath": brain})
json.dump(prev, open(cfgp, 'w'), indent=2, ensure_ascii=False)
open(cfgp, 'a').write('\n')
PY
  # soerg for at hook-filer + wiring er paa plads (idempotent; noedvendigt hvis
  # 'brain' koeres foer 'install', eller settings er blevet nulstillet).
  if [ ! -f "$PKG_DIR/hooks/brain-inject.js" ]; then
    ls "$HOOKS_SRC"/*.js >/dev/null 2>&1 || ensure_payload
    if ls "$HOOKS_SRC"/*.js >/dev/null 2>&1; then
      mkdir -p "$PKG_DIR/hooks"; cp "$HOOKS_SRC"/*.js "$PKG_DIR/hooks/"
    fi
  fi
  grep -q 'din-ai-org/hooks/' "$SETTINGS" 2>/dev/null || wire_hooks
  log "Hjerne koblet: $(short "$sti")"
  if [ -f "$sti/00-index.md" ]; then
    log "00-index.md fundet - hjernen indlaeses ambient fra naeste Claude Code-session."
  else
    log "00-index.md findes ikke endnu. Byg hjernen i den mappe med company-brain-prompt.txt - koblingen virker automatisk, saa snart filen findes."
  fi
}

do_install(){
  print_plan
  printf '\nTrin 3 koerer nu.\n\n'
  ensure_payload
  mkdir -p "$SKILLS_DIR" "$PKG_DIR"

  local tmp; tmp="$(mktemp -d)"
  all_skills | sort -u > "$tmp/desired.txt"
  read_managed | sort -u > "$tmp/prev.txt"

  # 0) Migration: fjern v1's udvikler-lag, foer vi skriver ny state.
  purge_legacy_dev

  # 1) Fjern managed skills der ikke laengere er i pakken (roerer ikke ikke-managed).
  local removed=0 s
  while IFS= read -r s; do
    [ -n "$s" ] || continue
    if ! grep -qxF "$s" "$tmp/desired.txt" && [ -d "$SKILLS_DIR/$s" ]; then
      rm -rf "${SKILLS_DIR:?}/$s"; removed=$((removed+1))
    fi
  done < "$tmp/prev.txt"

  # 2) Installer/opdater alle skills.
  local installed=0 d
  while IFS= read -r s; do
    [ -n "$s" ] || continue
    for d in "${DEPTS[@]}"; do
      if [ -f "$REPO_ROOT/$d/$s/SKILL.md" ]; then
        rm -rf "${SKILLS_DIR:?}/$s"
        cp -R "$REPO_ROOT/$d/$s" "$SKILLS_DIR/$s"
        installed=$((installed+1)); break
      fi
    done
  done < "$tmp/desired.txt"

  write_state "$tmp/desired.txt"

  # 3) Brain-prompt + installeren selv tilgaengelig ved siden af pakken, saa
  # opdatering og sundhedstjek altid er ét kald vaek - uden at finde noget frem igen.
  [ -f "$REPO_ROOT/company-brain-prompt.txt" ] && cp "$REPO_ROOT/company-brain-prompt.txt" "$PKG_DIR/company-brain-prompt.txt"
  if [ -f "$REPO_ROOT/install.sh" ]; then
    cp "$REPO_ROOT/install.sh" "$PKG_DIR/install.sh"; chmod +x "$PKG_DIR/install.sh"
  fi

  # 4) Hooks - kontinuitet + brain-inject + notify, wired merge-sikkert ind i settings.json.
  install_hooks

  log "Installeret: $installed skills i 11 afdelinger   (fjernet: $removed)"
  log "Hooks:       brain-inject, session-load/save, notify, connector-vagt, brain-guard"
  log "State:       $(short "$STATE")"

  # 5) Hjerne-kobling: uden den er ambient genkaldelse stille slukket, saa vi
  # spoerger (interaktivt) eller siger det hoejt (ikke-interaktivt). DIN_AI_BRAIN
  # respekteres fortsat, og en eksisterende kobling roeres ikke.
  local bp
  bp="$(python3 -c "import json,os;p='$PKG_DIR/config.json';print(json.load(open(p)).get('brainPath','') if os.path.exists(p) else '')" 2>/dev/null || echo '')"
  if [ -z "$bp" ] && [ -t 0 ]; then
    printf '\n  Hvor ligger (eller skal) din company-brain ligge?\n'
    printf '  Enter = %s   ·   egen sti   ·   "-" = spring over\n  > ' "$HOME/Documents/company-brain"
    local svar; IFS= read -r svar || svar="-"
    [ -z "$svar" ] && svar="$HOME/Documents/company-brain"
    [ "$svar" != "-" ] && { do_brain "$svar"; bp="$svar"; }
  fi

  # Naeste skridt foelger Kom i gang-raekkefoelgen (README) og viser kun det,
  # der reelt mangler - saa kursisten aldrig skal gaette raekkefoelgen selv.
  printf '\nTrin 3 er faerdigt. Naeste skridt (i denne raekkefoelge):\n'
  local idx=1
  if [ -n "$bp" ] && [ -f "$bp/00-index.md" ]; then
    log "$idx) Hjernen er bygget og koblet ($bp) - indlaeses ambient fra naeste session   (0 min)"; idx=$((idx+1))
  elif [ -n "$bp" ]; then
    log "$idx) Byg din company-brain i $(short "$bp"): paste $(short "$PKG_DIR")/company-brain-prompt.txt ind i Claude   (ca. 20-30 min)"; idx=$((idx+1))
  else
    log "$idx) Byg din company-brain: paste $(short "$PKG_DIR")/company-brain-prompt.txt ind i Claude, peget paa hjernens mappe (fx ~/Documents/company-brain)   (ca. 20-30 min)"; idx=$((idx+1))
    log "$idx) Kobl hjernen: $(short "$PKG_DIR")/install.sh brain <sti>   (ca. 1 min - uden koblingen indlaeses den ALDRIG ambient)"; idx=$((idx+1))
  fi
  log "$idx) Udfyld hub-filerne: koer skillene virksomhedsprofil, toneprofil og designretning   (ca. 15-25 min)"; idx=$((idx+1))
  log "$idx) Tjek det hele: $(short "$PKG_DIR")/install.sh status   (ca. 1 min)"
  printf '\n'
  log "Senere: $(short "$PKG_DIR")/install.sh update   henter nyeste version - ingen git, ingen konto."
  rm -rf "$tmp"
}

do_status(){
  banner
  [ -f "$STATE" ] || { echo "Ikke installeret endnu (ingen $STATE) - koer install.sh install"; return 0; }
  python3 - "$STATE" <<'PY'
import json,sys
d=json.load(open(sys.argv[1]))
print(f"Pakke:   {d.get('package')}  v{d.get('version')}")
print(f"Skills:  {len(d.get('managedSkills',[]))} managed")
print(f"Install: {d.get('installedAt')}")
legacy=sum(len(d.get(k,[])) for k in ('managedDevSkills','managedDevAgents','managedDevCommands','managedDevRules'))
if legacy and d.get('keepDevLayer'):
    print(f"Udviklerlag: {legacy} filer bevaret (--behold-udviklerlaget). Ryd med 'install.sh update --drop-udviklerlaget'")
elif legacy:
    print(f"BEMAERK: {legacy} rester fra v1's udvikler-lag - koer 'install.sh update' for at rydde dem")
PY

  # Sundhedstjek: hele kaeden install -> settings -> hooks -> hjerne -> hub-filer.
  # Koer denne, naar noget driller - hver linje siger selv, hvad man goer ved den.
  printf '\nSundhedstjek:\n'
  if command -v node >/dev/null 2>&1; then
    log "[OK]      Node fundet ($(node -v 2>/dev/null)) - hooks kan koere"
  else
    log "[MANGLER] Node ikke fundet - hooks (ambient hjerne, kontinuitet) koerer IKKE. Installer fra nodejs.org"
  fi
  if grep -q 'din-ai-org/hooks/' "$SETTINGS" 2>/dev/null; then
    log "[OK]      Hooks wiret i settings.json"
  else
    log "[MANGLER] Hooks ikke wiret i settings.json - koer './install.sh update'"
  fi
  local mangler
  mangler="$(python3 - "$STATE" "$SKILLS_DIR" <<'PY'
import json,sys,os
d=json.load(open(sys.argv[1]))
print(sum(1 for s in d.get('managedSkills',[]) if not os.path.isdir(os.path.join(sys.argv[2],s))))
PY
)"
  if [ "$mangler" = "0" ]; then
    log "[OK]      Alle managed skills ligger i $(short "$SKILLS_DIR")"
  else
    log "[MANGLER] $mangler managed skills mangler paa disk - koer './install.sh update'"
  fi
  local bp
  bp="$(python3 -c "import json,os;p='$PKG_DIR/config.json';print(json.load(open(p)).get('brainPath','') if os.path.exists(p) else '')" 2>/dev/null || echo '')"
  if [ -z "$bp" ]; then
    log "[MANGLER] Hjerne ikke koblet - koer './install.sh brain <sti-til-company-brain>'"
  elif [ -f "$bp/00-index.md" ]; then
    log "[OK]      Hjerne koblet: $(short "$bp") (00-index.md indlaeses ambient)"
    if [ -f "$bp/identity/virksomhedsprofil.md" ]; then
      log "[OK]      identity/virksomhedsprofil.md - skills kender virksomheden"
    else
      log "[VENTER]  identity/virksomhedsprofil.md mangler - oprettes i brain-promptens fase 4 (eller koer skillen 'virksomhedsprofil')"
    fi
    if [ -f "$bp/identity/voice-profil.md" ]; then
      log "[OK]      identity/voice-profil.md"
    else
      log "[VENTER]  identity/voice-profil.md mangler - koer skillen 'toneprofil'"
    fi
    if [ -f "$bp/identity/designprofil.md" ]; then
      log "[OK]      identity/designprofil.md"
    else
      log "[VENTER]  identity/designprofil.md mangler - koer skillen 'designretning'"
    fi
  else
    log "[MANGLER] Hjerne-sti sat ($bp), men 00-index.md findes ikke - byg hjernen dér med company-brain-prompt.txt"
  fi
}

_remove_list(){
  local key="$1" dir="$2" s n=0
  while IFS= read -r s; do
    [ -n "$s" ] || continue
    [ -e "$dir/$s" ] && { rm -rf "${dir:?}/$s"; n=$((n+1)); }
  done < <(python3 -c "import json;print(chr(10).join(json.load(open('$STATE')).get('$key',[])))" 2>/dev/null)
  echo "$n"
}

do_uninstall(){
  [ -f "$STATE" ] || { echo "Intet at afinstallere."; return 0; }
  local t=0
  t=$((t + $(_remove_list managedSkills "$SKILLS_DIR")))
  # Rester fra v1's udvikler-lag fjernes ogsaa, hvis de stadig staar i state.
  t=$((t + $(_remove_list managedDevSkills   "$SKILLS_DIR")))
  t=$((t + $(_remove_list managedDevAgents   "$AGENTS_DIR")))
  t=$((t + $(_remove_list managedDevCommands "$COMMANDS_DIR")))
  t=$((t + $(_remove_list managedDevRules    "$RULES_DIR")))
  [ -d "$RULES_DIR" ] && rm -rf "$RULES_DIR"   # namespaced, helt vores egen
  unwire_hooks
  rm -rf "$PKG_DIR"
  log "Fjernet $t skills + hooks + pakke-mappen. Dine egne filer er uroert."
}

do_update(){
  # 1) hent nyeste hvis repo er en git-checkout
  if [ -d "$REPO_ROOT/.git" ]; then
    log "Henter nyeste version fra git..."
    git -C "$REPO_ROOT" pull --ff-only 2>&1 | tail -2 | sed 's/^/  /'
  else
    ensure_payload force   # henter altid nyeste arkiv fra sitet - ingen git noedvendig
  fi
  log "Opdaterer til nyeste og afstemmer alt..."
  do_install
}

case "${1:-install}" in
  plan)      print_plan;;
  install)   do_install;;
  brain)     do_brain "${2:-}";;
  status)    do_status;;
  uninstall) do_uninstall;;
  update)    do_update;;
  *) die "ukendt kommando: $1 (plan | install | update | brain <sti> | status | uninstall) - flag: --behold-udviklerlaget | --drop-udviklerlaget";;
esac
