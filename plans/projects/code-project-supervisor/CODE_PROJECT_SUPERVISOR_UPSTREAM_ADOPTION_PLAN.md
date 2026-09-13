# Code Project Supervisor — Upstream Adoption Plan

## Preferred upstream

`Untrivial-ai/agent-orchestrator`

## Purpose

Use an existing mature development-supervisor foundation rather than continuing to build orchestration, daemon, worker, worktree and operator-interface infrastructure from scratch.

## Adoption hypothesis

Agent Orchestrator appears to match the intended product category closely enough that Code Project Supervisor should be implemented as a controlled fork/derivative rather than a greenfield supervisor.

The adoption audit must prove or reject this hypothesis before implementation.

## Audit dimensions

Evaluate upstream against:

- persistent daemon/control plane;
- multi-project registry;
- task decomposition/delegation;
- worker adapter ecosystem;
- Kilo/Codex/Cline compatibility;
- worktree/branch isolation;
- concurrent workers;
- task/session persistence;
- restart reconstruction;
- CI/PR/review feedback;
- event/evidence model;
- CLI/desktop operator interfaces;
- permissions/approval behavior;
- recovery/resume behavior;
- Windows support;
- tests/maintainability;
- release cadence;
- Apache-2.0 obligations.

## Capability classification

Every intended Code Project Supervisor capability receives one classification:

- **INHERIT** — upstream already satisfies the requirement; do not rebuild.
- **CONFIGURE** — upstream capability is sufficient with configuration/policy.
- **EXTEND** — use upstream capability with a narrow extension/plugin/adapter.
- **PORT_FROM_LEGACY** — legacy CodeBisor contains a proven capability genuinely missing upstream.
- **NEW** — capability must be newly implemented because neither source provides it adequately.
- **DROP** — old/desired capability does not materially support the operational target.

## Fork strategy if audit returns GO

1. Create a separate fork/repository; do not overwrite legacy CodeBisor immediately.
2. Preserve upstream remote for synchronization.
3. Record the exact upstream baseline commit/tag.
4. Keep upstream license/NOTICE requirements intact.
5. Keep Code Project Supervisor-specific logic in narrow modules/extensions where possible.
6. Avoid renaming/reformatting unrelated upstream code to minimize merge burden.
7. Maintain upstream tests in addition to Code Project Supervisor-specific contract tests.
8. Use legacy CodeBisor only as a reference source during migration.

## Initial integration priorities

### Priority A — prove inherited workflow

Before porting any legacy logic, demonstrate with upstream behavior alone:

`project -> task -> worker -> isolated workspace -> progress -> review/validation -> checkpoint/PR outcome`

### Priority B — worker ecosystem

Verify the intended worker set and choose a practical initial subset. Prefer upstream adapters rather than custom launchers.

### Priority C — governance gaps

Only after A/B work, add verified gaps such as:

- completion contracts;
- resource/recovery budgets;
- explicit authority/decision gates;
- project-specific validation profiles;
- independent-review requirements;
- checkpoint governance.

### Priority D — TownBoss planning integration

Connect portfolio/project planning documents only after the operational worker path is stable.

## Legacy CodeBisor disposition

The existing CodeBisor repository should initially remain intact and read-only except for archival/metadata changes explicitly approved later.

Candidate assets to mine:

- behavioral tests;
- completion-contract concepts;
- provider/resource policy concepts;
- recovery/circuit-breaker lessons;
- independent-review policy;
- decision/attention patterns;
- state-reconciliation lessons;
- acceptance scenarios.

Candidate assets not automatically worth porting:

- custom ANSI dashboard/rendering stack;
- duplicate daemon/process infrastructure;
- bespoke worker launching already available upstream;
- UI experiments that do not affect the acceptance target.

## Adoption kill criteria

Return NO-GO if the audit proves one or more of the following without a reasonable bounded remedy:

- upstream architecture cannot safely support multiple TownBoss projects;
- worker integrations cannot cover required agents and extensions are impractical;
- worktree/repository isolation is incompatible with our workflow;
- Windows operation is materially unreliable;
- upstream state/event architecture cannot support required governance without invasive duplication;
- licensing/dependency constraints conflict with intended commercial use;
- fork maintenance burden is greater than the value inherited.

## Success criteria for the audit

The audit should end with:

- architecture map;
- capability classification matrix;
- verified upstream test/runtime baseline;
- risk register;
- migration/extension plan;
- explicit GO/NO-GO.

No large-scale implementation should begin before that decision is recorded.
