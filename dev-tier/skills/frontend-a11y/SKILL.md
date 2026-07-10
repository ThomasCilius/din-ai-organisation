---
name: frontend-a11y
description: Build and audit accessible frontends to WCAG 2.2 Level AA. Covers the POUR principles, semantic HTML, ARIA rules, form labeling, keyboard navigation, focus management, contrast, and a combined automated plus manual testing approach. Use when building or reviewing any interactive UI component or form.
origin: ECC
---

# Frontend Accessibility (WCAG 2.2 AA)

Practical accessibility patterns for web frontends. Ensures interfaces are Perceivable, Operable, Understandable, and Robust (POUR) for all users, including those using screen readers, switch controls, or keyboard-only navigation. Covers the issues most commonly flagged in code review: missing form labels, incorrect ARIA usage, non-semantic interactive elements, and broken keyboard navigation.

## Why This Is a Legal Requirement in the EU

The European Accessibility Act (EAA) has been in force since June 2025 and makes accessibility a legal requirement for e-commerce, banking, ticketing, and many other digital products and services sold in the EU, including those from SMEs above the micro-enterprise threshold. Non-compliance can mean fines and products being pulled from the market. Treat WCAG 2.2 AA as the baseline for shipping, not as a nice-to-have.

## When to Use

- Building or reviewing form components (`<input>`, `<select>`, `<textarea>`)
- Creating interactive elements (modals, dropdowns, tooltips, tabs)
- Using `<div>` or `<span>` with `onClick`
- Adding `aria-*` attributes to any element
- Implementing keyboard navigation or focus management
- Auditing existing code for accessibility barriers or compliance gaps
- Receiving accessibility feedback from code review tools (ESLint a11y, axe)

## POUR Principles

The foundation of WCAG 2.2. Every finding and every fix maps back to one of these:

| Principle | Requirement | Key checks |
| :-------- | :---------- | :--------- |
| **Perceivable** | Information must be presentable to users in ways they can perceive | Text alternatives for non-text content; contrast 4.5:1 (normal text) / 3:1 (large text and UI components); content reflows at 400% zoom without loss of function |
| **Operable** | Interface components must be usable | Everything reachable by keyboard; visible high-contrast focus indicators (SC 2.4.11); minimum 24x24 CSS pixel target size (SC 2.5.8); single-pointer alternatives for dragging |
| **Understandable** | Information and operation must be clear | Consistent navigation; descriptive error messages with suggestions for correction (SC 3.3.3); no redundant entry of the same data in one process (SC 3.3.7) |
| **Robust** | Content must be compatible with assistive technology | Correct Name, Role, Value on every control; `aria-live` regions for dynamic status updates |

The **accessibility tree** is what assistive technologies actually read. Your job is to make that tree correct, not just the visual rendering.

## Semantic HTML First

Use the element that matches the intent. Native elements ship with role, keyboard support, and focus behavior for free. Screen readers and keyboard users depend on these built-in semantics.

```tsx
// BAD: div has no role, no keyboard support, no accessible name
<div onClick={handleClick}>Submit</div>

// GOOD: button is focusable, activates on Enter/Space, announces as "button"
<button type="button" onClick={handleClick}>Submit</button>
```

```tsx
// BAD: non-semantic navigation
<div onClick={() => navigate('/home')}>Home</div>

// GOOD: anchor supports right-click, middle-click, and keyboard navigation
<a href="/home">Home</a>
```

```tsx
// BAD: heading hierarchy skipped (h1 to h4)
<h1>Dashboard</h1>
<h4>Recent Activity</h4>

// GOOD: sequential heading levels
<h1>Dashboard</h1>
<h2>Recent Activity</h2>
```

Semantic mapping cheat sheet:

