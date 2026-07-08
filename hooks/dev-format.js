#!/usr/bin/env node
'use strict';
// PostToolUse (Write|Edit), DEV-lag: formatér den redigerede fil med det rette
// vaerktoej, hvis det er installeret. Best-effort, aldrig blokerende.
const { execFileSync } = require('child_process');
const fs = require('fs'), path = require('path');
function readStdin() { try { return fs.readFileSync(0, 'utf8'); } catch (e) { return ''; } }
function has(cmd) { try { execFileSync('command', ['-v', cmd], { shell: true, stdio: 'ignore' }); return true; } catch (e) { return false; } }
function run(cmd, args) { try { execFileSync(cmd, args, { stdio: 'ignore', timeout: 15000 }); } catch (e) {} }
try {
  const ev = JSON.parse(readStdin() || '{}');
  const fp = (ev.tool_input && (ev.tool_input.file_path || ev.tool_input.path)) || '';
  if (!fp || !fs.existsSync(fp)) process.exit(0);
  const ext = path.extname(fp).toLowerCase();
  if (['.js', '.jsx', '.ts', '.tsx', '.json', '.css', '.scss', '.md', '.html', '.yaml', '.yml'].includes(ext)) {
    if (has('prettier')) run('prettier', ['--write', fp]);
    else if (has('npx')) run('npx', ['--no-install', 'prettier', '--write', fp]);
  } else if (ext === '.py') {
    if (has('black')) run('black', ['-q', fp]);
    else if (has('ruff')) run('ruff', ['format', fp]);
  } else if (ext === '.go') { if (has('gofmt')) run('gofmt', ['-w', fp]); }
  else if (ext === '.rs') { if (has('rustfmt')) run('rustfmt', [fp]); }
} catch (e) {}
process.exit(0);
