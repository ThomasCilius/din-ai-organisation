#!/usr/bin/env node
'use strict';
// PostToolUse (Write|Edit), DEV-lag: advar om debug-udsagn i den redigerede fil.
const fs = require('fs'), path = require('path');
function readStdin() { try { return fs.readFileSync(0, 'utf8'); } catch (e) { return ''; } }
try {
  const ev = JSON.parse(readStdin() || '{}');
  const fp = (ev.tool_input && (ev.tool_input.file_path || ev.tool_input.path)) || '';
  if (!fp || !fs.existsSync(fp)) process.exit(0);
  const ext = path.extname(fp).toLowerCase();
  const txt = fs.readFileSync(fp, 'utf8');
  const rules = [
    [/\bconsole\.log\(/, 'console.log', ['.js', '.jsx', '.ts', '.tsx']],
    [/\bdebugger\b/, 'debugger', ['.js', '.jsx', '.ts', '.tsx']],
    [/^\s*print\(/m, 'print(', ['.py']],
    [/\bbreakpoint\(\)/, 'breakpoint()', ['.py']],
  ];
  const hits = rules.filter(([re, , exts]) => exts.includes(ext) && re.test(txt)).map(r => r[1]);
  if (hits.length) {
    process.stdout.write(JSON.stringify({ hookSpecificOutput: { hookEventName: 'PostToolUse',
      additionalContext: `Debug-udsagn i ${path.basename(fp)}: ${hits.join(', ')}. Fjern dem foer commit.` } }));
  }
} catch (e) {}
process.exit(0);
