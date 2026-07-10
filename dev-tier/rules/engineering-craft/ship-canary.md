# Ship & Canary - From Feature Branch to Verified Production

> Adapted from gstack (github.com/garrytan/gstack, MIT). The portable ship-and-deploy craft, gstack runtime stripped.

This is the release craft in three acts: **ship** (merge base, test, review, version, changelog, bisectable commits, push, PR), **land and deploy** (merge the PR, wait for CI and deploy, with a readiness gate before the irreversible step), and **canary** (verify and monitor production after the deploy). The user says "ship it"; the next thing they should see is a verified release, not a list of questions.

The ship phase is mostly automated: do not ask for trivial confirmations ("ready to push?", "create the PR?"). DO stop for the things that genuinely need judgment: merge conflicts, failing tests, review findings that need a human call, MINOR/MAJOR version bumps, and anything irreversible.

---

## Iron Law

**NO COMPLETION CLAIMS WITHOUT FRESH VERIFICATION EVIDENCE.**

"Should work now" is not evidence. "I'm confident" is not evidence. "I already tested earlier" is not evidence when code changed since then. "It's a trivial change" is how trivial changes break production. Claiming work is complete without verification is dishonesty, not efficiency.

---

## Act 1: Ship

### Step 1: Pre-flight

1. Check the current branch. On the base/default branch? **Abort:** "Ship from a feature branch."
2. `git status` - uncommitted changes are always included in the ship; no need to ask.
3. `git diff <base>...HEAD --stat` and `git log <base>..HEAD --oneline` to understand what is being shipped.
4. **Review readiness:** has an architecture/plan review or code review been run on this branch, and is it still current (few or no commits since)? If no prior review exists, say so and run a pre-landing review as part of the ship (see the code-review craft). If the diff is large (>200 lines), recommend a full architecture review before shipping, but do not block: the ship's own review is the safety net.
5. **Distribution check:** if the diff introduces a new standalone artifact (CLI binary, library package) and no release/publish workflow exists, stop and ask: add a release pipeline now, defer to the TODO list, or confirm it is internal-only. Code without distribution is code nobody can use.

### Step 2: Merge the base branch BEFORE tests

```bash
git fetch origin <base> && git merge origin/<base> --no-edit
```

Tests must run against the MERGED state: your branch plus everything that landed on the base since you forked. Testing the unmerged branch answers a question nobody asked ("did my code work against last week's main?"). Auto-resolve trivial conflicts (VERSION, changelog ordering, generated schema files); stop and show anything complex or ambiguous.

### Step 3: Run tests (on the merged code)

Run the full suite. Read the output; do not assume green.

**If a test fails, triage ownership before stopping.** Not every red test is your red test:

- **In-branch failure** (your diff broke it): fix it now. Unfixed in-branch failures block the ship, always.
- **Pre-existing failure**: may be handled (fixed opportunistically, added to the TODO list, or consciously skipped) without blocking, but see the blame protocol below: pre-existing must be PROVEN, not assumed.

**The E2E blame protocol - "pre-existing without receipts is a lazy claim."** When an E2E or integration test fails during a ship, never claim "not related to our changes" without proving it. These systems have invisible couplings: a text change affects behavior, a new helper changes timing, regenerated files shift context. Required before attributing a failure to "pre-existing":

1. Run the SAME test on the base branch and show it fails there too.
2. If it passes on the base but fails on your branch: it IS your change. Trace the blame.
3. If you cannot run it on the base, say "unverified - may or may not be related" and flag it as a risk in the PR body.

Prove it or don't say it.

### Step 4: Version bump (scale-aware, auto-decide small, ask big)

The bump level is COMMUNICATION to the user about what kind of release this is. Don't undersell it.

- **PATCH**: bug fix, doc tweak, small additive change. No new user-facing capability.
- **MINOR**: new capability shipped (feature, module, migration, big refactor), substantial code reduction, or a user-visible feature you would put in a tweet. **ASK before bumping MINOR.**
- **MAJOR**: breaking change to a public surface (renamed flag, removed feature, changed config format), or a release big enough to headline a blog post. **Always ASK.**

