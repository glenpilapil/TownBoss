# Code Project Supervisor — Project Memory

**Status:** CANONICAL / LIVING DOCUMENT  
**Project:** Code Project Supervisor  
**Portfolio:** TownBoss  
**Purpose:** Durable project-development memory and historical execution ledger

## 1. Purpose

This document is the durable written memory of the Code Project Supervisor project.

It records what was actually done during development, why important choices were made, what was learned, what failed, what was superseded, what evidence exists, and what state was handed forward to the next development session.

It exists so project continuity does not depend on ChatGPT memory, conversation history, an individual coding-agent session, terminal scrollback, or recollection by the operator.

A future human or agent should be able to read this document together with the canonical project specifications and understand the project's development history without reconstructing it from chats.

## 2. Authority Boundary

This file is a **memory/evidence ledger**, not a substitute for the project's normative documents.

- Duties and responsibilities define what the supervisor is responsible for.
- Product specification defines what should exist.
- Architecture defines structural boundaries.
- Implementation plan defines intended sequencing.
- Decisions and rules define binding project decisions and controls.
- Acceptance criteria define what must be proven.
- Upstream adoption plan governs upstream/fork decisions.
- **This Memory records what actually happened while carrying those plans out.**

When Memory conflicts with a newer explicit decision in a canonical decision document, the newer canonical decision governs. The conflicting historical entry must remain in Memory and be marked `SUPERSEDED`; it must not be silently rewritten as though the earlier decision never existed.

## 3. Core Memory Rule

Every meaningful development milestone must leave a durable memory entry.

An entry is required when any of the following occurs:

- a development pass or milestone starts or completes;
- an upstream repository or dependency is evaluated, adopted, rejected, replaced, forked, or upgraded;
- architecture materially changes;
- a product or implementation decision is approved, rejected, or superseded;
- files, schemas, APIs, workflows, or major components are added or removed;
- a defect is diagnosed and materially repaired;
- a test, audit, canary, security, or acceptance gate produces important evidence;
- a worker/agent encounters a failure that affects future execution;
- a workaround or temporary constraint is introduced;
- a project checkpoint or release is created;
- a task is blocked, deferred, abandoned, or replaced;
- lessons are learned that should prevent repetition of an earlier mistake.

Routine command output, repeated heartbeat/status polling, trivial formatting edits, and other low-value noise should not be copied into Memory.

## 4. Evidence Rules

Memory must distinguish fact from intent.

Use these evidence classifications:

- `DECISION` — an explicit approved project decision.
- `IMPLEMENTATION` — code/configuration/documentation was actually changed.
- `VERIFICATION` — tests, builds, audits, runtime checks, or acceptance evidence were produced.
- `INCIDENT` — a defect, interruption, provider failure, regression, or operational problem occurred.
- `LESSON` — a reusable conclusion derived from development experience.
- `MIGRATION` — architecture or implementation moved from one foundation/pattern to another.
- `CHECKPOINT` — a durable repository state was committed or otherwise captured.
- `BLOCKER` — work could not proceed for a stated reason.
- `SUPERSEDED` — an earlier approach or decision is retained historically but no longer governs.

Do not record worker prose as verified fact when machine-verifiable evidence is required. Record the worker's claim and the evidence separately.

## 5. Required Entry Format

Append new entries in chronological order. Do not rewrite history merely to make it look cleaner.

```markdown
### YYYY-MM-DD — <short event title>

**Type:** DECISION | IMPLEMENTATION | VERIFICATION | INCIDENT | LESSON | MIGRATION | CHECKPOINT | BLOCKER | SUPERSEDED  
**Status:** CURRENT | COMPLETED | BLOCKED | DEFERRED | SUPERSEDED  
**Scope:** <project/component/milestone>  
**Performed by:** <human/agent/tool if relevant>

**What happened**
<concise factual description>

**Why / context**
<reason this work or decision existed>

**Result**
<actual outcome>

**Evidence**
- Commit/PR: <identifier if available>
- Tests/audits: <results if available>
- Files/artifacts: <canonical paths>

**Impact on future work**
<what the next developer/agent must know>
```

Several related events from one bounded development pass may be captured in one entry when that preserves clarity.

## 6. Session Handoff Rule

Before a substantial development session is considered closed, the project should record enough Memory to answer:

1. What was attempted?
2. What actually changed?
3. What was verified?
4. What failed or remains uncertain?
5. What decisions were made?
6. What repository checkpoint represents the result?
7. What should happen next?

The objective is not exhaustive journaling. It is reliable reconstruction of project state and reasoning.

## 7. Initial Project Memory

### 2026-09-13 — Code Project Supervisor established as successor project

**Type:** MIGRATION / DECISION  
**Status:** CURRENT  
**Scope:** Project foundation  
**Performed by:** Operator + TownBoss planning process

**What happened**
A new TownBoss project named **Code Project Supervisor** was established as the current development-supervision initiative. The earlier CodeBisor implementation is retained as legacy/reference material rather than being treated as the mandatory foundation for continued development.

