> Adapted from ECC (github.com/affaan-m/ECC, MIT). The portable motion craft, ECC runtime stripped - CSS-first, framework-free; every pattern works in plain HTML/CSS/vanilla JS, with a React mapping at the end.

# Motion: A Complete, Accessible Motion System

Motion is interaction design, not decoration. This document defines the tokens, the hard rules, and the copy-paste patterns for the handful of motion moments a production surface actually needs. It pairs with `references/polering.md` (which covers per-component transition hygiene) and takes its durations/easings from the design profile when one exists.

**The final rule: if motion does not improve UX, remove it.**

---

## 1. Should This Motion Exist? (decision tree)

Motion must do at least ONE of these, or it must be removed:

1. **Guide attention** - onboarding, a key action appearing, a value that just changed
2. **Communicate state** - loading to loaded, open to closed, success, error
3. **Preserve spatial continuity** - layout changes, navigation, an element moving between contexts

Walk the tree for every animation:

```text
Does it guide attention, communicate state, or preserve continuity?
├─ NO  → delete it
└─ YES → Does it run on transform/opacity (compositor) only?
          ├─ NO  → redesign it (see performance rules)
          └─ YES → Does it degrade correctly under prefers-reduced-motion?
                    ├─ NO  → not shippable yet
                    └─ YES → Is it one of the surface's 1-2 memorable moments,
                             or a sub-200ms functional transition?
                              ├─ NEITHER → probably noise, cut it
                              └─ YES     → ship it
```

A page earns one or two memorable motion moments (a considered load sequence, one hero reveal). Twenty random hover effects are not a motion system; they are noise.

**Responsiveness always outranks smoothness.** A 60fps animation that delays input is worse than no animation.

---

## 2. Motion Tokens

Define once as CSS custom properties. Components never hardcode durations or easings.

```css
:root {
  /* Durations */
  --motion-instant: 80ms;   /* tooltip, focus ring, badge update */
  --motion-fast:    180ms;  /* button feedback, icon swap, chip toggle */
  --motion-normal:  350ms;  /* modal open, card expand, element enter */
  --motion-slow:    600ms;  /* hero entrance, full-page transition */
  --motion-crawl:   1000ms; /* deliberate storytelling; use sparingly */

  /* Easings */
  --ease-smooth: cubic-bezier(0.22, 1, 0.36, 1);   /* default enter/move */
  --ease-sharp:  cubic-bezier(0.4, 0, 0.2, 1);     /* utility, exits */
  --ease-bounce: cubic-bezier(0.34, 1.56, 0.64, 1); /* playful overshoot */

  /* Distances (translate offsets) */
  --move-xs: 4px;
  --move-sm: 8px;
  --move-md: 16px;
  --move-lg: 24px;

  /* Scales */
  --scale-subtle: 0.98;
  --scale-press:  0.95;
  --scale-pop:    1.04;
}
```

Choosing a duration:

| Token | Use when |
| --- | --- |
| `instant` | Tooltip show/hide, focus ring, badge update |
| `fast` | Button feedback, icon swap, chip toggle |
| `normal` | Modal open, card expand, page element enter |
| `slow` | Hero entrance, full-page transition |
| `crawl` | Deliberate storytelling; rare |

Direction rules: **enter = ease-out** (fast start, soft landing), **exit = ease-in or sharp, and always SHORTER than enter** (~150ms). Things leave quickly and arrive gracefully.

---

## 3. Named Spring Presets

Springs give motion physicality. The presets, by feel:

| Preset | Feel | Use when | JS spring config |
| --- | --- | --- | --- |
| `snappy` | quick, confident | default UI: buttons, chips, nav | stiffness 300, damping 30 |
| `gentle` | soft landing | cards, modals, panels | stiffness 120, damping 14 |
| `bouncy` | playful overshoot | empty states, onboarding | stiffness 400, damping 10 |
| `instant` | near-immediate | tooltips, popovers, dropdowns | stiffness 600, damping 35 |
| `release` | natural physics | drag release | stiffness 200, damping 20 |

In plain CSS you approximate springs two ways:

