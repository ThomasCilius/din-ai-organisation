#!/usr/bin/env node
'use strict';
// PreToolUse (Bash), DEV-lag: let kvalitetsgate foer 'git commit'. Ikke-blokerende,
// flager debug-udsagn og store filer i det stagede. Roerer intet.
const { execFileSync } = require('child_process');
const fs = require('fs');
function readStdin() { try { return fs.readFileSync(0, 'utf8'); } catch (e) { return ''; } }
try {
  const ev = JSON.parse(readStdin() || '{}');
  const cmd = (ev.tool_input && ev.tool_input.command) || '';
  if (!/\bgit\s+commit\b/.test(cmd)) process.exit(0);
  let staged = '';
  try { staged = execFileSync('git', ['diff', '--cached', '--name-only'], { stdio: 'pipe' }) + ''; } catch (e) { process.exit(0); }
  const warn = [];
  for (const f of staged.split('\n').filter(Boolean)) {
    try {
      const st = fs.statSync(f);
      if (st.size > 1000000) warn.push(`${f} er stor (${Math.round(st.size / 1024)} KB)`);
      if (/\.(js|jsx|ts|tsx)$/.test(f)) { if (/\bconsole\.log\(|\bdebugger\b/.test(fs.readFileSync(f, 'utf8'))) warn.push(`${f}: console.log/debugger`); }
      else if (/\.py$/.test(f)) { if (/\bbreakpoint\(\)/.test(fs.readFileSync(f, 'utf8'))) warn.push(`${f}: breakpoint()`); }
    } catch (e) {}
  }
  if (warn.length) {
    process.stdout.write(JSON.stringify({ hookSpecificOutput: { hookEventName: 'PreToolUse',
      additionalContext: 'Kvalitetsgate foer commit:\n' + warn.map(w => '- ' + w).join('\n') + '\nOvervej at rette foer du committer.' } }));
  }
} catch (e) {}
process.exit(0);