**Why / context**
CodeBisor had accumulated substantial bespoke development effort, including supervisor runtime, terminal UX, recovery, provider routing, state management, and an experimental OpenTUI migration. Development of the supervisor itself had become disproportionately large relative to its intended role of accelerating the actual product portfolio. The project therefore moved to an upstream-first strategy.

**Result**
A new canonical project corpus was created under `plans/projects/code-project-supervisor/`. The project is defined as a supervisor above coding agents rather than another coding agent.

**Evidence**
- Project index: `plans/projects/code-project-supervisor/README.md`
- Duties: `CODE_PROJECT_SUPERVISOR_DUTIES_AND_RESPONSIBILITIES.md`
- Product specification: `CODE_PROJECT_SUPERVISOR_PRODUCT_SPEC.md`
- Architecture: `CODE_PROJECT_SUPERVISOR_ARCHITECTURE.md`
- Implementation plan: `CODE_PROJECT_SUPERVISOR_IMPLEMENTATION_PLAN.md`
- Decisions/rules: `CODE_PROJECT_SUPERVISOR_DECISIONS_AND_RULES.md`
- Acceptance criteria: `CODE_PROJECT_SUPERVISOR_ACCEPTANCE_CRITERIA.md`
- Upstream strategy: `CODE_PROJECT_SUPERVISOR_UPSTREAM_ADOPTION_PLAN.md`

**Impact on future work**
Future development must begin from the Code Project Supervisor corpus rather than assuming the legacy CodeBisor architecture remains authoritative. CodeBisor capabilities may be selectively ported only when they remain useful and are not better supplied by the adopted upstream foundation.

### 2026-09-13 — Upstream-first development rule adopted

**Type:** DECISION / LESSON  
**Status:** CURRENT  
**Scope:** Implementation strategy

**What happened**
The project adopted an upstream-first rule: evaluate and reuse a mature existing orchestration/supervision foundation before implementing equivalent infrastructure locally.

**Why / context**
Previous CodeBisor work demonstrated the cost of independently building terminal UI, supervisor lifecycle, worker management, recovery, routing, state persistence, and orchestration infrastructure. Reimplementing mature upstream capabilities is no longer acceptable without a demonstrated project-specific gap.

**Result**
`Untrivial-ai/agent-orchestrator` was selected as the preferred upstream chassis subject to a bounded adoption audit. The adoption process must classify capabilities as `INHERIT`, `CONFIGURE`, `EXTEND`, `PORT_FROM_LEGACY`, `NEW`, or `DROP` before customization.

**Evidence**
- `CODE_PROJECT_SUPERVISOR_UPSTREAM_ADOPTION_PLAN.md`
- `CODE_PROJECT_SUPERVISOR_DECISIONS_AND_RULES.md`

**Impact on future work**
The next bounded workstream is the Agent Orchestrator adoption audit. No large customization effort should begin until the upstream capabilities and gaps are mapped against the Code Project Supervisor requirements.

### 2026-09-13 — Project Memory ledger introduced

**Type:** IMPLEMENTATION / DECISION  
**Status:** CURRENT  
**Scope:** Project governance and continuity

**What happened**
This canonical Memory document was introduced to preserve the project's development history independently of conversational or model memory.

**Why / context**
The project requires a durable way to recover prior work, decisions, failures, evidence, and lessons across sessions and agents without relying on chat history.

**Result**
Future meaningful development passes are required to append concise evidence-backed entries to this file.

**Evidence**
- `CODE_PROJECT_SUPERVISOR_MEMORY.md`

**Impact on future work**
Every agent or human conducting substantial Code Project Supervisor development should read the current Memory before beginning work and update it before closing a completed milestone or handing the project to another worker.

## 8. Memory Maintenance Rules

1. **Append history; do not erase it.** Corrections should identify the incorrect entry and record the correction.
2. **Mark superseded work explicitly.** Failed or abandoned approaches are useful project knowledge.
3. **Prefer evidence over narrative.** Include commit hashes, PRs, test counts, file paths, issue IDs, and audit results when available.
4. **Do not inflate status.** Planned work is not implemented; implemented work is not verified without evidence.
5. **Keep it useful.** Do not turn this into raw terminal logs.
6. **Record why.** A commit can show what changed; Memory should preserve why the change mattered.
7. **Record failures.** Repeated mistakes are more expensive than an untidy historical record.
8. **Preserve provenance.** Identify the worker/tool/human when that information matters to interpreting the evidence.
9. **Link canonical documents rather than duplicating them.** Memory records history; specifications define current requirements.
10. **Update before handoff.** A substantial milestone without a memory update is incomplete unless there was genuinely nothing durable to record.

## 9. Future Evolution

If this single file becomes too large, it may be converted into a memory index plus append-only dated files, for example:

```text
memory/
  README.md
  2026-09.md
  2026-10.md
  decisions-index.md
  incidents-index.md
```

The migration must preserve all existing entries and stable references. Do not split the ledger merely for aesthetics; do so only when retrieval materially benefits.
