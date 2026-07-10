#!/usr/bin/env node
'use strict';
// PreToolUse (Write|Edit), DEV-lag: fakta-tvang foer foerste redigering pr. fil.
// Naegter FOERSTE redigering af en eksisterende fil i sessionen med krav om
// dokumenteret undersoegelse; andet forsoeg tillades. Selv-evaluering aendrer
// intet - tvungen faktaindsamling goer (destilleret fra ECC gateguard, MIT).
// Slaa fra: DIN_AI_GATEGUARD=off. Fejler state: tillad (aldrig retry-loop).
const fs = require('fs'), path = require('path'), os = require('os');
function readStdin() { try { return fs.readFileSync(0, 'utf8'); } catch (e) { return ''; } }
function deny(reason) {
  process.stdout.write(JSON.stringify({ hookSpecificOutput: {
    hookEventName: 'PreToolUse', permissionDecision: 'deny', permissionDecisionReason: reason } }));
  process.exit(0);
}
try {
  if ((process.env.DIN_AI_GATEGUARD || '').toLowerCase() === 'off') process.exit(0);
  const ev = JSON.parse(readStdin() || '{}');
  const fp = (ev.tool_input && (ev.tool_input.file_path || ev.tool_input.path)) || '';
  if (!fp) process.exit(0);
  // Nye filer og rene noter/state-filer gates ikke - risikoen bor i eksisterende kode.
  if (!fs.existsSync(fp)) process.exit(0);
  const base = path.basename(fp).toLowerCase();
  if (['memory.md', 'todos.md', 'changelog.md'].includes(base) || fp.includes('/inbox/')) process.exit(0);

  const sid = ev.session_id || 'nosession';
  const stateFile = path.join(os.tmpdir(), 'din-ai-gateguard-' + sid.replace(/[^a-z0-9-]/gi, '') + '.json');
  let st = { denied: {}, fullBlocks: 0 };
  try { st = JSON.parse(fs.readFileSync(stateFile, 'utf8')); } catch (e) {}
  if (st.denied[fp]) process.exit(0); // allerede udfordret en gang: tillad

  st.denied[fp] = 1; st.fullBlocks = (st.fullBlocks || 0) + 1;
  try { fs.writeFileSync(stateFile, JSON.stringify(st)); }
  catch (e) { process.exit(0); } // kan state ikke skrives: tillad, aldrig permanent blok
  if (st.fullBlocks > 3) {
    deny('[Gateguard] Foerste redigering af ' + path.basename(fp) + ': undersoeg foerst (hvem bruger den, hvad bad brugeren om), og proev igen. (DIN_AI_GATEGUARD=off slaar vagten fra)');
  }
  deny('[Gateguard] Foerste redigering af ' + fp + ' i denne session.\n' +
    'Dokumentér FOERST din undersoegelse i dit naeste svar (kort):\n' +
    '1) Hvem bruger filen? (grep efter importoerer/kald - navngiv dem)\n' +
    '2) Hvilke data/kontrakter roerer aendringen? (skema, API, format)\n' +
    '3) Hvad bad brugeren faktisk om - og daekker aendringen praecis det?\n' +
    'Gentag derefter redigeringen - den tillades ved andet forsoeg.\n' +
    '(Bevidst friktion: undersoegelsen skaber opmaerksomhed, selv-evaluering goer ikke. Slaa fra: DIN_AI_GATEGUARD=off)');
} catch (e) { /* fejl maa aldrig blokere */ }
process.exit(0);
