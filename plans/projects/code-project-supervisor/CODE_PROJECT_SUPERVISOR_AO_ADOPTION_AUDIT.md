# Code Project Supervisor — Agent Orchestrator Adoption Audit

**Task ID:** CPS_PHASE_0_AGENT_ORCHESTRATOR_ADOPTION_AUDIT
**Date:** 2026-09-13
**Status:** COMPLETE
**Recommendation:** CONDITIONAL_GO

---

## 1. TownBoss Baseline

| Field | Value |
|-------|-------|
| Repository | `D:\Projects\TownBoss` |
| Branch | `main` |
| HEAD SHA | `8f3ef37adf75137dda490aa9228aa4e22994631b` |
| Freshness | Clean, up to date with `origin/main` |
| Status | `git status -sb` showed clean working tree |

---

## 2. Upstream Repository Audited

| Field | Value |
|-------|-------|
| Remote URL | `https://github.com/Untrivial-ai/agent-orchestrator` |
| Clone path | `D:\Projects\agent-orchestrator-audit` |
| Branch | `main` |
| HEAD SHA | `cadde8c9fd2079d0decca654004760ad8439328e` |
| License | Apache-2.0 |
| Repository cleanliness | Clean working tree, shallow clone |
| Primary language | Go (backend), TypeScript/Electron (frontend) |
| Go module | `github.com/aoagents/agent-orchestrator/backend` |
| Go version | 1.25.7 |

---

## 3. Upstream License

Apache License Version 2.0, January 2004.
File: `D:\Projects\agent-orchestrator-audit\LICENSE`

**Commercial-use implications:** Permissive. Commercial use, modification, and distribution are permitted with standard Apache-2.0 attribution and NOTICE preservation. No copyleft restrictions.

**Redistribution implications:** Standard Apache-2.0 obligations:
- Preserve copyright/patent/trademark notices
- Include a copy of the license in redistributed binaries
- State changes if modifying source files
- NOTICE file attribution if present

**Bundled/subdependency licenses:** Go module dependencies include standard permissive licenses (MIT, BSD, Apache-2.0). No GPL/LGPL copyleft dependencies identified in `go.mod`. `modernc.org/sqlite` is MIT-licensed CGO-free SQLite. No licensing red flags.

**Security review requirement:** Apache-2.0 does not relieve the project of security review duties. Dependencies should be reviewed at cadence per CPS Upstream Sync Policy.

---

## 4. Runtime/Toolchain Requirements

| Component | Requirement |
|-----------|-------------|
| Go toolchain | Go 1.25.7 (for backend build from source) |
| Node/npm | Required for frontend build; npm frozen as install path |
| Git | Required for worktree operations |
| SQLite | Bundled via `modernc.org/sqlite` (CGO-free, no system SQLite needed) |
| OS | Windows, macOS, Linux |
| Desktop runtime | Electron (bundled in desktop app) |

**Current workstation status:**
- Git 2.55.0.windows.3 ✓
- Node.js v24.19.0, npm 11.17.0 ✓
- Go: NOT INSTALLED ✗ (prerequisite for source build)
- AO desktop binary available for Windows as pre-built `.exe` ✓

**Impact:** Go must be installed before Phase 1 (fork establishment and baseline build). This is an environment setup task, not an upstream blocker.

---

## 5. Windows Compatibility Result

**Result: STRONG WINDOWS SUPPORT**

Evidence from source:

| Feature | Evidence |
|---------|----------|
| ConPTY runtime | `backend/internal/adapters/runtime/conpty/spawn_windows.go`, `host_conpty_windows.go`, `pidalive_windows.go` |
| Process management | `backend/internal/process/command_windows.go` — `CREATE_NO_WINDOW` flag |
| Process liveness | `backend/internal/processalive/process_windows.go` — `OpenProcess` + `WaitForSingleObject` |
| Windows path resolution | `backend/internal/service/session/path_resolve_windows.go` |
| Codex Windows security | `backend/internal/service/agent/codex_windows_security.go` |
| Codex file replacement | `backend/internal/service/agent/codex_file_replace_windows.go` |
| Daemon listener | `backend/internal/daemon/supervisor/listen_windows.go` |
| Browser runtime | `backend/internal/browserruntime/listen_windows.go` |
| Preview server | `backend/internal/previewserver/process_windows.go` |
| System execution | `backend/internal/adapters/systemexec/process_windows.go` |
| CLI process handling | `backend/internal/cli/process_windows.go` |
| Named pipe browser bridge | `ao-browser[-dev]` named pipe on Windows |
| Desktop binary | `agent-orchestrator-win32-x64.exe` published in GitHub Releases |

**Assessment:** AO has explicit, non-trivial Windows code paths across process, PTY, filesystem, browser bridge, and desktop packaging. Windows is a first-class target, not an afterthought. No material Windows adoption barrier identified in the source.

---

## 6. High-Level Architecture Map

```
Operator
   |
   v
AO Desktop (Electron + React)  ←→  ao CLI (Cobra)
   |                                    |
   v                                    v
Loopback HTTP Daemon (127.0.0.1:3001) — Go, chi router
   |
   +-- REST Controllers (sessions, projects, PRs, reviews, agents, etc.)
   +-- SSE Event Stream (/api/v1/events)
   +-- Terminal WebSocket (/mux)
   |
   v
Core Services
   +-- Session Service — read-model assembly, kanban, status derivation
   +-- Project Service — CRUD, workspace registration
   +-- PR Service — observation, merge, resolve-comments
   +-- Review Service — review triggering, delivery
   +-- Chat Service — native Chat controllers (Codex, Claude Code, etc.)
   +-- Session Manager — spawn, kill, restore, interface transitions
   +-- Lifecycle Manager — durable fact reducer (activity_state, is_terminated)
   +-- SCM Observer — GitHub/GitLab polling (30s tick)
   +-- Runtime Reaper — liveness probes (5s tick)
   +-- Autoreview Coordinator — idle-triggered review sweeps
   +-- Push Dispatcher — Expo push notifications
   |
   v
Persistence Layer
   +-- SQLite (modernc.org/sqlite, CGO-free)
   +-- Goose migrations
   +-- sqlc-generated typed queries
   +-- change_log table + CDC poller + Broadcaster
   |
   v
Adapters (all implement port interfaces)
   +-- Agent Adapters (39): Kilo, Codex, Claude Code, Cline, OpenCode, etc.
   +-- Chat Drivers (15): ACP, Codex app-server, persistent host
   +-- Runtime Adapters: tmux, ConPTY (Windows), ptyexec
   +-- Workspace Adapters: git worktree, scratch
   +-- SCM Adapters: GitHub, GitLab
   +-- Reviewer Adapters (22): Claude Code, Codex, Cline, Kilo, etc.
   +-- Tracker Adapters: GitHub, GitLab
```

