# DeerFlow 2 Overlap Analysis

**Status:** ACTIVE AUDIT / PRE-POC  
**Scope:** TownBoss shared agent infrastructure, Code Project Supervisor (CPS), Glen AI  
**Upstream:** `bytedance/deer-flow`  
**Companion documents:** `DEERFLOW_2_ADOPTION_AUDIT.md`, `DEERFLOW_2_CAPABILITY_GAP_MATRIX.md`

## 1. Purpose

Define exact ownership boundaries between DeerFlow 2 and TownBoss so selective adoption does not create duplicate orchestrators, competing sources of truth, ambiguous recovery ownership, or authority leakage.

The governing rule is:

> DeerFlow may own generic execution mechanics where proven adequate. TownBoss/CPS/Glen AI retain intent, authority, domain semantics, validation, acceptance, and canonical state.

No capability is assigned to DeerFlow merely because DeerFlow implements a similarly named feature. Ownership requires that the feature is generic runtime infrastructure, does not become a competing authority, and passes the bounded POC/security gates.

## 2. Layer model

```text
CANONICAL AUTHORITY
TownBoss MDPs / Implementation Plans / project decisions
        |
PRODUCT + SUPERVISOR AUTHORITY
CPS contracts / Glen AI permissions / GlenTown domain rules
        |
DOMAIN ORCHESTRATION
GlenTown Orchestration Engine / CPS task graph + validation gates
        |
RUNTIME ADAPTER
TownBoss DeerFlow adapter / policy envelope / evidence mapping
        |
GENERIC EXECUTION RUNTIME
DeerFlow runs / sub-agents / tools / MCP / context / sandbox / checkpoints
        |
EXECUTION TARGETS
Models / external coding agents where supported / MCP / browsers / sandboxes / APIs
```

Authority flows downward. Evidence and execution results flow upward. Lower layers may not redefine higher-layer intent or acceptance criteria.

## 3. Ownership matrix

