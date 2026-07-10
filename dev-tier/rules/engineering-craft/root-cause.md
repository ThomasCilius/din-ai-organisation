# Root-Cause Investigation

> Adapted from gstack (github.com/garrytan/gstack, MIT). The portable root-cause craft, gstack runtime stripped.

Systematic, hypothesis-driven debugging. The method has one non-negotiable rule and five phases: investigate, analyze, hypothesize, implement, verify. You do not write a fix until you can name the root cause and prove it.

## When to use this

Reach for this whenever something is broken and you don't yet know why: reported errors, 500s, stack traces, unexpected behavior, "it was working yesterday," a feature that silently stopped, a flaky test. If the cause is obvious and one-line trivial, just fix it. If it isn't, run the loop below instead of guessing.

---

## Iron Law

**NO FIXES WITHOUT ROOT CAUSE INVESTIGATION FIRST.**

Fixing symptoms creates whack-a-mole debugging. Every fix that doesn't address the root cause makes the next bug harder to find, because now the code has a patch that masks the real fault. Find the root cause, then fix it. A fix you cannot explain is a fix you cannot trust.

---

## Phase 1: Root-Cause Investigation

Gather context before forming any hypothesis. Resist the pull to jump straight to a fix. The goal of this phase is evidence, not a solution.

1. **Collect symptoms.** Read the actual error messages, stack traces, and reproduction steps. Read them literally, in full. Do not paraphrase the error in your head and debug the paraphrase. If the report is thin, ask the user one focused question at a time rather than a wall of questions: what did you do, what did you expect, what happened instead, when did it start.

2. **Read the code.** Trace the code path from the symptom back toward potential causes. Search for all references to the failing symbol, function, or route. Read the surrounding logic, not just the line that threw. Follow the data: where does the bad value come from, where does it get used, where does the assumption break.

3. **Check recent changes.** A bug that "was working yesterday" is a regression, and a regression means the root cause is in a diff.
   ```bash
   git log --oneline -20 -- <affected-files>
   ```
   Look at what changed in the affected files. Was this path touched recently? What commit could have introduced the fault? If you can bisect (`git bisect`) to the first bad commit, the diff of that commit is often the root cause itself.

4. **Reproduce.** Can you trigger the bug deterministically? A reproduction you control is the single most valuable asset in debugging: it lets you test hypotheses cheaply and confirms the fix at the end. If you cannot reproduce it yet, do not start fixing. Gather more evidence first: logs, exact inputs, environment, timing, sequence of actions. An intermittent bug you can't reproduce means your understanding is incomplete.

5. **Check history.** Have bugs appeared in this same area before? Recurring bugs in the same file or module are an architectural smell, not a coincidence. If the same code keeps breaking, the root cause may be structural (a bad abstraction, a leaky boundary, an implicit contract nobody enforces) rather than a single line. Note the pattern.

**Output of Phase 1:** a root-cause hypothesis stated as a specific, testable claim about what is wrong and why. Not "something in auth is broken." Instead: "`auth.ts` returns `undefined` for the session when the cookie has expired, and the caller dereferences it without a null check, which is what produces the white screen." A good hypothesis names a mechanism and predicts what you'd observe if it were true.

---

## Scope Lock (discipline, not tooling)

Once you have a root-cause hypothesis, decide the narrowest region of the codebase the fix should touch, and hold yourself to it. Name the affected module or directory out loud (e.g. "this is contained to `src/auth/`"). For the rest of this investigation, do not edit unrelated code, do not opportunistically refactor adjacent files, do not "improve" things you notice in passing. Scope creep during a debug session is how a one-line fix becomes a risky sprawling diff that's hard to review and hard to revert.

If the bug genuinely spans the whole repo or the scope is honestly unclear, say so and skip the lock, but that should be rare. Most bugs live in one place.

---

## Phase 2: Pattern Analysis

Before testing your hypothesis, check whether the bug matches a known failure shape. Recognizing the pattern tells you where to look and what evidence to gather.

| Pattern | Signature | Where to look |
|---------|-----------|---------------|
| Race condition | Intermittent, timing-dependent, worse under load | Concurrent access to shared state, missing locks, unawaited async |
| Nil/null propagation | `NoMethodError`, `TypeError`, "cannot read property of undefined" | Missing guards on optional values, unchecked returns |
| State corruption | Inconsistent data, partial updates, works then breaks | Transactions, callbacks, hooks, order of operations |
| Integration failure | Timeout, unexpected response, works in isolation | External API calls, service boundaries, serialization |
| Configuration drift | Works locally, fails in staging/prod | Env vars, feature flags, secrets, differing DB state |
| Stale cache | Shows old data, fixes on cache clear | Redis, CDN, browser cache, memoization, build artifacts |

Also worth checking: any project TODO/known-issues list for a related entry, and `git log` for prior fixes in the same area. Again: recurring bugs in the same files are an architectural smell, not bad luck.

**If the bug matches no known pattern:** search externally for the failure. Search the error *category* and framework, not the raw message, e.g. "{framework} {generic error type}" or "{library} {component} known issues." **Sanitize before searching** - strip hostnames, IPs, file paths, SQL fragments, and any customer or proprietary data out of the query. Search the shape of the problem, not your private data. If a documented cause or a known dependency bug surfaces, carry it into Phase 3 as a candidate hypothesis.

