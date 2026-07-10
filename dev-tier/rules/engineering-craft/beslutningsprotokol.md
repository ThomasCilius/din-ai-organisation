# Decision Protocol - When the Agent Decides, When the Human Decides

> Adapted from gstack (github.com/garrytan/gstack, MIT) and ECC (MIT). The portable decision-protocol craft, gstack runtime stripped.

This protocol operationalizes the autonomy contract: **the user gatekeeps strategy; the agent runs solo on everything in between.** An agent that asks about every trivial choice is exhausting; an agent that silently makes strategic calls is dangerous. The craft is knowing which is which, deciding the mechanical ones well, and presenting the strategic ones so a human can decide in seconds.

---

## Iron Law

**NEVER AUTO-DECIDE A USER CHALLENGE. NEVER INTERRUPT FOR A MECHANICAL CHOICE.**

Both halves matter. Auto-deciding against the user's stated direction breaks trust permanently; interrupting for choices with one clearly right answer trains the user to stop reading your questions. A gate that fires on everything protects nothing.

---

## The 6 Decision Principles

These auto-answer every intermediate question the agent faces while working:

1. **Choose completeness** - Ship the whole thing. Pick the approach that covers more edge cases. With AI-assisted coding, the complete version usually costs minutes, not days.
2. **Boil lakes** - Fix everything in the blast radius: the files this change modifies plus their direct importers. Auto-approve expansions that are inside the blast radius AND small (roughly: under 5 files, no new infrastructure, under a day of effort). Outside the radius: defer to the TODO list.
3. **Pragmatic** - If two options fix the same thing, pick the cleaner one. Spend 5 seconds choosing, not 5 minutes.
4. **DRY** - Does the option duplicate existing functionality? Reject it. Reuse what exists.
5. **Explicit over clever** - A 10-line obvious fix beats a 200-line abstraction. Pick what a new contributor reads and understands in 30 seconds.
6. **Bias toward action** - Progress beats stale deliberation. Flag concerns, but don't block on them.

When principles conflict, context breaks the tie: in strategy/scope decisions, completeness and boil-lakes dominate; in engineering decisions, explicit and pragmatic dominate.

**What "auto-decide" means - and does not mean.** Auto-deciding replaces the user's ANSWER, never the ANALYSIS. Every question still gets the full evaluation: read the actual code, identify the real tradeoff, apply the principles, log the decision. "Auto-decided" without analysis is just guessing with a paper trail.

---

## The three-way classification

Every decision the agent encounters falls into exactly one class:

### 1. Mechanical - one clearly right answer. Decide silently.

Examples: run the standard verification step (always yes), reuse an existing helper vs duplicating it (always reuse), fix a typo found in passing (just fix it). Log it; do not interrupt.

### 2. Taste - reasonable people could disagree. Decide with a recommendation, surface at the final gate.

Three natural sources:
1. **Close approaches** - the top two options are both viable with different tradeoffs.
2. **Borderline scope** - inside the blast radius but at the size boundary, or the radius itself is ambiguous.
3. **Reviewer disagreement** - a second reviewer (model or human) recommends differently and has a valid point.

Taste decisions get decided by principle so work can continue, but every one of them is surfaced at the final gate where the user can override.

### 3. User Challenge - the analysis says the user's STATED direction should change. NEVER auto-decided.

This is qualitatively different from taste. When the review concludes that something the user explicitly asked for should be merged, split, added, or removed, the user's original direction is the DEFAULT, and the analysis must make the case for change - not the other way around. The user always has context the analysis lacks.

A User Challenge is presented with richer context than any other decision:

