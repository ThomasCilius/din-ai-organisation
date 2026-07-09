> Adapted from gstack (github.com/garrytan/gstack, MIT). The portable design craft, gstack runtime stripped.

# Pretext-Native HTML Engine

Generate production-quality HTML where text actually works correctly. Not CSS
approximations. Computed layout via Pretext. Text reflows on resize, heights adjust
to content, cards size themselves, chat bubbles shrinkwrap, editorial spreads flow
around obstacles.

Pretext is a text-measurement/layout library (`@chenglou/pretext`, ~30KB, zero deps).
It measures real glyph runs so you can compute the true rendered height of any text
block at any width, then relayout cheaply on every resize. That is what makes text
"actually work" instead of guessing with CSS line-clamps and fixed heights.

---

## UX Principles: How Users Actually Behave

These principles govern how real humans interact with interfaces. They are observed
behavior, not preferences. Apply them before, during, and after every design decision.

### The Three Laws of Usability

1. **Don't make me think.** Every page should be self-evident. If a user stops
   to think "What do I click?" or "What does this mean?", the design has failed.
   Self-evident > self-explanatory > requires explanation.

2. **Clicks don't matter, thinking does.** Three mindless, unambiguous clicks
   beat one click that requires thought. Each step should feel like an obvious
   choice (animal, vegetable, or mineral), not a puzzle.

3. **Omit, then omit again.** Get rid of half the words on each page, then get
   rid of half of what's left. Happy talk (self-congratulatory text) must die.
   Instructions must die. If they need reading, the design has failed.

### How Users Actually Behave

- **Users scan, they don't read.** Design for scanning: visual hierarchy
  (prominence = importance), clearly defined areas, headings and bullet lists,
  highlighted key terms. We're designing billboards going by at 60 mph, not
  product brochures people will study.
- **Users satisfice.** They pick the first reasonable option, not the best.
  Make the right choice the most visible choice.
- **Users muddle through.** They don't figure out how things work. They wing
  it. If they accomplish their goal by accident, they won't seek the "right" way.
  Once they find something that works, no matter how badly, they stick to it.
- **Users don't read instructions.** They dive in. Guidance must be brief,
  timely, and unavoidable, or it won't be seen.

### Billboard Design for Interfaces

- **Use conventions.** Logo top-left, nav top/left, search = magnifying glass.
  Don't innovate on navigation to be clever. Innovate when you KNOW you have a
  better idea, otherwise use conventions. Even across languages and cultures,
  web conventions let people identify the logo, nav, search, and main content.
- **Visual hierarchy is everything.** Related things are visually grouped. Nested
  things are visually contained. More important = more prominent. If everything
  shouts, nothing is heard. Start with the assumption everything is visual noise,
  guilty until proven innocent.
- **Make clickable things obviously clickable.** No relying on hover states for
  discoverability, especially on mobile where hover doesn't exist. Shape, location,
  and formatting (color, underlining) must signal clickability without interaction.
- **Eliminate noise.** Three sources: too many things shouting for attention
  (shouting), things not organized logically (disorganization), and too much stuff
  (clutter). Fix noise by removal, not addition.
- **Clarity trumps consistency.** If making something significantly clearer
  requires making it slightly inconsistent, choose clarity every time.

### Navigation as Wayfinding

Users on the web have no sense of scale, direction, or location. Navigation
must always answer: What site is this? What page am I on? What are the major
sections? What are my options at this level? Where am I? How can I search?

Persistent navigation on every page. Breadcrumbs for deep hierarchies.
Current section visually indicated. The "trunk test": cover everything except
the navigation. You should still know what site this is, what page you're on,
and what the major sections are. If not, the navigation has failed.

### The Goodwill Reservoir

Users start with a reservoir of goodwill. Every friction point depletes it.

**Deplete faster:** Hiding info users want (pricing, contact, shipping). Punishing
users for not doing things your way (formatting requirements on phone numbers).
Asking for unnecessary information. Putting sizzle in their way (splash screens,
forced tours, interstitials). Unprofessional or sloppy appearance.

