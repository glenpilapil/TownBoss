# TownBoss Platform Memory

Status: CANONICAL / LIVING

This file is the durable history for the TownBoss platform project. Record major decisions, implementation milestones, verification, blockers, lessons, checkpoints, and handoffs.

## 2026-09-13 — Governance baseline established
TownBoss established portfolio development rules and a project-governance standard. Project implementation plans serve as operator dashboards. Active projects maintain Memory and Current State and use documentation compliance during planning, execution, and final review.

## 2026-09-21 — Cross-agent governance bootstrap implemented

TownBoss adopted concise repository-level bootstrap guidance for Codex, Kilo, Cline, and Antigravity through `AGENTS.md`, with Cline `.clinerules` and Antigravity `.agents/rules/` reinforcement where supported. The shared `governance/Test-TownBossTaskGovernance.ps1` checker is intentionally small and read-only: it validates governed location, Git worktree, task identifiers, expected branch/SHA, dirty-state visibility, and the deterministic part of closeout receipt and remote-SHA consistency. It does not replace CPS lifecycle supervision; CodeBisor is archived/reference-only.

The same implementation added Development Rule 32 rather than a separate UX-engine policy. It fixes authority precedence, external-reference lifecycle, reference-acquisition freeze, fixture/real-data discipline, screenshot ownership, independent-review boundaries, golden-test limitation, and the GlenTown responsive/physical evidence pipeline. Portfolio-wide UX-reference and MCP registries remain a proposed next bounded governance pass; unreviewed third-party Skills and MCPs were not installed.

Closeout state: implementation is complete; fresh discovery is proven for Codex, Kilo, and Cline. Antigravity is `ENVIRONMENT_BLOCKED`, not non-compliant: its installed `agentapi` reports `ANTIGRAVITY_LS_ADDRESS is not set`; the bounded read-only check found no active Antigravity process, no current environment value, and only historical random-port service logs. Preserve valid task-owned checkpoints and treat `ANTIGRAVITY_RULE_DISCOVERY_RECOVERY` as follow-up work. Future bounded governance work only: `TOWNBOSS_UX_REFERENCE_REGISTRY`, `TOWNBOSS_MCP_REGISTRY`, `TOWNBOSS_FIRST_PARTY_SKILLS_PACK`, and GitHub CLI/`gh skill` evaluation.

## Current handoff
The next platform phase is the portfolio architecture inventory defined in TOWNBOSS_PLATFORM_IMPLEMENTATION_PLAN.md.