| Concern | DeerFlow may own | TownBoss/CPS/Glen AI must own | Boundary decision |
|---|---|---|---|
| Run lifecycle | Runtime run/thread creation, execution, pause, cancellation, checkpoint primitives | Mapping run IDs to canonical user/project/task identity and legal state transitions | **DEERFLOW_RUNTIME / TOWNBOSS_AUTHORITY** |
| Persistence | Runtime checkpoint storage and resumable execution state | Canonical task/domain state, approval state, business records, project status | **SPLIT; NO PARALLEL TRUTH** |
| Resume | Mechanical restoration of a pinned run | Which run may resume, identity binding, stale-state detection, authorization | **SPLIT** |
| Sub-agents | Spawn, isolate context, execute, return structured result | Whether delegation is allowed, objective, scope, tools, budget, done contract | **SPLIT** |
| Parallelism | Concurrent runtime execution | Dependency locks, side-effect locks, repo/worktree locks, resource budgets | **TOWNBOSS-GOVERNED** |
| Tool dispatch | Generic schema invocation, timeout/error plumbing, receipts | Tool allowlist, action risk, permissions, approval tokens, idempotency | **SPLIT** |
| MCP | Protocol/session plumbing | Server registration, trust classification, auth, tool exposure, destructive gates | **SPLIT** |
| Skills | Skill loading/execution mechanism | Canonical skill source, version, precedence, project/domain authority | **SPLIT** |
| Sandbox | Container/Kubernetes/runtime abstraction | Mandatory production isolation profile, mounts, egress, secrets, tenancy | **SPLIT; TOWNBOSS POLICY WINS** |
| Filesystem | Workspace primitives | Repository/worktree leases, user/project scope, allowed paths | **SPLIT** |
| Browser | Playwright/browser execution | Allowed domains/actions, transaction gates, UX evidence requirements | **SPLIT** |
| Context management | Compaction/runtime context mechanics | Source precedence, authority labels, protected invariants, evidence IDs | **SPLIT** |
| Model providers | Provider invocation/configuration abstraction | Approved model roster, routing policy, budgets, safety/quality gates | **SPLIT** |
| Long-term memory | Optional storage/retrieval plumbing | Consent, provenance, identity scope, correction, conflict, deletion, retention | **TOWNBOSS AUTHORITY** |
| Planning | Bounded local reasoning inside an assigned task | MDP/IP authority, CPS task graph, GlenTown Orchestration Engine semantics | **TOWNBOSS ONLY** |
| Scheduling | Local runtime timing primitive only if useful | CPS portfolio scheduling and Glen AI/TownBoss automation authority | **TOWNBOSS ONLY for authoritative scheduling** |
| Human approval | Pause/resume mechanism | What requires approval, who can approve, approval evidence and expiry | **TOWNBOSS ONLY for policy** |
| Validation | Execute requested checks/tools | Validation profile, required gates, interpretation, acceptance | **TOWNBOSS ONLY** |
| Completion | Return worker/runtime result | DONE/accepted/checkpoint eligibility | **TOWNBOSS ONLY** |
| Observability | Raw runtime events/traces/receipts | Canonical evidence schema, redaction, retention, access, audit projection | **SPLIT** |
| Recovery | Runtime retry/resume mechanics | Retry policy, compensation, escalation, no-progress budget, authority | **SPLIT** |
| Transaction compensation | Execute a compensation tool if instructed | Compensation semantics and business correctness | **GLENTOWN DOMAIN ONLY** |
| Git/worktrees | Shell/Git commands if explicitly delegated | Branch/worktree allocation, conflict locks, commit/PR/checkpoint governance | **CPS ONLY** |
| Multi-project registry | None authoritative | Portfolio/project registry, dependencies, priorities, leases | **CPS ONLY** |
| External coding-agent adapters | Potential invocation substrate where proven | Canonical Kilo/Codex/Gemini/Cline worker contract/session governance | **CPS CHASSIS/ADAPTER LAYER** |
| UX verification | Browser execution/screenshots | UX Engine criteria, breakpoint matrix, accessibility/visual acceptance | **CPS UX ENGINE ONLY for acceptance** |

## 4. DeerFlow-owned candidate zone

Subject to POC evidence, DeerFlow is allowed to become the implementation owner of generic mechanics that TownBoss should avoid rebuilding:

- run/thread execution lifecycle;
- runtime checkpoint serialization and restoration;
- bounded sub-agent execution;
- generic tool invocation plumbing;
- MCP protocol plumbing;
- sandbox launch/teardown primitives;
- browser automation primitives;
- context compaction mechanics;
- provider invocation abstraction;
- structured low-level runtime receipts/events.

Even in this zone, TownBoss retains configuration and policy authority. `owns mechanics` never means `owns permission`.

## 5. TownBoss-owned non-delegable zone

The following must not migrate into DeerFlow configuration/prompts as the sole source of truth:

### Portfolio and project authority

- Master Development Plan and Implementation Plans;
- canonical decisions and design authority;
- project/task hierarchy and dependencies;
- portfolio priorities and resource governance;
- checkpoint/release acceptance.

### CPS authority

- task and completion contracts;
- worker scope and permissions;
- repository/worktree leases;
- validation profiles;
- independent review policy;
- Git/PR/checkpoint governance;
- evidence-backed status promotion;
- DONE determination.

### Glen AI authority

- user/account identity and consent;
- personal-context provenance;
- memory correction/deletion/conflict semantics;
- user-visible authority boundaries;
- consequential-action approvals;
- native GlenTown experience routing;
- abstention/evidence-sufficiency policy.

### GlenTown domain authority

- Goal → Tasks → Requirements → Dependencies → Validation Gates → Resources → Schedule → Execution → Exceptions → Completion;
- bookings, orders, payments, deposits, credits and other transactional invariants;
- government adapters and authoritative external-source semantics;
- idempotency and compensation rules;
- business permissions and tenancy.