| Intent | Use | Never |
| :----- | :-- | :---- |
| Trigger an action | `<button>` | `<div onClick>` |
| Navigate somewhere | `<a href>` | `<span onClick>` |
| Page landmark | `<header>`, `<nav>`, `<main>`, `<footer>` | generic `<div>` stacks |
| Group form fields | `<fieldset>` + `<legend>` | bare `<div>` |
| Data relationships | `<table>` with `<th scope>` | CSS grid of divs |

## Form Accessibility

Missing `htmlFor` / `id` pairing and disconnected error messages are the most common issues flagged in code review.

### Label Connection

```tsx
// BAD: label has no connection to input — screen readers cannot associate them
<label>Email</label>
<input type="email" />

// GOOD: htmlFor matches input id
<label htmlFor="email">Email</label>
<input id="email" type="email" />
```

### Required Fields

```tsx
// BAD: visual-only asterisk conveys nothing to screen readers
<label htmlFor="email">Email *</label>
<input id="email" type="email" />

// GOOD: required enables native browser validation; aria-required signals it to screen readers
<label htmlFor="email">
  Email <span aria-hidden="true">*</span>
</label>
<input id="email" type="email" required aria-required="true" />
```

### Error Messages

```tsx
// BAD: error text exists visually but is not linked to the input
<input id="email" type="email" />
<span className="error">Invalid email address</span>

// GOOD: aria-describedby connects input to its error message
// aria-invalid signals the invalid state to screen readers
<input
  id="email"
  type="email"
  aria-describedby="email-error"
  aria-invalid={!!error}
/>
{error && (
  <span id="email-error" role="alert">
    {error}
  </span>
)}
```

Errors must be identified in text with a suggestion for correction (SC 3.3.3). Never indicate an error with color alone, such as only turning a border red.

## ARIA Rules

**The first rule of ARIA: do not use ARIA.** If a native HTML element or attribute provides the semantics you need, use it instead. ARIA is for the gaps native HTML cannot cover. Wrong ARIA is worse than no ARIA, because it actively lies to the accessibility tree.

### aria-label vs aria-labelledby

```tsx
// aria-label: inline string label — use when no visible label text exists
<button aria-label="Close modal">
  <XIcon />
</button>

// aria-labelledby: references another element's text — use when a visible label exists
<section aria-labelledby="section-title">
  <h2 id="section-title">Recent Orders</h2>
  {/* content */}
</section>
```

### aria-describedby

```tsx
// Provides supplementary description beyond the label
<button
  aria-describedby="delete-warning"
  onClick={handleDelete}
> Delete account
</button>
<p id="delete-warning">This action cannot be undone.</p>
```

### aria-live for Dynamic Content

```tsx
// Use aria-live to announce content that updates without a page reload
// polite: waits for user to finish current action before announcing
// assertive: interrupts immediately — use only for urgent errors

export function StatusMessage({ message, isError }: { message: string; isError?: boolean }) {
  return (
    <div role="status" aria-live={isError ? 'assertive' : 'polite'} aria-atomic="true">
      {message}
    </div>
  );
}
```

### aria-expanded and aria-controls

```tsx
export function Accordion({ title, children }: { title: string; children: React.ReactNode }) {
  const [isOpen, setIsOpen] = useState(false);
  const contentId = useId();

  return (
    <div>
      <button aria-expanded={isOpen} aria-controls={contentId} onClick={() => setIsOpen(prev => !prev)}>
        {title}
      </button>
      <div id={contentId} hidden={!isOpen}>
        {children}
      </div>
    </div>
  );
}
```

## Keyboard Navigation

Every interactive element must be reachable and operable by keyboard alone. Tab order must be logical, and there must be no keyboard traps: once a user tabs into a component, they must be able to tab out again.

### Custom Dropdown

