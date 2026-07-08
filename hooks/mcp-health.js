#!/usr/bin/env node
'use strict';
// SessionStart: let connector-vagt. Laeser konfigurerede MCP-servere og flager dem,
// der ikke svarer (typisk et tabt login). Kort timeout, aldrig blokerende.
const fs = require('fs'), os = require('os'), path = require('path'), https = require('https'), http = require('http');
function readCfg(p) { try { return JSON.parse(fs.readFileSync(p, 'utf8')); } catch (e) { return null; } }
function collectServers() {
  const servers = {};
  const g = readCfg(path.join(os.homedir(), '.claude.json'));
  if (g && g.mcpServers) Object.assign(servers, g.mcpServers);
  const pj = readCfg(path.join(process.cwd(), '.mcp.json'));
  if (pj && pj.mcpServers) Object.assign(servers, pj.mcpServers);
  return servers;
}
function checkUrl(url) {
  return new Promise(res => {
    try {
      const lib = url.startsWith('https') ? https : http;
      const req = lib.request(url, { method: 'HEAD', timeout: 2500 }, r => {
        res({ ok: r.statusCode < 500 && r.statusCode !== 401 && r.statusCode !== 403, code: r.statusCode });
      });
      req.on('error', () => res({ ok: false, code: 'ingen forbindelse' }));
      req.on('timeout', () => { req.destroy(); res({ ok: false, code: 'timeout' }); });
      req.end();
    } catch (e) { res({ ok: false, code: 'fejl' }); }
  });
}
(async () => {
  try {
    const servers = collectServers();
    const names = Object.keys(servers);
    if (!names.length) process.exit(0);
    const problems = [];
    for (const n of names) {
      const s = servers[n] || {};
      const url = s.url || s.serverUrl;
      if (url) {
        const r = await checkUrl(url);
        if (!r.ok) problems.push(`${n} (${r.code})`);
      } else if (s.command) {
        const { spawnSync } = require('child_process');
        const w = spawnSync('command', ['-v', s.command], { shell: true });
        if (w.status !== 0) problems.push(`${n} (kommando '${s.command}' ikke fundet)`);
      }
    }
    if (problems.length) {
      process.stdout.write('# Connector-tjek: nogle forbindelser svarer ikke\n' +
        problems.map(p => '- ' + p).join('\n') +
        '\nTjek login eller forbindelse i Claude, hvis du skal bruge dem.\n');
    }
  } catch (e) {}
  process.exit(0);
})();
