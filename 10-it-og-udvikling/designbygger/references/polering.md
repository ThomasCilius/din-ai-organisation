> Adapted from ECC (github.com/affaan-m/ECC, MIT). The portable design-engineering craft, ECC runtime stripped - every pattern works in plain HTML/CSS and in React.

# Polish: Why Interfaces Feel Finished

This is the layer between the design profile (direction) and production (the built page). The design profile decides WHAT the design is; this document explains WHY a built surface feels polished or unfinished. Polish is not decoration. It is the accumulation of small physical correctnesses: radii that nest, targets that hit, states that exist, text that never jitters, shadows that behave like light. Users cannot name these details, but they can feel their absence instantly.

Read this before the final pass on any built design, and use the checklist at the end as a gate.

---

## 1. Concentric Radius

When a rounded element sits inside another rounded element, the corners must be concentric, or the inner corner visually collides with the outer one.

**The formula:**

```text
outer radius = inner radius + padding
```

```css
.card {
  --radius-inner: 8px;
  --padding: 12px;
  border-radius: calc(var(--radius-inner) + var(--padding)); /* 20px */
  padding: var(--padding);
}
.card > .thumbnail {
  border-radius: var(--radius-inner); /* 8px */
}
```

Rules of thumb:

- Derive the OUTER radius from the inner one, not the other way around. The innermost element (a button, an image) usually has the design system's base radius.
- If the padding is large (say, more than ~24px), stop forcing the math. At that distance the layers read as separate surfaces and can each use their own system radius.
- The point is optical coherence, not formula worship. When the computed value looks wrong, trust your eyes and adjust by 1-2px.

Failure signature: a chip with `border-radius: 8px` inside a card that also has `border-radius: 8px` and `padding: 16px`. The corners pinch. It reads as "template".

---

## 2. Hit Areas

Interactive controls need a minimum hit area of **40x40px, ideally 44x44px** (the Apple HIG and WCAG 2.5.8 baseline). The VISIBLE element can be smaller; the CLICKABLE area must not be.

Expand with a pseudo-element so the layout does not change:

```css
.icon-button {
  position: relative;
  width: 24px;
  height: 24px;
}
.icon-button::after {
  content: "";
  position: absolute;
  inset: -10px; /* 24 + 10 + 10 = 44px hit area */
}
```

Rules:

- Never let expanded hit areas overlap each other. If two 24px icons sit 8px apart, the expansion must shrink until the areas meet, not cross.
- Text links inside prose are exempt (they follow the line box), but standalone links, icons, checkboxes, radio buttons, and close buttons are not.
- On touch layouts, prefer expanding the real padding over the pseudo-element trick, so the visual affordance grows too.

---

## 3. The Complete Set of Interaction States

A component is not designed until EVERY state is designed. "It has a hover effect" is one state out of ten. Missing states are the single most common gap between a mockup and a production interface.

| State | Trigger | What it must communicate |
| --- | --- | --- |
| Default | none | What this is, and that it is interactive |
| Hover | pointer over | "This will respond" (pointer devices only) |
| Active / pressed | pointer down | Physical, tactile confirmation |
| Focus-visible | keyboard focus | Where keyboard focus is, unmistakably |
| Disabled | logic | "Exists, but not now" plus ideally why |
| Loading | async work | "Working, do not repeat the action" |
| Empty | no data | What belongs here and how to get it |
| Error | failed operation | What went wrong and how to recover |
| Enter | mount / appear | Where this came from |
| Exit | unmount / dismiss | That it left deliberately, not crashed |

Concrete patterns for the ones people get wrong:

**Hover** - change something cheap for the compositor (background-color, box-shadow, transform), never size. Guard for pointer devices so touch does not get sticky hovers:

```css
@media (hover: hover) {
  .button:hover { background: var(--surface-hover); }
}
```

**Active** - a small scale is the most tactile signal:

```css
.button:active { transform: scale(0.97); }
```

Keep it subtle (0.95-0.98). Provide a way to disable it where the movement distracts (dense toolbars).

**Focus-visible** - style `:focus-visible`, not `:focus`, so pointer clicks do not draw rings but keyboards always do. Never remove outlines without replacing them:

```css
.button:focus-visible {
  outline: 2px solid var(--color-accent);
  outline-offset: 2px;
}
```

The ring must meet 3:1 contrast against the surroundings. `outline-offset` keeps it from colliding with the element's own border.

**Disabled** - `opacity: 0.5` alone is lazy. Also neutralize the affordances that promise interactivity:

```css
.button:disabled {
  opacity: 0.55;
  cursor: not-allowed;
  box-shadow: none;
  pointer-events: none; /* only if a tooltip on the wrapper explains why */
}
```

If the user cannot guess why it is disabled, put the reason in a tooltip on a wrapper, or better: keep the control enabled and validate on action.

