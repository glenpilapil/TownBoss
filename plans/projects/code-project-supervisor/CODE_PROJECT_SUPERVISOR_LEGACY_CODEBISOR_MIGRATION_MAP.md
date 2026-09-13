# Code Project Supervisor — Legacy CodeBisor Migration Map

**Status:** CANONICAL / AUDIT COMPLETE
**Legacy Repository:** `D:\Projects\CodeBisor`
**Upstream:** `Untrivial-ai/agent-orchestrator` @ `cadde8c9fd2079d0decca654004760ad8439328e`
**Date:** 2026-09-13

---

## Migration Classification Vocabulary

| Class | Meaning |
|-------|---------|
| REPLACED_BY_UPSTREAM | AO provides equivalent or superior capability |
| CONCEPT_SPEC_WORTH_PORTING | Behavioral contract/concept is valuable; port the spec, not the code |
| TESTS_WORTH_PORTING | Test scenarios are valuable for CPS contract validation |
| CODE_WORTH_PORTING | Implementation code is the lowest-risk path |
| OBSOLETE_DROP | Capability is not required by CPS acceptance criteria |

---

## Capability Migration Map

| CodeBisor Capability | Source File(s) | Classification | Rationale | CPS Treatment |
|---------------------|----------------|----------------|-----------|---------------|
| **Completion contract verification** | `completion_verifier.py` | CODE_WORTH_PORTING | Proven PASS/FAIL/UNVERIFIED classification; CPS acceptance criteria require independent verification beyond worker prose | Port verification logic; adapt to CPS task lifecycle hooks |
| **AI Authority model (A0–A4)** | `ai_authority.py`, `CODEBISOR_AI_AUTHORITY_POLICY.json` | CONCEPT_SPEC_WORTH_PORTING | Matches CPS Authority Matrix exactly; policy is portable, implementation must integrate with AO session model | Port authority levels and classification logic; integrate with CPS task risk assignment |
| **Recovery budgets** | `agent_resource_governance.py` → `budgets()` | CONCEPT_SPEC_WORTH_PORTING | max_recovery_attempts, max_recoveries_without_progress, max_wall_clock_seconds, max_no_progress_seconds are proven concepts | Port budget model; integrate with AO lifecycle reducer |
| **Circuit breaker / resource incident** | `resource_incident_control.py`, `resource_lineage_control.py` | CONCEPT_SPEC_WORTH_PORTING | Bounded retry, no-progress detection, terminalization (never auto-reset) | Port circuit-breaker state machine; integrate with AO lifecycle |
| **Same-worktree write lease** | `worker_common.py` → `WorktreeWriteLease` | CODE_WORTH_PORTING | Cross-process file lock (msvcrt on Windows, fcntl on Unix) keyed by SHA-256 of worktree path | Port cross-process lock; AO prevents conflicting branches at git level but lacks application-level lease |
| **Documentation compliance gate** | `w0_documentation_gate.py` | CONCEPT_SPEC_WORTH_PORTING | Pre-checkpoint doc-check pattern; reads changed paths from git diff | Port concept; adapt to CPS three-stage compliance cycle |
| **State reconciler** | `state_reconciler.py` | CONCEPT_SPEC_WORTH_PORTING | Crash-state reconciliation patterns | Port reconciliation logic; integrate with AO daemon restart reconstruction |
| **Provider failure normalization** | `provider_failure.py` | CONCEPT_SPEC_WORTH_PORTING | Normalized failure vocabulary (PROVIDER_QUOTA_EXHAUSTED, PROVIDER_UNAVAILABLE, etc.) | Port normalization vocabulary; integrate with AO lifecycle observations |
| **Independent review** | `independent_review.py` | CONCEPT_SPEC_WORTH_PORTING | Policy-based review scheduling, blocking/non-blocking classification, checkpoint evaluation | Port policy model; AO has review infrastructure but lacks policy enforcement |
| **Task materializer** | `task_materializer.py` | CONCEPT_SPEC_WORTH_PORTING | Transforms proposals into authoritative task definitions with scope, exclusions, dependencies | Port task contract structure; integrate with AO spawn/orchestrator |
| **Job intake** | `job_intake.py` | CONCEPT_SPEC_WORTH_PORTING | Operator-submitted development jobs with scope, exclusions, dependencies, authority level | Port intake model; integrate with CPS operator interface |
| **Checkpoint supervisor** | `checkpoint_supervisor.py` | REPLACED_BY_UPSTREAM | AO handles PRs, merges, and diff observation natively | Use AO PR/SCM observer; add CPS checkpoint governance layer |
| **Dynamic project registry** | `dynamic_project_registry.py` | REPLACED_BY_UPSTREAM | AO has project CRUD + workspace registration | Use AO project service |
| **Scheduler** | `scheduler.py` | REPLACED_BY_UPSTREAM | AO has session-level concurrency + kanban | Extend AO with CPS task-level queue |
| **Durable state** | `durable_state.py` | REPLACED_BY_UPSTREAM | AO has SQLite + CDC + crash-safe writes | Use AO persistence layer |
| **Background authority** | `background_authority.py` | REPLACED_BY_UPSTREAM | AO daemon has single-authority model | Use AO daemon as single authority |
| **Persistent workspace** | `persistent_workspace.py`, `workspace_provisioning.py` | REPLACED_BY_UPSTREAM | AO has git worktree + scratch workspace adapters | Use AO workspace adapters |
| **Dashboard / TUI** | `dashboard*.py`, `tui_*.py`, `supervisor_dashboard*.py` | OBSOLETE_DROP | AO provides production-grade Electron desktop + CLI | Adopt AO UI; do not port custom rendering |
| **Control plane** | `control_plane.py`, `control_plane/` | OBSOLETE_DROP | Not required for first operational release | Defer per CPS product spec |
| **System tray** | `tray.py` | OBSOLETE_DROP | OPTIONAL in CPS, deferred | None |
| **Custom TUI framework** | `tui_bridge.py`, `tui_client.py` | OBSOLETE_DROP | DROP per CPS capability matrix | None |
| **OpenTUI dependency** | `opentui==0.1.2` in setup.py | OBSOLETE_DROP | Deferred per CPS product spec | None |
| **Gemini worker adapter** | `gemini_worker_supervisor.py` | OBSOLETE_DROP | Gemini is OPTIONAL in CPS; AO has no Gemini adapter | None |
| **Container runtime validation** | `container_runtime_validation.py` | OBSOLETE_DROP | Not required for CPS first release | None |
| **Multi-agent concurrency validation** | `multi_agent_concurrency_validation.py` | OBSOLETE_DROP | AO has session-level concurrency; CPS extends as needed | None |
| **GlenTown contracts** | `canonical_glentown_contracts.py` | OBSOLETE_DROP | GlenTown-specific; not portable to CPS core | Port only if GlenTown becomes CPS use case |
| **Acceptance canary** | `acceptance_canary.py` | TESTS_WORTH_PORTING | Test scenarios for recovery, checkpoint, state validation | Port acceptance scenarios as CPS operational acceptance tests |
| **Recovery state machine tests** | `test_recovery_state_machine.py` | TESTS_WORTH_PORTING | State machine tests for recovery transitions | Port as CPS recovery contract tests |
| **Recovery accounting tests** | `test_recovery_accounting_contract.py` | TESTS_WORTH_PORTING | Budget accounting tests | Port as CPS recovery budget tests |
| **Fresh attempt control** | `fresh_attempt_control.py` | CONCEPT_SPEC_WORTH_PORTING | Retires exhausted session lineage | Port lineage retirement concept |
| **Resource lineage control** | `resource_lineage_control.py` | CONCEPT_SPEC_WORTH_PORTING | Lineage field control and validation | Port lineage model |
| **Validation activity governance** | `validation_activity_governance.py` | CONCEPT_SPEC_WORTH_PORTING | Validation activity tracking | Port validation tracking |
| **Operator execution control** | `operator_execution_control.py` | CONCEPT_SPEC_WORTH_PORTING | Operator-level execution controls | Port operator control model |

