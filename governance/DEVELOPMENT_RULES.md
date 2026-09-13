# TownBoss Development Rules

**Status:** CANONICAL / PORTFOLIO-WIDE  
**Applies to:** TownBoss and every project, application, service, agent, worker, and development-supervision system governed by TownBoss  
**Purpose:** Prevent scope drift, unverifiable completion, duplicated infrastructure, lost decisions, unsafe automation, and development work that becomes detached from product outcomes.

## 1. Governing Principle

Development is evidence-driven execution against an approved plan. It is not an open-ended opportunity for a human or agent to redesign the project.

These rules are mandatory defaults. A project may add stricter rules. A project-specific exception must be explicit, documented, justified, scoped, and approved; silence is not an exception.

## 2. Authority Hierarchy

When instructions conflict, use this project-development hierarchy unless a higher legal/security/portfolio authority governs:

1. TownBoss canonical portfolio governance and architecture
2. Project Master Development Plan / project charter
3. Project implementation plan and architecture
4. Project decisions and rules
5. Project acceptance criteria
6. Approved bounded task contract
7. Project Memory and evidence
8. Worker/session instructions
9. Chat, terminal output, informal notes, and recollection

Historical Memory records what happened but does not silently override newer normative decisions.

## 3. Required Project Foundation

Before substantial implementation, a project must have enough canonical documentation to establish:

- mission/purpose;
- intended capabilities/scope;
- architecture/boundaries;
- implementation sequence;
- decisions/rules;
- acceptance criteria/Definition of Done;
- durable project Memory.

Missing foundations must be repaired before they become a source of architectural guesswork.

## 4. Decisions Are Binding

Approved decisions remain binding until explicitly superseded. Workers may challenge a decision with evidence and a recommendation but may not silently replace it.

Decision changes must preserve history:

`OLD DECISION -> SUPERSEDED -> NEW DECISION -> REASON/EVIDENCE`

The transition must be recorded in the appropriate decision document and Memory.

## 5. Upstream First

Before implementing substantial infrastructure, evaluate maintained upstream implementations.

Preferred order:

`INHERIT -> CONFIGURE -> EXTEND -> PORT -> BUILD NEW`

Building from scratch requires a demonstrated gap. Previous investment in a local implementation is not sufficient reason to retain inferior or duplicated infrastructure.

## 6. Build the Product, Not the Development System

Tooling, frameworks, dashboards, supervisors, abstractions, test infrastructure, migrations, and developer UX remain subordinate to delivering accepted product outcomes.

Every development task must materially advance acceptance criteria or remove a demonstrated blocker. Nice-to-have development-system work is deferred.

## 7. Bounded Passes Only

Every substantial task must define:

- entry/baseline state;
- objective;
- in-scope deliverables;
- prohibited/out-of-scope work;
- dependencies;
- authority/risk boundary;
- validation requirements;
- completion contract;
- required documentation/Memory update;
- expected handoff.

A bounded pass ends as `DONE`, `BLOCKED`, `REVIEW_REQUIRED`, or `FAILED`. It does not silently expand into another project.

## 8. No Silent Scope Expansion

New opportunities discovered during implementation become proposed future tasks unless required to satisfy the current completion contract.

A worker must not pull adjacent features, architecture rewrites, cosmetic improvements, or speculative infrastructure into the active pass without authorization.

## 9. Completion Has Distinct States

Use evidence-backed progression:

`PLANNED -> IMPLEMENTED -> TESTED -> VERIFIED -> CHECKPOINTED`

Implementation alone is not completion. A green test count alone is not verification unless the tests prove the relevant contract.

## 10. Definition of Done Comes First

A project and every significant milestone must establish its finish line before implementation begins.

Once acceptance criteria are demonstrably satisfied, declare the milestone operational and move on. Enhancements become later milestones; they do not keep the original milestone permanently open.

## 11. Preserve Working Behavior

Before changing established behavior, determine its current contract and regression coverage. New work must preserve accepted behavior unless an intentional change is explicitly approved.

When behavior changes intentionally, implementation, tests, canonical documentation, and Memory must remain consistent.

## 12. Diagnose Before Fixing

Defect workflow:

`OBSERVE -> REPRODUCE -> ROOT CAUSE -> EXPECTED BEHAVIOR -> MINIMUM SUFFICIENT FIX -> REGRESSION VERIFICATION -> MEMORY/LESSON WHEN MATERIAL`

Repeated speculative edits without increasing evidence must stop and escalate to investigation/review.

## 13. Fail Closed Under Material Uncertainty