```tsx
export function Dropdown({ options, onSelect }: { options: string[]; onSelect: (value: string) => void }) {
  const [isOpen, setIsOpen] = useState(false);
  const [activeIndex, setActiveIndex] = useState(0);
  const listId = useId();

  if (!options.length) return null;

  const handleKeyDown = (e: React.KeyboardEvent) => {
    switch (e.key) {
      case 'ArrowDown':
        e.preventDefault();
        setActiveIndex(i => Math.min(i + 1, options.length - 1));
        break;
      case 'ArrowUp':
        e.preventDefault();
        setActiveIndex(i => Math.max(i - 1, 0));
        break;
      case 'Enter':
      case ' ':
        e.preventDefault();
        if (isOpen) onSelect(options[activeIndex]);
        setIsOpen(prev => !prev);
        break;
      case 'Escape':
        setIsOpen(false);
        break;
    }
  };

  return (
    <div
      role="combobox"
      aria-expanded={isOpen}
      aria-haspopup="listbox"
      aria-controls={listId}
      tabIndex={0}
      onKeyDown={handleKeyDown}
      onClick={() => setIsOpen(prev => !prev)}
    >
      <span>{options[activeIndex]}</span>
      {isOpen && (
        <ul id={listId} role="listbox">
          {options.map((option, index) => (
            <li
              key={option}
              role="option"
              aria-selected={index === activeIndex}
              onClick={() => {
                onSelect(option);
                setIsOpen(false);
              }}
            >
              {option}
            </li>
          ))}
        </ul>
      )}
    </div>
  );
}
```

## Focus Management

Focus must move logically when UI state changes, especially for modals and route transitions. Focus indicators must be clearly visible and high-contrast (SC 2.4.11). Modals must contain focus while open and release it cleanly on close via the Escape key or an explicit close button (SC 2.1.2). Dropdowns and menus restore focus to the trigger element on close.

### Modal Focus Restoration

