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

## 4. Mandatory Documentation Compliance Cycle

Every substantial development task must consult all relevant canonical documentation three times: **before planning, during execution when making or changing a material action, and during final review before reporting completion.**

This is a mandatory compliance gate, not a recommendation.

### 4.1 Planning documentation gate

Before proposing or launching a substantial task, the planner/worker/supervisor must:

1. identify the repository/project being acted upon;
2. identify the applicable TownBoss portfolio rules and architecture;
3. identify the project's current implementation plan, architecture, decisions/rules, acceptance criteria, and Memory;
4. inspect repository-local agent/instruction files such as `AGENTS.md`, ADRs, specifications, migrations, or equivalent when relevant;
5. read the relevant documents, not merely confirm that the files exist;
6. record the documents consulted in the task contract or compliance receipt;
7. detect conflicting, stale, or ambiguous instructions before implementation;
8. stop and reconcile material conflicts rather than choosing silently.

A write-capable task must not move from planning to execution without satisfying this gate.

### 4.2 Execution documentation gate

During implementation, the worker must re-check the relevant governing documentation whenever any of the following occurs:

- the planned scope materially changes;
- an architecture decision is encountered or challenged;
- a new dependency/upstream component is proposed;
- a destructive, security-sensitive, migration, authorization, tenancy, money, deployment, or external action becomes necessary;
- acceptance criteria appear impossible or incorrect;
- implementation reveals a conflict between documentation and repository reality;
- the worker proposes work not present in the bounded task contract.

The worker must not continue based on memory of the documents when a material decision depends on their exact current content.

If the governing documentation changed since planning, the worker must reconcile the new authority before continuing.

### 4.3 Final review documentation gate

Before sending the final report, requesting checkpoint approval, or declaring a milestone `DONE`, `VERIFIED`, or `CHECKPOINTED`, the worker/reviewer must re-read the relevant current documentation and compare the actual result against it.

The final review must verify at minimum:

1. the implementation stayed within approved scope;
2. applicable decisions/rules were followed;
3. the architecture remains consistent or approved deviations are documented;
4. acceptance criteria are actually satisfied by evidence;
5. required tests/reviews/gates were executed;
6. documentation was updated when implementation changed project truth;
7. project Memory contains the material result/handoff;
8. temporary workarounds and deferred limitations are explicitly recorded;
9. no relevant rule exception was silently introduced.

A final report without this review is incomplete.

### 4.4 Documentation compliance receipt

Every substantial task final report must contain a concise **Documentation Compliance Receipt** listing:

- planning documents consulted;
- documents re-checked during execution, if any;
- documents consulted during final review;
- conflicts found and how they were resolved;
- approved exceptions, if any;
- documentation/Memory files updated;
- confirmation that the result was reconciled against current acceptance criteria before reporting.

The receipt is evidence that consultation occurred; it is not permission to copy document titles without reading them.

## 5. Canonical Documentation Availability and Freshness

Agents should have reliable local read access to TownBoss governance and project documentation. A local clone/mirror of the TownBoss repository is recommended for development work so agents can inspect the complete corpus without depending on conversational context or repeated remote lookups.

For local documentation clones:

- record the local repository path in development-tool configuration;
- verify repository identity before use;
- check the current branch/HEAD and remote tracking status at the beginning of a substantial planning pass;
- prefer a clean, current fast-forward state before relying on the clone as current authority;
- do not automatically overwrite or pull across local uncommitted work;
- if the local clone is stale and cannot be safely updated, fail closed and report the exact stale state rather than silently using obsolete rules;
- when offline, record the last known documentation commit used for the task.

The canonical source remains the governed TownBoss repository; a local clone is a working copy for reliable agent access.

## 6. Decisions Are Binding

Approved decisions remain binding until explicitly superseded. Workers may challenge a decision with evidence and a recommendation but may not silently replace it.

Decision changes must preserve history:

`OLD DECISION -> SUPERSEDED -> NEW DECISION -> REASON/EVIDENCE`

The transition must be recorded in the appropriate decision document and Memory.

## 7. Upstream First

Before implementing substantial infrastructure, evaluate maintained upstream implementations.

Preferred order:

`INHERIT -> CONFIGURE -> EXTEND -> PORT -> BUILD NEW`

Building from scratch requires a demonstrated gap. Previous investment in a local implementation is not sufficient reason to retain inferior or duplicated infrastructure.

## 8. Build the Product, Not the Development System

Tooling, frameworks, dashboards, supervisors, abstractions, test infrastructure, migrations, and developer UX remain subordinate to delivering accepted product outcomes.