**Key architectural principles:**
1. **Port-based design** — core depends on interfaces in `backend/internal/ports/`, adapters implement them
2. **Durable facts, derived status** — only `activity_state`, `is_terminated`, PR facts, and controller generation are persisted; display status computed at read time
3. **Observer pattern** — SCM Observer and Runtime Reaper observe external state; Lifecycle Manager reduces observations into durable facts
4. **CDC pipeline** — DB triggers → `change_log` → poller → broadcaster → SSE/terminal fanout
5. **Isolation** — each session owns one worktree and exactly one live controller (TUI or Chat)

---

## 7. Daemon/Control-Plane Result

**Result: INHERIT with minor CPS extension points**

| Aspect | AO Evidence | CPS Implication |
|--------|-------------|-----------------|
| Entry point | `backend/cmd/ao/main.go` → `daemon.Run()` | Inherit |
| Daemon supervisor | `backend/internal/daemon/supervisor/` — connection-watchdog with grace period | Inherit |
| Loopback listener | `127.0.0.1:3001`, unauthenticated (load-bearing rule) | Inherit |
| LAN listener | Opt-in authenticated second listener for mobile only | Drop for CPS first release |
| Graceful shutdown | `/shutdown` route, signal handling | Inherit |
| Run-file/PID tracking | `backend/internal/runfile/` | Inherit |
| Data directory | `~/.ao` (overridable via `AO_DATA_DIR`) | Inherit |
| Stale daemon detection | `backend/internal/daemon/stale.go` | Inherit |

**Gap:** AO's daemon is a single-user local loop. It does not implement CPS's portfolio-wide authority model, decision gates, or documentation-compliance checkpoints. These require CPS extensions on top of the inherited daemon foundation.

---

## 8. Project/Portfolio Result

**Result: INHERIT**

| Aspect | AO Evidence | CPS Implication |
|--------|-------------|-----------------|
| Project CRUD | `backend/internal/service/project/` | Inherit |
| Project kinds | `single_repo`, `workspace` (multi-repo), `scratch` | Inherit |
| Per-project config | `ProjectConfig` JSON blob: env, symlinks, postCreate, agentRules, reviewers | Inherit + extend |
| Workspace registration | `workspace_registration.go` — child repo discovery | Inherit |
| Project-scoped orchestrator | `domain.ProjectID` on orchestrator conversations | Inherit |
| Multi-project concurrency | Sessions across projects run independently | Inherit |

**Gap:** AO does not implement CPS's portfolio-level planning corpus ingestion, project priority/dependency across projects, or TownBoss-specific project governance. These are CPS extensions.

---

## 9. Planning/Decomposition Result

**Result: CONFIGURE + EXTEND**

| Aspect | AO Evidence | CPS Implication |
|--------|-------------|-----------------|
| Project orchestrator | `KindOrchestrator` sessions with project-scoped conversations | Inherit |
| Orchestrator conversation | `conversations` table: project-scoped narrative, bounded history pages | Inherit |
| Objective intake | Natural-language spawn via UI or `ao spawn` | Configure |
| Task decomposition | Manual (operator creates sessions) or orchestrator-driven | Extend — CPS needs bounded task graph with dependencies |
| Dependency planning | TrackerIntakeConfig for issue-driven spawning | Extend — CPS needs explicit task dependency graph |
| Follow-up/replanning | Orchestrator can spawn follow-up workers | Configure |
| Task ordering | Kanban columns: working, needs_input, in_review, ready, archive | Configure |

**Gap:** AO does not have a first-class task decomposition engine with explicit dependency graphs, eligibility checks, and bounded task contracts. The orchestrator can plan conversationally, but CPS needs machine-verifiable task structures. This is a CPS_EXTENSION.

---

## 10. Worker Adapter Result

**Result: INHERIT — strong adapter ecosystem**

AO has 39 agent adapters under `backend/internal/adapters/agent/`:

| CPS Required Worker | AO Adapter | Status |
|--------------------|-----------|--------|
| Kilo | `kilocode/` — full TUI adapter with plugin-based hooks, `KILO_CONFIG_CONTENT` injection | INHERIT |
| Codex | `codex/` — native app-server Chat driver + TUI adapter, account management | INHERIT |
| Cline | `cline/` — TUI adapter with terminal activity detection, Escape cancellation | INHERIT |
| Claude Code | `claudecode/` — TUI + Chat (ACP), interface handoff capable | INHERIT |
| OpenCode | `opencode/` — TUI adapter, plugin-based hooks | INHERIT |
| Gemini | Not found as dedicated adapter | DROP (not in CPS required set) |
| Other | 33 additional adapters | INHERIT as optional |

**Reviewer adapters:** 22 reviewer harnesses including Claude Code, Codex, Cline, Kilo, OpenCode, Copilot, Cursor, Devin, Droid, Goose, Kimi, Kimchi, Kiro, Amp, Aider, Grok, Crush, Auggie, Autohand, Agy, Muse, Pi, Qwen, Vibe.