> This example covers initial focus and restoration. For a full focus trap (Tab/Shift+Tab cycling within the modal), use a library like [`focus-trap-react`](https://github.com/focus-trap/focus-trap-react) which handles edge cases like dynamic content and nested portals.

```tsx
export function Modal({ isOpen, onClose, title, children }: { isOpen: boolean; onClose: () => void; title: string; children: React.ReactNode }) {
  const modalRef = useRef<HTMLDivElement>(null);
  const previousFocusRef = useRef<HTMLElement | null>(null);

  useEffect(() => {
    if (isOpen) {
      // Save currently focused element and move focus into modal
      previousFocusRef.current = document.activeElement as HTMLElement;
      modalRef.current?.focus();
    } else {
      // Restore focus to the element that opened the modal
      previousFocusRef.current?.focus();
    }
  }, [isOpen]);

  if (!isOpen) return null;

  return (
    <div ref={modalRef} role="dialog" aria-modal="true" aria-labelledby="modal-title" tabIndex={-1} onKeyDown={e => e.key === 'Escape' && onClose()}>
      <h2 id="modal-title">{title}</h2>
      {children}
      <button onClick={onClose}>Close</button>
    </div>
  );
}
```

## Contrast and Perceivable Requirements

- Text contrast at least **4.5:1** for normal text, **3:1** for large text (18pt+, or 14pt bold)
- UI components and meaningful graphics at least **3:1** against adjacent colors
- Interactive targets at least **24x24 CSS pixels** (SC 2.5.8), with roughly 44x44 as the comfortable mobile target
- Content reflows and stays functional at up to **400% zoom** without horizontal scrolling
- Never convey meaning with color alone; pair it with text or an icon

## Images and Icons

```tsx
// BAD: decorative icon announced as unlabeled image
<img src="/icon.svg" />

// GOOD: decorative image hidden from screen readers
<img src="/decoration.png" alt="" aria-hidden="true" />

// GOOD: meaningful image with descriptive alt text
<img src="/chart.png" alt="Monthly revenue increased 23% from January to March" />

// GOOD: icon button with accessible label
<button aria-label="Delete item">
  <TrashIcon aria-hidden="true" />
</button>
```

Never start alt text with "Image of..." or "Picture of...", screen readers already announce the role.

## Reduced Motion

Respect users who have requested reduced motion in their OS settings.

```tsx
export function useReducedMotion(): boolean {
  const [prefersReduced, setPrefersReduced] = useState(false);

  useEffect(() => {
    const mq = window.matchMedia('(prefers-reduced-motion: reduce)');
    setPrefersReduced(mq.matches);
    const handler = (e: MediaQueryListEvent) => setPrefersReduced(e.matches);
    mq.addEventListener('change', handler);
    return () => mq.removeEventListener('change', handler);
  }, []);

  return prefersReduced;
}
```

## Testing Approach

Automated tools catch roughly a third of WCAG failures. Combine both layers; neither replaces the other.

### Automated

- **Lint at write time**: `eslint-plugin-jsx-a11y` (React) or equivalent, so violations never reach review
- **Runtime audits**: axe-core via `@axe-core/react` in development, or `jest-axe` / `vitest-axe` in unit tests
- **E2E audits**: run axe in Playwright (`@axe-core/playwright`) against key pages and states, including open modals and error states
- **Lighthouse accessibility score** in CI as a regression tripwire, not as proof of compliance

### Manual (required before sign-off)

- **Keyboard-only pass**: unplug the mouse. Tab through every flow. Verify visible focus, logical order, no traps, Escape closes overlays
- **Screen reader pass**: VoiceOver (macOS/iOS) or NVDA (Windows) through the critical flows. Verify every control announces a sensible name, role, and value
- **Zoom to 400%**: content must reflow without loss of function or horizontal scrolling
- **Contrast spot-check**: verify actual rendered colors with a contrast checker, especially text on gradients, images, and disabled states
- **Reduced motion**: enable the OS setting and confirm animations are suppressed

## Anti-Patterns

```tsx
// BAD: onClick on non-interactive element with no keyboard support
<div onClick={handleClick}>Click me</div>

// BAD: aria-label on a div that has no role
<div aria-label="Navigation">...</div>

// BAD: placeholder used as a substitute for label
<input placeholder="Enter your email" />

// BAD: positive tabIndex creates unpredictable tab order
<button tabIndex={3}>Submit</button>

// BAD: aria-hidden on a focusable element — keyboard users get trapped
<button aria-hidden="true">Open</button>

// BAD: role="button" on div without keyboard handler
<div role="button" onClick={handleClick}>Submit</div>
// Missing: tabIndex={0}, onKeyDown for Enter/Space
```

Also avoid: color-only status indicators, "click here" link text, auto-playing media, fixed-size containers that break reflow at high zoom, and empty icon-only buttons without an `aria-label`.

## Checklist

Before submitting any interactive component for review:

- [ ] Every `<input>`, `<select>`, and `<textarea>` has a connected `<label>` via `htmlFor`/`id`
- [ ] Error messages are linked with `aria-describedby`, marked `role="alert"`, and suggest a correction
- [ ] No `onClick` on `<div>` or `<span>` without `role`, `tabIndex`, and `onKeyDown`
- [ ] Icon-only buttons have `aria-label`
- [ ] Decorative images use `alt=""` and `aria-hidden="true"`
- [ ] Text contrast meets 4.5:1, UI components meet 3:1
- [ ] Interactive targets are at least 24x24 CSS pixels
- [ ] Modals contain focus while open and restore focus on close
- [ ] Dynamic content updates use `aria-live`
- [ ] Content reflows at 400% zoom
- [ ] `prefers-reduced-motion` is respected for animations
- [ ] Automated axe pass is clean AND a manual keyboard-only pass has been done

## References

- [WCAG 2.2 Guidelines](https://www.w3.org/TR/WCAG22/)
- [WAI-ARIA Authoring Practices](https://www.w3.org/WAI/ARIA/apg/)
- [European Accessibility Act overview](https://ec.europa.eu/social/main.jsp?catId=1202)

## Related Skills

- `frontend-patterns` - general React component and state patterns
- `frontend-design` - visual direction and design quality
