# CodeBisor Implementation Plan

**Status:** ACTIVE IMPLEMENTATION

## Mission

CodeBisor is the TownBoss development supervisor: a persistent operational view of projects, tasks, agents, evidence, checkpoints, blockers and validation gates.

## Known implemented direction

- Supervisor dashboard model with portfolio/project/task checklists and statuses.
- Current task and live subtask activity rendering.
- ANSI cursor-boundary rendering architecture with persistent and transient regions plus fallback behavior.
- Development-agent collaboration and checkpoint reporting patterns.
- Portfolio attention/deferred decision/event-log concepts.

## Target architecture

### 1. Canonical plan ingestion
Consume the TownBoss masterplan hierarchy and project/application plans as roadmap authority.

### 2. Repository adapters
Git/GitHub/local workspace adapters for branch, commit, dirty state, tests, PRs, issues and checkpoint evidence.

### 3. Agent execution
Provider-neutral worker interface for Codex, Gemini, Kilo/Cline/other approved agents; explicit task contracts, stdout/events, cancellation, timeout and receipts.

### 4. State model
Portfolio -> project -> application -> milestone -> gate -> task -> subtask -> evidence/checkpoint.

### 5. Verification
Never mark DONE from agent prose alone when machine-verifiable evidence is required. Capture test/analyzer/build/git evidence.

### 6. Safety
Approval gates for destructive operations, production changes, secrets, irreversible migrations and external publication.

## Next milestones

- [ ] Reconcile current repository implementation and tests.
- [ ] Define masterplan Markdown parser/schema.
- [ ] Map existing supervisor checklist state to canonical plan IDs.
- [ ] Implement evidence-backed status promotion.
- [ ] Implement checkpoint persistence and repository provenance.
- [ ] Add multi-project switching without losing live worker state.
- [ ] Harden terminal rendering and non-ANSI fallback.
- [ ] Add resumable supervisor sessions.
- [ ] Add security/permission model for future remote operation.