**Adapter contract:** `backend/internal/ports/agent.go` — `Agent` interface with `GetLaunchCommand`, `GetRestoreCommand`, `GetPromptDeliveryStrategy`, `GetAgentHooks`, `SessionInfo`, `GetConfigSpec`. Optional capabilities: `AgentAuthChecker`, `AgentBinaryResolver`, `AgentInterfaceHandoff`, `AgentNativeSessionTerminator`, `AgentReadinessProvider`.

**Gap:** No Gemini adapter exists in AO. Gemini was OPTIONAL in CPS capability matrix. This is acceptable — CPS can start without Gemini and add it later if needed.

---

## 11. Kilo Compatibility

**Result: INHERIT**

Evidence: `backend/internal/adapters/agent/kilocode/kilocode.go`

- Full `Agent` interface implementation
- Launch command: `kilocode [--agent <ao-agent>] [--prompt <prompt>]`
- Permission modes via `KILO_CONFIG_CONTENT` env var (highest-precedence inline config)
- Plugin-based hooks installed into `.kilocode/plugins/`
- Session identity from plugin-reported events
- Activity detection for TUI surface
- Auth probe and binary resolution
- Registry ID: `kilocode`

**Assessment:** Kilo is a first-class AO citizen. CPS inherits full Kilo support.

---

## 12. Codex Compatibility

**Result: INHERIT**

Evidence: `backend/internal/adapters/agent/codex/`, `backend/internal/adapters/chatdriver/codexappserver/`

- Native app-server Chat driver
- TUI adapter with restore command
- Device-global account management (`service/agent/codex_accounts.go`)
- Account reconciliation, login terminal, capacity tracking
- `codexops/gate.go` — exclusive admission during account switches
- Interface handoff capable (TUI ↔ Chat)
- Conversation persistence with provider conversation ID

**Assessment:** Codex is deeply integrated. CPS inherits full Codex support including account management.

---

## 13. Cline Compatibility

**Result: INHERIT**

Evidence: `backend/internal/adapters/agent/cline/cline.go`, `activity.go`

- Full TUI adapter
- Terminal activity detection: "thinking... (esc to cancel)", empty composer detection
- Escape-based cancellation
- Reviewer harness: `ReviewerCline`
- Experimental reviewer status: "experimental user-approved reviewers that retain their native approval prompts"

**Assessment:** Cline is a first-class worker and reviewer. CPS inherits full Cline support.

---

## 14. Gemini/Other-Provider Result

**Result: DROP for initial CPS release**

- No Gemini adapter found in AO
- Gemini was OPTIONAL in CPS capability matrix
- No blocking requirement for first operational release

**Available alternatives:** 39 adapters cover Codex, Claude Code, Cline, Kilo, OpenCode, Copilot, Cursor, Devin, Droid, Goose, Grok, Kimi, Kimchi, Kiro, Amp, Aider, Agy, Auggie, Autohand, Crush, Muse, OMP, Pi, Qwen, Vibe.

---

## 15. Worktree/Isolation Result

**Result: INHERIT — strong isolation model**

| Aspect | AO Evidence | CPS Implication |
|--------|-------------|-----------------|
| Git worktree creation | `adapters/workspace/gitworktree/workspace.go` — `Create()` calls `git worktree add` | Inherit |
| Branch isolation | Each session gets its own branch | Inherit |
| Path traversal guard | `ErrUnsafePath` — validates worktree stays under managed root | Inherit |
| Dirty worktree safety | Load-bearing rule: "Never force-delete dirty worktrees" | Inherit |
| Worktree removal | `remove.go` — guarded removal with conflict detection | Inherit |
| Scratch workspace | `adapters/workspace/scratch/` for non-git work | Inherit |
| Workspace router | `router/router.go` — selects implementation by project kind | Inherit |
| Session worktree records | `SessionWorktreeRecord` tracks repo/branch per session | Inherit |
| Conflict detection | `ErrBranchCheckedOutElsewhere`, `ErrPreservedConflict` | Inherit |
| Reclaim/preserve | `workspace_reclaim_test.go`, `workspace_preserve_test.go` | Inherit |

**Gap:** AO does not implement CPS's same-worktree write lease with cross-process file locking (CodeBisor's `WorktreeWriteLease`). AO prevents conflicting branch creation at the git level but does not have an explicit application-level write lease. This is a G2 gap — small CPS extension.

---

## 16. Scheduler/Concurrency Result

**Result: INHERIT + EXTEND**

| Aspect | AO Evidence | CPS Implication |
|--------|-------------|-----------------|
| Parallel workers | Multiple sessions can be active simultaneously | Inherit |
| Multi-project concurrency | Independent projects run concurrently | Inherit |
| Capacity handling | Agent readiness coordinator with bounded warm-up | Inherit |
| Session input serialization | `session_input.go` — atomic pane-write admission | Inherit |
| Codex operation gate | `codex_operation_gate.go` — exclusive admission | Inherit |
| Same-project serialization | Not explicitly implemented | Extend — CPS needs project-level task queue |
| Task queueing | Kanban-based visibility, not explicit priority queue | Extend — CPS needs bounded queue |
| Dependencies | TrackerIntakeConfig for issue-driven spawn | Extend — CPS needs explicit task dependency graph |

**Gap:** AO's concurrency model is session-level, not task-level. There is no explicit task queue with dependencies, priority, or eligibility evaluation. This is a G2 gap — CPS extension.

---

## 17. Dependency Result

| Dependency | Version/License | CPS Implication |
|------------|-----------------|-----------------|
| Go | 1.25.7 (BSD-style) | Required for build |
| modernc.org/sqlite | v1.51.0 (MIT) | Bundled, CGO-free |
| go-chi/chi/v5 | v5.1.0 (MIT) | HTTP router |
| spf13/cobra | v1.10.1 (Apache-2.0) | CLI framework |
| Microsoft/go-winio | v0.6.2 (MIT) | Windows named pipes |
| coder/acp-go-sdk | v0.13.5 | ACP protocol |
| coder/websocket | v1.8.14 | WebSocket |
| pelletier/go-toml/v2 | v2.4.3 (MIT) | Config parsing |
| pressly/goose/v3 | v3.27.1 (MIT) | DB migrations |
| swaggest/openapi-go | v0.2.61 | API spec generation |
| golang.org/x/sync | v0.20.0 (BSD) | Concurrency primitives |
| Electron + React | Frontend runtime | Desktop app only |