**Replenish:** Know what users want to do and make it obvious. Tell them what they
want to know upfront. Save them steps wherever possible. Make it easy to recover
from errors. When in doubt, apologize.

### Mobile: Same Rules, Higher Stakes

All the above applies on mobile, just more so. Real estate is scarce, but never
sacrifice usability for space savings. Affordances must be VISIBLE: no cursor
means no hover-to-discover. Touch targets must be big enough (44px minimum).
Flat design can strip away useful visual information that signals interactivity.
Prioritize ruthlessly: things needed in a hurry go close at hand, everything
else a few taps away with an obvious path to get there.

---

## Step 0: Establish the design context (mode)

Before generating anything, decide which mode you are in. The mode determines your
source of truth:

- **approved-mockup** — you have an approved image/PNG of the target screen.
  The mockup is the source of truth; pixel-match it.
- **plan-driven** — you have a written brief, spec, or plan describing the UI
  (purpose, audience, visual feel, content structure, constraints) but no image.
  The prose is the source of truth.
- **freeform** — you have only a loose description. Gather what the user wants:
  purpose/audience, visual feel (dark/light, playful/serious, dense/spacious),
  content structure (hero, features, pricing, etc.), and any reference sites they
  like. Their answers plus the refinement loop become the source of truth.
- **evolve** — a prior finalized HTML exists. Apply new changes on top, preserving
  any custom edits, rather than regenerating from scratch.

Also pick a **screen name** (e.g. `landing-page`, `dashboard`, `pricing`). One
page per invocation; for multi-page designs, run once per page.

If a `DESIGN.md` (design-token file) exists in the project root, read it. Its tokens
take priority for system-level values (brand colors, font family, spacing scale)
over anything you extract from a mockup.

---

## Step 1: Design Analysis

Produce an implementation spec before writing any HTML.

1. **If you have an approved mockup image:** analyze it directly with your vision
   capability. Extract colors (hex), typography (family + weights + sizes), layout
   structure, spacing, and a component inventory. Describe the visual layout in
   enough detail to reproduce it.

2. **If plan-driven (no image):** read the brief/plan. Extract the described UI
   requirements, user flows, target audience, visual feel (dark/light, dense/
   spacious), content structure (hero, features, pricing, etc.), and design
   constraints. Build the spec from the prose.

3. **If freeform:** ask the user the questions above, then describe the intended
   visual layout, colors, typography, and component structure as your spec.

4. **Apply `DESIGN.md` tokens last.** They override extracted values for system-level
   properties (brand colors, font family, spacing scale).

5. **Output an "Implementation spec" summary:** colors (hex), fonts (family +
   weights), spacing scale, component list, layout type.

In all non-mockup modes, generate realistic content based on the plan or user
description. Never lorem ipsum.

---

## Step 2: Smart Pretext API Routing

Classify the design into a Pretext tier. Each tier uses different Pretext APIs for
optimal results:

| Design type | Pretext APIs | Use case |
|-------------|-------------|----------|
| Simple layout (landing, marketing) | `prepare()` + `layout()` | Resize-aware heights |
| Card/grid (dashboard, listing) | `prepare()` + `layout()` | Self-sizing cards |
| Chat/messaging UI | `prepareWithSegments()` + `walkLineRanges()` | Tight-fit bubbles, min-width |
| Content-heavy (editorial, blog) | `prepareWithSegments()` + `layoutNextLine()` | Text around obstacles |
| Complex editorial | Full engine + `layoutWithLines()` | Manual line rendering |

State the chosen tier and why. Reference the specific Pretext APIs that will be used.

---

## Step 2.5: Framework Detection

Check whether the project uses a frontend framework (e.g. inspect `package.json` for
`react`, `svelte`, `vue`, `@angular/core`, `solid-js`, `preact`).