**Loading** - two rules. First, the control that triggered the work shows the spinner (in place of its label, same width, so nothing jumps). Second, avoid the sub-200ms flash: either delay showing the loader ~150ms, or once shown keep it visible a minimum ~300ms. Skeletons go where CONTENT loads; spinners go where ACTIONS run.

**Empty** - an empty list is a designed screen, not a blank area: one line saying what belongs here, one primary action that creates the first item, optionally a muted illustration. Never just "No results".

**Error** - inline, adjacent to the failed thing, in the semantic error color, with a recovery path (retry button, corrected-input hint). Never a bare red border with no text, and never a toast as the ONLY record of a form error.

**Enter / exit** - see `references/motion.md`. The short version: exits are shorter and quieter than enters (~150ms), and both respect reduced motion.

---

## 4. Text: Wrapping, Truncation, Stable Numbers

**Wrapping**

```css
h1, h2, h3, .card-title { text-wrap: balance; } /* headings, short titles */
p, .caption, li          { text-wrap: pretty; }  /* short-to-medium body text */
```

- `balance` evens out ragged two-to-three-line headings. `pretty` prevents single-word orphan lines.
- Use neither on long prose, code, or preformatted content (the browser caps `balance` anyway, and `pretty` costs layout time on huge blocks).

**Truncation**

```css
/* Single line */
.row-title {
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

/* Multi-line clamp */
.card-excerpt {
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 3;
  overflow: hidden;
}
```

Truncation rules:

- Truncated text must be reachable: a `title` attribute at minimum, a real tooltip if the value matters (emails, filenames, amounts).
- Never truncate data the user must act on precisely (account numbers, error codes). Wrap those instead.
- Truncate at the END by default; truncate the MIDDLE for filenames and paths where the ending disambiguates (`invoice...2026.pdf`).
- A clamp is a layout decision, not a content decision. If every card clamps at 3 lines, write summaries that survive 3 lines.

**Stable numbers**

```css
.counter, .timer, .price, td.numeric {
  font-variant-numeric: tabular-nums;
}
```

Any number that updates (timers, counters, prices, table columns) must use tabular figures, or the layout jitters on every tick. Right-align numeric table columns while you are at it.

**Font smoothing (macOS)**

```css
html {
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
```

Apply once at the root when the project does not already.

---

## 5. Shadows and Borders: Depth That Behaves Like Light

Borders and shadows answer different questions. Borders SEPARATE (rows, inputs, focus rings). Shadows ELEVATE (cards, dropdowns, popovers, modals). Do not use a heavy shadow where a hairline border is doing the work.

**Layered shadows.** One big soft shadow looks like a smudge. Real depth is a stack: a crisp contact shadow plus one or two increasingly soft ambient layers:

```css
:root {
  --shadow-sm:
    0 1px 2px rgb(0 0 0 / 0.06),
    0 1px 1px rgb(0 0 0 / 0.04);
  --shadow-md:
    0 1px 2px rgb(0 0 0 / 0.06),
    0 4px 8px rgb(0 0 0 / 0.06),
    0 8px 16px rgb(0 0 0 / 0.04);
  --shadow-lg:
    0 2px 4px rgb(0 0 0 / 0.08),
    0 8px 16px rgb(0 0 0 / 0.08),
    0 24px 48px rgb(0 0 0 / 0.10);
}
```

Rules:

- Always transparent black (`rgb(0 0 0 / a)`), never gray hex values, so shadows work on any background.
- Elevation is a SCALE. A card, a dropdown, and a modal must not share one shadow token; higher elements get larger, softer shadows.
- Shadows fall DOWN: positive y-offset, no x-offset unless the design has an explicit light direction.
- Dark mode: shadows nearly disappear against dark surfaces. Convey elevation with surface lightness (higher = slightly lighter background) and hairline borders (`1px solid rgb(255 255 255 / 0.08)`), and keep only a faint shadow.
- A `1px` border plus a shadow on the same card is often right: the border defines the edge, the shadow gives the depth.

**Image outlines.** Images blur into surfaces that match their edge colors. Give them a neutral inset outline:

```css
img {
  outline: 1px solid rgb(0 0 0 / 0.1);
  outline-offset: -1px;
}
@media (prefers-color-scheme: dark) {
  img { outline-color: rgb(255 255 255 / 0.1); }
}
```

Neutral black/white alpha only. Never tint image outlines with the brand palette.

---

## 6. Icon Optics and Alignment

Geometric centering is not visual centering. Symmetric icons (circles, squares, gear) center geometrically. Asymmetric icons (play triangle, arrows, chevrons, stars, send) have an optical center that differs from their bounding box center, and they look off until nudged.

