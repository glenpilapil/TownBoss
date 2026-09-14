# GlenTown App Site UX Engine Pilot

Status: APPROVED / ACTIVE PILOT
Project: GlenTown App Site (`glenpilapil/GlenTown-App-Site`)
Supervisor: Code Project Supervisor (CPS)
Parent capability: `TOWNBOSS_UX_ENGINE`

## Purpose

GlenTown App Site is the first practical pilot for the future TownBoss UX Engine. The pilot begins immediately and does not depend on completion of the generalized engine.

Its purpose is to convert UX quality from an informal visual review into a supervised, evidence-based workflow with explicit authority, correction tracking, responsive inspection, accessibility checks, and rendered verification.

## Authority

The following remain authoritative:

1. TownBoss portfolio/master planning authority.
2. GlenTown planning and approved product decisions.
3. GlenTown App Site implementation plan and approved reference/template direction.
4. Approved GlenTown branding, imagery, photography, copy, and visual decisions.
5. Explicit human-approved decisions from design/visual review.

UX-engine skills and agent suggestions are advisory below these authorities. They must flag conflicts rather than silently overriding approved direction.

## Approved pilot pipeline

`Existing requirements/design → UX/IA review → design-system/rule extraction → rendered-screen critique → prioritized correction ledger → implementation → browser/device rendering → accessibility and visual verification → approval`

The cycle repeats until the UX gate passes.

## First execution environment

Use **Kilo Code in the VS Code extension** as the first execution environment because it is already part of the active GlenTown App Site development workflow.

The pilot must remain portable to:

- Kilo CLI
- Codex CLI
- Gemini CLI
- other CPS-approved compatible agents

The UX authority and project rules must live in shared/project-local documentation rather than inside one agent session. The agent can change; the design authority cannot.

## Upstream references

Approved upstream references for selective mining:

- `richhemsley3/claude-design-skills` — UX workflow and orchestration.
- `nicohodt/claude-code-ui-ux-skill` — design intelligence, design-system generation, UX anti-pattern checks, cross-agent portability.
- `szilu/ux-designer-skill` — UX principles, heuristics, WCAG/accessibility, IA, navigation, forms, research, onboarding, search, tables, AI-interface and ethical-design knowledge.
- `Gustavosilveira23/claude-design-skills` — visual/browser verification and specialized design review disciplines.

These are references, not production dependencies or design authorities.

## Required baseline review

Before UX-driven implementation changes, review as one package:

- current GlenTown App Site source;
- current rendered desktop/mobile state;
- TownBoss GlenTown App Site planning documents;
- approved reference/template;
- approved assets and photography;
- existing branding and design decisions;
- current navigation, CTA hierarchy, section order, responsive behavior, accessibility, and trust signals.

The first deliverable is a baseline correction ledger, not a redesign.

## Correction ledger

Use the following severity levels:

- `BLOCKER`
- `HIGH`
- `MEDIUM`
- `POLISH`

Each item should record the affected route/section and viewport, evidence, expected behavior, recommended correction, implementation status, and verification result.

## Responsive rule

Desktop, laptop, tablet, and mobile must be evaluated as distinct interaction contexts. A layout is not accepted as responsive merely because it scales or stacks without overflow.

Review hierarchy, navigation, CTA placement, content density, reading order, image crop, spacing, tap targets, interaction model, and context at each required viewport.

## Completion rule

A build that passes lint, typecheck, tests, or other automated checks is not automatically UX-complete.

Minimum acceptance loop:

1. Implement.
2. Render on required browser/device viewport.
3. Inspect visually and functionally.
4. Critique against approved authority.
5. Correct findings.
6. Re-render.
7. Verify corrections.
8. Record evidence and approval.

## Relationship to CPS

CPS owns supervision, sequencing, evidence requirements, conflict handling, and gate enforcement. The generalized design of `TOWNBOSS_UX_ENGINE` is maintained under:

`plans/projects/code-project-supervisor/TOWNBOSS_UX_ENGINE_REFERENCE_AUDIT.md`

The App Site pilot is expected to generate reusable patterns for that generalized capability.

## Rollout sequence

1. GlenTown App Site pilot.
2. Consolidate lessons into the generalized TownBoss UX Engine.
3. Apply the matured workflow to more complex surfaces, beginning with GlenTown Flutter Web.

## Immediate next gate

Review current documentation and implementation against the approved UX-engine references and produce the baseline UX correction ledger before asking implementation agents to make UX-driven changes.
