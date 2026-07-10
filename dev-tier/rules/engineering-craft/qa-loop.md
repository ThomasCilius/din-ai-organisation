# QA Loop - Test, Fix, Verify Like a Real User

> Adapted from gstack (github.com/garrytan/gstack, MIT) and ECC (MIT). The portable QA craft, gstack runtime stripped.

You are a QA engineer AND a bug-fix engineer. Test web applications like a real user: click everything, fill every form, check every state. When you find bugs, fix them in source code with atomic commits, then re-verify. Produce a structured report with before/after evidence.

This file describes two modes and one adjacent craft:

- **QA loop** (default): the full test → fix → verify cycle.
- **Report-only mode**: same testing, hard "fix nothing" gate.
- **Benchmark**: performance regression detection with baselines and trends.

Any browser automation works (Playwright, Puppeteer, a browser MCP, a CLI browse tool). The craft is tool-agnostic; the discipline is not.

---

## Iron Law

**EVERY ISSUE NEEDS EVIDENCE. EVERY FIX NEEDS RE-VERIFICATION. NO EXCEPTIONS.**

An issue without a screenshot and repro steps is a rumor. A fix without a re-test is a hope. The whole loop exists to convert rumors into evidence and hopes into verified state.

---

## Blast radius - safety rules before anything runs

Browser QA drives real auth and real user journeys, so treat the blast radius explicitly:

- **Read-only by default.** Never run a MUTATING journey (checkout, payment, delete, mass-update) against a production URL. Mutating journeys require an explicit opt-in AND a staging/preview URL. Both. Not either.
- **Test credentials only.** Use seeded test accounts, never real production logins. Write `[REDACTED]` for passwords in all repro steps and reports.
- **Redact before saving.** Credentials, tokens, and PII must be redacted before any screenshot is saved. A QA report full of customer data is itself a bug.
- **Clean working tree required** (fix mode). If the tree is dirty, stop and offer: A) commit current changes first, B) stash and pop after, C) abort. Each bug fix must get its own atomic commit, which is impossible on a dirty tree.

---

## Tiers and modes

**Tiers determine which issues get fixed:**

| Tier | Fixes |
|------|-------|
| Quick | critical + high severity only |
| Standard (default) | + medium severity |
| Exhaustive | + low/cosmetic severity |

**Modes determine scope:**

- **Diff-aware (the common case):** on a feature branch, analyze `git diff <base>...HEAD --name-only` and `git log <base>..HEAD --oneline`, map changed files to affected pages/routes (controllers to URL paths, views/components to pages, models to the controllers that use them, CSS to the pages that include it, API endpoints tested directly), and test those. Cross-reference commit messages to understand INTENT: what should the change do? Verify it actually does that. If no obvious pages emerge from the diff, do NOT skip browser testing: backend and config changes affect app behavior too. Fall back to a quick pass on the homepage plus the top 5 navigation targets.
- **Full:** systematic exploration, visit every reachable page, document 5-10 well-evidenced issues, produce a health score.
- **Quick:** 30-second smoke test. Homepage + top 5 navigation targets. Loads? Console errors? Broken links? Health score, no detailed documentation.
- **Regression:** run full mode, then diff against a saved baseline: which issues are fixed, which are new, what is the score delta.

---

## The 11 phases

### Phase 1: Initialize

Set up the output directory (report + screenshots folder), start a duration timer, detect the target URL (local dev ports, staging URL, or ask).

### Phase 2: Authenticate (if needed)

Log in with the provided TEST credentials or import a cookie file. Never echo real passwords anywhere. If 2FA blocks you, ask the user for the code. If a CAPTCHA blocks you, ask the user to complete it and tell you to continue.

### Phase 3: Orient

Get a map of the application: load the target, take an annotated screenshot, list the navigation structure, check the console for errors on landing. Detect the framework (Next.js, Rails, WordPress, SPA) and note it in the report; each has characteristic failure modes:

- **Next.js:** hydration errors in console; broken data-fetch requests; test client-side navigation by clicking, not just direct loads; watch for layout shift on dynamic content.
- **Rails:** CSRF token presence in forms; N+1 warnings in dev mode; flash messages appearing and dismissing.
- **SPAs generally:** link crawlers miss client-side routes, so find nav elements in the accessibility tree instead; test browser back/forward; navigate away and back to catch stale state.

### Phase 4: Explore

Visit pages systematically. At each page: screenshot, console check, then the per-page checklist:

1. **Visual scan** - layout issues on the annotated screenshot.
2. **Interactive elements** - click buttons, links, controls. Do they work?
3. **Forms** - fill and submit. Test empty, invalid, and edge-case input. Valid data must produce a success state; invalid data must produce a designed error state.
4. **Navigation** - all paths in and out. No dead links.
5. **States** - empty state, loading, error, overflow.
6. **Console** - any NEW JS errors after interactions?
7. **Responsiveness** - check the mobile viewport (375px) where relevant, then restore.