Do not guess where uncertainty can cause destructive changes, security failures, data loss, invalid state, architectural divergence, unauthorized actions, or irreversible external effects.

Material uncertainty becomes a bounded investigation or explicit decision request.

## 14. Human Attention Is Scarce

Workers/supervisors should request human input only for genuine authority decisions, including material product tradeoffs, destructive operations, major architectural deviation, unresolved ambiguity, external/financial commitments, security-sensitive actions, or acceptance of meaningful risk.

Ordinary technical choices within approved architecture should be resolved autonomously with evidence.

## 15. Git Is Part of the Control System

- Inspect changes before staging.
- Do not blindly stage unrelated work.
- Do not overwrite another worker's unrelated changes.
- Keep commits coherent and evidence-bearing.
- Never commit secrets or avoidable runtime artifacts.
- Preserve meaningful history.
- Record significant checkpoint hashes in project Memory.
- Verify repository/worktree identity before write-capable work.

## 16. Never Destroy Evidence to Obtain Green Status

A failing test may be changed or removed only when evidence shows its asserted contract is obsolete/superseded.

Do not weaken security checks, validation gates, migrations, failure evidence, logs required for audit, or state records merely to make a suite or checkpoint pass.

## 17. Security and Authority Are Architectural

Authentication, authorization, tenancy, secrets, permissions, agent authority, destructive actions, external APIs, and sensitive data boundaries must be deliberately designed.

Every worker receives minimum necessary authority. Privilege expansion requires justification.

## 18. Authoritative State Must Remain Authoritative

Where an authoritative backend/control plane exists, clients and workers must not independently determine privileged state such as authorization, ownership, money/pricing, completion, validation outcomes, or protected transitions.

## 19. Tests Prove Contracts

Prefer tests of domain invariants, externally meaningful behavior, security boundaries, integration contracts, regressions, and acceptance criteria over tests coupled to incidental implementation details.

Test quantity is not a substitute for coverage of the actual completion contract.

## 20. Independent Review for Consequential Work

Consequential changes require independent verification appropriate to risk. Examples include security/auth, tenancy, money, migrations, destructive operations, supervisor authority, recovery logic, and major architecture changes.

Where practical, the reviewer must be different from the implementing worker or be backed by deterministic validation.

## 21. Temporary Means Temporary

Workarounds, bypasses, compatibility layers, mocks, temporary fixtures, and accepted technical debt must state:

- why they exist;
- their scope;
- associated risk;
- the condition that removes them.

Temporary architecture must not become permanent by omission.

## 22. Memory Is Mandatory Development Infrastructure

Before substantial work, consult relevant project Memory. Before milestone completion/handoff, append material knowledge and evidence.

Memory records knowledge, not terminal noise: what happened, why, actual result, evidence, impact, and next state.

Failed and superseded approaches remain in history and are marked accordingly rather than erased.

## 23. Documentation Must Track Reality

If implementation changes an architectural, product, operational, or governance truth, update the corresponding canonical documentation in the same bounded pass unless explicitly deferred with a recorded reason.

Documentation that knowingly contradicts implementation is a defect.

## 24. External Dependency Adoption Discipline

Before adopting/forking a significant upstream dependency, evaluate at minimum:

- license/commercial implications;
- maintenance/activity;
- architecture fit;
- platform/runtime support;
- security implications;
- coupling and replacement cost;
- migration cost;
- upstream synchronization strategy;
- exit/fallback strategy.

Forking does not remove upstream-maintenance obligations.

## 25. Optimize for Replaceability

Provider/vendor-specific systems should remain behind adapters when practical. Coding agents, AI providers, hosting vendors, APIs, and integrations must not unnecessarily become architectural authorities.

## 26. Enforcement Is Part of the Rule

A rule that exists only in prose is advisory in practice. TownBoss development systems must progressively encode these rules into machine-enforceable gates, task schemas, repository checks, CI, supervisor policies, and checkpoint verification.

If a rule can be checked deterministically, prefer automated enforcement over relying on a worker to remember it.

## 27. Rule Violations

When a worker or supervisor detects a material rule violation:

1. stop the affected unsafe/non-compliant action;
2. preserve evidence;
3. classify the violation;
4. repair it within scope when deterministic and safe;
5. otherwise request the minimum necessary decision;
6. record material incidents/lessons in project Memory;
7. do not declare the affected milestone verified until compliance is restored or an explicit exception is approved.

## 28. Portfolio Completion Principle

The purpose of development governance is to finish useful products safely and reliably. Governance itself must not become an endless product-development project.

When the accepted objective is achieved with sufficient evidence, checkpoint it and proceed to the next product objective.
