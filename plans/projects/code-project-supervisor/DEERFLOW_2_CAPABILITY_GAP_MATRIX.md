# DeerFlow 2 Capability Gap Matrix

**Status:** ACTIVE AUDIT / PRE-POC  
**Scope:** TownBoss shared agent runtime, Code Project Supervisor (CPS), Glen AI  
**Upstream:** `bytedance/deer-flow`  
**Companion audit:** `DEERFLOW_2_ADOPTION_AUDIT.md`

## Purpose

This matrix turns the DeerFlow 2 architecture-fit review into an explicit capability-by-capability gap assessment. It identifies what DeerFlow appears to provide, what TownBoss still requires, where proof is missing, and what must be tested before any production dependency decision.

Classification vocabulary:

- `COVERED_CANDIDATE` — DeerFlow appears to provide the capability; POC evidence still required.
- `PARTIAL` — useful upstream capability exists but TownBoss requires adaptation or extension.
- `TOWNBOSS_OWNED` — intentionally retained above DeerFlow because it is authority, domain, governance, or product logic.
- `GAP` — required capability is not yet demonstrated by DeerFlow and needs another component or TownBoss implementation.
- `CONFLICT` — DeerFlow behavior overlaps or conflicts with TownBoss authority and must not become authoritative.
- `DEFER` — not needed for the first adoption decision.

## Capability gap matrix