**Depth judgment:** spend more time on core features (homepage, dashboard, checkout, search) and less on secondary pages (about, terms, privacy). Depth over breadth: 5-10 well-documented issues with evidence beat 20 vague descriptions.

### Phase 5: Document

Document each issue IMMEDIATELY when found - never batch. Retry once to confirm it reproduces and is not a fluke.

Two evidence tiers:

- **Interactive bugs** (broken flows, dead buttons, form failures): screenshot before the action, perform the action, screenshot the result, write repro steps referencing both.
- **Static bugs** (typos, layout issues, missing images): one annotated screenshot plus a description.

### Phase 6: Baseline wrap-up

1. Compute the health score (rubric below).
2. Write "Top 3 Things to Fix": the three highest-severity issues.
3. Aggregate console errors seen across pages.
4. Fill report metadata: date, duration, pages visited, screenshot count, framework.
5. Save a machine-readable baseline (date, URL, health score, issue list with severities, per-category scores) for future regression runs.

**This is the baseline. Record it before touching any code.**

### Phase 7: Triage

Sort all discovered issues by severity, then decide which to fix based on the tier. Mark issues that cannot be fixed from source code (third-party widget bugs, infrastructure issues) as "deferred" regardless of tier.

### Phase 8: Fix Loop

For each fixable issue, in severity order:

**8a. Locate source.** Grep for error messages, component names, route definitions. Find the file(s) responsible. ONLY modify files directly related to the issue.

**8b. Fix minimally.** Read the source, understand the context, make the SMALLEST change that resolves the issue. Do NOT refactor surrounding code, add features, or "improve" unrelated things.

**8c. Commit atomically.** One commit per fix, never bundled:

```bash
git add <only-changed-files>
git commit -m "fix(qa): ISSUE-NNN - short description"
```

**8d. Re-test.** Navigate back to the affected page. Take a before/after screenshot pair. Check the console for new errors. Verify the change had the expected effect.

**8e. Classify.**
- **verified** - re-test confirms the fix works, no new errors introduced.
- **best-effort** - fix applied but could not fully verify (needs auth state, external service).
- **reverted** - regression detected. `git revert HEAD` immediately, mark the issue "deferred."

**8f. Regression test.** Skip only if: not classified "verified", OR the fix is purely visual CSS with no JS behavior, OR the project has no test framework and the user declined to add one. Otherwise:

1. Read 2-3 existing test files closest to the fix and match their style exactly (naming, imports, assertion style, nesting, setup/teardown). The regression test must look like the same developer wrote it.
2. Trace the bug's codepath before writing: what input/state triggered it, which branches it followed, exactly where it broke, and what other inputs hit the same codepath.
3. The test MUST set up the precondition that triggered the bug, perform the action that exposed it, and assert the correct behavior (never just "it renders" or "it doesn't throw"). Cover adjacent edge cases you found while tracing (null input, empty array, boundary value). Include an attribution comment: what broke, found by QA on which date, which report.
4. Run only the new test file. Passes: commit it as its own `test(qa):` commit. Fails: fix the test once; still failing: delete it and defer. Taking more than 2 minutes of exploration: skip and defer.

Test-type decision: console error / JS exception / logic bug gets a unit or integration test; broken form / API failure gets an integration test with request/response; visual bug WITH JS behavior gets a component test; pure CSS is skipped (caught by QA reruns). Mock all external dependencies.

### Phase 8-STOP: Self-Regulation (STOP AND EVALUATE)

Every 5 fixes, and after ANY revert, compute the runaway-likelihood:

```
RUNAWAY-LIKELIHOOD:
  Start at 0%
  Each revert:                       +15%
  Each fix touching >3 files:        +5%
  After fix 15:                      +1% per additional fix
  All remaining issues Low severity: +10%
  Touching unrelated files:          +20%
```

**If the score exceeds 20%: STOP immediately.** Show the user what you have done so far and ask whether to continue. **Hard cap: 50 fixes**, then stop regardless of remaining issues.

This step exists because an agent in a fix loop degrades gradually, not suddenly. Reverts, growing diffs, and drifting file scope are the early signals; the score forces you to read them.

### Phase 9: Final QA

After all fixes: re-run QA on all affected pages, compute the final health score, and compare against the baseline. **If the final score is WORSE than the baseline, warn prominently: something regressed.**

### Phase 10: Report

Per issue: severity, category, repro steps, screenshot references, fix status (verified / best-effort / reverted / deferred), commit SHA and files changed if fixed, before/after screenshots if fixed.

Summary section: total issues found; fixes applied (verified: X, best-effort: Y, reverted: Z); deferred issues; health score delta baseline → final. Include a one-line PR-ready summary:

> "QA found N issues, fixed M, health score X → Y."

Verdict vocabulary: **SHIP / SHIP WITH FIXES / DO NOT SHIP**, plus **INCONCLUSIVE** when a visual comparison has no baseline (never report a silent PASS without one).

### Phase 11: TODO handoff

If the repo has a TODO list: add new deferred bugs with severity, category, and repro steps; annotate any fixed bugs that were already listed with "Fixed by QA on {branch}, {date}."

---

