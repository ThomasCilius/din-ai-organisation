# Code Review Craft - Finding Production Bugs That Pass CI

> Adapted from gstack (github.com/garrytan/gstack, MIT). The portable code-review craft, gstack runtime stripped.

This is a pre-landing code review methodology. Its job is narrow and high-value: find the structural bugs a diff introduces that **tests and CI do not catch** - SQL safety, concurrency races, trust-boundary violations, enum gaps, silent data corruption - verify each finding is real, and hand the author an actioned result, not a wall of maybes.

It is not a linter and not a style pass. Style, formatting, and "could be cleaner" belong elsewhere. This review hunts for the class of defect that compiles, passes the test suite, gets approved, and then breaks in production.

---

## The core idea

CI runs your tests. Tests encode the behavior you thought of. Production bugs live in the behavior you *didn't* think of: the second concurrent request, the enum value added in the frontend but not the backend, the LLM output written straight to the database, the migration that locks a 10M-row table. A good diff review reads the change adversarially and asks, for every line: *how does this fail in production?*

Three disciplines make the review trustworthy:

1. **Read the full diff before commenting.** Never flag something the diff already fixes two hunks down.
2. **Verify every finding against real code** (the pre-emit gate below). A finding you can't quote the motivating line for is not a finding.
3. **Action every finding.** Mechanical fixes get applied; judgment calls get asked. A review that ends in "looks good overall" with a list of maybes is a review that gets ignored.

---

## Step 0 - Establish the review baseline (the diff)

The single most common source of false positives is a **stale or wrong diff base**. Get this right first.

1. Determine the base branch the change targets (the PR/MR target branch, or the repo default branch - `main`/`master`). Do not hardcode `main`.
2. Fetch the latest base so you don't flag things already fixed on it:
   ```bash
   git fetch origin <base> --quiet
   ```
3. Diff against the **merge base**, not the raw base tip. This includes both committed and uncommitted work while excluding commits that landed on the base *after* this branch forked:
   ```bash
   DIFF_BASE=$(git merge-base origin/<base> HEAD)
   git diff "$DIFF_BASE"
   ```
4. If there is no diff, or you are on the base branch itself, there is nothing to review. Stop.

Everywhere below, "the diff" means `git diff "$DIFF_BASE"`. Use `git diff "$DIFF_BASE" --stat` for the file-level shape and `git log <base>..HEAD --oneline` for intent.

---

## Step 1 - Scope / intent check (did they build what was asked?)

Before hunting bugs, check the change against its stated intent. This is informational - it doesn't block - but it catches two expensive classes of problem early.

Sources of stated intent, in order of reliability:
- A plan/spec/design doc for this work, if one exists.
- The PR/MR description.
- Commit messages (`git log <base>..HEAD --oneline`) - extract the *intent* behind actionable verbs (add, implement, fix, create, remove), skip noise (WIP, tmp, merge, chore, typo).
- A `TODOS.md` or task list in the repo root.

Then compare the files-changed against that intent:

- **Scope creep** - files or features changed that the intent never mentioned. "While I was in there..." changes expand the blast radius and hide real risk. Flag each out-of-scope change.
- **Missing requirements** - stated requirements not addressed in the diff, test-coverage gaps for stated requirements, partial implementations (started, not finished).

Output a one-block summary:

```
Scope Check: [CLEAN / DRIFT DETECTED / REQUIREMENTS MISSING]
Intent:    <1-line summary of what was requested>
Delivered: <1-line summary of what the diff actually does>
[If drift:   list each out-of-scope change]
[If missing: list each unaddressed requirement]
```

### Verifying completion honestly

When you check whether each intended item actually shipped, classify *how* it can even be verified - the diff cannot prove everything:

- **Diff-verifiable** - a code change in this repo would show up in the diff. Cross-reference directly.
- **Cross-repo** - the item names a file in another repo. If that repo is reachable on disk, check `[ -f <path> ]`; otherwise it is unverifiable.
- **External-state** - the item names state in an external system (DNS, env vars, a SaaS config, an auth allowlist). The diff *cannot* prove this. Mark it unverifiable and cite the exact manual check the user must perform.

