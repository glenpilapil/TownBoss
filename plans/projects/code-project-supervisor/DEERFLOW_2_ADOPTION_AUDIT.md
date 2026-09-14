# DeerFlow 2 Adoption Audit

**Status:** ACTIVE AUDIT — ARCHITECTURE FIT COMPLETE / POC REQUIRED  
**Scope:** TownBoss / Code Project Supervisor / Glen AI  
**Upstream:** `bytedance/deer-flow` (DeerFlow 2.x)  
**License:** MIT  
**Decision authority:** TownBoss canonical plans and project implementation plans remain authoritative.

## 1. Audit purpose

Determine whether DeerFlow 2 should become a shared agent-runtime dependency for Glen AI and/or Code Project Supervisor (CPS), be selectively adopted, remain a reference only, or be rejected.

This audit is intentionally stricter than a feature review. DeerFlow may provide runtime infrastructure, but it must not become a competing source of product, project, authority, validation, or domain truth.

## 2. Current upstream assessment

DeerFlow 2 is a ground-up rewrite positioned as a long-horizon SuperAgent harness. It is built on LangGraph/LangChain and currently provides or documents:

- sub-agent spawning with scoped contexts, tools, termination conditions, structured results, and tool receipts;
- long-term memory with DeerMem plus optional alternate backends;
- skills and configurable tools;
- MCP server integration and durable-background-task adaptation;
- local, Docker, and Kubernetes sandbox modes;
- filesystem/workspace isolation;
- Playwright-based browser control;
- persistent threads/checkpoints and resume flows;
- embedded Python client and HTTP gateway;
- scheduled-task MVP;
- multi-provider model configuration;
- LangSmith, Langfuse, and Monocle tracing;
- terminal workbench/headless execution;
- MIT licensing.

Important upstream security facts:

- Local execution can run code directly on the host and is therefore not an acceptable production default for TownBoss agent execution.
- Docker AIO sandboxes default to open egress unless operators explicitly choose `isolated` or `allowlist` network policy.
- DeerFlow documents that prompt-injected code inside a sandbox may access mounted credential material in some integrations; sandbox presence alone must not be treated as a complete secret boundary.
- Some destructive MCP/memory operations still rely on caller-side confirmation policy rather than DeerFlow enforcing confirmation itself.

## 3. TownBoss architectural rule

DeerFlow may be considered a **runtime substrate**, never a TownBoss authority layer.

Target separation if adopted:

```text
TownBoss / GlenTown authority
    |
    +-- Master Development Plan / Implementation Plans
    +-- Glen AI authority + user permissions
    +-- CPS task contracts + completion contracts
    +-- GlenTown domain rules
    +-- Shared Orchestration Engine domain semantics
    +-- Validation gates / independent review / evidence policy
    |
    v
TownBoss runtime adapter
    |
    v
DeerFlow 2 runtime capabilities
    +-- run/thread lifecycle
    +-- sub-agent execution
    +-- context plumbing
    +-- tool dispatch
    +-- sandbox/filesystem execution
    +-- persistence/checkpoint primitives
    +-- selected memory plumbing
    +-- observability adapters
    |
    v
Models / MCP servers / external tools / sandboxes
```

No DeerFlow planner, memory backend, tool registry, or scheduler may silently override TownBoss planning, authority, domain, or completion semantics.

## 4. Initial ADOPT / ADAPT / KEEP / REJECT / DEFER matrix

