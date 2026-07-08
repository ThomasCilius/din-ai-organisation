#!/usr/bin/env python3
"""Generer index.html (GitHub Pages) fra de faktiske SKILL.md-filer."""
import glob, os, re, html

ROOT = "/Users/thomasciliushansen/Desktop/01 Projekter/thomascilius.dk/AI Academy/Claude Desktop 0-100/din-ai-organisation"
REPO = "https://github.com/ThomasCilius/din-ai-organisation"
DOMAIN = "skills.thomascilius.dk"
CC_ONELINER = ("Installer Claude Agent Skills fra dette repo i min skills-mappe: " + REPO +
  " - klon repoet, vis mig de 10 afdelinger, og kopiér de skill-mapper jeg vælger ind i ~/.claude/skills/ "
  "(foreslå kernen først: 03-viden-og-data + 01-direktionen).")
GIT_BLOCK = ("git clone " + REPO + ".git\n"
  "mkdir -p ~/.claude/skills\n"
  "cp -r din-ai-organisation/03-viden-og-data/*  ~/.claude/skills/\n"
  "cp -r din-ai-organisation/01-direktionen/*    ~/.claude/skills/")

DEPTS = [
    ("01-direktionen",        "Direktionen",            "Beslutninger & kontrakter", "direktion"),
    ("02-strategiudvikling",  "Strategiudvikling",      "Retning, kadence, årshjul",  "direktion"),
    ("03-viden-og-data",      "Viden & Data",           "Virksomhedens hjerne · stab", "stab"),
    ("04-programledelse",     "Programledelse",         "Styringsrygraden · stab",     "stab"),
    ("05-sekretariatet",      "Sekretariatet",          "Mail, møder, ugens rytme",    "afd"),
    ("06-salg-og-kundeservice","Salg & Kundeservice",   "Tilbud, leads, kunder",       "afd"),
    ("07-marketing",          "Marketing & Kommunikation","Tone, indhold, kampagner",  "afd"),
    ("08-okonomi",            "Økonomi",                "Bilag, likviditet, priser",   "afd"),
    ("09-hr",                 "HR",                     "People & Culture + skill-byg", "afd"),
    ("10-it-og-udvikling",    "IT & Udvikling",         "Design & byg · dirigent",     "afd"),
]

def parse_fm(txt):
    m = re.match(r'^---\n(.*?)\n---', txt, re.S)
    if not m: return {}
    fm = m.group(1)
    dm = re.search(r'^description:\s*(.*)$', fm, re.M)
    nm = re.search(r'^name:\s*(.*)$', fm, re.M)
    name = nm.group(1).strip() if nm else ''
    desc = ''
    if dm:
        v = dm.group(1).strip()
        if v[:1] in '"\'' and v[-1:] == v[0]:
            v = v[1:-1]
        desc = v
    return {"name": name, "desc": desc}

def purpose_of(desc):
    cut = re.split(r'\bBrug den\b|\bBrug til\b|\bBrug \b', desc, maxsplit=1)[0].strip()
    if not cut:
        cut = desc.split('.')[0]
    cut = cut.rstrip(' -–—')
    if cut and not cut.endswith('.'):
        cut += '.'
    return cut

def triggers_of(desc):
    head = re.split(r"Brug IKKE|paa engelsk|på engelsk|- eller paa engelsk|- eller på engelsk", desc)[0]
    phrases = re.findall(r"'([^']{2,60})'", head)
    seen, out = set(), []
    for p in phrases:
        pl = p.lower()
        if pl not in seen:
            seen.add(pl); out.append(p)
    return out[:6]

data = []
for folder, label, tag, tier in DEPTS:
    skills = []
    for f in sorted(glob.glob(os.path.join(ROOT, folder, "*", "SKILL.md"))):
        fm = parse_fm(open(f).read())
        nm = fm.get("name") or os.path.basename(os.path.dirname(f))
        skills.append({"name": nm, "purpose": purpose_of(fm.get("desc","")), "triggers": triggers_of(fm.get("desc",""))})
    data.append({"folder": folder, "label": label, "tag": tag, "tier": tier, "skills": skills})

total = sum(len(d["skills"]) for d in data)
BRAIN_PROMPT = ''
try:
    BRAIN_PROMPT = open(os.path.join(ROOT, "company-brain-prompt.txt")).read().rstrip()
except FileNotFoundError:
    pass
def esc(s): return html.escape(s, quote=True)

