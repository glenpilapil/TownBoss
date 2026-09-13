# CodeBisor Implementation Plan

**Status:** LEGACY / REFERENCE ONLY  
**Superseded portfolio project:** `Code Project Supervisor`  
**Superseding plan:** `../code-project-supervisor/README.md`

## Legacy purpose

This document preserves the historical implementation direction and repository evidence for the earlier CodeBisor supervisor effort. It is retained for lessons learned, behavioral contracts, useful tests, governance concepts and migration evidence.

It is **not** the preferred implementation foundation for current TownBoss development supervision.

The active portfolio project is now **Code Project Supervisor**, which follows an upstream-first strategy and currently prefers `Untrivial-ai/agent-orchestrator` as the candidate foundation subject to adoption audit.

## Historical mission

CodeBisor was intended as the TownBoss development supervisor: a persistent operational view of projects, tasks, agents, evidence, checkpoints, blockers and validation gates.

## Historical repository baseline — `glenpilapil/CodeBisor`

Repository history demonstrated substantial experimentation and implementation in areas including:

- supervisor/dashboard state;
- project/task checklists;
- provider routing;
- worker identity binding;
- provider resource budgets;
- provider failure normalization;
- GeoPlotter onboarding canary/task handling;
- recovery/circuit-breaker concepts;
- completion contracts and validation concepts;
- multi-project scheduling and state reconciliation;
- interactive CLI/TUI experiments.

These capabilities are historical evidence and reference material, not a mandate to port the implementation wholesale.

## Migration rule

For every legacy CodeBisor capability considered for Code Project Supervisor:

1. check whether the selected upstream foundation already implements it;
2. classify the capability under the new adoption matrix;
3. port behavioral contracts/tests/specification before implementation code where practical;
4. port code only when it is both still required and lower-risk than extending upstream;
5. do not preserve duplicate infrastructure because of sunk development effort.

## High-value concepts to retain for evaluation

- provider-neutral worker supervision;
- bounded recovery/resource governance;
- provider failure vs task failure distinction;
- human decision/attention gates;
- evidence-backed completion contracts;
- independent review;
- checkpoint governance;
- project-aware scheduling;
- persistent state/reconciliation;
- operator interaction with the supervisor rather than direct worker babysitting.

## Low-value or superseded areas unless proven necessary

- custom terminal rendering infrastructure;
- bespoke ANSI dashboard lifecycle;
- duplicate daemon/process supervision already solved upstream;
- bespoke worker launch adapters available in upstream;
- UI experimentation that does not affect operational delivery.

## Historical evidence rule

Commit history proves that a capability existed at some point. It does not prove that it remains correct, verified or appropriate for the new implementation. Any migrated capability must be validated against the selected upstream baseline and current Code Project Supervisor rules.

## Current action

Do not continue feature development in this legacy plan by default. Use it as input to the Code Project Supervisor upstream adoption audit.