Smell test: if you find yourself debating "is 10K lines added and 24K removed really a PATCH?", it isn't. Bump MINOR. Auto-pick PATCH silently for small diffs; the user only hears about it in the summary.

Merging the base does NOT mean adopting the base's version. If the base moved to a higher version while you worked, your branch still needs its OWN bump on top: your entry lands next.

### Step 5: CHANGELOG (the release rubric)

**The CHANGELOG is for users, never for contributors, and never for branch-internal narrative.**

The entry is the diff between the base branch and the shipping branch: what users GET when they upgrade, not how the branch got there. A reader should learn what they can do now that they couldn't before. They should NOT learn about branch-internal version bumps, mid-branch bug hunts, review outcomes, plan approvals, or squashed commits. That is development narrative; it belongs in PR descriptions and commit messages.

**Never reference branch-internal versions.** If the branch bumped v1.5.0 → v1.5.1 → v1.6.0 during development and only v1.6.0 ships, the entry must read as if v1.5.1 never existed. Consolidate all branch-internal entries into ONE entry at the final version. Version-number gaps on the released timeline are fine; do not back-fill them with placeholders.

**Structure of every version entry** (release summary first, itemized changes below):

1. **Two-line bold headline** (10-14 words total). Lands like a verdict, not marketing. Sound like someone who shipped today and cares whether it works.
2. **Lead paragraph** (3-5 sentences). What shipped, what changed for the user. Specific and concrete, no hype vocabulary.
3. **"The numbers that matter" section**: one short setup paragraph naming the SOURCE of the numbers (a real deployment or a reproducible benchmark, name the file or command), then a table of 3-6 key metrics with BEFORE / AFTER / delta columns, then 1-2 sentences interpreting the most striking number in concrete user terms. **Never make up numbers.** If a metric is not in a benchmark or production data, write "no measurement yet."
4. **"What this means for [audience]" closing** (2-4 sentences) tying the metrics to a real workflow shift. End with what to do.
5. Then `### Itemized changes` with Added / Changed / Fixed / Removed subsections. Always credit community contributions by name.

**The sell test:** every entry should make someone think "oh nice, I want to try that." Lead with what the user can now DO. "You can now..." beats "Refactored the...". No jargon: "every question now tells you which branch you're in", not "question format standardized via template resolver".

**Coverage cross-check:** enumerate every commit on the branch, group by theme, and verify every commit maps to at least one bullet. Infer content from the diff and commit history; never ask the user to describe their own changes.

**The honest empty entry:** if the diff has no user-facing change (only merges, only housekeeping), the entry is one sentence: "Version bump for release discipline. No user-facing changes yet." Stop there. Do not pad.

### Step 6: Bisectable commits

Small, logical commits that work with `git bisect` and help both humans and models understand what changed.

1. Group the diff into logical commits: one coherent change each. Not one file, one logical unit.
2. **Ordering** (earlier commits first): infrastructure (migrations, config, routes) → models and services (with their tests) → controllers and views (with their tests) → VERSION + CHANGELOG always in the final commit.
3. **Pairing rules:** a model and its test file share a commit; a service and its test share a commit; a migration is its own commit or grouped with the model it supports. If the total diff is small (<50 lines across <4 files), a single commit is fine.
4. **Each commit must be independently valid** - no broken imports, no references to code that does not exist yet. Order commits so dependencies come first.
5. Message format: `<type>: <summary>` (feat/fix/chore/refactor/docs), short body describing what the commit contains.

Good bisection also means: rename/move separate from behavior changes, mechanical refactors separate from new features, test infrastructure separate from test implementations.

### Step 7: Verification gate (before push)