| Capability | Initial decision | Rationale / TownBoss boundary |
|---|---|---|
| Run/thread lifecycle | **ADOPT candidate** | Mature reusable runtime concern; POC must prove restart/resume integrity. |
| Persistent checkpoints/resume | **ADOPT candidate** | Strong fit for long-horizon Glen AI and CPS work; canonical TownBoss state still separate. |
| Sub-agent runtime | **ADOPT candidate** | Scoped contexts, structured returns, and receipts align well; CPS/Glen AI decide when delegation is allowed. |
| Parallel sub-agent dispatch | **ADAPT** | Use only through TownBoss dependency/side-effect rules; no uncontrolled fan-out. |
| Tool dispatch | **ADOPT candidate** | Useful generic infrastructure; TownBoss supplies permission and authority policy. |
| Tool receipts/provenance | **ADOPT + EXTEND** | Strong base; TownBoss evidence model must add project/user/task lineage. |
| Skills system | **ADAPT** | Useful implementation mechanism; canonical TownBoss/project UX/domain rules stay outside agent-owned mutable authority. |
| MCP integration | **ADOPT candidate** | Strong interoperability layer; must be wrapped by allowlists, auth, timeouts, audit, and destructive-action gates. |
| Durable MCP background tasks | **ADOPT candidate** | Good fit for long-running integrations; TownBoss must govern retries, cancellation, and authority. |
| Sandbox abstraction | **ADOPT candidate** | Valuable, but production baseline must be isolated container/remote sandbox, never unrestricted host execution. |
| Sandbox local execution | **REJECT for production** | Host-level execution conflicts with TownBoss safety boundary. Dev-only use may be explicitly allowed. |
| Default open sandbox egress | **REJECT as TownBoss default** | TownBoss must default to isolated/allowlisted egress. |
| Filesystem workspace | **ADOPT candidate** | Good generic primitive; CPS repository/worktree isolation remains separately governed. |
| Agentic browser / Playwright | **ADOPT candidate** | Useful for UX audits, web workflows, and Glen AI actions; requires domain allowlists and action gating. |
| Long-term memory plumbing | **ADAPT** | Runtime storage/retrieval may be reused; Glen AI memory consent, provenance, conflict, correction, deletion, and privacy policies remain TownBoss-owned. |
| DeerMem fact model as Glen AI authority | **REJECT** | Insufficient as canonical Glen AI personal-context authority without provenance/consent extensions. |
| Alternate memory backends (mem0/Honcho/OpenViking) | **DEFER** | Evaluate separately only after Glen AI memory contract is finalized. |
| Context compaction | **ADOPT candidate** | Useful long-horizon primitive; must preserve task requirements, evidence IDs, and authority boundaries. |
| Model/provider abstraction | **ADOPT candidate** | Supports TownBoss model independence; benchmark provider switching and failure normalization. |
| Tracing integrations | **ADAPT** | Valuable observability, but traces can contain prompts/tool args/model outputs and therefore require privacy/secrets controls. |
| Scheduled tasks | **DEFER / selective** | Useful but TownBoss already has scheduling/automation concepts; avoid duplicate scheduling authority. |
| DeerFlow Web UI | **REFERENCE / optional** | Useful operator/debug surface, not a TownBoss product UI authority. |
| DeerFlow TUI | **REFERENCE / optional** | Useful for engineering and diagnostics; CPS UI/CLI strategy remains independently governed. |
| DeerFlow planner as CPS project planner | **REJECT** | CPS planning authority comes from canonical TownBoss/project plans and explicit task contracts. |
| DeerFlow planner as GlenTown domain orchestrator | **REJECT** | Shared GlenTown Orchestration Engine owns domain semantics and validation gates. |
| DeerFlow completion claims | **REJECT as authority** | CPS/Glen AI completion requires TownBoss-defined validation/evidence. |
| DeerFlow scheduler as portfolio supervisor | **REJECT** | CPS owns project portfolio scheduling and dependency governance. |

## 5. Glen AI-specific fit

### Strong fit

- persistent conversation/runtime state;
- model/provider independence;
- sub-agent context isolation;
- tool and MCP plumbing;
- browser execution;
- sandboxed code/file operations where needed;
- context compaction;
- optional memory backend interface;
- traceability and tool receipts.

### TownBoss must retain

- user intent and consent boundaries;
- memory provenance and reviewability;
- correction/forgetting rules;
- identity/account permissions;
- GlenTown domain authority;
- native experience routing;
- Orchestration Engine task/requirement/dependency/validation semantics;
- government-adapter authority boundaries;
- transactional approval requirements;
- evidence sufficiency and abstention policy.

### Initial Glen AI conclusion

**SELECTIVE ADOPTION CANDIDATE.** DeerFlow appears promising as a runtime substrate, but its memory and planning behavior must remain subordinate to Glen AI authority and the shared Orchestration Engine.

## 6. CPS-specific fit

CPS already defines itself as a control plane above coding agents and currently prefers `Untrivial-ai/agent-orchestrator` as the upstream chassis subject to audit. DeerFlow therefore must not be adopted as a second full orchestrator without comparison.

### Strong fit

- persistent runs and resume;
- sub-agent isolation;
- tool/sandbox execution;
- receipts and tracing;
- model abstraction;
- headless/embedded client access;
- background task primitives;
- browser capability useful for UX verification.

### Potential conflict

- CPS requires repository/worktree isolation, project registry, task graph, worker adapters for Kilo/Codex/Cline/Gemini, checkpoint/PR governance, independent review, and portfolio scheduling.
- DeerFlow is a general SuperAgent harness, not demonstrably a complete replacement for the coding-agent supervisor chassis.
- Adopting DeerFlow beneath an already adopted `agent-orchestrator` could create nested orchestration, duplicate persistence, duplicate scheduling, and ambiguous recovery ownership.