Every development task must materially advance acceptance criteria or remove a demonstrated blocker. Nice-to-have development-system work is deferred.

## 9. Bounded Passes Only

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
- expected handoff;
- planning documentation receipt.

A bounded pass ends as `DONE`, `BLOCKED`, `REVIEW_REQUIRED`, or `FAILED`. It does not silently expand into another project.

## 10. No Silent Scope Expansion

New opportunities discovered during implementation become proposed future tasks unless required to satisfy the current completion contract.

A worker must not pull adjacent features, architecture rewrites, cosmetic improvements, or speculative infrastructure into the active pass without authorization.

## 11. Completion Has Distinct States

Use evidence-backed progression:

`PLANNED -> IMPLEMENTED -> TESTED -> VERIFIED -> CHECKPOINTED`

Implementation alone is not completion. A green test count alone is not verification unless the tests prove the relevant contract.

## 12. Definition of Done Comes First

A project and every significant milestone must establish its finish line before implementation begins.

Once acceptance criteria are demonstrably satisfied, declare the milestone operational and move on. Enhancements become later milestones; they do not keep the original milestone permanently open.

## 13. Preserve Working Behavior

Before changing established behavior, determine its current contract and regression coverage. New work must preserve accepted behavior unless an intentional change is explicitly approved.

When behavior changes intentionally, implementation, tests, canonical documentation, and Memory must remain consistent.

## 14. Diagnose Before Fixing

Defect workflow:

`OBSERVE -> REPRODUCE -> ROOT CAUSE -> EXPECTED BEHAVIOR -> MINIMUM SUFFICIENT FIX -> REGRESSION VERIFICATION -> MEMORY/LESSON WHEN MATERIAL`

Repeated speculative edits without increasing evidence must stop and escalate to investigation/review.

## 15. Fail Closed Under Material Uncertainty

Do not guess where uncertainty can cause destructive changes, security failures, data loss, invalid state, architectural divergence, unauthorized actions, or irreversible external effects.

Material uncertainty becomes a bounded investigation or explicit decision request.

## 16. Human Attention Is Scarce

Workers/supervisors should request human input only for genuine authority decisions, including material product tradeoffs, destructive operations, major architectural deviation, unresolved ambiguity, external/financial commitments, security-sensitive actions, or acceptance of meaningful risk.

Ordinary technical choices within approved architecture should be resolved autonomously with evidence.

## 17. Git Is Part of the Control System

- Inspect changes before staging.
- Do not blindly stage unrelated work.
- Do not overwrite another worker's unrelated changes.
- Keep commits coherent and evidence-bearing.
- Never commit secrets or avoidable runtime artifacts.
- Preserve meaningful history.
- Record significant checkpoint hashes in project Memory.
- Verify repository/worktree identity before write-capable work.

## 18. Never Destroy Evidence to Obtain Green Status

A failing test may be changed or removed only when evidence shows its asserted contract is obsolete/superseded.

Do not weaken security checks, validation gates, migrations, failure evidence, logs required for audit, or state records merely to make a suite or checkpoint pass.

## 19. Security and Authority Are Architectural

Authentication, authorization, tenancy, secrets, permissions, agent authority, destructive actions, external APIs, and sensitive data boundaries must be deliberately designed.

Every worker receives minimum necessary authority. Privilege expansion requires justification.

## 20. Authoritative State Must Remain Authoritative

Where an authoritative backend/control plane exists, clients and workers must not independently determine privileged state such as authorization, ownership, money/pricing, completion, validation outcomes, or protected transitions.

## 21. Tests Prove Contracts

Prefer tests of domain invariants, externally meaningful behavior, security boundaries, integration contracts, regressions, and acceptance criteria over tests coupled to incidental implementation details.

Test quantity is not a substitute for coverage of the actual completion contract.

## 22. Independent Review for Consequential Work

Consequential changes require independent verification appropriate to risk. Examples include security/auth, tenancy, money, migrations, destructive operations, supervisor authority, recovery logic, and major architecture changes.

Where practical, the reviewer must be different from the implementing worker or be backed by deterministic validation.

## 23. Temporary Means Temporary

Workarounds, bypasses, compatibility layers, mocks, temporary fixtures, and accepted technical debt must state:

- why they exist;
- their scope;
- associated risk;
- the condition that removes them.

Temporary architecture must not become permanent by omission.

## 24. Memory Is Mandatory Development Infrastructure

Before substantial work, consult relevant project Memory. Before milestone completion/handoff, append material knowledge and evidence.

