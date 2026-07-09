#!/usr/bin/env bash
# din-ai-organisation - installationen over installationerne
#
# Modulaer, idempotent installer med profiler, install-state og ren afinstallation.
# Roerer ALDRIG dine egne skills - kun det, den selv har lagt (ownership: managed).
#
#   ./install.sh [install] [profil]   profil: operatoer (default) | hele-organisationen | udvikler
#   ./install.sh update               hent nyeste + geninstaller (afstemmer skills, dev-lag og hooks)
#   ./install.sh status               vis installeret profil, version og antal managed skills
#   ./install.sh aktiver-udvikler     aktiver det stagede udvikler-lag (hvis payload findes)
#   ./install.sh uninstall            fjern KUN managed skills + pakke-mappen
#
# CLAUDE_HOME kan overrides (bruges til test): CLAUDE_HOME=/tmp/x ./install.sh
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")" && pwd)"
CLAUDE_HOME="${CLAUDE_HOME:-$HOME/.claude}"
SKILLS_DIR="$CLAUDE_HOME/skills"
AGENTS_DIR="$CLAUDE_HOME/agents"
COMMANDS_DIR="$CLAUDE_HOME/commands"
RULES_DIR="$CLAUDE_HOME/rules/din-ai-org"
PKG_DIR="$CLAUDE_HOME/din-ai-org"
STASH="$PKG_DIR/udvikler-lager"
STATE="$PKG_DIR/install-state.json"
SETTINGS="$CLAUDE_HOME/settings.json"
HOOKS_SRC="$REPO_ROOT/hooks"
VERSION="1.0.0"

DEPTS=(01-direktionen 02-strategiudvikling 03-viden-og-data 04-programledelse \
       05-sekretariatet 06-salg-og-kundeservice 07-marketing 08-okonomi 09-hr 10-it-og-udvikling)

log(){ printf '  %s\n' "$*"; }
die(){ printf 'FEJL: %s\n' "$*" >&2; exit 1; }