If ANY code changed after the Step 3 test run (fixes from review findings; changelog edits don't count): **re-run the test suite and paste fresh output.** Stale output is not acceptable. If the project has a build step, run it. If tests fail here: STOP, do not push, fix and return to Step 3.

### Step 8: Push and PR

Never force push. Push with upstream tracking, then create the PR (or update its body if it already exists - re-running a ship is idempotent for actions, never for verifications). The PR title carries the version: `v<VERSION> <type>: <summary>`. The PR body summarizes what shipped, test results, review findings and how they were resolved, and any flagged risks (including "unverified" blame calls from Step 3).

---

## Act 2: Land and deploy

You are now a release engineer. The two worst feelings in software: the merge that breaks prod, and the merge that sits in a queue for 45 minutes while you stare at the screen. Handle both gracefully: merge efficiently, wait intelligently, verify thoroughly, give a clear verdict. Narrate what is happening so the user is never staring at silence.

### First-run dry-run validation

The FIRST time you deploy a given project (or when its deploy configuration changed since last time), do a dry run before anything irreversible:

1. Detect the deploy infrastructure: platform (Vercel, Fly, Heroku, Render, GitHub Actions workflow, custom), production URL, staging environment.
2. Validate each detected command actually works (auth status, platform CLI, curl the production URL) and build a validation table.
3. Show the user exactly what WILL happen, step by step, and ask: "Does this match how your project actually deploys?" Only proceed on confirmation. Save the confirmed configuration so subsequent runs skip the dry run - but re-trigger it automatically whenever the deploy config changes.

Validation failures are warnings, not blockers (except broken auth): "I couldn't reach that URL - I can still deploy, but I won't be able to verify health afterward."

### CI wait

Check CI status on the PR. Failing required checks: **STOP** - never merge code that has not passed CI. Pending: wait with a sensible timeout (15 minutes), polling at 30-second intervals, and report progress. Merge conflicts: STOP and hand back.

### Pre-merge readiness gate (the last stop before irreversible)

The merge cannot be undone without a revert commit, so gather ALL evidence and get explicit confirmation:

- **Review staleness:** when was the last review, and how many commits have landed since? 0 commits = CURRENT; 1-3 = RECENT; 4+ = STALE (the review was done on different code than what is about to merge). If commits after the review contain "fix", "refactor", "rewrite" or touch more than 5 files, flag as stale with significant changes. If the review is stale or missing, offer an inline quick review of the diff before proceeding.
- **Test results:** run the cheap tests now; check for recent E2E results. No E2E run today is a warning, failing free tests are a blocker.
- **PR body accuracy:** compare the PR description against the actual commits. Missing features, stale descriptions, and wrong version references are warnings.
- **Docs:** CHANGELOG and VERSION updated on the branch? New features without them is a warning.

Present the readiness report (reviews / tests / docs / PR body, with warnings and blockers counted), recommend, and let the user choose: merge, hold and fix warnings, or merge anyway with eyes open. If they hold, give specific next steps per warning.

### Merge

Prefer the repo's own merge settings (auto-merge and merge queues where enabled; squash otherwise). After ANY failed merge command, query the authoritative PR state before doing anything else - the server may have completed the merge even though the local command errored, or a queue may be processing. **Never retry a merge command blind.** If a merge queue is in use, explain it and poll until the PR actually merges. Capture the merge commit SHA: the revert path needs it.

### Deploy wait

Detect how this project deploys (CI workflow triggered by the merge, platform CLI status, auto-deploy platforms that just need ~60 seconds of propagation) and wait accordingly, reporting progress every couple of minutes. If the deploy workflow fails: offer A) investigate the logs, B) revert immediately, C) continue to health checks anyway (the failure might be a flaky step).

### The revert path (always available)

At every failure point, revert is an explicit option, explained in plain language:

```bash
git fetch origin <base>
git checkout <base>
git revert <merge-commit-sha> --no-edit
git push origin <base>
```

If branch protections block direct pushes, create a revert PR instead. After a successful revert: the deploy rolls back once CI passes; keep an eye on the site to confirm. Report the final status as REVERTED, never as a silent failure.

---

## Act 3: Canary - verify, then watch

You are watching production after a deploy. Deploys pass CI and still break in production: a missing environment variable, a CDN serving stale assets, a migration slower on real data. Catch these in the first 10 minutes, not 10 hours.

### Verification with conditional depth

Scale the check to what actually changed:

| Diff scope | Canary depth |
|------------|--------------|
| Docs only | Skip entirely - nothing to verify |
| Config only | Smoke: load the page, verify 200 |
| Backend only | Console errors + performance check |
| Frontend (any) | Full: console + performance + screenshot |
| Mixed | Full |