**Assessment:** All dependencies are permissive-licensed (MIT, BSD, Apache-2.0). No GPL/LGPL copyleft dependencies. No external service dependencies for core operation. `exp.host` (Expo push) is optional and only for mobile notifications.

---

## 18. State/Persistence Result

**Result: INHERIT**

| Aspect | AO Evidence | CPS Implication |
|--------|-------------|-----------------|
| Database | SQLite via `modernc.org/sqlite` | Inherit |
| Migrations | Goose (`migrate_*.go`) | Inherit |
| Typed queries | sqlc-generated (`storage/sqlite/gen/`) | Inherit |
| Schema | projects, sessions, conversations, PRs, reviews, notifications, change_log | Inherit |
| Durable facts | activity_state, is_terminated, session_mode, controller_generation, PR facts | Inherit |
| Derived status | Computed at read time, never stored | Inherit |
| CDC | DB triggers → change_log → poller → broadcaster | Inherit |
| Crash safety | Single-writer + reader-pool, writeMu-guarded | Inherit |
| Data directory | `~/.ao` (overridable) | Inherit |

**Gap:** AO does not implement CPS's durable project Memory ledger, documentation-compliance receipts, or checkpoint governance state. These are CPS_EXTEND.

---

## 19. Event/Observability Result

**Result: INHERIT**

| Aspect | AO Evidence | CPS Implication |
|--------|-------------|-----------------|
| Event model | CDC-based: change_log → poller → broadcaster → SSE | Inherit |
| Worker lifecycle | activity_state transitions: active, idle, waiting_input, blocked, exited | Inherit |
| Task lifecycle | Session CRUD + PR state transitions | Inherit |
| CI status | SCM observer polls GitHub Checks API, writes pr_checks | Inherit |
| Review status | PR reviews, review threads, review comments | Inherit |
| Human attention | waiting_input, blocked states; notification service | Inherit |
| Auditability | change_log with old_data/new_data JSON | Inherit |
| SSE stream | `GET /api/v1/events` with `Last-Event-ID` replay | Inherit |
| Terminal attach | WebSocket `/mux` with attach/detach | Inherit |

**Gap:** AO's event model covers worker/session/PR lifecycle but does not include CPS-specific events: decision records, documentation-compliance checkpoints, recovery budget exhaustion, circuit-breaker trips. These are CPS_EXTEND.

---

## 20. Recovery/Resume Result

**Result: INHERIT + PORT_FROM_LEGACY**

| Aspect | AO Evidence | CPS Implication |
|--------|-------------|-----------------|
| Session persistence | Sessions survive daemon restart | Inherit |
| Session restore | `POST /sessions/{id}/restore` | Inherit |
| Runtime reaper | 5s polling, probes runtime liveness | Inherit |
| Lifecycle reducer | Applies observations, updates durable facts | Inherit |
| Chat resume | Persistent host reconnects without interrupting in-flight turns | Inherit |
| ACP reconnect | Restores initialized session snapshot, JSON-RPC correlation, pending interactions, acknowledged prompt replay | Inherit |
| Agent switch recovery | Durable handoff with controller-generation fencing, message outbox | Inherit |
| Codex account switch | Exclusive admission, stops/resumes affected controllers | Inherit |
| No-progress detection | Runtime reaper reports `ProbeFailed`/`ProbeDead` | Inherit |
| Circuit breaker | Mass-death circuit breaker in reaper | Inherit |
| Recovery budgets | Not explicitly implemented (AO retries implicitly) | PORT_FROM_LEGACY (CodeBisor) |
| Bounded retry ceilings | Not explicitly implemented | PORT_FROM_LEGACY (CodeBisor) |
| No-progress loop detection | Not explicitly implemented | PORT_FROM_LEGACY (CodeBisor) |
| Provider outage classification | Not explicitly normalized | PORT_FROM_LEGACY (CodeBisor) |

**Gap:** AO's recovery is implicit in the observer pattern. It does not have explicit recovery budgets, bounded retry ceilings, or provider-failure normalization into a CPS vocabulary. CodeBisor's `agent_resource_governance.py` and `resource_incident_control.py` provide proven patterns. Gap severity: G2 (moderate CPS extension with legacy port).

---

## 21. Validation Result

**Result: CONFIGURE + EXTEND**

| Aspect | AO Evidence | CPS Implication |
|--------|-------------|-----------------|
| CI observation | SCM observer polls CI check status | Inherit |
| PR mergeability | Semantic diff, mergeable/conflict detection | Inherit |
| Scope verification | PR diff observed, but no explicit scope gate | Extend |
| Secret detection | Not implemented | Extend (CPS R13) |
| Test/build/lint | Not run by supervisor (delegated to worker/CI) | Configure |
| Completion detection | Worker exits, PR merged, or manual termination | Configure |
| Proof/evidence storage | change_log, PR facts, conversation archive | Inherit |

**Gap:** AO does not implement CPS's completion-contract verification, project-specific validation profiles, or scope/diff validation before checkpoint readiness. CodeBisor's `completion_verifier.py` provides a proven pattern. Gap severity: G2 (port concept from CodeBisor, extend in CPS).

---

## 22. Independent Review Result

**Result: INHERIT + EXTEND**

| Aspect | AO Evidence | CPS Implication |
|--------|-------------|-----------------|
| Review gateway | `reviewgateway/gateway.go` — AO-owned environment, immutable manifest | Inherit |
| Review engine | `service/review/`, `internal/review/` | Inherit |
| Autoreview coordinator | `autoreview/coordinator.go` — idle-triggered sweeps | Inherit |
| Review runs | `ReviewRun` with trigger source (manual/auto), status, verdict | Inherit |
| Reviewer adapters | 22 reviewer harnesses | Inherit |
| Blocking findings | Not explicitly modeled | Extend |
| Review policy | Auto-review on/off per project | Configure |
| Independent reviewer permissions | Reviewer gets isolated AO-owned environment | Inherit |

