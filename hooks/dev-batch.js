#!/usr/bin/env node
'use strict';
// Stop, DEV-lag: batch-formatering + typecheck af ALLE filer redigeret i dette
// svar, en gang, i stedet for pr. edit. Laeser accumulator-filen fra
// dev-accumulate.js og rydder den. Best-effort, aldrig blokerende.
const { execFileSync } = require('child_process');
const fs = require('fs'), path = require('path'), os = require('os');
function has(cmd) { try { execFileSync('command', ['-v', cmd], { shell: true, stdio: 'ignore' }); return true; } catch (e) { return false; } }
function run(cmd, args, opts) { try { execFileSync(cmd, args, Object.assign({ stdio: 'ignore', timeout: 30000 }, opts || {})); return ''; }
  catch (e) { return ((e.stdout || '') + '').toString(); } }
function findUp(start, name) { let d = start; for (let i = 0; i < 8; i++) { if (fs.existsSync(path.join(d, name))) return d; const p = path.dirname(d); if (p === d) break; d = p; } return null; }
try {
  const ev = JSON.parse(fs.readFileSync(0, 'utf8') || '{}');
  const sid = (ev.session_id || 'nosession').replace(/[^a-z0-9-]/gi, '');
  const accum = path.join(os.tmpdir(), 'din-ai-edited-' + sid + '.txt');
  if (!fs.existsSync(accum)) process.exit(0);
  const files = Array.from(new Set(fs.readFileSync(accum, 'utf8').split('\n').map(s => s.trim()).filter(Boolean)))
    .filter(f => fs.existsSync(f));
  try { fs.unlinkSync(accum); } catch (e) {}
  if (!files.length) process.exit(0);

  // 1) Formatering: en kaldsrunde pr. vaerktoej, ikke pr. fil.
  const pret = files.filter(f => ['.js', '.jsx', '.ts', '.tsx', '.json', '.css', '.scss', '.html', '.yaml', '.yml'].includes(path.extname(f).toLowerCase()));
  if (pret.length) {
    if (has('prettier')) run('prettier', ['--write'].concat(pret));
    else if (has('npx')) run('npx', ['--no-install', 'prettier', '--write'].concat(pret));
  }
  const py = files.filter(f => path.extname(f).toLowerCase() === '.py');
  if (py.length) { if (has('black')) run('black', ['-q'].concat(py)); else if (has('ruff')) run('ruff', ['format'].concat(py)); }
  const go = files.filter(f => path.extname(f).toLowerCase() === '.go');
  if (go.length && has('gofmt')) run('gofmt', ['-w'].concat(go));
  const rs = files.filter(f => path.extname(f).toLowerCase() === '.rs');
  if (rs.length && has('rustfmt')) run('rustfmt', rs);

  // 2) Typecheck: en tsc pr. tsconfig-rod, en mypy-runde for python.
  const notes = [];
  const tsRoots = new Set();
  files.filter(f => ['.ts', '.tsx'].includes(path.extname(f).toLowerCase()))
       .forEach(f => { const r = findUp(path.dirname(f), 'tsconfig.json'); if (r) tsRoots.add(r); });
  for (const root of tsRoots) {
    if (!has('npx')) break;
    const out = run('npx', ['--no-install', 'tsc', '--noEmit', '--pretty', 'false'], { cwd: root, stdio: 'pipe', timeout: 45000 });
    if (out.trim()) notes.push('tsc (' + path.basename(root) + '):\n' + out.split('\n').filter(Boolean).slice(0, 8).join('\n'));
  }
  if (py.length && has('mypy') && findUp(path.dirname(py[0]), 'pyproject.toml')) {
    const out = run('mypy', py, { stdio: 'pipe', timeout: 45000 });
    if (out.trim() && !/Success/.test(out)) notes.push('mypy:\n' + out.split('\n').filter(Boolean).slice(0, 8).join('\n'));
  }
  if (notes.length) process.stdout.write('# Typecheck efter dette svar (' + files.length + ' filer redigeret)\n' + notes.join('\n\n') + '\n');
} catch (e) {}
process.exit(0);
