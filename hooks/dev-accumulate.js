#!/usr/bin/env node
'use strict';
// PostToolUse (Write|Edit), DEV-lag: registrér blot den redigerede filsti til
// batch-behandling ved Stop (dev-batch.js). Accumulate + batch er hurtigere og
// mere stoejfrit end formatter/typecheck pr. edit (moenster fra ECC, MIT).
const fs = require('fs'), path = require('path'), os = require('os');
try {
  const ev = JSON.parse(fs.readFileSync(0, 'utf8') || '{}');
  const fp = (ev.tool_input && (ev.tool_input.file_path || ev.tool_input.path)) || '';
  if (!fp) process.exit(0);
  const sid = (ev.session_id || 'nosession').replace(/[^a-z0-9-]/gi, '');
  fs.appendFileSync(path.join(os.tmpdir(), 'din-ai-edited-' + sid + '.txt'), fp + '\n');
} catch (e) {}
process.exit(0);