Per-item verdicts: **DONE** (cite the file/evidence), **PARTIAL** (work exists but incomplete), **NOT DONE** (verification produced negative evidence), **CHANGED** (goal met by a different approach than planned - note the difference), **UNVERIFIABLE** (diff can't prove it - cite the manual check).

Honesty rules:
- **Be conservative with DONE.** A file being touched is not evidence the described functionality is present. Code that *handles* a deliverable is not the deliverable - shipping a markdown-extraction library is not shipping the markdown file.
- **Be generous with CHANGED.** If the goal is met by different means, that counts.
- **Be honest with UNVERIFIABLE.** Better to surface five items the user must confirm than to silently call them DONE. If a plan names a *concrete* path, you must resolve it to DONE/NOT DONE via `[ -f <path> ]` - "I didn't want to check" is not "unverifiable."

For each PARTIAL or NOT DONE item worth escalating, investigate *why* (scope cut, ran out of context mid-way, misunderstood the requirement, blocked by a dependency, or simply forgotten) and state the impact:

```
DISCREPANCY:   {PARTIAL|NOT_DONE} | {item} | {what was actually delivered}
INVESTIGATION: {likely reason, with evidence from git log / code}
IMPACT:        {HIGH|MEDIUM|LOW} - {what breaks or degrades if this stays undelivered}
```

HIGH-impact discrepancies are the one place the scope check gates: stop and ask whether to (A) implement the missing items now, (B) ship anyway and file follow-up tasks, or (C) confirm it was intentionally dropped.

---

## Step 2 - Critical pass (the core bug hunt)

Read the diff against the critical categories below. These are the highest-severity, production-breaking classes. Be specific: cite `file:line`, name the failure mode, suggest the fix. Skip anything that's fine.

### SQL & Data Safety
- **String interpolation in SQL** - even when values look sanitized (`.to_i`/`.to_f`). Use parameterized queries: Rails `sanitize_sql_array`/Arel, Node prepared statements, Python parameterized queries.
- **TOCTOU races** - check-then-set patterns that should be a single atomic `WHERE` + update.
- **Bypassing model validations** on direct DB writes - Rails `update_column`, Django `QuerySet.update()`, Prisma raw queries.
- **N+1 queries** - missing eager loading (Rails `.includes()`, SQLAlchemy `joinedload()`, Prisma `include`) for associations used in loops or views.

### Race Conditions & Concurrency
- **Read-check-write without a uniqueness constraint** - `where(hash:).first` then `save!` with no handling for a concurrent insert. Either add the DB constraint, or catch the duplicate-key error and retry.
- **find-or-create without a unique index** - concurrent calls create duplicates.
- **Status transitions that aren't atomic** - must be `WHERE old_status = ? UPDATE SET new_status`. Without the guard, concurrent updates skip or double-apply the transition.
- **Unsafe HTML rendering on user-controlled data (XSS)** - Rails `.html_safe`/`raw()`, React `dangerouslySetInnerHTML`, Vue `v-html`, Django `|safe`/`mark_safe`.

### LLM Output Trust Boundary
Treat model output as untrusted input crossing a boundary.
- **LLM-generated values** (emails, URLs, names) written to the DB or passed to mailers **without format validation**. Add lightweight guards (`EMAIL_REGEXP`, `URI.parse`, `.strip`) before persisting.
- **Structured tool output** (arrays, hashes) accepted **without type/shape checks** before a DB write.
- **LLM-generated URLs fetched without an allowlist** - SSRF risk if the URL points at the internal network. Parse the hostname and check it against a blocklist before fetching.
- **LLM output stored in a knowledge base or vector DB without sanitization** - stored prompt-injection risk.

### Shell Injection
- `subprocess.run()`/`call()`/`Popen()` with `shell=True` **and** f-string/`.format()` interpolation in the command - use argument arrays instead.
- `os.system()` with variable interpolation - replace with `subprocess.run()` and an argument array.
- `eval()`/`exec()` on model-generated or user-generated code without sandboxing.

### Enum & Value Completeness
**This is the one category where reviewing only the diff is insufficient - you must read code outside the diff.** When the diff introduces a new enum value, status string, tier name, or type constant:
- **Trace it through every consumer.** Grep for the sibling values, then *read* (not just grep) each file that switches on, filters by, or displays the enum. If any consumer doesn't handle the new value, flag it. The classic miss: added to the frontend dropdown, never persisted by the backend model/compute method.
- **Check allowlists / filter arrays.** Find every list of sibling values (e.g. `%w[quick lfg mega]`) and verify the new value is included where it needs to be.
- **Check `case`/`if-elsif` chains.** Does the new value fall through to a wrong default?

---

## Step 3 - Informational pass (lower severity, still actioned)

Same diff, lower-severity categories. Worth fixing, rarely worth blocking.

### Async/Sync Mixing
- Synchronous `subprocess.run()`, `open()`, `requests.get()` inside `async def` - blocks the event loop. Use `asyncio.to_thread()`, `aiofiles`, or an async HTTP client.
- `time.sleep()` in async code - use `asyncio.sleep()`.
- Sync DB calls in async context without executor wrapping.

### Column / Field Name Safety
- Verify column names in ORM queries (`.select()`, `.eq()`, `.gte()`, `.order()`) against the actual schema - a wrong column name silently returns empty results or throws a swallowed error.
- Check `.get()` calls use the column name that was actually selected.

### Version / Changelog Consistency
- Version mismatch between the PR title and the VERSION/CHANGELOG files.
- CHANGELOG entries that describe changes inaccurately ("changed from X to Y" when X never existed).

### LLM Prompt Issues
- 0-indexed lists in prompts (models reliably return 1-indexed).
- Prompt text listing tools/capabilities that don't match what's actually wired up.
- Word/token limits stated in multiple places that can drift apart.

### Completeness Gaps
- Shortcut implementations where the complete version would cost little extra effort (partial enum handling, incomplete error paths, straightforward missing edge cases).
- Test-coverage gaps that mirror existing structure (missing negative-path or edge-case tests alongside a covered happy path).
- Features shipped at 80-90% when 100% is achievable with modest additional code.

### Time Window Safety
- Date-key lookups that assume "today" covers 24h - a report at 08:00 under today's key only sees midnight→08:00.
- Mismatched time windows between related features - one uses hourly buckets, another daily keys, for the same data.

### Type Coercion at Boundaries
- Values crossing language→JSON→language boundaries where the type can change (numeric vs string) - hash/digest inputs must normalize types first. `{ cores: 8 }` and `{ cores: "8" }` produce different hashes.

### View / Frontend
- Inline `<style>` blocks in partials (re-parsed every render).
- O(n·m) lookups in views (`Array#find` in a loop where an indexed hash would do).
- Application-side `.select{}` filtering on DB results that could be a `WHERE` clause (unless deliberately avoiding a leading-wildcard `LIKE`).

### Distribution & CI/CD Pipeline
- Workflow changes: build-tool versions match project requirements, artifact names/paths are correct, secrets referenced as secrets (never hardcoded).
- New artifact types (CLI binary, library, package): a publish/release path exists and targets the right platforms.
- Cross-platform builds: the CI matrix covers all target OS/arch, or documents which are untested.
- Version tag format consistency (`v1.2.3` vs `1.2.3`) across the VERSION file, git tags, and publish scripts.
- Publish idempotency: re-running the publish workflow must not fail.
- **Do NOT flag:** web services with existing auto-deploy pipelines, internal-only tools, or test-only CI changes.

---

## Step 4 - Specialist passes (parallel, fresh context)

For larger or higher-surface diffs, run dedicated specialist reviews *in parallel with fresh context* - no bias from the primary pass. Each specialist reads the same diff and applies one focused checklist. Gate them by scope so you don't waste effort:

- **Testing** and **Maintainability** - run on every non-trivial diff (roughly 50+ changed lines).
- **Security** - when auth/authz is touched, or a backend change exceeds ~100 lines.
- **Performance** - when backend or frontend code changes.
- **Data Migration** - when migrations change.
- **API Contract** - when a public API surface changes.
- **Red Team** - the adversarial catch-all; run it when the diff is large (200+ lines) or any specialist produced a critical finding. It runs *after* the others and hunts what they missed.

Small diffs skip specialists entirely - the critical/informational passes plus an adversarial read are enough coverage.

Each specialist emits structured findings (one per finding) with: severity (CRITICAL/INFORMATIONAL), a confidence score, `path`, `line`, category, a one-line summary, and a recommended fix. Where the specialist can write a test that would catch the bug, it includes a minimal test skeleton.

### Merging specialist findings
- **Deduplicate by fingerprint** (`path:line:category`). When two specialists independently flag the same fingerprint, keep the higher-confidence version, tag it **multi-specialist confirmed**, and bump confidence (agreement across independent reviewers is strong signal).
- Apply the confidence gates (below) uniformly.
- A simple health signal for the whole diff: `quality_score = max(0, 10 − (critical_count·2 + informational_count·0.5))`, capped at 10.

### Testing specialist
- **Missing negative-path tests** - new error/rejection/invalid-input paths, guard clauses, early returns, catch/rescue branches, and auth "denied" cases with no test.
- **Missing edge-case coverage** - zero, negative, max-int, empty string, empty array, null; single-element collections (off-by-one); unicode/special chars; concurrent-access patterns.
- **Test isolation violations** - shared mutable state, order-dependent tests, tests depending on clock/timezone/locale, tests making real network calls instead of stubbing.
- **Flaky patterns** - timing-dependent assertions (sleep/tight waitFor), assertions on unordered results (hash keys, set iteration, async resolution order), dependence on external services, randomized data without a seed.
- **Security enforcement tests missing** - authz with no "unauthorized" test, rate limiting with no test proving it blocks, sanitization with no malicious-input test, CSRF/CORS with no integration test.
- **Coverage gaps** - new public methods with zero coverage; changed methods where existing tests only cover the old behavior; utilities tested only indirectly.

### Maintainability specialist
- **Dead code & unused imports** - assigned-but-never-read variables, defined-but-never-called functions (grep the repo), now-unreferenced imports, commented-out blocks.
- **Magic numbers & string coupling** - bare numeric literals in logic (thresholds, limits, retry counts) → named constants; error strings reused as query filters; hardcoded URLs/ports/hostnames that belong in config; duplicated literals across files.
- **Stale comments & docstrings** - comments describing pre-change behavior, TODO/FIXME referencing completed work, docstrings whose params don't match the signature, ASCII diagrams that no longer match the flow.
- **DRY violations** - repeated 3+ line blocks within the diff, copy-paste that wants a shared helper, duplicated test setup, repeated conditional chains that want a lookup table.
- **Conditional side effects** - a branch that forgets a side effect the sibling branch performs; a log message claiming an action that was conditionally skipped; a state transition that updates related records on one branch but not the other; events that only fire on the happy path.
- **Module boundary violations** - reaching into another module's internals, raw DB queries in controllers/views that should go through a service, tight coupling that should be an interface.

### Security specialist (deeper than the critical pass)
- **Input validation at trust boundaries** - unvalidated user input at the handler; query params used directly in queries or file paths; request-body fields with no type/schema check; file uploads without type/size/content validation; webhook payloads processed without signature verification.
- **Auth & authorization bypass** - endpoints missing auth middleware; authz that defaults to "allow"; role-escalation paths (user edits their own role); insecure direct object references (change an ID, read someone else's data); session fixation/hijacking; token validation that skips expiration.
- **Injection beyond SQL** - command injection, template injection (Jinja2/ERB/Handlebars), LDAP injection, SSRF via user-controlled URLs, path traversal, HTTP header injection.
- **Cryptographic misuse** - MD5/SHA1 for security-sensitive ops, predictable randomness (`Math.random`/`rand()`) for tokens, non-constant-time comparison of secrets, hardcoded keys/IVs, missing salt.
- **Secrets exposure** - keys/tokens/passwords in source (even comments), secrets in logs or error messages, credentials in URLs, sensitive data in error responses, PII stored plaintext.
- **XSS via escape hatches** - `.html_safe`/`raw()`, `dangerouslySetInnerHTML`, `v-html`, `|safe`/`mark_safe`, raw `innerHTML` on unsanitized data.
- **Deserialization** - deserializing untrusted data (pickle, Marshal, `YAML.load`, `JSON.parse` of executable types); accepting serialized objects from users/external APIs without schema validation.

### Performance specialist
- **N+1 queries** - ORM associations traversed in loops without eager loading; queries inside iteration that could batch; nested serializers triggering lazy loads; GraphQL resolvers querying per-field instead of via a batching loader.
- **Missing indexes** - new WHERE/ORDER BY on unindexed columns; composite queries without composite indexes; new foreign keys without indexes.
- **Algorithmic complexity** - O(n²)+ patterns (nested loops, `find` inside `map`); repeated linear scans that want a hash/set; string concatenation in loops; sorting/filtering the same large collection repeatedly.
- **Bundle size (frontend)** - known-heavy new deps (moment, full lodash, jquery); barrel imports instead of deep imports; large unoptimized assets; missing route-level code splitting.
- **Rendering (frontend)** - fetch waterfalls that could be `Promise.all`; re-renders from unstable references (new objects/arrays in render); missing memoization on expensive computation; layout thrashing (read-then-write DOM in a loop); missing `loading="lazy"` on below-fold images.
- **Missing pagination** - list endpoints returning unbounded results; queries without LIMIT that grow with data; responses embedding full nested objects instead of IDs.
- **Blocking in async contexts** - sync I/O inside async functions; `sleep` inside event-loop handlers; CPU-bound work blocking the main thread with no worker offload.

### Data Migration specialist
- **Reversibility** - can it roll back without data loss? Is there a real down migration (not a no-op)? Would rolling back break the current app code?
- **Data loss risk** - dropping columns that still hold data (deprecate first); type changes that truncate; removing tables still referenced; renaming columns without updating every reference (ORM, raw SQL, views); adding NOT NULL to a column with existing NULLs (backfill first).
- **Lock duration** - `ALTER TABLE` / index creation on large tables without `CONCURRENTLY`; multiple ALTERs that could share one lock; schema changes during peak traffic.
- **Backfill strategy** - new NOT NULL columns without a DEFAULT; computed defaults needing batch population; missing backfill script; backfill that updates all rows at once instead of batching.
- **Multi-phase safety** - migrations that must deploy in a specific order relative to code; schema changes that break currently-running code (deploy code first, then migrate); old-code + new-schema crash windows during a rolling deploy; missing feature flag for the mixed state.

### API Contract specialist
- **Breaking changes** - removed response fields, changed field types, new required params on existing endpoints, changed HTTP methods/status codes, renamed endpoints without an alias, changed auth requirements (public → authenticated).
- **Versioning strategy** - breaking changes without a version bump; mixed versioning strategies (URL vs header vs query); deprecated endpoints without a sunset/migration path.
- **Error response consistency** - new endpoints returning a different error shape; missing standard error fields; status codes that don't match the error type; error messages leaking internals (stack traces, SQL).
- **Rate limiting & pagination** - new endpoints missing rate limits that peers have; pagination scheme changes without backwards compatibility; changed page sizes/defaults without docs; missing total-count/next-page indicators.
- **Documentation drift** - OpenAPI/Swagger not updated; API docs describing old behavior; examples that no longer work.
- **Backwards compatibility** - will older clients break? Can't-force-update mobile apps? Changed webhook payloads without notifying subscribers? SDK changes required?

### Red Team pass (adversarial catch-all)
Not a checklist - adversarial analysis. Given the other specialists' findings, find what they **missed**. Think like an attacker, a chaos engineer, and a hostile QA tester at once.
- **Attack the happy path** - 10× normal load; two requests hitting the same resource simultaneously; a slow database (>5s query); an external service returning garbage.
- **Find the silent failures** - catch-all handlers that swallow exceptions with just a log; operations that partially complete then crash (3 of 5 items processed); state transitions that leave records inconsistent on failure; background jobs that fail without alerting.
- **Exploit trust assumptions** - data validated on the frontend but not the backend; internal APIs called without auth ("only our code calls this"); config values assumed present but never validated; paths/URLs built from user input without sanitization.
- **Break the edge cases** - maximum input size; zero items, empty strings, nulls; the very first run (no existing data); the user clicking the button twice in 100ms.
- **Find the gaps between categories** - cross-category issues (a perf bug that's also a security bug); integration-boundary issues where two systems meet; issues that only manifest in a specific deployment config.

---

## Step 5 - Independent adversarial read (always)

Beyond the checklists, give every diff at least one **fresh-context adversarial pass** - a reviewer that hasn't seen the structured checklist, so it isn't anchored by it. This genuine independence catches what the primary reviewer is blind to. If you have access to a second model, run it too and compare - cross-model agreement is your highest-confidence signal.

The adversarial brief:

> Read the diff. Think like an attacker and a chaos engineer: find the ways this code fails in production. Look for edge cases, race conditions, security holes, resource leaks, failure modes, silent data corruption, logic errors that produce wrong results silently, error handling that swallows failures, and trust-boundary violations. Be adversarial and thorough. No compliments - just the problems. For each finding, classify it FIXABLE (you know the fix) or INVESTIGATE (needs human judgment). End with one line: `Recommendation: <action> because <one-line reason naming the single most exploitable finding>`. A generic reason ("because it's safer") does not qualify - point at a specific finding, or give a concrete no-fix rationale.

FIXABLE findings flow into the fix pipeline; INVESTIGATE findings are surfaced as informational.

**When the diff contains security test fixtures / attack-pattern corpora:** review those files in *summary mode* - note that they changed and what they cover, but don't pull their raw payloads into your adversarial reasoning or expand on exploit content. State that fixtures were reviewed in summary mode, so the reduced depth is visible rather than silent.

### Cross-source synthesis
After all passes, synthesize:

```
ADVERSARIAL REVIEW SYNTHESIS
════════════════════════════════════════════
  High confidence (found by >1 source): ...
  Unique to structured review:          ...
  Unique to adversarial pass:           ...
  Unique to second model (if run):      ...
════════════════════════════════════════════
```

Prioritize the findings that multiple independent sources agree on.

---

## Confidence calibration & the pre-emit verification gate

**Every finding carries a confidence score, 1-10.** This is what separates a useful review from a noise generator.

| Score | Meaning | Display rule |
|-------|---------|--------------|
| 9-10 | Verified by reading the specific code. Concrete bug or exploit demonstrated. | Show normally |
| 7-8  | High-confidence pattern match. Very likely correct. | Show normally |
| 5-6  | Moderate. Could be a false positive. | Show with caveat: "medium confidence, verify" |
| 3-4  | Low. Suspicious but may be fine. | Suppress from the main report; appendix only |
| 1-2  | Speculation. | Only report if the severity would be catastrophic |

**Finding format:**

```
[SEVERITY] (confidence: N/10) file:line - description
```

Examples:
```
[P1] (confidence: 9/10) app/models/user.rb:42 - SQL injection via string interpolation in where clause
[P2] (confidence: 5/10) app/controllers/users_controller.rb:18 - possible N+1, verify against production logs
```

### The pre-emit gate (kills the "field doesn't exist" false-positive class)

Before any finding is promoted into the report, you must be able to **quote the specific code line(s) that motivate it** - `file:line` plus the verbatim text that triggered the finding:

- "Field X doesn't exist on model Y" → quote the class body of Y where the field would live.
- "`dict.get()` might return None" → quote the dict's initialization.
- "Race condition between A and B" → quote both A and B.

**If you cannot quote the motivating line, the finding is unverified.** Force its confidence to 4-5 so it drops out of the main report (keep it in an appendix for calibration audit). Do not manufacture a confidence of 7+ to route around the gate - that defeats it.

**Framework-generated symbols:** when the symbol comes from a framework metaclass, descriptor, ORM inner `Meta` class, decorator, or migration history (Django `Meta`, Rails `has_many`/`scope`, SQLAlchemy `relationship`/`Column`, TypeORM decorators, Sequelize `init`/`belongsTo`, Prisma generated client), quote the *construct that creates the symbol* (the `Meta` block, the migration, the decorator, the schema file) rather than expecting the literal name in the class body. Verification means "I read the source that creates this symbol," not "I grepped for the name and didn't find it."

This gate specifically kills the false-positive classes that look plausible but evaporate on inspection: "field doesn't exist on model," "`dict.get()` might be None" (when the dict is `{}`-initialized), "`save()` might lose fields," "`update_fields` might miss X."

### Calibration learning
If you report a finding below confidence 7 and it turns out to be a **real** issue, that's a signal your calibration was too low for that pattern. Note the corrected pattern so future reviews catch it at higher confidence. Compounding calibration is how the review gets sharper on a given codebase over time.

---

## Verification of claims (before you finalize)

Every reassuring claim needs a citation, exactly like every finding does:

- Claim "this pattern is safe" → cite the specific line proving it.
- Claim "this is handled elsewhere" → read and cite the handling code.
- Claim "tests cover this" → name the test file and method.
- Never write "likely handled" or "probably tested." Verify, or flag as unknown.

**Rationalization prevention:** "This looks fine" is not a finding and not a clearance. Either cite the evidence that it *is* fine, or flag it unverified. A confident-sounding dismissal with no citation is the same failure mode as a confident-sounding false positive.

---

## Fix-First: every finding gets an action

A review that only lists problems makes the author do the sorting. Instead, classify each finding and act:

**AUTO-FIX** (apply directly, no need to ask - a senior engineer would make this change without discussion):
- Dead code / unused variables
- N+1 queries (add the eager load)
- Stale comments contradicting the code
- Magic numbers → named constants
- Missing LLM-output validation guards
- Version / path mismatches
- Inline styles, O(n·m) view lookups

**ASK** (needs human judgment - reasonable engineers could disagree):
- Security-sensitive changes (auth, XSS, injection)
- Race conditions
- Design decisions
- Large fixes (>~20 lines)
- Enum completeness
- Removing functionality
- Anything changing user-visible behavior

**Rule of thumb:** if the fix is mechanical and uncontroversial, auto-fix it. If reasonable engineers could disagree, ask. Critical findings lean toward ASK (they're riskier); informational findings lean toward AUTO-FIX (they're more mechanical). Any finding that comes with a proposed *test* is always an ASK - show the test path and code and let the author approve writing it.

**Batch the ASK items into one decision**, not a drip of questions:

```
I auto-fixed 5 issues. 2 need your input:

1. [CRITICAL] app/models/post.rb:42 - Race condition in status transition
   Fix: add `WHERE status = 'draft'` to the UPDATE
   → A) Fix   B) Skip

2. [INFORMATIONAL] app/services/generator.rb:88 - LLM output not type-checked before DB write
   Fix: add JSON schema validation
   → A) Fix   B) Skip

RECOMMENDATION: fix both - #1 is a real race, #2 prevents silent data corruption.
```

Auto-fixed items get a one-line log each: `[AUTO-FIXED] file:line Problem → what you did`.

**A review that has skipped a finding once should not re-nag about it** if the relevant code hasn't changed since - but a *fixed* finding always gets re-checked in case it regressed.

The review applies fixes; it does not commit, push, or open PRs. That's a separate, deliberate step.

---

## Adjacent checks worth folding in

- **Task/TODO cross-reference** - does this change close any open tracked items? Does it create work that should become one? Note it.
- **Documentation staleness** - for each root doc (README, ARCHITECTURE, CONTRIBUTING, etc.), if the code it describes changed in this diff but the doc didn't, flag it informational: "docs may be stale - [file] describes [feature] but the code changed."

---

## Output format

```
Pre-Landing Review: N issues (X critical, Y informational)

AUTO-FIXED:
- [file:line] Problem → fix applied

NEEDS INPUT:
- [file:line] Problem description
  Recommended fix: suggested fix
```

If nothing is wrong: `Pre-Landing Review: No issues found.`

Be terse. One line for the problem, one line for the fix. No preamble, no "looks good overall," no summaries.

---

## Suppressions - do NOT flag these

These are the recurring false positives that erode trust in a review. Leave them alone:

- "X is redundant with Y" when the redundancy is harmless and aids readability.
- "Add a comment explaining why this threshold/constant was chosen" - thresholds get tuned, comments rot.
- "This assertion could be tighter" when it already covers the behavior.
- Consistency-only changes (wrapping a value to match how another constant happens to be guarded).
- "Regex doesn't handle edge case X" when the input is constrained and X never occurs in practice.
- "This test exercises multiple guards at once" - tests don't need to isolate every guard.
- Empirically-tuned threshold changes (they change constantly by design).
- Harmless no-ops.
- **Anything already addressed in the diff you're reviewing** - which is why you read the full diff before commenting.

---

## The rules that hold the whole thing together

- **Read the full diff before commenting.** Don't flag what the diff already fixes.
- **Verify or flag as unknown - never rationalize.** Cite the line, or lower the confidence.
- **Fix-first, not read-only.** Auto-fix the mechanical; ask about the judgment calls. Don't commit or push - that's a separate step.
- **Be terse.** One line problem, one line fix.
- **Only flag real problems.** Skip anything that's fine. A review with three verified findings beats a review with thirty maybes.