def copyblock(pid, content, cls=''):
    return ('<div class="codewrap"><pre class="cmd ' + cls + '" id="' + pid + '">' + esc(content) + '</pre>'
      '<button class="copy-icon" data-copy="' + pid + '" data-tip="Kopiér" aria-label="Kopiér" type="button">'
      '<svg class="i-copy" viewBox="0 0 24 24" aria-hidden="true">'
      '<rect width="14" height="14" x="8" y="8" rx="2" ry="2"/>'
      '<path d="M4 16c-1.1 0-2-.9-2-2V4c0-1.1.9-2 2-2h10c1.1 0 2 .9 2 2"/></svg>'
      '<svg class="i-check" viewBox="0 0 24 24" aria-hidden="true"><path d="M20 6 9 17l-5-5"/></svg>'
      '</button></div>')

def dept_box(d, i):
    return f'''<button class="node node--{d['tier']}" data-target="dep-{i}" type="button">
      <span class="node__label">{esc(d['label'])}</span>
      <span class="node__tag">{esc(d['tag'])}</span>
      <span class="node__count">{len(d['skills'])} skills</span>
    </button>'''

direktion = [ (i,d) for i,d in enumerate(data) if d['tier']=='direktion' ]
stab      = [ (i,d) for i,d in enumerate(data) if d['tier']=='stab' ]
afd       = [ (i,d) for i,d in enumerate(data) if d['tier']=='afd' ]

chart = f'''
<div class="chart">
  <div class="chart__tier chart__tier--top">
    {''.join(dept_box(d,i) for i,d in direktion)}
  </div>
  <div class="chart__spine"></div>
  <div class="chart__tier chart__tier--stab">
    {''.join(dept_box(d,i) for i,d in stab)}
  </div>
  <div class="chart__spine"></div>
  <div class="chart__tier chart__tier--afd">
    {''.join(dept_box(d,i) for i,d in afd)}
  </div>
</div>'''

def skill_card(s):
    trig = ''
    if s['triggers']:
        chips = ''.join(f'<span class="chip">{esc(t)}</span>' for t in s['triggers'])
        trig = f'<div class="card__triggers">{chips}</div>'
    return f'''<article class="card" data-text="{esc((s['name']+' '+s['purpose']+' '+' '.join(s['triggers'])).lower())}">
      <h3 class="card__name">{esc(s['name'])}</h3>
      <p class="card__purpose">{esc(s['purpose'])}</p>
      {trig}
    </article>'''

sections = []
for i,d in enumerate(data):
    cards = ''.join(skill_card(s) for s in d['skills'])
    sections.append(f'''<section class="dep" id="dep-{i}" data-folder="{esc(d['folder'])}">
      <header class="dep__head">
        <span class="dep__num">{d['folder'].split('-')[0]}</span>
        <div>
          <h2 class="dep__title">{esc(d['label'])}</h2>
          <p class="dep__tag">{esc(d['tag'])} · {len(d['skills'])} skills</p>
        </div>
        <a class="dep__zip" href="releases/{d['folder']}.zip" download>⬇ Zip</a>
      </header>
      <div class="grid">{cards}</div>
    </section>''')

