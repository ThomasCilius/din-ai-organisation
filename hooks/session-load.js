#!/usr/bin/env node
'use strict';
// SessionStart: injicér "hvor vi slap" for den aktuelle mappe (fra ../sessions/).
const fs = require('fs'), path = require('path');
function readStdin() { try { return fs.readFileSync(0, 'utf8'); } catch (e) { return ''; } }
function slugify(p) { return (p || 'root').replace(/[^A-Za-z0-9]+/g, '-').replace(/^-|-$/g, '') || 'root'; }
try {
  const ev = JSON.parse(readStdin() || '{}');
  const cwd = ev.cwd || process.cwd();
  const f = path.join(__dirname, '..', 'sessions', slugify(cwd) + '.json');
  if (fs.existsSync(f)) {
    const r = JSON.parse(fs.readFileSync(f, 'utf8'));
    let out = '# Hvor vi slap (denne mappe)\nSidst aktiv: ' + r.when + '\n';
    if (r.topics && r.topics.length) out += 'Seneste emner:\n' + r.topics.map(t => '- ' + t).join('\n') + '\n';
    process.stdout.write(out);
  }
} catch (e) { /* aldrig blokere sessionsstart */ }
process.exit(0);