**Full canary sequence:** load the URL and confirm a 200 (not an error page); check the console for critical errors (Uncaught, TypeError, ReferenceError, Failed to load - ignore warnings); confirm load time is sane; confirm the page has real content (not blank, not a generic error screen); save an annotated screenshot as evidence.

All pass: report HEALTHY with the numbers. Any fail: show the evidence and ask: A) expected, still warming up - mark healthy; B) broken - revert; C) investigate before deciding.

### Post-deploy monitoring (the extended watch)

For higher-risk deploys, monitor for 10 minutes (configurable). Every 60 seconds, per page: load, screenshot, console check, performance check. Compare against the baseline:

1. **Page load failure** → CRITICAL alert
2. **New console errors** (not present in baseline) → HIGH alert
3. **Load time above 2x baseline** → MEDIUM alert
4. **New 404s** → LOW alert

Rules of the watch:
- **Alert on changes, not absolutes.** A page with 3 console errors in the baseline is fine if it still has 3. One NEW error is an alert.
- **Don't cry wolf.** Only alert on patterns that persist across 2+ consecutive checks. A single transient network blip is not an alert.
- **Every alert carries evidence:** timestamp, page, finding, screenshot path, baseline value, current value. On CRITICAL/HIGH, ask immediately: investigate / keep watching / rollback / dismiss as false positive.
- **Baseline is king.** Capture a baseline BEFORE deploying; without one, the canary is only a health check. After a healthy deploy, offer to promote the current state to the new baseline.

Close with a report: duration, pages, checks performed, per-page status, alerts fired, and a verdict (DEPLOY IS HEALTHY / DEPLOY HAS ISSUES with details).

---

## TODO maintenance (part of every ship)

Cross-reference the project's TODO list against what is being shipped:

- **Completed detection is conservative and automatic:** mark an item complete only when the diff clearly shows the work is done (commit messages match, referenced files changed, described work matches functional changes). If uncertain, leave it alone. Move completed items to a Completed section annotated with version and date.
- **New deferred work gets a full write-up.** Never append a vague bullet. Every TODO item carries:
  - **What:** one-line description of the work.
  - **Why:** the concrete problem it solves or value it unlocks.
  - **Pros:** what you gain by doing it.
  - **Cons:** cost, complexity, or risks of doing it.
  - **Where to start:** enough context that someone picking it up in 3 months understands the motivation, the current state, and the entry point. Plus priority (P0 blocking → P4 someday) and dependencies.

  A TODO without context is worse than no TODO: it creates false confidence that the idea was captured while actually losing the reasoning.

---

## Important Rules

- **Never skip tests. Never skip the review.** Failing tests stop the ship, full stop.
- **Merge the base BEFORE tests.** Test the merged state, not the stale branch.
- **Pre-existing needs receipts.** Run the failing check on the base branch before claiming "not my change."
- **Version bumps are communication.** Scale-aware; ask on MINOR/MAJOR; never undersell.
- **CHANGELOG is for users.** Verdict headline, real numbers with BEFORE/AFTER/delta, sell test, zero branch-internal narrative, zero invented metrics.
- **Split commits for bisectability.** One logical change each, independently valid, dependencies first.
- **Fresh verification before push.** Code changed after the test run means the test run happens again.
- **Never force push. Never retry a failed merge blind.** Query server state first.
- **First deploy = dry run + teacher mode.** Show the infrastructure, validate the commands, get confirmation. Repeat deploys = efficient mode.
- **Readiness gate before the irreversible merge.** Reviews, tests, docs, PR accuracy - evidence, then explicit confirmation.
- **Revert is always on the menu.** At every failure point, with the merge SHA in hand and plain-language explanation.
- **Canary depth follows diff scope.** Docs skip; frontend gets the full treatment; monitoring alerts on CHANGES vs baseline and never on single blips.
- **TODO items ship with What/Why/Pros/Cons/Where-to-start.** Completion marking stays conservative.
- **The goal:** the user says "ship it"; the next thing they see is the PR URL, and after landing, a verified production verdict.
