# TownBoss Platform Memory

Status: CANONICAL / LIVING

This file is the durable history for the TownBoss platform project. Record major decisions, implementation milestones, verification, blockers, lessons, checkpoints, and handoffs.

## 2026-09-13 — Governance baseline established
TownBoss established portfolio development rules and a project-governance standard. Project implementation plans serve as operator dashboards. Active projects maintain Memory and Current State and use documentation compliance during planning, execution, and final review.

## 2026-09-21 — Cross-agent governance bootstrap reconciled

The authoritative bootstrap is Rule 33 plus repository `AGENTS.md`, concise Cline/Antigravity rule files, and `governance/Test-TownBossTaskGovernance.ps1`; these operationalize rather than supersede canonical documentation. Project-first durability is proven by remote governance checkpoints: GlenTown App `governance/multi-agent-compliance-bootstrap-20260921` at `e7bdf9ece2c3aa7b872b32fdc4bfaa00b4ad157d`, and GlenTown API branch of the same name at `4d48c5c1bfcb7d0f9985fbc28a7a4bc047a9e610`. Neither is merged into an accepted product baseline.

Codex, Kilo, and Cline fresh discovery are proven. Antigravity remains `ENVIRONMENT_BLOCKED` because no legitimate active session provides `ANTIGRAVITY_LS_ADDRESS`; follow up with `ANTIGRAVITY_RULE_DISCOVERY_RECOVERY` only when it is actively launched. The approved UX Engine reference audit remains authority for references. Future bounded work: lifecycle/provenance registry for UX references, MCP registry, first-party Skills pack, and GitHub CLI/`gh skill` evaluation.

## 2026-09-21 â€” Codex global bootstrap implementation

`governance/agent-bootstrap/CODEX_GLOBAL_AGENTS.md` is the versioned, concise universal entry contract for Codex sessions launched beneath `D:\Projects`; it explicitly distinguishes the orchestration root from a project repository and leaves repository-specific rules to each repository `AGENTS.md`. `governance/Test-CodexGlobalBootstrap.ps1` is intentionally separate from the portable task-governance checker because it verifies machine-local Codex home state without exposing configuration contents. `CODEX_GLOBAL_BOOTSTRAP = IMPLEMENTED`; discovery statuses remain pending until fresh read-only session evidence is collected. Antigravity remains `ENVIRONMENT_BLOCKED`.

## Current handoff
The next platform phase is the portfolio architecture inventory defined in TOWNBOSS_PLATFORM_IMPLEMENTATION_PLAN.md.
