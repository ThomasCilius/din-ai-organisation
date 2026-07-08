#!/usr/bin/env node
'use strict';
// PreToolUse (Write|Edit): ikke-blokerende paamindelse, naar en kernefil i
// company-brain er ved at blive skrevet. Beskytter mod stille overskrivning.
const fs = require('fs'), path = require('path');
function readStdin() { try { return fs.readFileSync(0, 'utf8'); } catch (e) { return ''; } }
try {
  const ev = JSON.parse(readStdin() || '{}');
  const fp = (ev.tool_input && (ev.tool_input.file_path || ev.tool_input.path)) || '';
  if (!fp) process.exit(0);
  const cfgPath = path.join(__dirname, '..', 'config.json');
  const cfg = fs.existsSync(cfgPath) ? JSON.parse(fs.readFileSync(cfgPath, 'utf8')) : {};
  const bp = cfg.brainPath;
  if (!bp) process.exit(0);
  const inBrain = path.resolve(fp).startsWith(path.resolve(bp));
  const base = path.basename(fp);
  const isCore = inBrain && ['00-index.md', 'CLAUDE.md', 'SENSITIVITY.md'].includes(base);
  if (isCore) {
    process.stdout.write(JSON.stringify({
      hookSpecificOutput: {
        hookEventName: 'PreToolUse',
        additionalContext: `Paamindelse: ${base} er en kernefil i company-brain. Bevar strukturen, append til Log frem for at overskrive, og slet aldrig eksisterende viden stiltiende.`
      }
    }));
  }
} catch (e) {}
process.exit(0);