Memory records knowledge, not terminal noise: what happened, why, actual result, evidence, impact, and next state.

Failed and superseded approaches remain in history and are marked accordingly rather than erased.

## 25. Documentation Must Track Reality

If implementation changes an architectural, product, operational, or governance truth, update the corresponding canonical documentation in the same bounded pass unless explicitly deferred with a recorded reason.

Documentation that knowingly contradicts implementation is a defect.

## 26. External Dependency Adoption Discipline

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

## 27. Optimize for Replaceability

Provider/vendor-specific systems should remain behind adapters when practical. Coding agents, AI providers, hosting vendors, APIs, and integrations must not unnecessarily become architectural authorities.

## 28. Enforcement Is Part of the Rule

A rule that exists only in prose is advisory in practice. TownBoss development systems must progressively encode these rules into machine-enforceable gates, task schemas, repository checks, CI, supervisor policies, and checkpoint verification.

If a rule can be checked deterministically, prefer automated enforcement over relying on a worker to remember it.

At minimum, development supervision should eventually enforce these state-transition gates:

- no write-capable `PLANNED -> RUNNING` transition without a planning documentation receipt;
- no material scope expansion without task-contract reconciliation;
- no `IMPLEMENTED -> VERIFIED` transition without validation evidence and final documentation review;
- no `VERIFIED -> CHECKPOINTED` transition without required Memory/documentation updates or an explicit recorded exception;
- no final report accepted as complete without the Documentation Compliance Receipt.

## 29. Rule Violations

When a worker or supervisor detects a material rule violation:

1. stop the affected unsafe/non-compliant action;
2. preserve evidence;
3. classify the violation;
4. repair it within scope when deterministic and safe;
5. otherwise request the minimum necessary decision;
6. record material incidents/lessons in project Memory;
7. do not declare the affected milestone verified until compliance is restored or an explicit exception is approved.

## 30. Portfolio Completion Principle

The purpose of development governance is to finish useful products safely and reliably. Governance itself must not become an endless product-development project.

When the accepted objective is achieved with sufficient evidence, checkpoint it and proceed to the next product objective.

## 31. Workspace Root Namespace Protection

`D:\Projects` is a protected project-root namespace. Agents may access authorized sibling projects but may create a new top-level directory only for an explicitly authorized project.

Project-owned auxiliary artifacts such as runtime data, canaries, audit clones, worktrees, logs, state, references, and temporary files must live beneath the owning project unless the operator explicitly authorizes an external location.

Legitimate project roots are established by the operator or by explicit project-creation workflow. A directory is not a project root merely because it contains source code.

## 32. Web Source Integrity and Safe Editing

All web-source changes governed by TownBoss inherit `governance/WEB_SOURCE_INTEGRITY_AND_SAFE_EDIT_GATE.md`.

For JSX/TSX/JS/TS and equivalent structured web source:

- prefer bounded edits over whole-file rewrites;
- do not use blanket recursive text replacement when it can affect syntax or semantics;
- inspect the current file before structural mutation;
- inspect the resulting diff after material structural edits;
- validate parser/type integrity before proceeding across additional structural files;
- treat validation output as stale after any later material source edit;
- distinguish transient hot-reload errors during active writes from persistent final-state source failures;
- require final validation against the final saved source state;
- block `VERIFIED`/`CHECKPOINTED` on malformed, duplicated, spliced, unexplained or unreviewed source churn.

Unsafe editing methods are rule violations when they create or materially risk source corruption. Repeated source-integrity incidents must be escalated from symptom repair to workflow/process correction.

## 33. Agent Bootstrap, UX Evidence, and Tool Authority

Canonical TownBoss and project documentation is authority. Persistent agent rules operationalize that authority; first-party TownBoss Skills encode repeatable procedures; approved third-party Skills and MCP tools provide bounded capability; deterministic gates verify/enforce compliance. No lower layer may silently supersede canonical product, project, or design authority.

Substantial tasks use a repository bootstrap that requires project-repository documentation first, TownBoss reconciliation second, preflight evidence, bounded ownership, safe Git/recovery behavior, the applicable validation profile, exact evidence SHAs, and compliant checkpoint/remote verification. A task with required closeout pending is not DONE.

UI tasks also inherit `plans/projects/code-project-supervisor/TOWNBOSS_UX_ENGINE_REFERENCE_AUDIT.md` and the applicable project UX/design authority. External references are subordinate pattern sources: record their lifecycle and implementation SHA; use explicit fixture/real-data state; collect governed rendered evidence; and require independent visual review. Builds, tests, and golden images alone do not confer visual acceptance.