### Initial CPS conclusion

**REFERENCE + COMPONENT CANDIDATE, NOT YET CHASSIS.** Compare DeerFlow directly against the selected CPS upstream foundation before any dependency decision. The likely useful role is shared runtime components or a specialized worker/runtime adapter, unless POC evidence shows it can simplify rather than duplicate CPS.

## 7. Required POC gates before dependency adoption

No production dependency decision is allowed until both bounded POCs pass.

### POC A — Glen AI runtime

Required scenario:

1. start a user-scoped conversation;
2. persist and retrieve explicit user context;
3. execute one typed GlenTown-style tool through an allowlist;
4. spawn one bounded sub-agent;
5. run one orchestration-style task with requirement/dependency checks supplied by TownBoss logic;
6. interrupt execution;
7. restart/resume without losing authoritative task state;
8. show tool/sub-agent receipts and evidence lineage;
9. correct or delete a stored user fact and verify scope isolation;
10. demonstrate that an unauthorized/destructive tool request is denied by TownBoss policy even if the model requests it.

Suggested demo scenario: plan a Saturday in Puerto Princesa with two errands, requirements, a lunch option, unresolved requirements, and a resumable plan.

### POC B — CPS runtime

Required scenario:

1. ingest an isolated test repository and canonical implementation plan;
2. create a bounded CPS task contract outside DeerFlow;
3. invoke an implementation worker;
4. execute tests in an isolated sandbox/worktree;
5. invoke an independent reviewer with separate context;
6. deliberately inject one failed implementation or validation failure;
7. recover without marking the task complete;
8. interrupt/restart and resume the exact task lineage;
9. emit structured evidence and tool receipts;
10. allow CPS—not DeerFlow—to decide DONE and checkpoint eligibility.

## 8. Security gates

Before any production use:

- production execution must use isolated container/remote sandbox mode;
- network egress must default deny or explicit allowlist;
- cloud metadata/private/link-local access must remain blocked;
- credentials must not be mounted into general-purpose agent sandboxes where avoidable;
- secret-bearing traces must be disabled/redacted or routed only to approved trusted destinations;
- MCP servers require explicit registration, tool allowlists, auth controls, timeouts, and destructive-action approval policy;
- memory backends require per-user isolation, deletion/correction semantics, provenance, retention policy, and privacy review;
- prompt-injection tests must cover web pages, MCP results, uploaded files, and memory content;
- background/scheduled tasks must fail closed when human approval is required.

## 9. POC success criteria

All of the following must be demonstrated with evidence:

- persistence across process restart;
- exact user/project/task isolation;
- controlled tool execution;
- sub-agent context isolation;
- bounded parallelism;
- model/provider portability;
- interruption and resume;
- observable tool/sub-agent receipts;
- TownBoss-controlled completion and approval gates;
- no silent fallback from required safety controls;
- acceptable latency/resource overhead;
- no duplicate authoritative state with the existing CPS/GlenTown control planes.

## 10. Current audit decision

**Decision: PROCEED TO POC; NO PRODUCTION ADOPTION YET.**

Current recommended classification:

- **Glen AI:** high-priority selective runtime candidate.
- **CPS:** high-priority runtime/reference candidate; must be compared against `Untrivial-ai/agent-orchestrator` before any chassis decision.
- **TownBoss shared infrastructure:** possible reusable agent-runtime layer only if it reduces duplication across Glen AI and CPS without becoming a third orchestration authority.

## 11. Next tasks

- [ ] `DEERFLOW_2_POC_ENVIRONMENT` — establish isolated test deployment and pinned upstream revision.
- [ ] `GLEN_AI_DEERFLOW_2_POC` — execute POC A and capture evidence.
- [ ] `CPS_DEERFLOW_2_POC` — execute POC B and capture evidence.
- [ ] `DEERFLOW_2_VS_AGENT_ORCHESTRATOR_COMPARISON` — compare overlap, persistence, adapters, worktree model, review/CI flows, and control-plane fit.
- [ ] `DEERFLOW_2_SECURITY_REVIEW` — sandbox, egress, credentials, MCP, prompt injection, tracing, memory privacy.
- [ ] Final classification: `ADOPT_CORE`, `SELECTIVE_ADOPTION`, `REFERENCE_ONLY`, or `REJECT`.