| Capability | TownBoss requirement | DeerFlow 2 current fit | Classification | Gap / required adaptation | POC evidence required |
|---|---|---|---|---|---|
| Long-running agent runtime | Tasks may span many tool/sub-agent steps without losing lineage | Persistent threads/checkpoints and long-horizon agent execution are core DeerFlow concepts | `COVERED_CANDIDATE` | Verify stability under interruption, tool failure, and restart | Start task, interrupt mid-run, restart service, resume same lineage |
| Run persistence | Durable state survives process restart | DeerFlow provides checkpointed/persistent thread state | `COVERED_CANDIDATE` | TownBoss authoritative task state must remain separately attributable | Compare pre/post-restart task, receipts, pending approvals, state hashes/IDs |
| Exact-session resume | Resume the intended task, not ambient/latest work | Resume primitives exist | `PARTIAL` | CPS/Glen AI need explicit run identity binding and fail-closed mismatch handling | Attempt valid and invalid resume IDs; verify no accidental adoption |
| Sub-agent creation | Parent may delegate bounded work | Native sub-agent spawning with scoped context/tools/results | `COVERED_CANDIDATE` | Delegation policy must remain TownBoss-controlled | Spawn one bounded worker with explicit objective and termination contract |
| Sub-agent isolation | Worker context and tools limited to task | Scoped contexts/tools are documented | `COVERED_CANDIDATE` | Verify no inherited unauthorized tools/secrets/context | Attempt cross-scope read/tool invocation and prove denial |
| Structured sub-agent results | Parent receives machine-readable result/evidence | DeerFlow supports structured results/tool receipts | `COVERED_CANDIDATE` | TownBoss evidence IDs and lineage must be appended | Require typed result schema and reject malformed completion claims |
| Parallel sub-agents | Safe concurrent independent work | Parallel delegation available | `PARTIAL` | TownBoss dependency, side-effect, repo, and resource locks must constrain fan-out | Two safe tasks parallel; conflicting tasks must serialize/block |
| Agent loop/no-progress control | Repeated ineffective behavior must stop | DeerFlow has loop/iteration controls, but TownBoss thresholds differ | `PARTIAL` | Add TownBoss budgets, retry ceilings, escalation, and no-progress rules | Deliberately induce repeated failure and verify circuit break/escalation |
| Tool registry | Only approved tools exposed per task/user/project | Configurable tools and integrations exist | `PARTIAL` | TownBoss allowlist and authority policy must filter availability dynamically | Authorized tool succeeds; unapproved tool is absent/denied |
| Typed tool execution | Inputs/outputs validated, failures normalized | Tool framework exists | `COVERED_CANDIDATE` | Verify schema enforcement and deterministic error surfaces | Invalid args, timeout, remote error, retryable/non-retryable cases |
| Tool receipts/provenance | Every consequential action attributable to task/user/agent/tool | DeerFlow emits tool/sub-agent receipts | `PARTIAL` | Add TownBoss user/project/task lineage, approval ID, evidence class | Reconstruct one run entirely from structured receipts |
| MCP interoperability | Connect approved external tool servers safely | DeerFlow supports MCP | `COVERED_CANDIDATE` | Require registration, auth, allowlists, timeouts, approval policy | Connect test MCP server; deny unregistered/destructive operation |
| Durable/background MCP work | Long remote jobs survive waiting/restart | DeerFlow exposes durable/background patterns | `COVERED_CANDIDATE` | Cancellation, retry, idempotency and authority semantics need TownBoss policy | Launch job, restart, resume/poll, cancel, verify duplicate prevention |
| Skills | Reusable agent procedures with project-local authority | Skills supported | `PARTIAL` | Skills cannot overwrite canonical TownBoss/project decisions | Load project skill; conflict with plan must resolve in favor of plan |
| Project-local UX/domain rules | Same rules usable across Kilo/Codex/Gemini/DeerFlow | Possible through skills/context/files | `PARTIAL` | Need canonical path/versioning and read-only authority semantics | Same rule set consumed by two different agents with equivalent constraints |
| Sandbox abstraction | Risky execution isolated from host | Local, Docker, Kubernetes sandbox modes | `COVERED_CANDIDATE` | Production must ban unrestricted local/host execution | Run same task in isolated sandbox and verify host boundary |
| Filesystem isolation | Agent cannot roam beyond assigned workspace | Workspace/sandbox filesystem abstractions exist | `PARTIAL` | Need per-user/project/task mount policy and repo/worktree boundaries | Attempt traversal/cross-project read; verify denial |
| Network egress control | Default deny/allowlist for agent sandboxes | Configurable, but open egress may be default in some modes | `GAP` | TownBoss must enforce isolated or explicit allowlist defaults | Verify blocked arbitrary outbound request and allowed approved endpoint |
| Secret isolation | Models/code should not freely access production credentials | Sandbox alone is insufficient | `GAP` | External secret broker/scoped injection/redaction policy required | Prompt-injection attempt cannot read unrelated credentials |
| Browser automation | Agent may inspect/use websites in controlled domains | Playwright/browser tooling available | `COVERED_CANDIDATE` | Domain allowlists, destructive-action gates, evidence screenshots/logs | Navigate allowed site; reject forbidden domain/action; capture receipt |
| UX rendered inspection | CPS UX Engine needs browser/device evidence, not code-only claims | Browser tooling can support web inspection | `PARTIAL` | Add viewport matrix, visual criteria, screenshot evidence, accessibility gates | Render App Site at defined breakpoints and produce evidence-backed findings |
| Model/provider abstraction | Swap providers without rewriting product/runtime | Multi-provider configuration available | `COVERED_CANDIDATE` | Normalize tool calling, structured outputs, retries, safety differences | Execute same bounded task on at least two providers |
| Provider failover | Recover from quota/provider outage without corrupting state | Not yet proven for TownBoss needs | `GAP` | Need explicit routing/failover policy and semantic compatibility checks | Force provider failure; resume safely on approved alternative |
| Context compaction | Long tasks retain requirements/evidence while reducing context | DeerFlow supports context management/compaction | `COVERED_CANDIDATE` | Protect authority, constraints, evidence IDs, unresolved decisions from loss | Force compaction and verify invariant retention |
| Retrieval/context injection | Relevant files/memory/tools added without uncontrolled prompt growth | General context plumbing exists | `PARTIAL` | TownBoss must rank sources and distinguish authority/evidence/reference | Conflicting source test must prefer canonical plan/authority |
| Long-term user memory | Glen AI may retain approved user context across sessions | DeerFlow can integrate memory backends | `PARTIAL` | Consent, provenance, correction, deletion, retention, isolation remain missing | Store, retrieve, correct, delete and isolate one user fact |
| Memory provenance | User can know where a remembered fact came from | Not sufficient as canonical Glen AI guarantee | `GAP` | TownBoss provenance schema and source linkage required | Every surfaced memory fact must show source/creation lineage internally |
| Memory conflict handling | Newer/corrected facts must not silently coexist as truth | Not yet demonstrated to TownBoss standard | `GAP` | Temporal/conflict resolution contract required | Inject contradictory facts; verify explicit resolution/state |
| Memory forgetting/deletion | User-directed deletion propagates reliably | Backend-dependent | `GAP` | TownBoss deletion contract and verification required | Delete fact and prove it cannot be retrieved through caches/indexes |
| User/account isolation | One Glen AI user cannot access another's context | Must be guaranteed end-to-end | `GAP` until proven | Bind runtime, memory, tools, files and receipts to tenant/user scope | Cross-user retrieval/tool attempt must fail |
| Human approval gates | Execution can pause for approval before consequential action | Interrupt/human-in-loop patterns are possible | `PARTIAL` | TownBoss decides which actions require approval and stores approval evidence | Pause before destructive action; approve/deny; resume correctly |
| Destructive-action enforcement | Model cannot bypass approval by choosing another tool/path | Caller-side policy is not sufficient | `GAP` | Central policy enforcement outside model prompt required | Multiple attempted bypass paths all denied without valid approval token |
| Authority/risk classification | Every task/action mapped to allowed authority level | Not a DeerFlow product concern | `TOWNBOSS_OWNED` | Keep in CPS/Glen AI authority model | Demonstrate runtime receives/enforces precomputed policy envelope |
| Canonical planning authority | MDP/Implementation Plans define project intent | DeerFlow planner cannot own this | `CONFLICT` | DeerFlow planning may assist only inside bounded task contracts | Deliberately conflicting plan suggestion must not override canonical task |
| GlenTown Orchestration Engine semantics | Goal→Tasks→Requirements→Dependencies→Gates→Resources→Schedule→Execution→Exceptions→Completion | DeerFlow is generic and must not replace domain semantics | `TOWNBOSS_OWNED` | Adapter must expose runtime primitives under GlenTown orchestration authority | Run one planner scenario where TownBoss engine controls dependencies/gates |
| CPS task contracts | Coding agents receive bounded objective, scope, authority and done criteria | Generic task prompts exist | `TOWNBOSS_OWNED` | CPS contract compiler remains above runtime | Worker cannot broaden scope beyond CPS contract |
| Completion verification | Worker/model prose cannot mark work DONE | DeerFlow can return completion but not TownBoss acceptance | `CONFLICT` | CPS/Glen AI validation gate is authoritative | Worker says done while test fails; task remains not done |
| Independent reviewer | Consequential implementation reviewed by separate context/agent | Sub-agent primitives can support it | `PARTIAL` | Reviewer independence and non-self-approval policy required | Implementer and reviewer contexts separated; reviewer can reject |
| Validation profiles | Required tests/lint/security/UX gates vary by task | Generic tools can run checks | `TOWNBOSS_OWNED` | CPS chooses profile and interprets evidence | Required failing gate prevents completion even if other checks pass |
| Repository/worktree isolation | CPS write agents must not collide | DeerFlow filesystem isolation is not equivalent to Git worktree governance | `GAP` for CPS | Retain/adopt dedicated repo/worktree manager | Two write tasks get distinct branches/worktrees and attributable commits |
| Git checkpoint/commit/PR governance | Verified work becomes controlled checkpoint/PR | General command execution possible | `GAP` for CPS | CPS/agent-orchestrator remains owner unless DeerFlow proves equivalent | Commit only after gates; verify task lineage and expected diff |
| Multi-project registry | CPS supervises multiple projects/repos | DeerFlow is not currently TownBoss portfolio registry | `GAP` for CPS | CPS retains portfolio/project registry | Concurrent tasks in two repos stay isolated and correctly attributed |
| Cross-project dependency graph | Tasks may depend on changes in another project | Not demonstrated | `GAP` for CPS | CPS owns dependency-aware portfolio scheduling | Downstream task remains blocked until upstream evidence/checkpoint exists |
| Worker adapter layer | Kilo, Codex, Gemini, Cline etc. run through common contract | DeerFlow runs model/sub-agents, not necessarily external coding agents equivalently | `GAP` for CPS | Compare against `Untrivial-ai/agent-orchestrator` adapter model | Execute same CPS task through at least Kilo and Codex adapters |
| External coding-agent session resume | Resume exact Kilo/Codex/etc. session where supported | Not established as DeerFlow strength | `GAP` for CPS | Likely remains CPS upstream-chassis responsibility | Suspend/resume exact external coding-agent session |
| Portfolio scheduler | Resource/dependency-aware scheduling across projects | DeerFlow scheduling is not CPS portfolio authority | `CONFLICT` if promoted | CPS remains scheduler; DeerFlow scheduler only optional local primitive | Verify runtime cannot independently reorder authoritative CPS plan |
| Scheduled user automations | Glen AI may run approved recurring tasks | DeerFlow has scheduled-task support | `DEFER` | Avoid duplicating TownBoss/ChatGPT automation concepts until ownership decided | None for initial POC |
| Observability/tracing | Operator can inspect meaningful execution without exposing secrets | LangSmith/Langfuse/Monocle and runtime events available | `PARTIAL` | Add TownBoss event schema, redaction, retention, access controls | Reconstruct run while secret values remain absent/redacted |
| Audit/event durability | Evidence survives service restart and supports dispute/debug | Runtime persistence exists | `PARTIAL` | Need append-safe authoritative audit projection and stable IDs | Restart then reconstruct lifecycle from persisted structured events |
| Cost/token/resource budgets | Per task/user/project/provider limits | Generic model configs exist | `GAP` | TownBoss budget enforcement needed | Exceed test budget and verify clean stop/escalation |
| Cancellation | Operator/user can stop a run safely | Runtime cancellation likely available but needs verification | `COVERED_CANDIDATE` | Must propagate to sub-agents/background tools without corrupting state | Cancel during tool/sub-agent operation; verify terminal consistent state |
| Idempotency | Retried transactional actions must not duplicate side effects | Not guaranteed by generic runtime | `GAP` | Domain/tool adapters need idempotency keys and replay protection | Retry simulated booking/payment-like action with one side effect only |
| Transaction compensation | Multi-step failure can undo/reconcile prior effects | Not a generic guarantee | `GAP` | Keep in GlenTown Orchestration Engine/domain workflows | Fail step 3 of 4 and prove compensation/reconciliation contract |
| Data privacy/retention | User/project data retention follows TownBoss policy | Backend/integration dependent | `GAP` | Define storage map, retention, deletion and processor boundaries | Enumerate stored artifacts; enforce deletion/retention test |
| Prompt-injection resistance | Web/files/MCP/memory cannot escalate authority | Runtime alone cannot guarantee this | `GAP` | Central policy, content trust labels, tool gating, security tests required | Inject malicious page/file/MCP payload; consequential tool remains denied |
| Production deployment | Reproducible, pinned, supportable service | Docker/Kubernetes paths exist | `COVERED_CANDIDATE` | Pin revision/images; health checks; backups; upgrade/rollback policy | Deploy pinned build, restart, upgrade test, rollback test |
| Windows developer usability | Can be developed/tested from current Windows workflow | Likely feasible via supported dev/container paths | `PARTIAL` | Current machine limitations (Docker/virtualization history) may affect local sandbox choice | Run minimal dev setup on actual Glen workstation or approved remote dev host |
| Licensing | Commercial use must be compatible | DeerFlow is MIT | `COVERED_CANDIDATE` | Dependency/license inventory still required | Generate dependency/license review for pinned revision |

