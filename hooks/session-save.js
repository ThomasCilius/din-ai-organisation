#!/usr/bin/env node
'use strict';
// Stop: gem et let sessions-mærke pr. mappe (tidspunkt + seneste emner) til ../sessions/.
// Rører kun pakkens egen sessions-mappe, aldrig hjernen eller brugerens filer.
const fs = require('fs'), path = require('path');
function readStdin() { try { return fs.readFileSync(0, 'utf8'); } catch (e) { return ''; } }
function slugify(p) { return (p || 'root').replace(/[^A-Za-z0-9]+/g, '-').replace(/^-|-$/g, '') || 'root'; }
try {
  const ev = JSON.parse(readStdin() || '{}');
  const cwd = ev.cwd || process.cwd();
  const sessionsDir = path.join(__dirname, '..', 'sessions');
  fs.mkdirSync(sessionsDir, { recursive: true });

  // Seneste brugeremner fra transskriptet (defensivt, degraderer pænt).
  let topics = [];
  try {
    const tp = ev.transcript_path;
    if (tp && fs.existsSync(tp)) {
      for (const line of fs.readFileSync(tp, 'utf8').split('\n')) {
        if (!line) continue;
        try {
          const o = JSON.parse(line);
          const msg = o.message || o;
          if (o.type === 'user' || msg.role === 'user') {
            let t = msg.content;
            if (Array.isArray(t)) t = t.map(x => (x && x.text) || '').join(' ');
            if (typeof t === 'string') { t = t.trim(); if (t && !t.startsWith('<')) topics.push(t.slice(0, 120)); }
          }
        } catch (_) { /* spring ulæselige linjer over */ }
      }
    }
  } catch (_) {}
  topics = topics.slice(-3);

  const when = new Date().toISOString().slice(0, 16).replace('T', ' ');
  fs.writeFileSync(path.join(sessionsDir, slugify(cwd) + '.json'),
    JSON.stringify({ when, cwd, topics }, null, 2));
} catch (e) { /* aldrig blokere Stop */ }
process.exit(0);