If a framework is detected, ask the user which output format they want:
- **A) Vanilla HTML** — self-contained preview file (recommended for the first pass).
- **B) Framework component** — framework-native with Pretext hooks. If chosen, ask a
  follow-up: TypeScript or JavaScript.

If no framework is detected, default to vanilla HTML with no question.

- For vanilla HTML: proceed with vanilla output.
- For framework output: proceed with framework-specific patterns.

---

## Step 3: Generate Pretext-Native HTML

### Pretext source embedding

For **vanilla HTML output**, make the file self-contained:
- Preferred: inline the Pretext bundle (`pretext.js`) directly in a `<script>` tag so
  the HTML file has zero network dependencies.
- Fallback (if you have no local bundle): import from a CDN as an ES module, e.g.
  `import { prepare, layout, prepareWithSegments, walkLineRanges, layoutNextLine, layoutWithLines } from 'https://esm.sh/@chenglou/pretext'`
  and add a comment noting it is a CDN fallback.

For **framework output**, add Pretext to the project's dependencies instead
(`npm install @chenglou/pretext`, or the bun/pnpm/yarn equivalent matching the
project's lockfile), then use standard imports in the component.

### HTML generation

Write a single self-contained file for the screen.

**Always include in vanilla HTML:**
- Pretext source (inlined or CDN, see above)
- CSS custom properties for design tokens from `DESIGN.md` / the Step 1 extraction
- Web fonts via `<link>` tags + a `document.fonts.ready` gate before the first
  `prepare()` call (measuring before fonts load gives wrong heights)
- Semantic HTML5 (`<header>`, `<nav>`, `<main>`, `<section>`, `<footer>`)
- Responsive behavior via Pretext relayout (not just media queries)
- Breakpoint-specific adjustments at 375px, 768px, 1024px, 1440px
- ARIA attributes, heading hierarchy, focus-visible states
- `contenteditable` on text elements + a `MutationObserver` to re-prepare and
  re-layout on edit
- `ResizeObserver` on containers to re-layout on resize
- `prefers-color-scheme` media query for dark mode
- `prefers-reduced-motion` for animation respect
- Real content extracted from the mockup (never lorem ipsum)

**Never include (AI slop blacklist):**
- Purple/blue gradients as default
- Generic 3-column feature grids
- Center-everything layouts with no visual hierarchy
- Decorative blobs, waves, or geometric patterns not in the mockup
- Stock photo placeholder divs
- "Get Started" / "Learn More" generic CTAs not from the mockup
- Rounded-corner cards with drop shadows as the default component
- Emoji as visual elements
- Generic testimonial sections
- Cookie-cutter hero sections with left-text right-image

### Pretext wiring patterns

Use the pattern matching the tier selected in Step 2. These are the correct Pretext
API usage patterns; follow them exactly.

**Pattern 1: Basic height computation (Simple layout, Card/grid)**
```js
import { prepare, layout } from './pretext-inline.js'
// Or if inlined: const { prepare, layout } = window.Pretext

// 1. PREPARE — one-time, after fonts load
await document.fonts.ready
const elements = document.querySelectorAll('[data-pretext]')
const prepared = new Map()

for (const el of elements) {
  const text = el.textContent
  const font = getComputedStyle(el).font
  prepared.set(el, prepare(text, font))
}

// 2. LAYOUT — cheap, call on every resize
function relayout() {
  for (const [el, handle] of prepared) {
    const { height } = layout(handle, el.clientWidth, parseFloat(getComputedStyle(el).lineHeight))
    el.style.height = `${height}px`
  }
}

// 3. RESIZE-AWARE
new ResizeObserver(() => relayout()).observe(document.body)
relayout()

// 4. CONTENT-EDITABLE — re-prepare when text changes
for (const el of elements) {
  if (el.contentEditable === 'true') {
    new MutationObserver(() => {
      const font = getComputedStyle(el).font
      prepared.set(el, prepare(el.textContent, font))
      relayout()
    }).observe(el, { characterData: true, subtree: true, childList: true })
  }
}
```

**Pattern 2: Shrinkwrap / tight-fit containers (Chat bubbles)**
```js
import { prepareWithSegments, walkLineRanges } from './pretext-inline.js'

// Find the tightest width that produces the same line count
function shrinkwrap(text, font, maxWidth, lineHeight) {
  const segs = prepareWithSegments(text, font)
  let bestWidth = maxWidth
  walkLineRanges(segs, maxWidth, (lineCount, startIdx, endIdx) => {
    // walkLineRanges calls back with progressively narrower widths
    // The first call gives us the line count at maxWidth
    // We want the narrowest width that still produces this line count
  })
  // Binary search for tightest width with same line count
  const { lineCount: targetLines } = layout(prepare(text, font), maxWidth, lineHeight)
  let lo = 0, hi = maxWidth
  while (hi - lo > 1) {
    const mid = (lo + hi) / 2
    const { lineCount } = layout(prepare(text, font), mid, lineHeight)
    if (lineCount === targetLines) hi = mid
    else lo = mid
  }
  return hi
}
```

**Pattern 3: Text around obstacles (Editorial layout)**
```js
import { prepareWithSegments, layoutNextLine } from './pretext-inline.js'

function layoutAroundObstacles(text, font, containerWidth, lineHeight, obstacles) {
  const segs = prepareWithSegments(text, font)
  let state = null
  let y = 0
  const lines = []

  while (true) {
    // Calculate available width at current y position, accounting for obstacles
    let availWidth = containerWidth
    for (const obs of obstacles) {
      if (y >= obs.top && y < obs.top + obs.height) {
        availWidth -= obs.width
      }
    }

    const result = layoutNextLine(segs, state, availWidth, lineHeight)
    if (!result) break

    lines.push({ text: result.text, width: result.width, x: 0, y })
    state = result.state
    y += lineHeight
  }

  return { lines, totalHeight: y }
}
```

**Pattern 4: Full line-by-line rendering (Complex editorial)**
```js
import { prepareWithSegments, layoutWithLines } from './pretext-inline.js'

const segs = prepareWithSegments(text, font)
const { lines, height } = layoutWithLines(segs, containerWidth, lineHeight)

// lines = [{ text, width, x, y }, ...]
// Use for Canvas/SVG rendering or custom DOM positioning
for (const line of lines) {
  const span = document.createElement('span')
  span.textContent = line.text
  span.style.position = 'absolute'
  span.style.left = `${line.x}px`
  span.style.top = `${line.y}px`
  container.appendChild(span)
}
```

### Pretext API reference

```
PRETEXT API CHEATSHEET:

prepare(text, font) → handle
  One-time text measurement. Call after document.fonts.ready.
  Font: CSS shorthand like '16px Inter' or 'bold 24px Georgia'.

layout(prepared, maxWidth, lineHeight) → { height, lineCount }
  Fast layout computation. Call on every resize. Sub-millisecond.

prepareWithSegments(text, font) → handle
  Like prepare() but enables line-level APIs below.

layoutWithLines(segs, maxWidth, lineHeight) → { lines: [{text, width, x, y}...], height }
  Full line-by-line breakdown. For Canvas/SVG rendering.

walkLineRanges(segs, maxWidth, onLine) → void
  Calls onLine(lineCount, startIdx, endIdx) for each possible layout.
  Find minimum width for N lines. For tight-fit containers.

layoutNextLine(segs, state, maxWidth, lineHeight) → { text, width, state } | null
  Iterator. Different maxWidth per line = text around obstacles.
  Pass null as initial state. Returns null when text is exhausted.

clearCache() → void
  Clears internal measurement caches. Use when cycling many fonts.

setLocale(locale?) → void
  Retargets word segmenter for future prepare() calls.
```

---

## Step 3.5: Live Reload Server

After writing the HTML file, start a simple local HTTP server for live preview:

```bash
# From the output directory
python3 -m http.server 0 --bind 127.0.0.1 &
_SERVER_PID=$!
_PORT=$(lsof -i -P -n | grep "$_SERVER_PID" | grep LISTEN | awk '{print $9}' | cut -d: -f2 | head -1)
echo "SERVER: http://localhost:$_PORT/finalized.html"
```

If `python3` is not available, fall back to opening the file directly in a browser.

Tell the user: "Live preview running at that URL. After each edit, refresh the browser
(Cmd+R) to see changes." Kill the server when the refinement loop ends.

---

## Step 4: Preview + Refinement Loop

### Verification screenshots

If you have any headless-browser screenshot capability, take verification screenshots
at three viewports and inspect them:

- mobile: width 375
- tablet: width 768
- desktop: width 1440

Check each for:
- **Text overflow** (text cut off or extending beyond containers)
- **Layout collapse** (elements overlapping or missing)
- **Responsive breakage** (content not adapting to viewport)

Fix any issues before presenting to the user. If you have no screenshot capability,
skip automated verification and say so.

### Refinement loop

```
LOOP:
  1. Tell the user to open the live preview URL (or the file directly).

  2. If an approved mockup exists, show it alongside for visual comparison.
     In plan-driven or freeform mode, skip this.

  3. Ask what needs to change. Invite the user to:
     - resize the window (text should reflow dynamically)
     - click any text (it's editable, layout recomputes instantly)
     Ask them to say "done" when satisfied.

  4. If "done" / "ship it" / "looks good" / "perfect" → exit loop, go to Step 5.

  5. Apply feedback with targeted, surgical edits on the HTML file.
     Do NOT regenerate the entire file.

  6. Give a brief summary of what changed (2-3 lines max).

  7. If verification screenshots are available, re-take them to confirm the fix.

  8. Go to LOOP.
```

Cap at ~10 iterations. If the user hasn't said "done" after 10 rounds, ask whether
to keep iterating or call it done.

---

## Step 5: Save & Next Steps

### Design token extraction

If no `DESIGN.md` exists in the project root, offer to create one from the generated
HTML so future design work stays style-consistent automatically. Extract:
- CSS custom properties (colors, spacing, font sizes)
- Font families and weights used
- Color palette (primary, secondary, accent, neutral)
- Spacing scale
- Border radius values
- Shadow values

If the user agrees, write `DESIGN.md` to the project root with these tokens.

### Save metadata (optional)

If you want a record of the run, save a small JSON sidecar alongside the HTML:
```json
{
  "source_mockup": "<approved mockup path or null>",
  "source_plan": "<plan/brief path or null>",
  "mode": "<approved-mockup|plan-driven|freeform|evolve>",
  "html_file": "<path to finalized HTML or component file>",
  "pretext_tier": "<selected tier>",
  "framework": "<vanilla|react|svelte|vue>",
  "iterations": "<number of refinement iterations>",
  "date": "<ISO 8601>",
  "screen": "<screen name>"
}
```

### Next steps

Offer the user a choice: copy the HTML/component into their codebase, keep iterating,
or treat it as a finished reference.

---

## Important Rules

- **Source-of-truth fidelity over code elegance.** When an approved mockup exists,
  pixel-match it. If that requires `width: 312px` instead of a CSS grid class, that's
  correct. In plan-driven or freeform mode, the user's feedback during the refinement
  loop is the source of truth. Code cleanup happens later during component extraction.

- **Always use Pretext for text layout.** Even if the design looks simple, Pretext
  ensures correct height computation on resize. The overhead is ~30KB. Every page
  benefits.

- **Surgical edits in the refinement loop.** Make targeted changes, not full-file
  regeneration. The user may have made manual edits via `contenteditable` that should
  be preserved.

- **Real content only.** When a mockup exists, extract text from it. In plan-driven
  mode, use content from the plan. In freeform mode, generate realistic content based
  on the user's description. Never use "Lorem ipsum", "Your text here", or placeholder
  content.

- **One page per invocation.** For multi-page designs, run once per page. Each run
  produces one HTML file.