- **Play triangle:** nudge right ~4-8% of the icon width (the visual mass sits left).
- **Chevrons and arrows:** nudge 1-2px toward the direction they point away from.
- **Fix the SVG first.** Adjust the shape inside its own `viewBox` so every use site inherits the fix. Only reach for a pixel margin/padding when you do not own the SVG.

```css
/* Last resort when the SVG cannot be edited */
.icon-play { transform: translateX(1px); }
```

Alignment with text:

- Icons next to text align to the text's CAP HEIGHT zone, not the full line box. In flex rows, `align-items: center` plus an icon sized around 1em to 1.25em of the label usually lands right; verify by eye at the final size.
- Keep one consistent stroke width across an icon set (mixing 1.5px and 2px strokes in the same toolbar reads as sloppy).
- Give icon+label pairs a fixed gap token (usually the smallest spacing step, 4-8px), not ad hoc margins.
- Icons that render at multiple sizes need per-size verification: a 16px render of a 24px-grid icon often needs its own simplified variant.

---

## 7. Spacing: Optics Versus Math

The spacing scale (4/8px steps) is the starting point, not the verdict. Several optical effects make mathematically equal spacing look unequal:

- **Line height is invisible padding.** A text block carries built-in space above and below (half-leading). Measure padding to the text block, not to the line box, or the top of every card will look emptier than the sides. In modern CSS, `text-box-trim` fixes this properly; otherwise compensate a step down on top padding.
- **Icons carry their own whitespace.** An icon with internal padding in its viewBox needs less external margin than the token says. Align the VISIBLE edge, not the bounding box.
- **Uppercase and small text need letter-spacing.** All-caps labels want `letter-spacing: 0.04em to 0.08em` plus a slightly smaller size; large display text usually wants slightly NEGATIVE tracking.
- **Grouping is a ratio, not a value.** Space BETWEEN groups must be clearly larger than space WITHIN a group; 2x is a reliable floor. If a label sits 8px from its own input but 12px from the next field, the grouping is ambiguous. Make it 8 within and 24 between.
- **Optically heavy elements need more clearance.** A saturated badge or a dark button next to quiet text needs a step more space than the grid says, because visual weight bleeds.

The rule: compute with the scale, then LOOK. When math and optics disagree, optics win, and the fix is usually one step on the scale, not an arbitrary pixel value.

---

## 8. Motion Micro-Polish (pointer to motion.md)

The full motion system lives in `references/motion.md`. The polish-level rules that belong in every component regardless:

- **Never `transition: all`.** Name the properties:

```css
.button {
  transition-property: transform, background-color, box-shadow;
  transition-duration: 150ms;
  transition-timing-function: ease-out;
}
```

- Use CSS TRANSITIONS for interactive state changes (they retarget mid-motion when the user changes intent). Reserve KEYFRAMES for staged one-shot entrances and loading sequences.
- Enter: opacity + small translateY (+ optional blur). Exit: shorter and quieter, ~150ms.
- Icon swaps cross-fade (opacity + scale + blur), never instant visibility toggles.
- `will-change` only to fix a measured first-frame stutter, only on `transform`/`opacity`/`filter`, removed when done. Never `will-change: all`.

---

## Review Output

When running a polish pass on an existing surface, report concrete changes as before/after rows:

| Principle | Before | After |
| --- | --- | --- |
| Concentric radius | Same radius on parent and child | Parent radius = child radius + padding |
| Tabular numbers | Counter shifts as digits change | `font-variant-numeric: tabular-nums` |
| Transition scope | `transition: all` | Explicit property list |
| Focus | `outline: none` on buttons | 2px `:focus-visible` ring with offset |

Include file paths and properties when they are not obvious. Omit principles you checked but did not change.

---

## Checklist (gate before delivery)

- [ ] Nested rounded elements are concentric (outer = inner + padding) or deliberately separate surfaces
- [ ] Every interactive control has a >= 40px (ideally 44px) hit area, with no overlapping expansions
- [ ] All ten states exist where relevant: default, hover, active, focus-visible, disabled, loading, empty, error, enter, exit
- [ ] `:focus-visible` rings are visible, offset, and 3:1 contrast; no removed outlines without replacement
- [ ] Hover effects are guarded with `@media (hover: hover)`
- [ ] Headings use `text-wrap: balance`, short body text uses `text-wrap: pretty`
- [ ] Truncated text is reachable (tooltip/title); precise data is never truncated
- [ ] Updating numbers use `tabular-nums`; numeric table columns are right-aligned
- [ ] Shadows are layered, transparent, on an elevation scale; dark mode elevates with surface lightness + hairline borders
- [ ] Images have neutral inset outlines
- [ ] Asymmetric icons are optically centered (fixed in the SVG where possible)
- [ ] Spacing between groups >= 2x spacing within groups; optical adjustments beat raw grid math
- [ ] No `transition: all`, no `will-change: all`; exits are shorter than enters
