#!/usr/bin/env node
'use strict';
// SessionStart: injicér et LET indeks over aktive dev-kodestandarder (kun stier,
// ikke fuldt indhold), saa Claude ved de findes og kan laese den relevante on-demand.
const fs = require('fs'), path = require('path'), os = require('os');
try {
  const dir = path.join(os.homedir(), '.claude', 'rules', 'din-ai-org');
  if (!fs.existsSync(dir)) process.exit(0);
  const files = [];
  (function walk(d, rel) {
    for (const e of fs.readdirSync(d, { withFileTypes: true })) {
      const p = path.join(d, e.name), r = rel ? rel + '/' + e.name : e.name;
      if (e.isDirectory()) walk(p, r);
      else if (e.name.endsWith('.md')) files.push(r);
    }
  })(dir, '');
  if (files.length) {
    process.stdout.write('# Kodestandarder (dev-lag) i ~/.claude/rules/din-ai-org/\n' +
      'Laes den relevante regel foer du koder i det sprog:\n' +
      files.sort().map(f => '- ' + f).join('\n') + '\n');
  }
} catch (e) {}
process.exit(0);
