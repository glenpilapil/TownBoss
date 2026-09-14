# TownBoss UX Engine Reference Audit

Status: APPROVED / PLANNED AUDIT
Owner: Code Project Supervisor (CPS)
Capability: `TOWNBOSS_UX_ENGINE`

## Decision

Establish `TOWNBOSS_UX_ENGINE` as a first-class CPS capability for systematic UX design, design-governance support, rendered inspection, and visual/interaction validation across TownBoss web and app surfaces.

This capability is not a replacement for project product authority, Master Development Plans, implementation plans, or approved design systems. CPS remains the orchestration and supervision layer.

## Core objective

Prevent technically passing implementations from being treated as UX-complete without rendered inspection and verification.

Target lifecycle:

`Product requirements → User/Journey model → Information Architecture → UX reasoning → Design system → Page/screen specification → Implementation → Browser/device inspection → UX critique → Accessibility → Visual regression → Approval`

## Approved upstream references

The following are approved upstream references only. They are not architectural authorities and are not automatic production dependencies.

### `richhemsley3/claude-design-skills`
Primary reference for UX workflow/orchestration, including staged research, journey mapping, information architecture, product design, critique/heuristics, accessibility, research review, and component-gap analysis.

### `nicohodt/claude-code-ui-ux-skill`
Primary reference for design intelligence, design-system generation, palettes/typography/style reasoning, UX anti-pattern checks, and portable use across multiple coding agents.

### `szilu/ux-designer-skill`
Primary reference for UX principles and knowledge: Nielsen heuristics, Laws of UX, WCAG, IA, forms, navigation, mobile UX, design systems, research, onboarding, notifications, search, tables, AI interfaces, and ethical design.

### `Gustavosilveira23/claude-design-skills`
Primary reference for visual/browser verification, specialized design disciplines, and evidence-based review of rendered implementations.

Claude's official/current frontend-design approach should also be compared where relevant, but TownBoss must not attempt to clone vendor-specific hidden behavior.

## Required audit method

For each candidate pattern, compare it against current TownBoss and CPS architecture before adoption. Classify each as:

- `ADOPT`
- `ADAPT`
- `REJECT`
- `DEFER`

The audit must explicitly check for duplication with existing CPS capabilities, project planning contracts, browser/device audit workflows, validation gates, design-system authority, accessibility rules, and visual regression practices.

## Authority hierarchy

The UX Engine must operate below existing product/design authority:

1. TownBoss portfolio/master planning authority.
2. Project Master Development Plan and implementation plans.
3. Approved project product decisions and design system.
4. Explicit human-approved visual/UX decisions.
5. CPS UX Engine interpretation and validation.
6. Upstream UX references and agent suggestions.

An agent must flag a conflict with higher authority; it must not silently override it.

## Agent portability

The UX Engine must be agent-agnostic.

Approved initial execution surfaces include:

- Kilo Code VS Code extension
- Kilo CLI
- Codex CLI
- Gemini CLI
- other CPS-approved compatible coding agents

The canonical UX rules, design authority, evaluation criteria, and correction ledgers should be project-local or CPS-managed artifacts, not private knowledge trapped inside one agent or IDE surface.

Kilo Code in the VS Code extension is approved as the first practical execution environment for the GlenTown App Site pilot. CLI use is not required merely to access the UX workflow.

## Responsive and multi-surface rule

The UX Engine must reason independently about each relevant surface rather than simply stretching one composition.

Examples include desktop web, laptop, tablet, mobile web, native mobile, Flutter Web, admin portals, business portals, and specialized applications. The engine should reason about user task, viewport, information density, navigation model, interaction method, hierarchy, and context before choosing or validating a layout.

## Rendered-evidence rule

Code quality signals alone are insufficient for visual/UX completion.

Builds, tests, lint, typecheck, static analysis, and component tests remain required where applicable, but UX acceptance requires rendered evidence and explicit visual/interaction verification on required surfaces.

Expected loop:

`Design/requirements → implement → render → inspect → critique → correct → re-render → verify → approve`

## First pilot

The first bounded production pilot is `GLENTOWN_APP_SITE_UX_ENGINE_PILOT`.

The GlenTown App Site pilot should be used to establish:

- canonical audit prompts and roles;
- UX correction-ledger schema;
- viewport/device evidence requirements;
- accessibility and responsive gates;
- screenshot/browser inspection procedures;
- design-authority conflict handling;
- reusable anti-pattern checks;
- approval/closure criteria;
- portability between Kilo VS Code, Codex CLI, Gemini CLI, and other CPS-approved agents.

Lessons from the App Site pilot should inform the generalized engine before rollout to more complex surfaces such as GlenTown Flutter Web.

## Non-goals

The UX Engine must not:

- autonomously replace an approved project design direction;
- treat an upstream skill as TownBoss product authority;
- optimize for visual novelty over product usability;
- equate responsive layout with simple scaling/stacking;
- declare UX completion from code/tests alone;
- force every project into one visual style;
- couple canonical UX knowledge to a single model, agent, IDE, or CLI.

## Audit deliverables

The future reference audit should produce:

1. source-by-source capability map;
2. overlap/gap comparison with CPS;
3. ADOPT/ADAPT/REJECT/DEFER matrix;
4. canonical UX Engine architecture proposal;
5. agent-interface/portability contract;
6. project-local design-authority schema;
7. correction-ledger schema;
8. rendered-evidence and visual-regression protocol;
9. accessibility validation protocol;
10. migration path from the GlenTown App Site pilot to generalized CPS capability.