## Summary by category

### Strongest DeerFlow candidates

The current audit indicates the strongest potential reuse is in:

- long-running run/thread lifecycle;
- checkpoint persistence and resume;
- sub-agent execution;
- tool dispatch and receipts;
- MCP integration;
- sandbox abstraction;
- browser execution;
- context compaction;
- model/provider abstraction;
- baseline observability.

These are generic runtime concerns and therefore good candidates for selective shared infrastructure.

### Largest gaps for Glen AI

DeerFlow does **not** eliminate the need for TownBoss-owned Glen AI contracts around:

- user/account isolation;
- consent and authority;
- provenance-aware memory;
- correction/forgetting/conflict handling;
- transactional approval and idempotency;
- domain orchestration and compensation;
- prompt-injection resistance;
- privacy/retention policy.

### Largest gaps for CPS

DeerFlow does **not** currently demonstrate replacement-level coverage for:

- repository/worktree governance;
- Kilo/Codex/Gemini/Cline worker adapters;
- exact external coding-agent session resume;
- multi-project registry;
- cross-project dependency scheduling;
- Git checkpoint/PR governance;
- CPS completion contracts and validation profiles;
- independent review policy;
- portfolio-level resource/authority governance.

This is why DeerFlow remains a **runtime/component candidate** for CPS rather than the preferred CPS chassis at this stage.

## POC priority gaps

The first POC should prioritize the capabilities whose uncertainty most affects the adoption decision:

1. restart/resume integrity;
2. user/project/task isolation;
3. sub-agent isolation and structured results;
4. central tool permission enforcement;
5. sandbox filesystem + network isolation;
6. secrets and prompt-injection boundaries;
7. context compaction invariants;
8. provider portability/failure behavior;
9. human approval interruption/resume;
10. structured receipts/evidence lineage;
11. memory correction/deletion/provenance for Glen AI;
12. independent reviewer separation for CPS.

## Adoption gate

No row marked `GAP`, `PARTIAL`, or `CONFLICT` may be treated as implicitly solved by DeerFlow documentation or model behavior. Required capabilities must either:

1. pass a bounded POC with evidence;
2. be explicitly owned by an existing TownBoss/CPS/Glen AI component; or
3. receive an approved deferral compatible with the intended deployment.

Production adoption remains blocked until the companion `DEERFLOW_2_ADOPTION_AUDIT.md` POC and security gates are satisfied.