## 6. Explicit duplicate systems to prohibit

If DeerFlow is adopted, TownBoss must not accidentally operate two authoritative versions of any of these:

1. **Task state** — DeerFlow run status cannot become a second CPS/GlenTown task status.
2. **Planning graph** — DeerFlow planning cannot become a competing MDP/IP or Orchestration Engine graph.
3. **Memory truth** — DeerMem cannot become an independent authoritative user profile beside Glen AI memory.
4. **Scheduling authority** — DeerFlow scheduled tasks cannot independently schedule portfolio/domain work already governed elsewhere.
5. **Approval state** — approval cannot exist only in a model prompt or DeerFlow thread state.
6. **Completion state** — DeerFlow/worker `success` cannot equal CPS/Glen AI `DONE`.
7. **Tool permissions** — DeerFlow tool exposure cannot be the only authorization control.
8. **Audit truth** — third-party tracing cannot replace TownBoss evidence/audit records.
9. **Repository ownership** — DeerFlow filesystem workspaces cannot independently allocate CPS write ownership.
10. **Business workflow state** — domain transactions cannot be represented only by agent/runtime checkpoints.

## 7. Canonical state vs runtime state

### Canonical state

Durable state that remains authoritative even if DeerFlow is removed:

- users/accounts/permissions;
- Glen AI approved memory records and provenance;
- GlenTown business/domain records;
- orchestration goals/tasks/requirements/dependencies/gates;
- CPS project/task/validation/checkpoint state;
- approval records;
- evidence manifests and acceptance decisions.

### Runtime state

Replaceable execution state used to continue a particular agent run:

- model messages/context window;
- sub-agent execution frames;
- transient tool state;
- runtime checkpoints;
- compaction summaries;
- low-level execution cursors;
- sandbox/session handles.

Runtime state may reference canonical IDs. Canonical state must not require interpreting opaque runtime state to determine truth.

## 8. Adapter contract required before adoption

TownBoss should integrate DeerFlow only through a dedicated adapter boundary. Direct domain code should not depend broadly on DeerFlow-specific classes or state formats.

Minimum conceptual contract:

```text
start_run(authority_envelope, task_contract, runtime_profile) -> run_id
resume_run(canonical_task_id, run_id, authorization) -> run
cancel_run(canonical_task_id, run_id, reason)
spawn_worker(parent_run_id, worker_contract) -> worker_id
invoke_tool(run_id, tool_request, policy_token) -> receipt
pause_for_approval(run_id, approval_request) -> canonical_approval_id
collect_evidence(run_id) -> normalized_evidence[]
checkpoint_runtime(run_id) -> runtime_checkpoint_ref
```

The adapter must normalize DeerFlow-specific outputs into TownBoss-owned contracts and evidence types.

## 9. Recovery ownership

Recovery must be layered:

- DeerFlow may retry/reconnect/resume **mechanical runtime failures** within TownBoss-supplied limits.
- TownBoss decides whether a failed action is retryable, requires human attention, requires compensation, or invalidates the task.
- GlenTown domain services own compensation/reconciliation for business side effects.
- CPS owns repository reset/rebase/worktree/checkpoint recovery.
- No automatic runtime retry may repeat a consequential side effect without a TownBoss/domain idempotency guarantee.

## 10. Security ownership

DeerFlow's sandbox/tool facilities are enforcement mechanisms, not security policy authority.

TownBoss must define and enforce:

- default-deny/allowlisted network egress;
- filesystem/mount boundaries;
- secret injection and redaction;
- per-user/project/tool scope;
- destructive-action approvals;
- prompt-injection trust labels;
- trace retention/access;
- model/provider data handling policy.

The POC must prove these controls cannot be bypassed by an agent choosing a different DeerFlow tool path.

## 11. CPS-specific overlap with `Untrivial-ai/agent-orchestrator`

