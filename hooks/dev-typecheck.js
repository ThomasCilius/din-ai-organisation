#!/usr/bin/env node
'use strict';
// PostToolUse (Write|Edit), DEV-lag: let typecheck af redigeret .ts/.py, kun hvis
// der findes projekt-config og vaerktoejet er installeret. Bundet timeout.
const { execFileSync } = require('child_process');
const fs = require('fs'), path = require('path');
function readStdin() { try { return fs.readFileSync(0, 'utf8'); } catch (e) { return ''; } }
function findUp(start, name) { let d = start; for (let i = 0; i < 6; i++) { if (fs.existsSync(path.join(d, name))) return d; const p = path.dirname(d); if (p === d) break; d = p; } return null; }
function has(cmd) { try { execFileSync('command', ['-v', cmd], { shell: true, stdio: 'ignore' }); return true; } catch (e) { return false; } }
try {
  const ev = JSON.parse(readStdin() || '{}');
  const fp = (ev.tool_input && (ev.tool_input.file_path || ev.tool_input.path)) || '';
  if (!fp || !fs.existsSync(fp)) process.exit(0);
  const ext = path.extname(fp).toLowerCase();
  let out = '';
  if (['.ts', '.tsx'].includes(ext)) {
    const root = findUp(path.dirname(fp), 'tsconfig.json');
    if (root && has('npx')) {
      try { execFileSync('npx', ['--no-install', 'tsc', '--noEmit'], { cwd: root, timeout: 20000, stdio: 'pipe' }); }
      catch (e) { out = ((e.stdout || '') + '').split('\n').filter(Boolean).slice(0, 8).join('\n'); }
    }
  } else if (ext === '.py') {
    const root = findUp(path.dirname(fp), 'pyproject.toml');
    if (root && has('mypy')) {
      try { execFileSync('mypy', [fp], { timeout: 20000, stdio: 'pipe' }); }
      catch (e) { out = ((e.stdout || '') + '').split('\n').filter(Boolean).slice(0, 8).join('\n'); }
    }
  }
  if (out.trim()) {
    process.stdout.write(JSON.stringify({ hookSpecificOutput: { hookEventName: 'PostToolUse',
      additionalContext: 'Typecheck-fejl efter redigering:\n' + out.trim() } }));
  }
} catch (e) {}
process.exit(0);