```css
/* Simple overshoot: the bounce bezier */
.panel-enter { transition: transform var(--motion-normal) var(--ease-bounce); }

/* True spring curve: linear() (modern browsers) */
:root {
  --spring-snappy: linear(
    0, 0.1394 5.9%, 0.4557 15.8%, 0.8358 27.8%, 0.9983 35.8%,
    1.0687 42.9%, 1.0894 49.6%, 1.0741 58.3%, 1.0136 79.7%, 1
  );
}
.chip { transition: transform 400ms var(--spring-snappy); }
```

Use one preset per component family and stay consistent: a modal that lands `gentle` while its toast siblings land `snappy` is fine; two modals with different springs is not.

---

## 4. Reduced Motion Is a HARD Rule

`prefers-reduced-motion: reduce` overrides everything: design preference, brand, "but it looks better". When it is set, all TRANSFORMS are disabled; the only permitted fallback is an opacity-only fade at <= 200ms. Content must never be hidden or unreachable because an animation was skipped, and skipping must not cause layout shift.

Global CSS pattern (put this in every project):

```css
@media (prefers-reduced-motion: reduce) {
  *, *::before, *::after {
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
    scroll-behavior: auto !important;
  }
  /* Permitted fallback: short opacity-only fades */
  .motion-fade-ok { transition: opacity 150ms ease !important; }
}
```

Per-component pattern (opt-in animation instead of opt-out):

```css
.card-enter { opacity: 0; }
@media (prefers-reduced-motion: no-preference) {
  .card-enter { translate: 0 var(--move-md); }
  .card-enter-active {
    translate: 0 0;
    transition: translate var(--motion-normal) var(--ease-smooth),
                opacity  var(--motion-normal) var(--ease-smooth);
  }
}
.card-enter-active { opacity: 1; transition: opacity 150ms ease; }
```

Vanilla JS gate, for anything driven from script:

```js
const REDUCED = matchMedia("(prefers-reduced-motion: reduce)").matches;

// Optional: low-end device adaptation
const LOW_END =
  (navigator.deviceMemory !== undefined && navigator.deviceMemory <= 2) ||
  (navigator.deviceMemory === undefined && navigator.hardwareConcurrency <= 4);

function shouldAnimate({ essential = false } = {}) {
  if (REDUCED) return false;
  if (!essential && LOW_END) return false;
  return true;
}
```

Priority order, highest first: reduced motion, then low-end device, then design preference.

---

## 5. Performance Rules (compositor only)

**Safe to animate:** `transform` (translate/scale/rotate), `opacity`. Sparingly: `clip-path`, `filter`.

**Banned from animation:** `width`, `height`, `top`, `left`, `margin`, `padding`, `border`, `font-size`. These trigger layout on every frame.

- Need a width change? Animate `scaleX` (with `transform-origin`) or crossfade between two states.
- Need to move something? `translate`, never `top`/`left`.
- Never `transition: all`; name the properties (see polering.md).
- `will-change` only to fix a MEASURED first-frame stutter, only on compositor properties, removed after the animation. Never leave it on permanently and never `will-change: all`.
- Scroll effects use `IntersectionObserver` or `animation-timeline`, never a raw scroll handler that mutates styles per event.
- Stagger intervals stay between 50 and 100ms. Below feels mechanical, above feels sluggish.

---

## 6. SSR-Safe Initial States

The rule: **the initial state in CSS/markup must match what the server sends.** If content is server-rendered visible, do not default it to `opacity: 0` in a stylesheet and hope JS runs; users on slow connections (or with JS blocked) get a blank page, and hydration mismatches flash.

The safe pattern is opt-in: content is visible by default, and a JS-added class arms the animation just before it plays:

```css
/* Visible by default - correct without JS */
.reveal { opacity: 1; }

/* Only when JS has confirmed it is running do we arm the hidden state */
html.js .reveal:not(.is-visible) {
  opacity: 0;
  translate: 0 var(--move-md);
}
html.js .reveal.is-visible {
  opacity: 1;
  translate: 0 0;
  transition: opacity var(--motion-normal) var(--ease-smooth),
              translate var(--motion-normal) var(--ease-smooth);
}
```

```html
<script>document.documentElement.classList.add("js");</script>
```