CPS already identifies `Untrivial-ai/agent-orchestrator` as the preferred upstream chassis subject to audit. Therefore DeerFlow cannot be inserted beneath CPS as another general orchestrator by default.

The required comparison must decide one of these shapes:

### Shape A — Agent-orchestrator chassis + no DeerFlow in CPS

Use DeerFlow only for Glen AI/shared services if CPS chassis already covers coding-agent runtime needs better.

### Shape B — Agent-orchestrator chassis + narrowly scoped DeerFlow worker/runtime adapter

Use DeerFlow only where it provides unique value such as sandboxed multimodal/browser/general-agent work without duplicating CPS persistence/scheduling.

### Shape C — DeerFlow replaces selected chassis responsibilities

Allowed only if POC/comparison proves DeerFlow can eliminate, not duplicate, equivalent infrastructure while preserving CPS external coding-agent/worktree/review needs.

### Shape D — DeerFlow becomes shared TownBoss runtime below both CPS and Glen AI

Highest potential reuse, but highest architectural risk. Allowed only if canonical/runtime separation is clean and CPS does not need a second conflicting persistence/scheduling stack.

Current preference before POC: **A or B for CPS; selective shared runtime remains open for Glen AI.**

## 12. Glen AI-specific target shape

The currently preferred candidate shape is:

```text
User
  |
Glen AI intent + authority + consent
  |
GlenTown Orchestration Engine / native capability router
  |
TownBoss DeerFlow adapter
  |
DeerFlow runtime
  +-- model
  +-- bounded sub-agent
  +-- approved tools/MCP
  +-- sandbox/browser
  +-- runtime checkpoint
```

Glen AI memory should be injected into DeerFlow as scoped, provenance-aware context; DeerFlow memory should not independently redefine the user profile.

## 13. POC assertions derived from overlap analysis

The POC must demonstrate all of the following:

1. DeerFlow run `success` does not automatically mark a TownBoss task DONE.
2. A DeerFlow planner suggestion conflicting with canonical plan is rejected/ignored.
3. A sub-agent cannot broaden its TownBoss worker contract.
4. Tool availability is filtered by TownBoss policy, not prompt wording alone.
5. Runtime restart restores execution without creating a second canonical task record.
6. Context compaction preserves protected TownBoss authority/requirement/evidence identifiers.
7. DeerFlow memory cannot cross user/project scope and cannot override corrected canonical memory.
8. A destructive action cannot execute without canonical approval even if an alternate tool path is attempted.
9. Retry of a consequential operation cannot duplicate the side effect.
10. Raw DeerFlow receipts can be normalized into TownBoss evidence with stable task/user/project lineage.
11. For CPS, DeerFlow cannot allocate conflicting write workspaces outside CPS worktree governance.
12. For CPS, independent reviewer rejection keeps canonical task state incomplete regardless of worker/runtime success.

## 14. Overlap conclusion

**Recommended boundary: selective runtime delegation, not authority delegation.**

DeerFlow can potentially save TownBoss substantial implementation effort in generic agent execution mechanics. The architectural value disappears if adoption creates parallel planners, task stores, schedulers, memory truth, approvals, or completion systems.

The POC should therefore test the boundary itself, not merely whether DeerFlow features work.

### Current ownership recommendation

- **DeerFlow:** generic run/sub-agent/tool/MCP/sandbox/browser/context/provider mechanics.
- **TownBoss shared layer:** policy envelope, adapter, canonical evidence mapping, security profile.
- **CPS:** project/task/worktree/validation/review/Git/portfolio authority.
- **Glen AI:** user intent/consent/memory/domain-routing authority.
- **GlenTown Orchestration Engine:** domain workflow semantics, dependencies, validation gates, idempotency and compensation.

Production adoption remains blocked until the adoption POCs and `DEERFLOW_2_VS_AGENT_ORCHESTRATOR_COMPARISON` prove this separation is operationally clean.