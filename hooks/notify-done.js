#!/usr/bin/env node
'use strict';
// Stop: giv en lokal notifikation når Claude er færdig. Best-effort, aldrig blokerende.
const { execFile } = require('child_process');
try {
  if (process.platform === 'darwin') {
    execFile('osascript', ['-e',
      'display notification "Claude er faerdig" with title "din-ai-organisation"'], () => {});
  } else if (process.platform === 'linux') {
    execFile('notify-send', ['din-ai-organisation', 'Claude er faerdig'], () => {});
  }
} catch (e) {}
process.exit(0);