(That one-liner goes in `<head>` so the armed state exists before first paint - no flash of hidden-then-shown content.)

React equivalent: the `initial` value must match the server render; defer entrance animation until after mount, or wrap in a presence component. See the React section.

---

## 7. Copy-Paste Patterns (CSS-first)

### Button press

```css
.button {
  transition-property: transform, background-color, box-shadow;
  transition-duration: var(--motion-fast);
  transition-timing-function: var(--ease-smooth);
}
@media (hover: hover) {
  .button:hover { transform: scale(var(--scale-pop)); }
}
.button:active { transform: scale(var(--scale-press)); }
```

### Modal (enter + exit, no framework)

Modern CSS can animate `<dialog>` open AND close with zero JS beyond `showModal()`/`close()`:

```css
dialog.modal {
  opacity: 0;
  transform: scale(var(--scale-press)) translateY(var(--move-sm));
  transition:
    opacity   var(--motion-fast) var(--ease-sharp),
    transform var(--motion-fast) var(--ease-sharp),
    overlay   var(--motion-fast) allow-discrete,
    display   var(--motion-fast) allow-discrete;
}
dialog.modal[open] {
  opacity: 1;
  transform: scale(1) translateY(0);
  transition-duration: var(--motion-normal);
  transition-timing-function: var(--ease-smooth);
  @starting-style {
    opacity: 0;
    transform: scale(var(--scale-press)) translateY(var(--move-sm));
  }
}
dialog.modal::backdrop {
  background: rgb(0 0 0 / 0.4);
  opacity: 0;
  transition: opacity var(--motion-fast), overlay var(--motion-fast) allow-discrete,
              display var(--motion-fast) allow-discrete;
}
dialog.modal[open]::backdrop {
  opacity: 1;
  @starting-style { opacity: 0; }
}
```

Note the asymmetry: exit (150-180ms, sharp) is faster than enter (350ms, smooth). `<dialog>` + `showModal()` gives you focus trap, Escape close, and inert background for free; add scroll lock (`overflow: hidden` on body while open) yourself. Older-browser fallback: toggle a class and remove the node on `transitionend`.

### Toast

```css
.toast {
  opacity: 0;
  translate: var(--move-lg) 0;
  transition: opacity var(--motion-fast) var(--ease-smooth),
              translate var(--motion-fast) var(--ease-smooth);
}
.toast.is-visible { opacity: 1; translate: 0 0; }
.toast.is-leaving { opacity: 0; translate: var(--move-lg) 0; transition-duration: 150ms; }
```

```js
function dismissToast(el) {
  el.classList.add("is-leaving");
  el.addEventListener("transitionend", () => el.remove(), { once: true });
}
```

Toasts enter from the edge they live at, stack with a small gap, and auto-dismiss timers pause on hover.

### Stagger (list entrance)

```css
.list .reveal { transition-delay: calc(var(--i) * 70ms); } /* 50-100ms cap */
```

```html
<li class="reveal" style="--i: 0">…</li>
<li class="reveal" style="--i: 1">…</li>
<li class="reveal" style="--i: 2">…</li>
```

Cap the total: beyond ~8 items, stop increasing the delay (`min(var(--i), 8)`), or the tail feels broken.

### Page transition (View Transitions API + fallback)

```css
@view-transition { navigation: auto; } /* MPA cross-document */

::view-transition-old(root) {
  animation: page-out var(--motion-fast) var(--ease-sharp) both;
}
::view-transition-new(root) {
  animation: page-in var(--motion-normal) var(--ease-smooth) both;
}
@keyframes page-out { to { opacity: 0; translate: 0 calc(-1 * var(--move-sm)); } }
@keyframes page-in  { from { opacity: 0; translate: 0 var(--move-sm); } }
```

Browsers without View Transitions simply navigate instantly; that IS the fallback, no polyfill needed. In an SPA, wrap the DOM swap in `document.startViewTransition(() => swap())` when available, else just swap.

### Scroll reveal

