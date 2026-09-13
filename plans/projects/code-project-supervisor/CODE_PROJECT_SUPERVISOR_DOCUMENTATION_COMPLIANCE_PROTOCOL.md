# Code Project Supervisor — Documentation Compliance Protocol

**Status:** CANONICAL  
**Purpose:** Ensure relevant TownBoss and project documentation is checked during planning, execution, review, and reporting.

## Core Rule

Substantial development work must verify documentation compliance at three stages:

1. **Planning Gate** — before action.
2. **Execution Re-check Gate** — when material circumstances change.
3. **Final Review Gate** — before reporting completion or checkpoint readiness.

This protocol applies whether work is performed by a human, CPS, or a worker agent.

## 1. Planning Gate

Before substantial action, identify and read the relevant documentation set.

Minimum default read-set:

- TownBoss `governance/DEVELOPMENT_RULES.md`;
- project `CURRENT_STATE`;
- project implementation plan;
- project architecture;
- project decisions/rules;
- project acceptance criteria;
- project Memory;
- relevant capability/task/authority/validation policies;
- repository-local instructions such as `AGENTS.md`, README, ADRs, or contribution rules;
- task-specific specifications.

The worker or supervisor must record which documents were consulted.

### Freshness Check

When using a local TownBoss clone, verify the expected repository, branch, and freshness before treating it as canonical. If it is stale and cannot be safely refreshed, report the condition and stop where stale rules could materially affect the task.

## 2. Execution Re-check Gate

Re-check relevant documents whenever any of these triggers occurs:

- task scope materially changes;
- architecture assumptions change;
- a new dependency or upstream component is introduced;
- a security, authority, or risk boundary changes;
- an acceptance criterion becomes ambiguous;
- a conflicting existing implementation is discovered;
- recovery changes the execution strategy;
- a task becomes blocked or requires attention;
- a worker proposes work outside the original contract;
- evidence suggests the canonical plan is stale or inconsistent.

Do not wait until final reporting to discover that implementation violated a governing decision.

## 3. Final Review Gate

Before sending the final report, marking VERIFIED, or accepting a checkpoint, re-read the documents that govern:

- scope;
- architecture;
- decisions;
- acceptance criteria;
- validation requirements;
- risk/authority;
- Memory and documentation update obligations.

Compare actual output against those documents, not against the worker's original plan alone.

## 4. Documentation Compliance Receipt

Every substantial final report must include a receipt containing:

- **Planning documents consulted**
- **Execution-stage documents re-checked** and the trigger
- **Final-review documents consulted**
- **Conflicts or ambiguities discovered**
- **How conflicts were resolved**
- **Approved exceptions**, if any
- **Canonical documents updated**
- **Memory update performed**
- **Compliance result:** `PASS | PASS_WITH_APPROVED_EXCEPTION | FAIL`

A task with `FAIL` cannot be promoted to VERIFIED.

## 5. Conflict Handling

When documents disagree:

1. identify the exact conflicting statements;
2. apply the TownBoss authority hierarchy;
3. consider source recency and explicit supersession;
4. do not silently select the most convenient interpretation;
5. request a decision if authority cannot be resolved deterministically;
6. update the affected canonical documents once resolved;
7. record material resolution in Memory.

## 6. Retrieval Principle

Agents should read only the documentation relevant to the current task, but the read-set must be complete enough to cover scope, architecture, authority, validation, and historical constraints. Compliance is not measured by number of files opened.

## 7. Future Machine Enforcement

CPS should eventually generate required documentation read-sets automatically from project and task metadata, verify that mandatory documents were consulted, check freshness, and require a complete compliance receipt before final verification.