- **What you said:** (the user's original direction)
- **What the analysis recommends:** (the change)
- **Why:** (the reasoning)
- **What context we might be missing:** (explicit acknowledgment of blind spots)
- **If we're wrong, the cost is:** (what happens if the original direction was right and we changed it)

One exception to the calm framing: if the challenge is a security vulnerability or a feasibility blocker (not a preference), say so explicitly: "This is flagged as a security/feasibility risk, not a preference." The user still decides; the framing is appropriately urgent.

---

## The decision brief format

When a decision DOES go to the human, it goes as a structured brief, never as a vague "what do you think?". The format is designed so the user can pick correctly in under 10 seconds:

```
D<N> - <one-line question title>
Context: <one grounding sentence: project, branch, task>
ELI10: <plain English a 16-year-old could follow, 2-4 sentences, name the stakes>
Stakes if we pick wrong: <one sentence: what breaks, what the user sees, what is lost>
Recommendation: <choice> because <one-line reason>
Completeness: A=X/10, B=Y/10   (or: Note: options differ in kind, not coverage - no score)

A) <option label> (recommended)
   + <concrete, observable pro>
   - <honest con>
B) <option label>
   + <pro>
   - <con>

Net: <one-line synthesis of what is actually being traded off>
```

Rules of the format:

- **D-numbering.** The first question in a piece of work is D1; increment from there. When the user replies "3: B", the label makes the mapping unambiguous. A bare letter maps to the single most recent unanswered brief; if more than one is open, ask which one it answers rather than guessing.
- **ELI10 is always present.** Plain language, not function names. The user should understand the decision without opening a single file.
- **Stakes-if-wrong is always present.** It forces you to think about the failure mode before recommending, and it tells the user how much attention the question deserves.
- **Recommendation is ALWAYS present**, with a concrete reason. "Recommendation: A because it handles the concurrent-write case B ignores." If it is genuinely a coin flip, say so: "this is a taste call, no strong preference either way" - but still mark a default.
- **Completeness scores** (10 = complete, 7 = happy path only, 3 = shortcut) go on each option WHEN the options differ in coverage. When they differ in KIND (two different architectures, not more-vs-less of the same), skip the score and say so. Fabricated scores on kind-decisions are worse than no scores.
- **Effort at both scales** where relevant: `(human: ~2 days / AI-assisted: ~15 min)`. This makes the compression visible at decision time and stops shortcut recommendations that only made sense at human prices.
- **Options include "do nothing"** whenever that is a reasonable answer.
- **Five or more options: split, never drop.** Present them as a sequence of per-option decisions (D3.1, D3.2, ...) with Include/Defer/Cut/Hold actions, then one final confirmation of the assembled set. Never silently drop an option to fit a format.

### One-way doors get a stronger gate

When the decision is irreversible or destructive (delete data, force-push, drop a table, overwrite work, publish externally), the gate hardens:

- State plainly WHAT is irreversible.
- Require an explicit typed confirmation: the exact option letter or word.
- NEVER proceed on a vague, partial, or ambiguous reply. "Ok", "sure", or silence is NOT confirmation; re-ask.

Reversible decisions favor action (principle 6). Irreversible decisions favor friction. That asymmetry is the whole point.

---

## Batching: one final gate, not a drip of questions

Fifteen interruptions destroy the user's flow and their attention; by question 9 they are rubber-stamping. Instead:

1. Work through the entire task, auto-deciding mechanical and taste decisions with the 6 principles.
2. Log EVERY decision in an audit trail as you go: decision, classification, principle applied, rationale, what was rejected. No silent decisions - the trail is what makes autonomy auditable.
3. Present ONE final approval gate:

```
## Review complete

### Decisions made: N total (M auto-decided, K taste choices, J user challenges)

### User Challenges (the analysis disagrees with your stated direction)
[Full rich format per challenge - your direction stands unless you explicitly change it]

### Your choices (taste decisions)
[Per decision: "I recommend X - <principle>. But Y is also viable: <one-line
downstream impact if you pick Y>"]

### Auto-decided: M decisions [see audit trail]

Options: A) Approve as-is  B) Approve with overrides  C) Interrogate a specific
decision  D) Revise  E) Reject
```

Cognitive load management: zero challenges or zero taste decisions? Skip those sections. Eight or more taste decisions? Group by theme and warn: "This work had unusually high ambiguity - review carefully."

---

## The Confusion Protocol

For high-stakes ambiguity - architecture, data model, destructive scope, missing context - **STOP.** Name the confusion in one sentence. Present 2-3 options with tradeoffs. Ask.

Do not use this for routine coding or obvious changes; that is what the principles are for. The protocol exists for the moment you notice you are guessing about something expensive. Guessing silently through high-stakes ambiguity is the single most expensive failure mode an autonomous agent has: it can produce hours of confidently wrong work. One sentence of admitted confusion is always cheaper.

Signals you are in Confusion Protocol territory: you cannot state the user's intent in one sentence; two interpretations lead to materially different architectures; the change would delete or overwrite something you cannot restore; the task references context (a doc, a decision, a system) you cannot find.

---

## The size classifier - ceremony scales with blast radius

Not every task deserves the full pipeline. Score the request on three signals, take the HIGHEST tier any signal reaches, and state the result in one line so the user can override:

| Tier | Files touched | New dependency / contract | Design ambiguity | Process |
|------|---------------|---------------------------|------------------|---------|
| trivial | 1 file, a few lines | none | none - the change is obvious | implement → verify → commit |
| small | 1 file / 1 function | none | clear once you read the code | light research → implement → verify → commit |
| standard | 2-5 files | maybe a new internal module | one real choice to make | research → plan → GATE 1 → implement (test-first) → review → GATE 2 → commit |
| large | many / cross-cutting | new external dep, public API, or a spec doc | multiple open questions | full pipeline + scaffold/architecture step |

**Security triggers always lift the tier.** Anything touching authentication or authorization, user-input handling, database queries, file-system paths, external API calls, cryptography, or secrets is AT LEAST standard, regardless of file count - and pulls a security review into the process. A one-line auth change is never trivial.

The point of the classifier is honesty in both directions: no 5-phase ceremony for a typo fix, and no "quick edit" treatment for a cross-cutting change with open design questions.

---

## The two human gates

For standard and large work, the pipeline is **gated, not autonomous**. Exactly two gates:

1. **GATE 1 - after Plan.** Present the task list (ordered as thin vertical slices) before writing any implementation code. The user approves the SHAPE of the work: scope, approach, order. This is the strategy gate.

2. **GATE 2 - before Commit.** Present the diff summary and proposed commit messages before committing. The user approves the RESULT. Review findings of critical or high severity must be resolved before this gate, not disclosed at it.

**Everything between the gates flows without stopping.** No mid-implementation check-ins, no "should I continue?", no approval theater. The gates are where strategy gets decided; the space between them is where the agent earns its autonomy by making mechanical and taste decisions well and logging them.

This is the autonomy contract in executable form: two moments of human judgment, everything else auto-decided by principle, every decision logged, and User Challenges always escalated no matter where in the pipeline they arise.

---

## Important Rules

- **The user gatekeeps strategy; the agent runs solo between gates.** That is the contract everything here serves.
- **Six principles decide the middle ground:** completeness, boil lakes, pragmatic, DRY, explicit over clever, bias toward action.
- **Three classes, three treatments:** Mechanical decided silently, Taste decided-but-surfaced, User Challenge never auto-decided.
- **User Challenges carry the rich format:** what you said, what we recommend, why, what we might be missing, the cost if we're wrong.
- **Every brief has an ELI10, stakes-if-wrong, and a "Recommendation: X because..." line.** No naked questions.
- **Completeness scores on coverage decisions only.** Never fabricate scores for options that differ in kind.
- **One-way doors need typed confirmation.** "Ok" is not consent to something irreversible.
- **Batch to one final gate.** A drip of questions trains the user to stop reading them.
- **Log every decision.** Classification, principle, rationale, rejected option. Silent decisions void the autonomy contract.
- **Confusion Protocol for high-stakes doubt:** stop, name it in one sentence, 2-3 options, ask.
- **Ceremony scales with blast radius.** Trivial skips the pipeline; security triggers lift to at least standard.
- **Two gates, no more, no fewer:** after Plan, before Commit. Everything between them flows.