```js
const io = new IntersectionObserver((entries) => {
  for (const e of entries) {
    if (e.isIntersecting) {
      e.target.classList.add("is-visible");
      io.unobserve(e.target); // reveal once - repeating on scroll-out distracts
    }
  }
}, { rootMargin: "-80px" });

if (shouldAnimate()) {
  document.querySelectorAll(".reveal").forEach((el) => io.observe(el));
} else {
  document.querySelectorAll(".reveal").forEach((el) => el.classList.add("is-visible"));
}
```

Uses the `.reveal` CSS from section 6. Reveal ONCE; do not re-hide when scrolling away.

### Skeleton loading

```css
.skeleton {
  border-radius: 6px;
  background: var(--surface-muted);
  animation: skeleton-pulse 1.5s ease-in-out infinite;
}
@keyframes skeleton-pulse { 0%, 100% { opacity: 0.5; } 50% { opacity: 1; } }
@media (prefers-reduced-motion: reduce) {
  .skeleton { animation: none; opacity: 0.7; }
}
```

1.5s is the comfortable pulse; faster reads as flashing. An infinite animation is only acceptable because it communicates the loading state; every other infinite animation needs the same justification.

---

## 8. Using React + a Motion Library (optional layer)

The system above is the contract; a library just executes it. If the project uses `motion/react` (Motion for React, formerly Framer Motion):

| Need | Pattern |
| --- | --- |
| Hover / press feedback | `whileHover` / `whileTap` with the scale tokens |
| Conditional mount/unmount | `AnimatePresence` |
| Reveal on scroll | `whileInView` + `viewport={{ once: true }}` |
| Scroll-linked value | `useScroll` + `useTransform` |
| Small in-place layout shift | `layout` prop (small, isolated elements only) |
| Shared element across contexts | `layoutId` (unique per mounted instance) |

Hard rules carried over:

- Never mix `motion/react` and `framer-motion` imports in one tree; the schedulers conflict and exit animations break.
- `AnimatePresence` contract: it wraps the conditional, the direct child has a `key`, and the child defines `exit`. Miss one and exits silently fail. Always set `mode` explicitly: `"wait"` for modals/page transitions, `"popLayout"` for dismissible lists, `"sync"` only for intentional overlap.
- `useReducedMotion()` gates every transform, mirroring section 4.
- `initial` must match the server render (section 6); `"use client"` on files importing `motion/react` in Next.js App Router.
- No `layout` on large or full-viewport containers; the measurement cost causes jank and CLS.
- Token values come from one shared tokens module, mirroring the CSS custom properties, never inline numbers.

The library is never a REQUIREMENT of this system: every pattern in section 7 ships without it.

---

## 9. Anti-Patterns

| Anti-pattern | Fix |
| --- | --- |
| Animating `width`/`height`/`top`/`left` | `transform` equivalents or crossfade |
| Purely decorative motion | Delete it (the final rule) |
| Infinite animation without a state to communicate | Delete or make it finite |
| Stagger interval > 100ms | Cap at 70-80ms, cap total delay |
| Ignoring `prefers-reduced-motion` | Global override + opt-in pattern (section 4) |
| Content hidden by default, revealed by JS | Opt-in `html.js` pattern (section 6) |
| Same duration for enter and exit | Exit ~150ms, always shorter |
| `transition: all` / permanent `will-change` | Named properties; will-change only while animating |
| Scroll handler mutating styles per event | IntersectionObserver / animation-timeline |
| Twenty hover effects, no memorable moment | 1-2 designed moments, quiet everything else |

---

## QA Checklist

- [ ] Every animation passes the decision tree (attention, state, or continuity)
- [ ] All durations/easings come from tokens; no inline magic numbers
- [ ] Only `transform`/`opacity` animate (clip-path/filter sparingly, justified)
- [ ] Reduced motion: transforms disabled, opacity-only fallback <= 200ms, no layout shift, nothing unreachable
- [ ] No CLS from any entrance or exit
- [ ] Content is visible without JS; animations are opt-in armed
- [ ] Exits are shorter and quieter than enters
- [ ] Stagger 50-100ms with a capped tail
- [ ] Modals: focus trapped, Escape closes, background inert, scroll locked
- [ ] Animations stop cleanly on removal (no orphaned timers/observers)
- [ ] Tested on a throttled CPU: input stays responsive during every animation
