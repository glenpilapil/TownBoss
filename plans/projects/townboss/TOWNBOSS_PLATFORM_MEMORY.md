# TownBoss Platform Memory

Status: CANONICAL / LIVING

This file is the durable history for the TownBoss platform project. Record major decisions, implementation milestones, verification, blockers, lessons, checkpoints, and handoffs.

## 2026-09-13 — Governance baseline established
TownBoss established portfolio development rules and a project-governance standard. Project implementation plans serve as operator dashboards. Active projects maintain Memory and Current State and use documentation compliance during planning, execution, and final review.

## 2026-09-16 — TownBoss Sites platform direction approved
**Type:** PRODUCT / ARCHITECTURE DECISION  
**Status:** CURRENT

Established `TOWNBOSS_SITES_PLATFORM` as a managed multi-tenant website composition and extension platform. The portfolio should prefer reusable Sites capabilities over bespoke organization websites. WordPress concepts such as themes, blocks, plugins, hooks, permissions and ecosystem economics may be mined as references, but arbitrary uploaded server-side plugin execution is not part of the approved model.

TownTraveler is Reference Implementation / Pilot #1. Generic website composition belongs in Sites; reusable horizontal business capabilities remain with their TownBoss/GlenTown Biz owners; tourism semantics remain TownTraveler-owned; other verticals retain their own domain authority. Plugins use governed manifests, explicit capabilities/permissions, APIs/events/webhooks, compatibility, provenance, lifecycle controls and entitlements.

Site-plan entitlements, plugin entitlements and usage metering are distinct. First-party plugins precede any verified third-party ecosystem. A public marketplace is deferred until security, signing/provenance, compatibility, review, rollback, billing and publisher governance are mature.

Architecture baseline: `plans/projects/townboss/TOWNBOSS_SITES_PLATFORM_ARCHITECTURE.md`.

## Current handoff
The overall platform phase remains portfolio architecture inventory. For the Sites sub-workstream, complete TownTraveler Phase 0 authoritative ownership decisions and validate the smallest Sites Core/plugin contracts required by the real TownTraveler consumer before implementation.