---

## Phase 3: Hypothesis Testing

Before writing ANY fix, verify the hypothesis. This is the phase people skip, and skipping it is why fixes fail.

1. **Confirm the hypothesis.** Add a temporary log line, an assertion, a breakpoint, or a debug print at the suspected root cause. Run the reproduction. Does the observed evidence match what your hypothesis predicted? If you predicted the session is `undefined` at line 47, print it at line 47 and confirm it actually is. You are looking for direct evidence, not plausibility.

2. **If the hypothesis is wrong,** do not patch over it and do not immediately guess again. First consider searching for the (sanitized) error to see if others hit the same cause. Then return to Phase 1: gather more evidence and form a *new* hypothesis grounded in what you just learned. Every failed hypothesis narrows the space, but only if you actually update on the evidence instead of guessing randomly.

3. **The 3-strike rule.** If three hypotheses fail, STOP. Three misses usually means this is not a simple bug where you're one guess away. It's often an architectural issue: the fault is in how the pieces fit together, not in a single line. Escalate the decision instead of grinding. Present the situation and the options:
   - **Continue** - you have a genuinely new, evidence-backed hypothesis worth testing.
   - **Escalate** - this needs someone with deeper system knowledge; hand off with everything you've gathered.
   - **Instrument and wait** - add logging around the area and catch it with real data next time it fires.

**Red flags that mean slow down:**
- "Quick fix for now." There is no "for now." A fix that doesn't address the root cause is a future bug with a delay timer. Fix it right or escalate.
- Proposing a fix before you've traced the data flow. If you haven't followed the bad value to its source, you are guessing.
- Each fix reveals a new problem somewhere else. That's the signature of fixing at the wrong layer: you're pushing the symptom around instead of removing the cause.

---

## Phase 4: Implementation

Only once the root cause is confirmed by evidence.

1. **Fix the root cause, not the symptom.** The smallest change that eliminates the actual fault. If the session can be `undefined`, decide whether the real fix is to guarantee it isn't, or to handle the `undefined` case correctly, and fix at the layer where the contract is actually violated.

2. **Minimal diff.** Fewest files touched, fewest lines changed. Resist the urge to refactor adjacent code while you're in there. A tight diff is easy to review, easy to reason about, and easy to revert if you're wrong.

3. **Write a regression test** that:
   - **Fails without the fix** (run it against the unpatched code and watch it fail - this proves the test actually exercises the bug), and
   - **Passes with the fix** (proves the fix works).
   A regression test that doesn't fail before the fix is testing nothing. The fail-then-pass sequence is what makes it meaningful.

4. **Run the full test suite.** Confirm no regressions elsewhere. Read the output; don't assume green.

5. **If the fix touches many files** (say, more than about five), stop and flag the blast radius before proceeding. A large diff for a bug fix is a signal worth questioning. Either the root cause genuinely spans those files (fine, proceed knowingly), or the change is too broad and should be split into the critical path now plus the rest deferred, or there's a more targeted fix you haven't found yet. Make that call explicitly rather than sliding into a sprawling change.

---

## Phase 5: Verification and Report

**Fresh verification is not optional.** Reproduce the original bug scenario, exactly as it was reported, and confirm it is actually fixed. Not "should be fixed" - observed, with your own eyes, fixed. Then run the test suite and read the output.

Never say "this should fix it." Verify and prove it.

Produce a structured report:

```
DEBUG REPORT
════════════════════════════════════════
Symptom:         [what the user observed]
Root cause:      [what was actually wrong, and the mechanism]
Fix:             [what changed, with file:line references]
Evidence:        [test output, reproduction showing the fix works]
Regression test: [file:line of the new test]
Related:         [known-issue entries, prior bugs in same area, architectural notes]
Status:          DONE | DONE_WITH_CONCERNS | BLOCKED
════════════════════════════════════════
```

Status meanings:
- **DONE** - root cause found, fix applied, regression test written, full suite passes.
- **DONE_WITH_CONCERNS** - fixed, but you can't fully verify (e.g. an intermittent bug, or it needs staging to confirm). State the concern plainly.
- **BLOCKED** - root cause still unclear after real investigation. Escalate with what you tried and what you'd try next.

If the investigation surfaced a durable, non-obvious insight about this codebase (a pattern, a pitfall, an architectural weakness, a recurring fault line), write it down somewhere the next investigation will find it. Recurring bugs in the same area are the ones most worth documenting, because the next one is coming.

---

## Important Rules (the whole method in one screen)

- **No fixes without root cause.** This is the Iron Law. Everything else serves it.
- **3+ failed fix attempts → stop and question the architecture.** Wrong architecture, not just a wrong guess.
- **Never apply a fix you cannot verify.** If you can't reproduce and confirm, don't ship it.
- **Never say "this should fix it."** Prove it. Run the tests. Reproduce the original scenario.
- **Minimal diff.** Fix the cause, not the symptom; touch the fewest files; don't refactor adjacent code mid-debug.
- **Regression test that fails before and passes after.** No exceptions for "obvious" fixes.
- **Large blast radius → pause and reconsider** before proceeding.
- **Sanitize anything you search externally.** Strip hosts, IPs, paths, SQL, customer data; search the error category, not your private data.