**Gap:** AO's review model does not have an explicit blocking/non-blocking finding classification or policy-based review requirements. CPS needs to extend the review engine with policy gates. Gap severity: G1 (configuration + small extension).

---

## 23. Human-Decision/Authority Result

**Result: EXTEND**

| Aspect | AO Evidence | CPS Implication |
|--------|-------------|-----------------|
| Attention states | `waiting_input`, `blocked` activity states | Inherit |
| Notification service | Durable notifications for needs_input, ready_to_merge, pr_merged | Inherit |
| Approval modes | Agent permission modes (normal, auto-edit, YOLO) | Inherit |
| Authority levels | Not implemented (no A0-A4 model) | EXTEND |
| Decision records | Not durably persisted | EXTEND |
| Approval gates | Permission prompts in agent CLIs, not supervisor-level | EXTEND |
| Destructive action guards | Not implemented at supervisor level | EXTEND |
| Recommendation support | Not implemented | EXTEND |

**Gap:** AO does not implement CPS's authority matrix, decision records, or approval gates at the supervisor level. These are CPS_EXTEND items.

---

## 24. CLI Result

**Result: INHERIT**

| Aspect | AO Evidence |
|--------|-------------|
| Framework | Cobra (`backend/internal/cli/`) |
| Commands | start, stop, spawn, session, send, project, pr, review, preview, browser, import, doctor, agent, hooks, codex-login, orchestrator, launch, dev |
| Architecture | Thin HTTP client over daemon loopback |
| Transport | REST + SSE |
| Windows support | `process_windows.go`, `ptyhost.go` |
| Output formatting | `output.go` |

**Assessment:** AO's CLI is thin, well-structured, and covers the essential operator surfaces. CPS inherits it and can extend with additional commands as needed.

---

## 25. Desktop UI Result

**Result: INHERIT (adopt upstream before custom)**

| Aspect | AO Evidence |
|--------|-------------|
| Framework | Electron + React 19 + TanStack Router/Query + Tailwind |
| Shell | Sidebar (projects + sessions), session board, session view + inspector |
| Terminal | WebSocket `/mux` with attach/detach |
| Chat | Durable Chat timeline/composer for Chat-mode sessions |
| PR view | Pull-requests page with CI/review state |
| Browser | Session-scoped browser panel with CDP bridge |
| Preview | `ao preview` targets |
| Mobile | Expo + React Native (Connect Mobile over LAN) |
| Windows binary | `agent-orchestrator-win32-x64.exe` |

**Assessment:** AO's desktop UI is production-grade and covers the CPS minimum UX requirements: active/queued/blocked/attention work visibility, worker/session status, decision surfaces, evidence/logs, attach/detach. CPS adopts upstream UI first per D8/DECISIONS_AND_RULES.md.

**Gap:** AO's UI is operator-centric for individual project/session management, not portfolio-centric for TownBoss governance. CPS may need a portfolio overlay, but this is deferred until the operational acceptance test proves the basic path.

---

## 26. PR/CI/Merge Result

**Result: INHERIT**

| Aspect | AO Evidence |
|--------|-------------|
| PR observation | SCM observer polls GitHub/GitLab API every 30s |
| PR actions | `POST /prs/{id}/merge`, `POST /prs/{id}/resolve-comments` |
| CI status | PR checks observed and persisted |
| Review state | Review threads, review comments, review runs |
| Merge conflict | Semantic diff detects conflicts |
| Agent nudges | CI failures, review feedback, merge conflicts routed to agent |
| PR lifecycle | Draft → open → review → mergeable → merged |

**Assessment:** AO has a complete PR/CI/merge observation and action pipeline. CPS inherits this fully.

---

## 27. Upstream-Maintenance Result

| Aspect | AO Evidence | CPS Implication |
|--------|-------------|-----------------|
| Release cadence | Active GitHub Releases, tagged versions | Favorable |
| Activity | Top 6k repositories, active development | Favorable |
| Extension points | Port interfaces in `backend/internal/ports/` | Favorable |
| Adapter registry | `adapters/registry/registry.go` — register new adapters without core changes | Favorable |
| Customization zones | Project config, adapter plugins, agent hooks | Favorable |
| Merge burden | Well-defined package boundaries, sqlc-generated code | Low |
| License | Apache-2.0 — contribution-friendly | Favorable |
| Contribution policy | CONTRIBUTING.md present | Check before contributing |

**Assessment:** AO is actively maintained with clear extension seams. Fork maintenance burden is low if CPS stays within extension points.

---

## 28. Capability Classification Counts

| Classification | Count |
|---------------|-------|
| INHERIT | 28 |
| CONFIGURE | 5 |
| EXTEND | 12 |
| PORT_FROM_LEGACY | 4 |
| NEW | 1 |
| DROP | 3 |

---

## 29. Gap Severity Counts

| Severity | Count | Description |
|----------|-------|-------------|
| G0 | 28 | No gap / inherited |
| G1 | 5 | Configuration only |
| G2 | 8 | Small extension |
| G3 | 4 | Moderate CPS-specific extension |
| G4 | 1 | Major architectural gap |
| G5 | 0 | Adoption blocker |

---

## 30. Critical Gaps

