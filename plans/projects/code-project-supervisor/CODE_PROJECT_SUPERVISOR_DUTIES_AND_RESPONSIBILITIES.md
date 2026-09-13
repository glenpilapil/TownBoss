# Code Project Supervisor — Duties and Responsibilities

## Position summary

The Code Project Supervisor is the TownBoss portfolio's development-management authority for supervised software engineering work. It coordinates coding agents, repositories, tasks, evidence, reviews and checkpoints so development can proceed with less direct operator babysitting while preserving explicit governance and human control.

The role is analogous to a senior software-development supervisor, engineering operations lead and quality gatekeeper combined into one controlled software system.

## Primary duty

Turn approved development objectives into verified, governable software-delivery outcomes.

## Core responsibilities

### 1. Intake and clarification

- Accept development objectives from the operator.
- Resolve the target project/repository and current project state.
- Distinguish informational requests, audits, implementation work, remediation, review and release/checkpoint work.
- Convert free-form objectives into explicit task contracts before execution where appropriate.
- Surface ambiguity rather than silently invent scope.

### 2. Planning and decomposition

- Break objectives into bounded tasks and subtasks.
- Record scope, exclusions, dependencies, validation requirements and completion criteria.
- Respect portfolio/project plans, architecture decisions and repository-local instructions.
- Keep task identity stable and auditable.

### 3. Worker selection and delegation

- Select an eligible coding agent/provider based on capability, availability, policy and resource constraints.
- Launch workers with complete prompts/contracts generated from authoritative task state.
- Preserve worker/session identity and evidence.
- Avoid duplicate workers for the same authoritative lineage.

### 4. Concurrency and repository safety

- Prevent conflicting writes to the same repository/worktree.
- Allow safe cross-project concurrency when workers and resources are available.
- Use isolated branches/worktrees where supported by the upstream foundation.
- Queue work when dependencies, locks, capacity or authority gates are not ready.

### 5. Supervision and recovery

- Track worker progress, exits, stalls and failures.
- Apply bounded retry/recovery policies.
- Detect no-progress cycles and provider/resource exhaustion.
- Preserve evidence when recovery stops.
- Escalate to the operator only when a genuine decision or authorization is required.

### 6. Quality assurance

- Never accept worker prose alone as proof of completion when machine-verifiable evidence is required.
- Run or verify applicable tests, linting, type checks, builds, migrations, repository checks and project-specific validation gates.
- Compare actual changes with approved scope.
- Detect secrets, unrelated modifications and incomplete work.

### 7. Independent review

- Schedule read-only independent review when policy/risk requires it.
- Separate implementation from verification where useful.
- Classify findings as blocking/non-blocking.
- Prevent checkpoint promotion while mandatory blocking findings remain.

### 8. Human decisions and authority

- Present decisions in plain language with recommendation, rationale, evidence and bounded options.
- Keep destructive, production-sensitive or otherwise governed operations behind explicit authorization.
- Never treat AI reasoning as an authorization boundary.
- Record decisions durably.

### 9. Checkpoints and delivery

- Determine checkpoint readiness from evidence-backed completion contracts.
- Stage only intended files when commits are authorized.
- Verify staged changes before commit.
- Record checkpoint hashes and relevant evidence.
- Never push, publish or deploy unless policy explicitly permits it.

### 10. Portfolio awareness

- Supervise multiple TownBoss projects without cross-project contamination.
- Maintain project-specific context, instructions and priorities.
- Expose what is running, waiting, blocked, attention-required and complete.
- Preserve clear ownership between portfolio governance and project repositories.

## Responsibilities to the operator

The supervisor should reduce operator workload, not transfer implementation complexity into more supervision overhead. It should:

- ask fewer, better questions;
- explain blockers clearly;
- recommend a next action;
- surface evidence on demand;
- allow the operator to pause, defer, reprioritize or stop work;
- avoid requiring direct interaction with individual worker agents during normal operation.

## Responsibilities to worker agents

The supervisor should provide workers with:

- a bounded objective;
- authoritative repository/worktree;
- explicit scope and exclusions;
- dependency and authority context;
- completion marker/contract;
- validation requirements;
- checkpoint restrictions;
- clear reporting requirements.

Workers are execution resources, not the source of project authority.

## Out of scope responsibilities

Code Project Supervisor is not itself responsible for:

- deciding product strategy without operator/portfolio authority;
- replacing repository-specific architecture documentation;
- silently changing legal/compliance requirements;
- making irreversible production decisions autonomously;
- becoming a general ERP/project-management platform;
- replacing coding agents when an existing specialized agent is better suited.

## Accountability standard

The supervisor's performance is judged by development outcomes: correct scope, safe execution, reduced supervision burden, evidence-backed quality, reliable recovery, accurate state and verified checkpoints—not by dashboard complexity or the number of internal features implemented.
