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

  // Dagsspor til hjernens indbakke: automatisk opsamling uden brugerhandling.
  // Roerer KUN inbox/ (kvalitetsport-princippet: automatik skriver aldrig i
  // permanente sider). Dagsskifte-ritualet i CLAUDE.md hoester noterne naeste dag.
  try {
    const cfgPath = path.join(__dirname, '..', 'config.json');
    const cfg = fs.existsSync(cfgPath) ? JSON.parse(fs.readFileSync(cfgPath, 'utf8')) : {};
    const bp = cfg.brainPath;
    if (bp && fs.existsSync(path.join(bp, '00-index.md')) && topics.length) {
      const inbox = path.join(bp, 'inbox');
      fs.mkdirSync(inbox, { recursive: true });
      const day = new Date().toISOString().slice(0, 10);
      const f = path.join(inbox, day + '-claude-code-spor.md');
      if (!fs.existsSync(f)) fs.writeFileSync(f,
        '# Claude Code-spor ' + day + '\n\nAutomatisk dagsspor (session-save-hooken). ' +
        'Hoestes af dagsskifte-ritualet - flyt til inbox/arkiv/ naar behandlet.\n\n');
      const hhmm = new Date().toTimeString().slice(0, 5);
      fs.appendFileSync(f, '- ' + hhmm + ' [' + path.basename(cwd) + ']: ' + topics.join(' · ') + '\n');
    }
  } catch (_) { /* dagsspor er best-effort */ }
} catch (e) { /* aldrig blokere Stop */ }
process.exit(0);