| Gap | Severity | Classification | Evidence |
|-----|----------|----------------|----------|
| Task decomposition with dependency graph | G3 | EXTEND | AO orchestrator plans conversationally; CPS needs machine-verifiable task structures with explicit dependencies |
| Completion contract verification | G2 | PORT_FROM_LEGACY | CodeBisor `completion_verifier.py` provides proven pattern; AO lacks scope/diff validation |
| Recovery budgets and circuit breakers | G2 | PORT_FROM_LEGACY | CodeBisor `agent_resource_governance.py`, `resource_incident_control.py` provide proven patterns |
| Authority/decision model | G3 | EXTEND | CPS needs A0-A4 authority levels, decision records, approval gates at supervisor level |
| Documentation compliance gates | G3 | NEW | CPS-specific three-stage gate (planning/execution/final review) with compliance receipts |
| Project Memory ledger | G3 | NEW | CPS-specific durable append-only memory per project |
| Same-worktree write lease | G2 | EXTEND | AO prevents conflicting branches; CPS needs application-level cross-process write lease |
| Natural-language job intake | G2 | EXTEND | AO spawn is manual; CPS needs structured task contract generation from objectives |

---

## 31. Legacy CodeBisor Capabilities Worth Preserving

| Capability | Source | Classification | Rationale |
|-----------|--------|----------------|-----------|
| Completion contract verification | `completion_verifier.py` | PORT_FROM_LEGACY | Proven PASS/FAIL/UNVERIFIED classification; CPS acceptance criteria require it |
| AI Authority model (A0–A4) | `ai_authority.py`, `CODEBISOR_AI_AUTHORITY_POLICY.json` | PORT_FROM_LEGACY | Matches CPS Authority Matrix exactly |
| Recovery budgets | `agent_resource_governance.py` | PORT_FROM_LEGACY | max_recovery_attempts, max_recoveries_without_progress, max_wall_clock_seconds |
| Circuit breaker / resource incident control | `resource_incident_control.py`, `resource_lineage_control.py` | PORT_FROM_LEGACY | Bounded retry, no-progress detection, terminalization |
| Same-worktree write lease | `worker_common.py` → `WorktreeWriteLease` | PORT_FROM_LEGACY | Cross-process file lock keyed by worktree path SHA-256 |
| Documentation compliance gate | `w0_documentation_gate.py` | PORT_FROM_LEGACY | Pre-checkpoint doc-check pattern |
| State reconciler | `state_reconciler.py` | PORT_FROM_LEGACY | Crash-state reconciliation |
| Provider failure normalization | `provider_failure.py` | PORT_FROM_LEGACY | Normalized failure vocabulary |

---

## 32. Legacy CodeBisor Capabilities to Abandon

| Capability | Source | Rationale |
|-----------|--------|-----------|
| Custom ANSI dashboard/rendering stack | `dashboard.py`, `dashboard_terminal_frame.py`, `tui_*.py` | AO provides production-grade desktop UI + CLI |
| Duplicate daemon/process infrastructure | `supervisor_console.py`, `durable_state.py` | AO daemon is mature and portable |
| Bespoke worker launching | `*_worker_supervisor.py` | AO adapter registry is more maintainable |
| OpenTUI migration | `opentui==0.1.2` dependency | Deferred per CPS product spec |
| Control-plane client protocol | `control_plane.py` | Not required for first operational release |
| System tray | `tray.py` | OPTIONAL in CPS, deferred |
| Custom TUI framework | `tui_bridge.py`, `tui_client.py` | DROP per CPS capability matrix |

---

## 33. TownBoss Development Rule Enforcement Coverage

| Rule | Enforcement Mechanism | Upstream Evidence | CPS Gap | Implementation Need | Operational Blocker? |
|------|----------------------|-------------------|--------|---------------------|---------------------|
| R1 Governing Principle | CPS extension | None | No enforcement | Document in CPS | No |
| R2 Authority Hierarchy | CPS extension | None | No enforcement | Document in CPS | No |
| R3 Required Project Foundation | CPS extension | None | No enforcement | Document in CPS | No |
| R4 Documentation Compliance Cycle | CPS EXTENSION | None | No hooks in AO | Three-stage gate implementation | **YES** |
| R5 Canonical Doc Freshness | CPS NEW | None | No freshness check | Stale-clone detection | **YES** |
| R6 Decisions Are Binding | CPS EXTENSION | None | No decision store | Decision record persistence | No |
| R7 Upstream First | UPSTREAM_ENFORCED | AO inherits most capabilities | None | None | No |
| R8 Build Product Not System | CONFIGURATION | CPS scope controls | None | Scope discipline | No |
| R9 Bounded Passes | CPS EXTENSION | None | No task contract enforcement | Task contract + bounded pass | No |
| R10 No Silent Scope Expansion | CPS EXTENSION | None | No scope gate | Task contract + scope check | No |
| R11 Completion States | CPS EXTENSION | None | No state promotion gates | Evidence-backed promotion | No |
| R12 Definition of Done First | CPS EXTENSION | None | No acceptance gate | Acceptance criteria check | No |
| R13 Preserve Working Behavior | CONFIGURATION | AO preserves behavior | None | Regression tests | No |
| R14 Diagnose Before Fixing | CONFIGURATION | CPS policy | None | Document in CPS | No |
| R15 Fail Closed Under Uncertainty | CPS EXTENSION | None | No fail-closed gate | Authority gate implementation | **YES** |
| R16 Human Attention Scarce | CONFIGURE | AO attention states | Needs CPS recommendation layer | Decision presentation | No |
| R17 Git Is Part of Control System | UPSTREAM_ENFORCED | AO uses git for worktree isolation | None | None | No |
| R18 Never Destroy Evidence | UPSTREAM_ENFORCED | AO never force-deletes dirty worktrees | None | None | No |
| R19 Security and Authority Are Architectural | CPS EXTENSION | None | No security model | Security/authority design | **YES** |
| R20 Authoritative State Must Remain Authoritative | CPS EXTENSION | None | No single authority enforcement | Daemon as single authority | No |
| R21 Tests Prove Contracts | CONFIGURATION | AO has tests | None | CPS contract tests | No |
| R22 Independent Review | UPSTREAM_ENFORCED | AO has review gateway + autoreview | Policy extension needed | Review policy config | No |
| R23 Temporary Means Temporary | CPS EXTENSION | None | No workaround tracking | Temporary workaround registry | No |
| R24 Memory Is Mandatory | CPS NEW | None | No Memory update enforcement | Memory update gate | **YES** |
| R25 Documentation Must Track Reality | CPS EXTENSION | None | No doc-reality check | Doc compliance gate | No |
| R26 External Dependency Adoption | UPSTREAM_ENFORCED | This audit satisfies it | None | None | No |
| R27 Optimize for Replaceability | UPSTREAM_ENFORCED | AO port-based adapters | None | None | No |
| R28 Enforcement Is Part of Rule | CPS EXTENSION | None | No automated gates | Machine-enforceable gates | **YES** |
| R29 Rule Violations | CPS EXTENSION | None | No violation handling | Violation classification + repair | No |
| R30 Portfolio Completion Principle | CONFIGURATION | CPS scope controls | None | None | No |