---

## Migration Priority

### Priority A — Prove Inherited Workflow (Phase 2)
- Adopt AO project/session/worktree/worker model as-is
- Verify Kilo, Codex, Cline adapters work
- Verify daemon, CLI, desktop UI

### Priority B — Port Proven Concepts (Phase 3)
- Recovery budgets (`agent_resource_governance.py` → CPS recovery policy)
- Circuit breakers (`resource_incident_control.py` → CPS lifecycle integration)
- Completion verification (`completion_verifier.py` → CPS validation gates)
- Authority model (`ai_authority.py` → CPS authority matrix)
- Provider failure normalization (`provider_failure.py` → CPS adapter contract)

### Priority C — Build CPS Extensions (Phase 3/4)
- Task decomposition with dependency graph
- Documentation compliance gates
- Project Memory ledger
- Natural-language job intake → task contract
- TownBoss planning corpus ingestion

### Priority D — Defer
- Remote/cloud operation
- Custom TUI/dashboard
- System tray
- GlenTown-specific contracts

---

## Legacy Code Worth Preserving (Reference Only)

| File | Purpose | Action |
|------|---------|--------|
| `D:\Projects\CodeBisor\agent_resource_governance.py` | Recovery budget model | Reference during Phase 3 |
| `D:\Projects\CodeBisor\resource_incident_control.py` | Circuit-breaker state machine | Reference during Phase 3 |
| `D:\Projects\CodeBisor\completion_verifier.py` | Completion contract logic | Reference during Phase 3 |
| `D:\Projects\CodeBisor\ai_authority.py` | Authority classification | Reference during Phase 3 |
| `D:\Projects\CodeBisor\provider_failure.py` | Failure normalization | Reference during Phase 3 |
| `D:\Projects\CodeBisor\worker_common.py` | Write lease pattern | Reference during Phase 2 |
| `D:\Projects\CodeBisor\independent_review.py` | Review policy model | Reference during Phase 3 |
| `D:\Projects\CodeBisor\test_recovery_state_machine.py` | Recovery state tests | Reference during Phase 3 |
| `D:\Projects\CodeBisor\test_recovery_accounting_contract.py` | Budget accounting tests | Reference during Phase 3 |

**Instruction:** Do not copy-paste CodeBisor code into CPS. Read the concept, write CPS-specific implementation against AO's port interfaces. This preserves upstream syncability.
