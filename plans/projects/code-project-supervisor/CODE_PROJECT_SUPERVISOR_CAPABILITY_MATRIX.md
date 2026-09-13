# Code Project Supervisor — Capability Matrix

**Status:** CANONICAL / INITIAL  
**Purpose:** Definitive completeness map for CPS. Prevents moving goalposts and duplicate implementation.

## Classification Vocabulary

- `REQUIRED` — must exist before CPS can be declared operational.
- `OPTIONAL` — useful but not part of the first operational finish line.
- `INHERIT` — supplied sufficiently by adopted upstream.
- `CONFIGURE` — upstream capability exists but needs configuration.
- `EXTEND` — upstream capability exists but needs CPS-specific extension.
- `PORT_FROM_LEGACY` — proven CodeBisor behavior is worth selectively porting.
- `NEW` — no acceptable upstream/legacy implementation; must be built.
- `DROP` — intentionally not carried forward.
- `UNKNOWN` — requires adoption audit.

## Capability Register

| Capability | Required? | Likely ownership/source | Adoption class | Current status | Acceptance evidence |
|---|---|---|---|---|---|
| Persistent background supervisor/daemon | REQUIRED | Agent Orchestrator | UNKNOWN | Audit pending | Authority survives UI detach/restart |
| Multi-project registry | REQUIRED | Agent Orchestrator + CPS config | UNKNOWN | Audit pending | Two projects independently supervised |
| Repository/worktree resolution | REQUIRED | Agent Orchestrator / CPS adapter | UNKNOWN | Audit pending | Correct project/worktree selected |
| Natural-language job intake | REQUIRED | CPS control layer | UNKNOWN | Planned | Objective becomes bounded task contract |
| Task decomposition | REQUIRED | Project orchestrator | UNKNOWN | Audit pending | Objective decomposed into traceable tasks |
| Dependency handling | REQUIRED | Upstream/CPS | UNKNOWN | Audit pending | Blocked tasks wait; eligible tasks proceed |
| Worker adapter abstraction | REQUIRED | Agent Orchestrator | UNKNOWN | Audit pending | Kilo/Codex/etc. launched through common contract |
| Kilo worker support | REQUIRED | Upstream adapter or extension | UNKNOWN | Audit pending | Bounded task completes with evidence |
| Codex worker support | REQUIRED | Upstream adapter | UNKNOWN | Audit pending | Bounded task completes with evidence |
| Cline worker support | OPTIONAL | Upstream adapter | UNKNOWN | Audit pending | Adapter can launch/resume safely |
| Gemini worker support | OPTIONAL | Upstream/extension | UNKNOWN | Audit pending | Quota/failure normalized safely |
| Same-worktree write isolation | REQUIRED | Agent Orchestrator | UNKNOWN | Audit pending | No concurrent conflicting writers |
| Cross-project concurrency | REQUIRED | Agent Orchestrator | UNKNOWN | Audit pending | Independent projects run concurrently |
| Worker/session persistence | REQUIRED | Agent Orchestrator | UNKNOWN | Audit pending | Supervisor restart retains session truth |
| Exact-session resume where supported | REQUIRED | Adapter layer | UNKNOWN | Audit pending | Resume does not adopt ambient process |
| Provider/resource budgets | REQUIRED | CPS governance | UNKNOWN | Planned | Recovery/resource ceilings enforced |
| Recovery/no-progress circuit breaker | REQUIRED | Upstream + CPS policy | UNKNOWN | Audit pending | Repeated no-progress stops automatically |
| Human attention/decision gate | REQUIRED | CPS extension | UNKNOWN | Planned | Only genuine decisions reach operator |
| Authority/risk classification | REQUIRED | CPS | NEW/EXTEND | Planned | Task risk maps to allowed actions |
| Completion contract verification | REQUIRED | CPS | PORT_FROM_LEGACY/EXTEND | Planned | Worker prose alone cannot mark DONE |
| Validation profiles | REQUIRED | CPS | EXTEND | Planned | Required gates run per task risk/type |
| Independent review | REQUIRED for consequential work | Upstream review + CPS policy | UNKNOWN | Audit pending | Implementer cannot self-approve high-risk work |
| Checkpoint/commit/PR handling | REQUIRED | Agent Orchestrator + CPS gates | UNKNOWN | Audit pending | Verified work yields coherent checkpoint |
| Documentation compliance gate | REQUIRED | CPS | NEW | Planned | Planning/execution/final doc checks evidenced |
| Project Memory update | REQUIRED | CPS | NEW | Planned | Milestone handoff appends durable memory |
| Portfolio status/current-state view | REQUIRED | Upstream UI + CPS projection | UNKNOWN | Audit pending | Operator can see current work/attention |
| Detailed event/history view | REQUIRED | Agent Orchestrator | UNKNOWN | Audit pending | Meaningful events available without heartbeat noise |
| System tray | OPTIONAL | Legacy/OS integration | DROP unless justified | Deferred | Not required for first operational acceptance |
| Custom terminal rendering engine | NO | None | DROP | Dropped | Upstream UI preferred |
| Bespoke dashboard framework | NO | None | DROP | Dropped | No duplicate supervisor UI infrastructure |
| Remote/cloud operation | OPTIONAL | Future | DEFER | Deferred | Security model required first |
| TownBoss plan ingestion | REQUIRED | CPS | EXTEND/NEW | Planned | CPS can resolve canonical project docs/tasks |
| Documentation freshness/local clone checks | REQUIRED | CPS | NEW | Planned | Stale governance source detected/fails closed |
| Compliance receipt generation | REQUIRED | CPS | NEW | Planned | Final report includes documented compliance receipt |
| Operational freeze after acceptance | REQUIRED governance behavior | CPS rules | CONFIGURE | Planned | No CPS feature work unless real product blocker |

## Audit Rule

The Agent Orchestrator adoption audit must replace every `UNKNOWN` with an evidence-backed classification and identify the exact upstream module/configuration or CPS gap.

## Operational Rule

CPS cannot be declared operational while any `REQUIRED` capability lacks either implementation evidence or an explicitly approved deferral compatible with the operational acceptance test.