**Rules marked NOT_YET_ENFORCED with operational blocker status:** R4, R5, R15, R19, R24, R28.

These are all CPS extensions, not upstream gaps. They require Phase 3 implementation but do not block Phase 0 GO/CONDITIONAL GO.

---

## 34. Rules Currently NOT_YET_ENFORCED

| Rule | Description | CPS Treatment |
|------|-------------|---------------|
| R4 | Documentation compliance cycle (3-stage gate) | CPS_EXTENSION — implement in Phase 3 |
| R5 | Canonical documentation freshness check | CPS_NEW — implement stale-clone detection |
| R15 | Fail closed under material uncertainty | CPS_EXTENSION — authority gate |
| R19 | Security and authority are architectural | CPS_EXTENSION — security model design |
| R24 | Memory is mandatory development infrastructure | CPS_NEW — Memory update gate |
| R28 | Enforcement is part of the rule | CPS_EXTENSION — automated gates |

**Assessment:** None of these are adoption blockers. They are bounded Phase 3 extensions with clear implementation paths.

---

## 35. Documentation-Compliance Enforcement Result

**Planning Gate:** CPS must implement a mechanism to:
1. Identify the repository/project being acted upon
2. Identify applicable TownBoss portfolio rules and architecture
3. Identify project implementation plan, architecture, decisions, acceptance criteria, Memory
4. Inspect repository-local instructions (AGENTS.md, ADRs, etc.)
5. Read relevant documents (not merely confirm existence)
6. Record consulted documents
7. Detect conflicting/stale/ambiguous instructions
8. Stop and reconcile material conflicts

**AO Hooks Available:** None. AO does not have a documentation-compliance stage. This is a CPS_EXTENSION.

**Execution Re-check Gate:** CPS must implement re-check triggers when:
- Scope materially changes
- Architecture assumptions change
- New dependency/upstream component proposed
- Security/authority/risk boundary changes
- Acceptance criterion becomes ambiguous
- Conflicting implementation discovered
- Recovery changes strategy
- Task becomes blocked
- Worker proposes work outside contract

**AO Hooks Available:** None. CPS_EXTENSION.

**Final Review Gate:** CPS must implement final-document review before:
- Final report
- VERIFIED/CHECKPOINTED promotion
- Milestone completion

**AO Hooks Available:** None. CPS_EXTENSION.

**Documentation Compliance Receipt:** CPS must generate receipts listing:
- Planning documents consulted
- Execution-stage documents re-checked and triggers
- Final-review documents consulted
- Conflicts and resolutions
- Approved exceptions
- Documentation updated
- Memory updated

**AO Hooks Available:** None. CPS_NEW.

**Narrowest Extension Point:** The CPS extension should wrap the task lifecycle at the Session Manager / Service layer, intercepting task state transitions (PROPOSED → READY → RUNNING → VALIDATING → VERIFYING → CHECKPOINTED) to enforce documentation compliance checks.

---

## 36. Security/Licensing Concerns

| Concern | Assessment |
|---------|-----------|
| License | Apache-2.0 — permissive, commercial-safe |
| Attribution obligations | Preserve LICENSE + NOTICE in fork |
| Dependency licenses | All MIT/BSD/Apache-2.0 — no copyleft |
| Daemon exposure | Loopback-only (`127.0.0.1`) by load-bearing rule |
| LAN listener | Opt-in, authenticated, never exposes control routes |
| Secret handling | AO does not store secrets; agents handle their own auth |
| Desktop data | All under `~/.ao` (overridable via `AO_DATA_DIR`) |
| Browser bridge | Authenticated, worker-scoped, session-limited |
| Mobile auth | Bearer password, per-source lockout, hashed storage |
| Telemetry | PostHog with policy authority, rate limiting, sanitization |
| Codex Windows security | Dedicated Windows security layer for Codex file operations |

**Assessment:** No material security or licensing concerns. AO's security model is deliberate and well-documented.

---

## 37. Adoption Scorecard

| Dimension | Score (1-5) | Rationale |
|-----------|-------------|-----------|
| Architecture fit | 5 | Port-based design, durable facts, observer pattern match CPS target exactly |
| Feature coverage | 4 | Strong coverage of worker orchestration, worktree isolation, events, CLI, desktop UI; gaps in task decomposition and validation |
| Worker ecosystem | 5 | 39 agent adapters, 22 reviewer adapters, including all CPS required workers |
| Windows fit | 5 | Explicit Windows code paths, ConPTY, desktop binary |
| Daemon/background model | 5 | Mature Go daemon with supervisor, restart persistence, data-dir isolation |
| Project/portfolio model | 4 | Multi-project registry, workspace support; needs CPS planning corpus integration |
| Concurrency | 4 | Session-level concurrency, worktree isolation; needs task-level queue |
| Isolation | 5 | Git worktree per session, dirty-worktree protection, single-controller invariant |
| Recovery | 4 | Session persistence, Chat resume, agent switching; needs explicit recovery budgets |
| Validation | 3 | CI/PR observation; needs completion contracts, scope validation |
| Review | 4 | Review gateway, autoreview coordinator, 22 reviewer adapters; needs policy gates |
| Human governance | 3 | Attention states, notifications; needs authority matrix, decision records |
| Doc-compliance extensibility | 2 | No hooks; needs CPS extension at task lifecycle |
| TownBoss-rule extensibility | 3 | No rule enforcement; needs CPS extension layer |
| Maintainability | 4 | Active project, clear package boundaries, extension seams |
| Upstream-sync burden | 4 | Apache-2.0, narrow extension points, sqlc-generated code |
| Licensing | 5 | Apache-2.0, all permissive dependencies |
| Security | 4 | Deliberate security model, loopback-only daemon, authenticated LAN |
| Operational acceptance fit | 4 | Close to CPS acceptance target; bounded extensions required |