HTML = f'''<!doctype html>
<html lang="da">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Din AI-organisation · {total} skills til danske SMV'er</title>
<meta name="description" content="Et kurateret sæt Agent Skills til Claude, bygget som et dansk organisationsdiagram: {total} skills fordelt på 10 afdelinger. Fra AI Academy · Claude 0-100.">
<style>
:root{{
  --bg:#f6f3ee; --surface:#fffdf9; --ink:#211d17; --muted:#6b6459;
  --line:#e4ddd1; --accent:#b9762a; --accent-soft:#f0e2cd; --accent-ink:#7a4a13;
  --stab:#3f6b63; --stab-soft:#e0ece9; --afd-line:#d8cfc0; --code-bg:#2b2117; --code-ink:#f3e7d4;
  --radius:14px; --maxw:1120px;
  --font:-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,Helvetica,Arial,sans-serif;
  --serif:"Iowan Old Style","Palatino Linotype",Palatino,Georgia,serif;
  --mono:ui-monospace,SFMono-Regular,Menlo,Consolas,monospace;
}}
@media (prefers-color-scheme:dark){{
  :root{{ --bg:#17140f; --surface:#211c15; --ink:#f0ebe1; --muted:#a89e8d;
    --line:#332c22; --accent:#e0973f; --accent-soft:#3a2c17; --accent-ink:#f0c184;
    --stab:#6fb3a6; --stab-soft:#1e2e2a; --afd-line:#3a3227; --code-bg:#0f0c08; --code-ink:#e9dcc6; }}
}}
:root[data-theme=dark]{{ --bg:#17140f; --surface:#211c15; --ink:#f0ebe1; --muted:#a89e8d;
  --line:#332c22; --accent:#e0973f; --accent-soft:#3a2c17; --accent-ink:#f0c184;
  --stab:#6fb3a6; --stab-soft:#1e2e2a; --afd-line:#3a3227; --code-bg:#0f0c08; --code-ink:#e9dcc6; }}
:root[data-theme=light]{{ --bg:#f6f3ee; --surface:#fffdf9; --ink:#211d17; --muted:#6b6459;
  --line:#e4ddd1; --accent:#b9762a; --accent-soft:#f0e2cd; --accent-ink:#7a4a13;
  --stab:#3f6b63; --stab-soft:#e0ece9; --afd-line:#d8cfc0; --code-bg:#2b2117; --code-ink:#f3e7d4; }}
*{{box-sizing:border-box}}
body{{margin:0;background:var(--bg);color:var(--ink);font-family:var(--font);line-height:1.55;
  -webkit-font-smoothing:antialiased;overflow-x:hidden}}
a{{color:var(--accent-ink);text-underline-offset:3px}}
.wrap{{max-width:var(--maxw);margin:0 auto;padding:0 clamp(16px,4vw,40px)}}
.topbar{{position:sticky;top:0;z-index:50;background:color-mix(in srgb,var(--bg) 88%,transparent);
  backdrop-filter:blur(10px);border-bottom:1px solid var(--line)}}
.topbar__in{{display:flex;align-items:center;gap:16px;padding:12px clamp(16px,4vw,40px);max-width:var(--maxw);margin:0 auto}}
.brand{{font-weight:700;letter-spacing:-.01em;margin-right:auto;font-size:15px}}
.brand b{{color:var(--accent-ink)}}
.search{{flex:1;max-width:340px;padding:9px 13px;border:1px solid var(--line);border-radius:999px;
  background:var(--surface);color:var(--ink);font-size:14px;font-family:inherit}}
.search:focus{{outline:2px solid var(--accent);outline-offset:1px}}
.themebtn{{border:1px solid var(--line);background:var(--surface);color:var(--ink);border-radius:999px;
  width:38px;height:38px;font-size:16px;cursor:pointer;flex:none}}
.hero{{padding:clamp(48px,8vw,92px) 0 clamp(24px,4vw,40px)}}
.eyebrow{{font-size:13px;letter-spacing:.16em;text-transform:uppercase;color:var(--accent-ink);font-weight:600;margin:0 0 14px}}
.hero h1{{font-family:var(--serif);font-weight:600;letter-spacing:-.02em;line-height:1.02;
  font-size:clamp(2.6rem,6vw,5rem);margin:0 0 18px}}
.hero p.lead{{font-size:clamp(1.05rem,1.6vw,1.3rem);color:var(--muted);max-width:46ch;margin:0 0 26px}}
.stats{{display:flex;gap:34px;flex-wrap:wrap;margin-bottom:28px}}
.stat b{{font-family:var(--serif);font-size:2rem;display:block;line-height:1;color:var(--accent-ink)}}
.stat span{{font-size:13px;color:var(--muted)}}
.btnrow{{display:flex;gap:12px;flex-wrap:wrap}}
.btn{{display:inline-flex;align-items:center;gap:9px;padding:12px 20px;border-radius:999px;font-size:15px;
  font-weight:600;text-decoration:none;border:1px solid var(--line);background:var(--surface);color:var(--ink);
  transition:transform .14s ease,border-color .14s ease}}
.btn:hover{{transform:translateY(-2px);border-color:var(--accent)}}
.btn--primary{{background:var(--accent);border-color:var(--accent);color:#fff}}
.btn--primary:hover{{border-color:var(--accent)}}
.btn svg{{width:18px;height:18px;fill:currentColor}}
.section-label{{font-size:13px;letter-spacing:.14em;text-transform:uppercase;color:var(--muted);
  font-weight:600;margin:0 0 20px;padding-top:10px;border-top:1px solid var(--line)}}
.chart{{display:flex;flex-direction:column;align-items:center;gap:0;margin:0 0 20px}}
.chart__tier{{display:flex;gap:16px;flex-wrap:wrap;justify-content:center;width:100%}}
.chart__spine{{width:2px;height:26px;background:var(--afd-line)}}
.node{{position:relative;flex:1 1 200px;max-width:280px;min-width:170px;text-align:left;cursor:pointer;
  background:var(--surface);border:1px solid var(--line);border-radius:var(--radius);
  padding:16px 18px;display:flex;flex-direction:column;gap:3px;font-family:inherit;
  transition:transform .14s ease,border-color .14s ease,box-shadow .14s ease}}
.node:hover{{transform:translateY(-3px);border-color:var(--accent);box-shadow:0 8px 24px -14px rgba(0,0,0,.4)}}
.node:focus-visible{{outline:2px solid var(--accent);outline-offset:2px}}
.node--direktion{{border-top:3px solid var(--accent)}}
.node--stab{{border-top:3px solid var(--stab)}}
.node--afd{{flex:1 1 150px;min-width:150px;padding:13px 15px}}
.node__label{{font-weight:700;letter-spacing:-.01em;font-size:15px}}
.node__tag{{font-size:12.5px;color:var(--muted)}}
.node__count{{font-size:11.5px;color:var(--accent-ink);font-weight:600;margin-top:4px;text-transform:uppercase;letter-spacing:.05em}}
.node--stab .node__count{{color:var(--stab)}}
.notes{{display:grid;grid-template-columns:repeat(auto-fit,minmax(240px,1fr));gap:16px;margin:8px 0}}
.note{{background:var(--surface);border:1px solid var(--line);border-radius:var(--radius);padding:18px 20px}}
.note h4{{margin:0 0 6px;font-size:14px;letter-spacing:-.01em}}
.note p{{margin:0;font-size:13.5px;color:var(--muted)}}
.note code,.inline{{background:var(--accent-soft);color:var(--accent-ink);padding:1px 6px;border-radius:6px;font-size:12.5px;font-family:var(--mono)}}
/* install */
.install{{margin:12px 0 8px}}
.install__cols{{display:grid;grid-template-columns:repeat(auto-fit,minmax(300px,1fr));gap:16px}}
.icard{{background:var(--surface);border:1px solid var(--line);border-radius:var(--radius);padding:22px 22px}}
.icard h3{{margin:0 0 4px;font-size:17px;letter-spacing:-.01em}}
.icard .sub{{margin:0 0 16px;color:var(--muted);font-size:13.5px}}
.step{{display:flex;gap:11px;margin:0 0 12px;font-size:14px}}
.step>b{{flex:none;width:22px;height:22px;border-radius:50%;background:var(--accent-soft);color:var(--accent-ink);
  font-size:12px;display:flex;align-items:center;justify-content:center;font-weight:700;margin-top:1px}}
.step>div b{{font-weight:700}}
pre.cmd{{background:var(--code-bg);color:var(--code-ink);border-radius:10px;padding:13px 15px;margin:6px 0 0;
  overflow-x:auto;font-family:var(--mono);font-size:12.5px;line-height:1.7}}
pre.cmd .c{{color:#9db98f}}
pre.brain{{max-height:360px;overflow:auto;margin-top:12px;font-size:12px;line-height:1.55}}
pre.cmd.wrapline{{white-space:pre-wrap;word-break:break-word}}
.brainbar{{display:flex;align-items:center;gap:12px;flex-wrap:wrap}}
.codewrap{{position:relative}}
.codewrap pre.cmd{{padding-right:46px}}
.copy-icon{{position:absolute;top:8px;right:8px;width:30px;height:30px;display:inline-flex;align-items:center;
  justify-content:center;border:1px solid var(--line);border-radius:8px;background:var(--surface);color:var(--muted);
  cursor:pointer;transition:color .12s ease,border-color .12s ease}}
.copy-icon:hover{{color:var(--accent-ink);border-color:var(--accent)}}
.copy-icon:focus-visible{{outline:2px solid var(--accent);outline-offset:2px}}
.copy-icon svg{{width:15px;height:15px;fill:none;stroke:currentColor;stroke-width:2;stroke-linecap:round;stroke-linejoin:round}}
.copy-icon .i-check{{display:none}}
.copy-icon.copied{{color:#2f8f4e;border-color:#2f8f4e}}
.copy-icon.copied .i-copy{{display:none}}
.copy-icon.copied .i-check{{display:block}}
.copy-icon::after{{content:attr(data-tip);position:absolute;bottom:calc(100% + 6px);right:0;background:var(--ink);
  color:var(--bg);font-size:11px;font-weight:600;padding:3px 7px;border-radius:6px;white-space:nowrap;
  opacity:0;pointer-events:none;transition:opacity .12s ease}}
.copy-icon:hover::after,.copy-icon:focus-visible::after{{opacity:1}}
.dep{{padding:40px 0 8px;scroll-margin-top:76px}}
.dep__head{{display:flex;align-items:center;gap:16px;margin:0 0 22px}}
.dep__num{{font-family:var(--serif);font-size:2.1rem;color:var(--accent);font-weight:600;
  border:1px solid var(--line);border-radius:12px;width:58px;height:58px;display:flex;
  align-items:center;justify-content:center;flex:none;background:var(--surface)}}
.dep__title{{margin:0;font-family:var(--serif);font-weight:600;font-size:clamp(1.5rem,3vw,2.1rem);letter-spacing:-.01em}}
.dep__tag{{margin:2px 0 0;color:var(--muted);font-size:14px}}
.dep__zip{{margin-left:auto;flex:none;align-self:center;font-size:13px;font-weight:600;text-decoration:none;
  border:1px solid var(--line);border-radius:999px;padding:7px 14px;color:var(--accent-ink);background:var(--surface);
  transition:border-color .14s ease,transform .14s ease}}
.dep__zip:hover{{border-color:var(--accent);transform:translateY(-2px)}}
.grid{{display:grid;grid-template-columns:repeat(auto-fill,minmax(260px,1fr));gap:14px}}
.card{{background:var(--surface);border:1px solid var(--line);border-radius:var(--radius);padding:17px 18px;
  transition:border-color .14s ease,transform .14s ease}}
.card:hover{{border-color:var(--accent);transform:translateY(-2px)}}
.card__name{{margin:0 0 6px;font-size:15px;font-weight:700;letter-spacing:-.01em;font-family:var(--mono);color:var(--accent-ink)}}
.card__purpose{{margin:0;font-size:14px;color:var(--ink)}}
.card__triggers{{margin-top:11px;display:flex;flex-wrap:wrap;gap:6px}}
.chip{{font-size:11.5px;color:var(--muted);background:var(--bg);border:1px solid var(--line);border-radius:999px;padding:3px 9px}}
.dep.dim,.card.hide{{display:none}}
.noresult{{color:var(--muted);padding:30px 0;font-size:15px}}
footer{{border-top:1px solid var(--line);margin-top:60px;padding:34px 0;color:var(--muted);font-size:13.5px}}
footer a{{color:var(--accent-ink)}}
@media (max-width:560px){{
  .chart__tier{{flex-direction:column;align-items:stretch}}
  .node,.node--afd{{max-width:none}}
  .stats{{gap:22px}}
}}
</style>
</head>
<body>
<div class="topbar"><div class="topbar__in">
  <span class="brand">Din <b>AI-organisation</b></span>
  <input id="q" class="search" type="search" placeholder="Søg i {total} skills…" aria-label="Søg i skills">
  <button id="theme" class="themebtn" type="button" aria-label="Skift lyst/mørkt tema">◐</button>
</div></div>

<header class="hero"><div class="wrap">
  <p class="eyebrow">AI Academy · Claude 0-100</p>
  <h1>Byg din virksomhed<br>som et AI-hold</h1>
  <p class="lead">Et kurateret sæt Agent Skills til Claude, skåret efter et klassisk dansk organisationsdiagram. Hver afdeling er et hold AI-medarbejdere · hver skill er én afgrænset, tilbagevendende opgave.</p>
  <div class="stats">
    <span class="stat"><b>{total}</b><span>skills</span></span>
    <span class="stat"><b>10</b><span>afdelinger</span></span>
    <span class="stat"><b>DK</b><span>jobvalideret</span></span>
  </div>
  <div class="btnrow">
    <a class="btn btn--primary" href="#brain">Byg din company brain</a>
    <a class="btn" href="#install">Installér skills</a>
    <a class="btn" href="{REPO}" target="_blank" rel="noopener">
      <svg viewBox="0 0 16 16" aria-hidden="true"><path d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.01 8.01 0 0 0 16 8c0-4.42-3.58-8-8-8z"/></svg>
      Se på GitHub
    </a>
  </div>
</div></header>

<main class="wrap">
  <p class="section-label">Organisationsdiagrammet — klik en afdeling</p>
  {chart}

  <div class="notes">
    <div class="note"><h4>Én hjerne, mange forbrugere</h4><p>Alle skills læser <code>virksomhedsprofil.md</code>, <code>voice-profil.md</code> og <code>designprofil.md</code> først — konteksten gives én gang.</p></div>
    <div class="note"><h4>Aldrig-regler er en del af formatet</h4><p>Altid kladde · sender, sletter og bogfører aldrig selv · plan før filhandlinger · citér kilden · AI anbefaler, mennesket beslutter.</p></div>
    <div class="note"><h4>Artefakt-kæder</h4><p>Hver skill efterlader et navngivet artefakt, som den næste læser — det er dét, der gør {total} løse skills til én organisation.</p></div>
    <div class="note"><h4>Modulær installation</h4><p>Start med kernen (<code>03 Viden &amp; Data</code> + <code>01 Direktionen</code>), og vælg de afdelinger, din rolle bruger.</p></div>
  </div>

  <section class="install" id="brain">
    <p class="section-label" style="margin-top:34px">Trin 0 — byg din company brain</p>
    <div class="install__cols" style="grid-template-columns:1.05fr 1fr">
      <div class="icard">
        <h3>Fundamentet: byg hjernen først</h3>
        <p class="sub">En AI-organisation uden en hjerne svarer i blinde. Byg hjernen → installér skills → skillene arbejder oven på den.</p>
        <div class="step"><b>1</b><div>Åbn en ny <span class="inline">Cowork</span>-samtale i Claude Desktop med adgang til en <b>tom mappe</b> (fx <span class="inline">company-brain/</span>).</div></div>
        <div class="step"><b>2</b><div>Kopiér hele prompten til højre ind. Claude interviewer dig og bygger hjernen fase for fase (0-6).</div></div>
        <div class="step"><b>3</b><div>Medbring <b>3-5 dokumenter</b> til seedingen - en tom hjerne giver tomme svar.</div></div>
        <div class="step"><b>4</b><div>Pakkens hub-filer (<span class="inline">virksomhedsprofil.md</span>, <span class="inline">voice-profil.md</span>) bor i hjernen - alle skills læser dem derfra.</div></div>
        <p style="margin:16px 0 0"><a class="btn" href="company-brain-bootstrap.md">Læs guiden &amp; facilitator-noter</a></p>
      </div>
      <div class="icard">
        <div class="brainbar">
          <h3 style="margin:0">Prompten</h3>
          <a class="dep__zip" href="company-brain-prompt.txt" download style="margin-left:auto">⬇ Download .txt</a>
        </div>
        <p class="sub" style="margin-top:8px">Kopiér alt nedenfor (ikonet øverst til højre) ind i den tomme Cowork-mappe.</p>
        {copyblock("brainprompt", BRAIN_PROMPT, "brain")}
      </div>
    </div>
  </section>

  <section class="install" id="install">
    <p class="section-label" style="margin-top:34px">Installér skills — <a href="{REPO}" target="_blank" rel="noopener">{REPO.replace('https://','')}</a></p>
    <div class="install__cols">
      <div class="icard">
        <h3>Claude Code</h3>
        <p class="sub">Nemmest: giv Claude Code repoets URL og bed den installere — så klarer den klon og kopiering for dig.</p>
        <p style="font-weight:600;font-size:13.5px;margin:0 0 4px">Indsæt i Claude Code</p>
        {copyblock("ccprompt", CC_ONELINER, "wrapline")}
        <p class="sub" style="margin-top:18px">Eller klon manuelt og kopiér kernen ind:</p>
        {copyblock("ccmanual", GIT_BLOCK)}
        <p class="sub" style="margin-top:10px">Skillene trigger automatisk på danske og engelske sætninger. Læg dem evt. i projektets egen <span class="inline">.claude/skills/</span>.</p>
      </div>
      <div class="icard">
        <h3>Claude Desktop</h3>
        <p class="sub">Upload én skill-mappe ad gangen som .zip.</p>
        <div class="step"><b>1</b><div>Hent repoet: grøn <span class="inline">Code</span>-knap på GitHub → <span class="inline">Download ZIP</span> (eller klon som ovenfor).</div></div>
        <div class="step"><b>2</b><div>Pak den enkelte skill-mappe (den med <span class="inline">SKILL.md</span> i) som en <span class="inline">.zip</span> — fx <span class="inline">virksomhedsprofil/</span>.</div></div>
        <div class="step"><b>3</b><div>I Claude Desktop: <span class="inline">Settings → Capabilities → Skills → Upload skill</span>, og vælg zip-filen. Gentag pr. skill.</div></div>
        <div class="step"><b>4</b><div>Start altid med <span class="inline">virksomhedsprofil</span> — den bygger hub-filen, alle andre skills læser.</div></div>
      </div>
    </div>
    <p class="sub" style="margin-top:14px">Vil du hente en <b>hel afdeling</b>? Brug <span class="inline">⬇ Zip</span>-knappen ved hver afdeling nedenfor — pak ud i <span class="inline">~/.claude/skills/</span> (Claude Code), eller træk de enkelte skill-mapper ud til Desktop-upload.</p>
  </section>

  <p class="section-label" style="margin-top:34px">Alle afdelinger &amp; skills</p>
  <div id="deps">
    {''.join(sections)}
  </div>
  <p id="noresult" class="noresult" hidden>Ingen skills matcher søgningen.</p>
</main>

<footer><div class="wrap">
  <strong>Din AI-organisation</strong> · {total} Agent Skills · bygget til kurset <b>Claude 0-100</b>, AI Academy hos thomascilius.dk.<br>
  Kode og skills: <a href="{REPO}" target="_blank" rel="noopener">{REPO.replace('https://','')}</a> · <a href="{REPO}/blob/main/README.md" target="_blank" rel="noopener">README &amp; installationsguide</a>
</div></footer>

<script>
(function(){{
  var root=document.documentElement, tb=document.getElementById('theme');
  function set(t){{root.setAttribute('data-theme',t);try{{localStorage.setItem('tc-theme',t)}}catch(e){{}}}}
  try{{var s=localStorage.getItem('tc-theme');if(s)set(s);}}catch(e){{}}
  tb.addEventListener('click',function(){{
    var cur=root.getAttribute('data-theme');
    if(!cur){{cur=matchMedia('(prefers-color-scheme:dark)').matches?'dark':'light';}}
    set(cur==='dark'?'light':'dark');
  }});
  document.querySelectorAll('.node').forEach(function(n){{
    n.addEventListener('click',function(){{
      var el=document.getElementById(n.dataset.target);
      if(el)el.scrollIntoView({{behavior:'smooth',block:'start'}});
    }});
  }});
  document.querySelectorAll('.copy-icon').forEach(function(cb){{
    cb.addEventListener('click',function(){{
      var el=document.getElementById(cb.dataset.copy); if(!el)return;
      var t=el.textContent;
      function ok(){{cb.classList.add('copied');cb.setAttribute('data-tip','Kopieret');
        setTimeout(function(){{cb.classList.remove('copied');cb.setAttribute('data-tip','Kopiér');}},1600);}}
      if(navigator.clipboard&&navigator.clipboard.writeText){{navigator.clipboard.writeText(t).then(ok,function(){{}});}}
      else{{var r=document.createRange();r.selectNode(el);var s=getSelection();s.removeAllRanges();s.addRange(r);
        try{{document.execCommand('copy');ok();}}catch(e){{}}s.removeAllRanges();}}
    }});
  }});
  var q=document.getElementById('q'), deps=document.querySelectorAll('.dep'),
      cards=document.querySelectorAll('.card'), nores=document.getElementById('noresult');
  q.addEventListener('input',function(){{
    var v=q.value.trim().toLowerCase(), any=false;
    cards.forEach(function(c){{
      var hit=!v||c.dataset.text.indexOf(v)>-1;
      c.classList.toggle('hide',!hit); if(hit)any=true;
    }});
    deps.forEach(function(d){{
      var vis=d.querySelectorAll('.card:not(.hide)').length;
      d.classList.toggle('dim',v&&vis===0);
    }});
    nores.hidden=any||!v;
  }});
}})();
</script>
</body>
</html>'''

open(os.path.join(ROOT, "index.html"), "w").write(HTML)
open(os.path.join(ROOT, ".nojekyll"), "w").write("")
open(os.path.join(ROOT, "CNAME"), "w").write(DOMAIN + "\n")
print(f"WROTE index.html ({len(HTML)} bytes) + .nojekyll + CNAME ({DOMAIN})")
print(f"Skills i alt: {total}")