# Operatoer-skill-mapper fra repoet (alle mapper med en SKILL.md under de 10 afdelinger).
operator_skills(){
  local d s
  for d in "${DEPTS[@]}"; do
    [ -d "$REPO_ROOT/$d" ] || continue
    for s in "$REPO_ROOT/$d"/*/; do
      [ -f "${s}SKILL.md" ] || continue
      basename "$s"
    done
  done
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

# Skriv install-state. Args: profil, sti-til-fil-med-skill-navne.
write_state(){
  local profile="$1" names_file="$2"
  mkdir -p "$PKG_DIR"
  python3 - "$profile" "$STATE" "$VERSION" "$names_file" <<'PY'
import json,sys,datetime,os
profile,state,version,namesf=sys.argv[1:5]
prev=json.load(open(state)) if os.path.exists(state) else {}
names=[n.strip() for n in open(namesf) if n.strip()]
out={"package":"din-ai-organisation","version":version,"profile":profile,
     "installedAt":datetime.datetime.now().isoformat(timespec="seconds"),
     "managedSkills":sorted(set(names))}
for k,v in prev.items():
    if k.startswith("managedDev"): out[k]=v
json.dump(out, open(state,"w"), indent=2, ensure_ascii=False)
open(state,"a").write("\n")
PY
}

# Wire pakkens hooks ind i settings.json - merge-sikkert. Identificeres pa stien
# 'din-ai-org/hooks/', saa vi kan fjerne prAcis vores egne igen uden at roere andres.
wire_hooks(){
  python3 - "$SETTINGS" "$PKG_DIR" "$STATE" <<'PY'
import json, sys, os
settings, pkg, state = sys.argv[1], sys.argv[2], sys.argv[3]
d = json.load(open(settings)) if os.path.exists(settings) else {}
hooks = d.setdefault('hooks', {})
marker = 'din-ai-org/hooks/'
dev = False
if os.path.exists(state):
    try: dev = bool(json.load(open(state)).get('managedDevSkills'))
    except Exception: pass
def clean(ev):
    hooks[ev] = [g for g in hooks.get(ev, [])
                 if not any(marker in h.get('command','') for h in g.get('hooks', []))]
def add(ev, script, matcher='*'):
    hooks.setdefault(ev, []).append(
        {"matcher": matcher, "hooks": [{"type": "command", "command": f"node '{pkg}/hooks/{script}'"}]})
for ev in ('SessionStart', 'Stop', 'PreToolUse', 'PostToolUse'):
    clean(ev)
add('SessionStart', 'brain-inject.js'); add('SessionStart', 'session-load.js')
add('SessionStart', 'rules-inject.js'); add('SessionStart', 'mcp-health.js')
add('Stop', 'session-save.js');         add('Stop', 'notify-done.js')
add('PreToolUse', 'brain-guard.js', 'Write|Edit')
if dev:
    add('PostToolUse', 'dev-format.js', 'Write|Edit')
    add('PostToolUse', 'dev-console-warn.js', 'Write|Edit')
    add('PostToolUse', 'dev-typecheck.js', 'Write|Edit')
    add('PreToolUse', 'dev-commit-gate.js', 'Bash')
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

do_install(){
  local profile="${1:-operatoer}"
  case "$profile" in
    operatoer|operatør|hele-organisationen|udvikler) ;;
    *) die "ukendt profil: $profile (brug operatoer | hele-organisationen | udvikler)";;
  esac
  [ -d "$REPO_ROOT/03-viden-og-data" ] || die "koer scriptet fra repo-roden"
  mkdir -p "$SKILLS_DIR" "$PKG_DIR"

  local tmp; tmp="$(mktemp -d)"
  operator_skills | sort -u > "$tmp/desired.txt"
  read_managed | sort -u > "$tmp/prev.txt"

  # 1) Fjern managed skills der ikke laengere er i profilen (roerer ikke ikke-managed).
  local removed=0 s
  while IFS= read -r s; do
    [ -n "$s" ] || continue
    if ! grep -qxF "$s" "$tmp/desired.txt" && [ -d "$SKILLS_DIR/$s" ]; then
      rm -rf "${SKILLS_DIR:?}/$s"; removed=$((removed+1))
    fi
  done < "$tmp/prev.txt"

  # 2) Installer/opdater de oenskede skills.
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

  write_state "$profile" "$tmp/desired.txt"

  # 3) Udvikler-lager: stage dev-lagets skills, agenter og commands (alle profiler).
  mkdir -p "$STASH"
  for t in skills agents commands rules; do
    [ -d "$REPO_ROOT/dev-tier/$t" ] && { mkdir -p "$STASH/$t"; cp -R "$REPO_ROOT/dev-tier/$t/." "$STASH/$t/"; }
  done

  # 4) Brain-prompt tilgaengelig ved siden af pakken.
  [ -f "$REPO_ROOT/company-brain-prompt.txt" ] && cp "$REPO_ROOT/company-brain-prompt.txt" "$PKG_DIR/company-brain-prompt.txt"

  # 5) Hooks - kontinuitet + brain-inject + notify, wired merge-sikkert ind i settings.json.
  install_hooks

  log "Profil:      $profile"
  log "Installeret: $installed skills   (fjernet: $removed)"
  log "Hooks:       brain-inject, session-load/save, notify (settings.json)"
  log "State:       $STATE"
  case "$profile" in
    udvikler|hele-organisationen) do_activate_dev ;;
    *) [ -n "$(ls -A "$STASH/skills" 2>/dev/null)" ] && log "Udvikler-lag: $(ls "$STASH/skills" | wc -l | tr -d ' ') skills staged - aktiver med './install.sh aktiver-udvikler'" ;;
  esac
  [ -z "${DIN_AI_BRAIN:-}" ] && log "Tip: saet DIN_AI_BRAIN=~/company-brain foer install, saa hjernen indlaeses ambient (eller redigeer $PKG_DIR/config.json)."
  printf '\nFaerdig. Naeste skridt: byg din company-brain med %s\n' "$PKG_DIR/company-brain-prompt.txt"
  rm -rf "$tmp"
}

do_status(){
  [ -f "$STATE" ] || { echo "Ikke installeret (ingen $STATE)"; return 0; }
  python3 - "$STATE" <<'PY'
import json,sys
d=json.load(open(sys.argv[1]))
print(f"Pakke:   {d.get('package')}  v{d.get('version')}")
print(f"Profil:  {d.get('profile')}")
print(f"Skills:  {len(d.get('managedSkills',[]))} managed")
ds,da,dc=len(d.get('managedDevSkills',[])),len(d.get('managedDevAgents',[])),len(d.get('managedDevCommands',[]))
if ds or da or dc: print(f"Dev-lag: {ds} skills + {da} agenter + {dc} commands aktive")
print(f"Install: {d.get('installedAt')}")
PY
}

# Aktiver/opdater én staged type (skills/agents/commands/rules) og AFSTEM: fjern
# tidligere-managed items der er faldet ud af payloadet, saa opdateringer bliver rene.
_activate_type(){
  local type="$1" dest="$2" statekey="$3" src="$STASH/$1"
  [ -d "$src" ] || return 0
  mkdir -p "$dest"
  local cur; cur="$(mktemp)"
  shopt -s nullglob
  for e in "$src"/*; do basename "$e"; done > "$cur"
  # 1) fjern items der var managed, men ikke laengere er i payloadet
  python3 -c "import json,os;print(chr(10).join(json.load(open('$STATE')).get('$statekey',[])) if os.path.exists('$STATE') else '')" 2>/dev/null \
    | while IFS= read -r p; do
        [ -n "$p" ] || continue
        grep -qxF "$p" "$cur" || { [ -e "$dest/$p" ] && rm -rf "${dest:?}/$p"; }
      done
  # 2) kopiér nuvaerende payload ind
  local n=0 e
  for e in "$src"/*; do
    local base; base="$(basename "$e")"
    rm -rf "${dest:?}/$base"; cp -R "$e" "$dest/$base"; n=$((n+1))
  done
  # 3) state[statekey] = nuvaerende payload (afstem, ikke merge)
  python3 - "$STATE" "$statekey" "$cur" <<'PY'
import json,sys,os
state,key,curf=sys.argv[1],sys.argv[2],sys.argv[3]
d=json.load(open(state)) if os.path.exists(state) else {"package":"din-ai-organisation"}
d[key]=sorted({n.strip() for n in open(curf) if n.strip()})
json.dump(d,open(state,"w"),indent=2,ensure_ascii=False); open(state,"a").write("\n")
PY
  [ "$n" -gt 0 ] && log "Aktiveret/opdateret $n $type"
  rm -f "$cur"
}

do_activate_dev(){
  [ -d "$STASH" ] || die "intet udvikler-lager (koer install foerst)"
  _activate_type skills   "$SKILLS_DIR"   managedDevSkills
  _activate_type agents   "$AGENTS_DIR"   managedDevAgents
  _activate_type commands "$COMMANDS_DIR" managedDevCommands
  _activate_type rules    "$RULES_DIR"    managedDevRules
  wire_hooks   # dev-laget er nu aktivt: wire dev-workflow-hooks (format/typecheck/commit-gate) ind
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
  t=$((t + $(_remove_list managedSkills     "$SKILLS_DIR")))
  t=$((t + $(_remove_list managedDevSkills   "$SKILLS_DIR")))
  t=$((t + $(_remove_list managedDevAgents   "$AGENTS_DIR")))
  t=$((t + $(_remove_list managedDevCommands "$COMMANDS_DIR")))
  t=$((t + $(_remove_list managedDevRules    "$RULES_DIR")))
  [ -d "$RULES_DIR" ] && rm -rf "$RULES_DIR"   # namespaced, helt vores egen
  unwire_hooks
  rm -rf "$PKG_DIR"
  log "Fjernet $t filer (skills, dev-lag, hooks) + pakke-mappen. Dine egne filer er uroert."
}

do_update(){
  # 1) hent nyeste hvis repo er en git-checkout
  if [ -d "$REPO_ROOT/.git" ]; then
    log "Henter nyeste version fra git..."
    git -C "$REPO_ROOT" pull --ff-only 2>&1 | tail -2 | sed 's/^/  /'
  else
    log "Ikke en git-mappe. Opdater repo-filerne manuelt (nyt download) foer update."
  fi
  # 2) vaelg profil: udvikler hvis dev-laget er aktivt, ellers den registrerede
  local profile="operatoer"
  if [ -f "$STATE" ]; then
    if python3 -c "import json,sys;sys.exit(0 if json.load(open('$STATE')).get('managedDevSkills') else 1)" 2>/dev/null; then
      profile="udvikler"
    else
      profile="$(python3 -c "import json;print(json.load(open('$STATE')).get('profile','operatoer'))" 2>/dev/null || echo operatoer)"
    fi
  fi
  log "Opdaterer til nyeste, profil: $profile"
  do_install "$profile"
}

case "${1:-install}" in
  install)          do_install "${2:-operatoer}";;
  status)           do_status;;
  aktiver-udvikler) do_activate_dev;;
  uninstall)        do_uninstall;;
  update)           do_update;;
  operatoer|operatør|hele-organisationen|udvikler) do_install "$1";;  # tillad './install.sh <profil>'
  *) die "ukendt kommando: $1 (install | update | status | aktiver-udvikler | uninstall)";;
esac