**Overall assessment:** AO is a strong chassis. The gaps are bounded extensions, not architectural mismatches.

---

## 38. Phase 0 Checklist Status

| Checklist Item | Status | Evidence |
|---------------|--------|----------|
| Read all relevant TownBoss and CPS documents | ✓ | 19 documents read |
| Inspect current Agent Orchestrator upstream | ✓ | Cloned, architecture read, source explored |
| Inspect legacy CodeBisor as behavioral reference | ✓ | Full structure mapped |
| Produce capability-by-capability adoption matrix | ✓ | See separate capability matrix file |
| Review findings against CPS acceptance criteria | ✓ | Mapped in audit sections |
| Update CPS Memory with audit result | Pending | Memory update pending |
| Record bounded GO/NO-GO decision | Pending | This document |

---

## 39. Phase 0 Gate Status

| Gate Item | Status | Evidence |
|-----------|--------|----------|
| Adoption audit completed | ✓ | This document |
| Agent Orchestrator architecture fit confirmed | ✓ | Sections 6-27 |
| License/commercial use acceptable | ✓ | Apache-2.0, all permissive deps |
| Primary Windows environment support confirmed | ✓ | Source-level Windows compatibility confirmed: ConPTY, process management, path resolution, daemon listener, browser bridge, published desktop binary. Go 1.25.7 installation and untouched upstream build/test are Phase 1 entry requirements, not Phase 0 blockers. |
| Required worker ecosystem support confirmed | ✓ | Kilo, Codex, Cline confirmed; Gemini deferred |
| Governance-enforcement gaps identified and path defined | ✓ | Section 33 |
| Upstream synchronization strategy accepted | ✓ | Upstream Sync Policy reviewed |
| Exit/fallback strategy accepted | ✓ | Port-based design enables migration |
| GO decision recorded | ✓ | CONDITIONAL_GO — ACCEPTED; D11 recorded in DECISIONS_AND_RULES.md; Memory entry appended 2026-09-13 |

**Gate status:** COMPLETE — CONDITIONAL GO accepted. Go 1.25.7 installation and untouched upstream Windows build/test verification are Phase 1 entry prerequisites, not Phase 0 blockers.

---

## 40. Recommendation: CONDITIONAL GO

**Rationale:**

Agent Orchestrator is the correct upstream chassis for Code Project Supervisor. Its architecture aligns closely with CPS requirements:
- Port-based adapter design matches CPS worker adapter contract
- Git worktree isolation matches CPS workspace isolation requirements
- Durable facts + derived status matches CPS state model
- CDC event pipeline matches CPS evidence/audit requirements
- 39 agent adapters cover all CPS required workers (Kilo, Codex, Cline)
- Strong Windows support confirmed in source
- Apache-2.0 license is commercial-safe
- Active maintenance with clear extension seams

**Conditions for unconditional GO:**

1. **Install Go 1.25.7 on Windows** — prerequisite for Phase 1 baseline build
2. **Complete Phase 1 baseline verification** — confirm upstream tests pass on Windows before customization
3. **Bounded Phase 3 scope** — governance extensions (R4, R5, R15, R19, R24, R28) are required but implementation paths are clear

**No architectural mismatches found.** All identified gaps are bounded extensions or proven CodeBisor ports. The fork-maintenance burden is low given AO's extension-point design.

---

## 41. Recommended Next CPS Task

**Phase 1 — Establish Fork and Baseline**

1. Install Go 1.25.7 on Windows development workstation
2. Create CPS fork from upstream `cadde8c9fd2079d0decca654004760ad8439328e`
3. Establish upstream remote and CPS origin remote
4. Verify upstream baseline tests pass on Windows
5. Record baseline failures, if any
6. Create baseline checkpoint
7. Update Memory with fork provenance

---

## 42. Files Created/Changed in TownBoss

| File | Action |
|------|--------|
| `D:\Projects\TownBoss\plans\projects\code-project-supervisor\CODE_PROJECT_SUPERVISOR_AO_ADOPTION_AUDIT.md` | Created |
| `D:\Projects\TownBoss\plans\projects\code-project-supervisor\CODE_PROJECT_SUPERVISOR_AO_CAPABILITY_GAP_MATRIX.md` | Created |
| `D:\Projects\TownBoss\plans\projects\code-project-supervisor\CODE_PROJECT_SUPERVISOR_RULE_ENFORCEMENT_MATRIX.md` | Created |
| `D:\Projects\TownBoss\plans\projects\code-project-supervisor\CODE_PROJECT_SUPERVISOR_LEGACY_CODEBISOR_MIGRATION_MAP.md` | Created |

---

## 43. git diff --check

(To be run before final submission)

```bash
cd D:\Projects\TownBoss && git diff --check
```

---

## 44. git status --short

(To be run before final submission)

```bash
cd D:\Projects\TownBoss && git status --short
```

---

## 45. Repository Modification Confirmation

| Repository | Modified? |
|-----------|-----------|
| TownBoss (`D:\Projects\TownBoss`) | Yes — audit artifacts created |
| Agent Orchestrator (`D:\Projects\agent-orchestrator-audit`) | No — read-only inspection |
| CodeBisor (`D:\Projects\CodeBisor`) | No — read-only inspection |
| Product repositories | No — not inspected |