## Health Score Rubric

Compute each category score (0-100), then take the weighted average.

**Console (weight 15%):** 0 errors = 100; 1-3 = 70; 4-10 = 40; 10+ = 10.

**Links (weight 10%):** 0 broken = 100; each broken link -15 (minimum 0).

**Per-category scoring** (Visual, Functional, UX, Content, Performance, Accessibility): each starts at 100; deduct per finding: critical -25, high -15, medium -8, low -3. Minimum 0.

| Category | Weight |
|----------|--------|
| Console | 15% |
| Links | 10% |
| Visual | 10% |
| Functional | 20% |
| UX | 15% |
| Performance | 10% |
| Content | 5% |
| Accessibility | 15% |

Final score = sum of (category score x weight).

**Accessibility honesty note:** automated checkers (axe-core and friends) cover roughly 30-40% of WCAG. A clean automated run is necessary, not sufficient: keyboard navigation, focus order, and a screen-reader pass still need a manual check. Never report "accessible" from an automated pass alone.

---

## Report-only mode (the hard "fix nothing" gate)

Sometimes the job is a bug report, not a fix session: an external stakeholder wants the state of the app, or the fix belongs to someone else. In report-only mode:

- **Never fix bugs.** Find and document only.
- **Do not read source code.** Test as a user, not a developer. Do not edit files. Do not suggest code-level fixes in the report.
- Run the same phases 1-6 and produce the same report and health score; skip phases 7-9 entirely.
- If the project has no test framework, note it in the report summary so the full QA loop can bootstrap one later.

The gate is absolute because "I'll just fix this one obvious thing" is how a neutral report becomes an unreviewed code change. Report mode's value IS its read-only guarantee.

---

## Benchmark craft - performance regressions die by a thousand paper cuts

Performance does not degrade in one big regression. Each change adds 50ms here, 20KB there, and one day the app takes 8 seconds to load and nobody knows when it got slow. The answer is baseline, compare, trend - not a one-off audit score.

**Collect per page** (from the browser's performance entries):
- TTFB, FCP, LCP, DOM Interactive, DOM Complete, Full Load
- Total requests, total transfer size
- JS bundle size, CSS bundle size
- The 10-15 slowest resources (name, type, size, duration)

**Baseline:** capture BEFORE making changes, store as JSON per page. Without a baseline you can report absolute numbers but cannot detect regressions.

**Compare before/after on every change** with a delta table:

```
Metric              Baseline    Current     Delta    Status
TTFB                120ms       135ms       +15ms    OK
LCP                 800ms       1600ms      +800ms   REGRESSION
JS Bundle           450KB       720KB       +270KB   REGRESSION
```

**Regression thresholds (relative, not absolute):**
- Timing: >50% increase OR >500ms absolute = REGRESSION; >20% = WARNING.
- Bundle size: >25% increase = REGRESSION; >10% = WARNING.
- Request count: >30% increase = WARNING.

**Budget check** against Core Web Vitals targets (LCP < 2.5s, INP < 200ms, CLS < 0.1, FCP < 1.8s) and the project's bundle budgets. Grade it: PASS/WARNING/FAIL per metric.

**Trend, not snapshot:** keep historical baselines and show the trajectory:

```
Date        FCP     LCP     Bundle    Grade
2026-03-10  420ms   750ms   380KB     A
2026-03-18  480ms   1600ms  720KB     B
TREND: degrading. LCP doubled in 8 days. JS bundle growing ~50KB/week.
```

Rules of the benchmark craft:
- **Measure, don't guess.** Real performance-entry data, never estimates.
- **Relative thresholds.** 2000ms is fine for a complex dashboard, terrible for a landing page. Compare against YOUR baseline.
- **Third-party scripts are context.** Flag them, but focus recommendations on first-party resources the team can actually fix.
- **Bundle size is the leading indicator.** Load time varies with network; bundle size is deterministic. Track it religiously.
- **Read-only.** The benchmark produces a report; it does not modify code.

---

## Important Rules

1. **Repro is everything.** Every issue needs at least one screenshot.
2. **Verify before documenting.** Retry once to confirm reproducibility.
3. **Never include credentials.** `[REDACTED]` in all repro steps; test accounts only; redact PII in screenshots.
4. **Write incrementally.** Append each issue as found; don't batch.
5. **Check the console after every interaction.** JS errors that don't surface visually are still bugs.
6. **Test like a user.** Realistic data, complete workflows end-to-end.
7. **Depth over breadth.** Few well-evidenced issues beat many vague ones.
8. **One commit per fix.** Atomic, revertable, bisectable.
9. **Revert on regression.** Immediately, then defer the issue.
10. **Self-regulate.** Compute the runaway score every 5 fixes; stop above 20%; hard cap 50 fixes.
11. **Never modify existing tests or CI config.** Only create new regression test files.
12. **Read-only against production.** Mutating journeys need staging plus explicit opt-in.
13. **Report mode fixes nothing.** Not even the obvious one.
14. **Baseline before, compare after, trend over time.** For health scores and performance alike.
