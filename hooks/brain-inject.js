#!/usr/bin/env node
'use strict';
// SessionStart: injicér company-brain'ens 00-index.md som ambient kontekst.
// Læser brain-stien fra ../config.json (skrevet af install.sh). No-op hvis usat.
const fs = require('fs'), path = require('path');
try {
  const cfgPath = path.join(__dirname, '..', 'config.json');
  const cfg = fs.existsSync(cfgPath) ? JSON.parse(fs.readFileSync(cfgPath, 'utf8')) : {};
  const bp = cfg.brainPath;
  if (!bp) process.exit(0);
  const idx = path.join(bp, '00-index.md');
  if (fs.existsSync(idx)) {
    process.stdout.write('# Company-brain er indlæst (00-index.md)\n\n' + fs.readFileSync(idx, 'utf8').trim() + '\n');
  }
} catch (e) { /* fejl må aldrig blokere sessionsstart */ }
process.exit(0);
