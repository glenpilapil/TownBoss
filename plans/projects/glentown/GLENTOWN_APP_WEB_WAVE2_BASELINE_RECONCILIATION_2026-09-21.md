# GlenTown-App Shared Baseline and Web Wave 2 Reconciliation — 2026-09-21

**Status:** VERIFIED_CURRENT / PLANNING BASELINE

This is the current TownBoss reconciliation record for the GlenTown-App shared
baseline. It supersedes no historical evidence; it resolves current execution
state alongside the permanent decision and visual-authority documents.

## Accepted source baseline

- **GlenTown-App baseline candidate:**
  `8e17b297b7a3b2e5b0a35eafebcefe9409f37759`
  (`reconcile/web-wave2-governance-20260921`)
- **Web recovery implementation checkpoint:**
  `f5267d9ae12dd1e08a457e1c85639544ba8dc3ad`
- The App baseline reconciles the Web recovery documentation and the approved
  repository-governance bootstrap. It is not a declaration that the Web
  product is feature-complete or finally browser-accepted.

## Web Wave 2 disposition

| Item | Current status | Required later action |
|---|---|---|
| F-W2-003 — Desktop Home Community-column truncation | VISUALLY CLOSED; regression check passed | Recheck only if later affected work changes the layout. |
| F-W2-013 — Home Community feed taxonomy | VISUALLY CLOSED; regression check passed | Recheck only if later affected work changes the feed. |
| F-W2-005 — Explore bottom/content clearance | OPEN / DEFERRED | At 1199px the floating navigation overlaps the lower edge of the Browse by category banner. Resolve and visually validate during comprehensive responsive/adaptive QA after major Web elements exist. |
| F-W2-008 — Expanded-width bottom-navigation containment | IMPLEMENTED; final SHA-bound visual verification deferred | Obtain fresh valid rendered evidence bound to the implementation SHA during later comprehensive QA. |

The responsive micro-correction loop is intentionally parked. Responsive and
adaptive correctness remains required for final acceptance; it is deferred so
major Web feature/completeness work does not repeatedly invalidate narrow
layout corrections.

## Evidence-integrity boundary

- `correction-01` is `INVALID_RENDERED_EVIDENCE`: the capture tooling served
  `tool/build/web` rather than repository `build/web`, yielding HTTP 404 pages.
- `correction-02` remains valid historical rendered evidence for F-W2-003 and
  F-W2-013 and for identification of F-W2-005/F-W2-008.
- `correction-03` is not final SHA-bound visual evidence: its manifest names
  parent `c475ec0`, not `f5267d9`; its purported real-API captures are
  byte-identical to fixture captures.
- Therefore `REAL_API_VISUAL_SANITY` is `UNVERIFIED / EVIDENCE_INVALID`.
  This is an evidence-integrity condition, not a confirmed product/API defect.
  Fresh valid real-API visual evidence is required during later comprehensive
  QA.

## Current authority retained

- Customer navigation: **Home, Explore, Create, Chat, You/avatar**.
- Desktop sidebar: GlenTown brand, Home, Explore, Create, Chat, Help,
  You/Profile. Desktop topbar: Location context, Map, Universal Search,
  Notifications, Calendar, Cart.
- Explore primary taxonomy: **Products, Foods, Services, Tourism, Jobs,
  Events, Properties, Suppliers, Directory**. Places and Professionals are
  not primary Explore categories.
- Home Community feed tabs: **For You, Following, Local, Events,
  Announcements, Looking For, Alerts, Polls**.
- Jobs/hiring supports both household/personal and business/organization
  hiring, subject to their respective eligibility/compliance flows.
- Responsive classes: compact `<600`; medium `600–899`; expanded `900–1199`;
  full desktop `>=1200`. Full desktop does not begin below 1200px.

## Execution sequence and live QA

1. Establish the reconciled shared GlenTown-App baseline.
2. Reconcile TownBoss and verify App + TownBoss local/remote convergence.
3. Resume Android immediately as a first-class implementation lane.
4. Continue Web feature/completeness implementation in parallel-safe bounded
   scopes.
5. Perform comprehensive responsive/adaptive QA after major Web elements are
   implemented.

Web feature/completeness remains pending; the current screenshots are not
evidence of a finished Web operating surface. Significant canonical desktop
sidebar, topbar, and Home operating-surface elements remain subject to scoped
implementation and later QA.

For Android/Web implementation sessions, the accepted API server must be
running and healthy; real API is preferred for live product QA, and fixture
mode must be explicit. Android remains visibly open on the user's physical
device and Web visibly open in the browser so the user may inspect work while
it proceeds. For a bounded UI/UX finding: inspect → user flags the exact issue
→ change only that widget/layout → refresh/recheck → continue. A UI agent does
not silently extend into API/backend work. If a finding needs an API change,
record screen/widget, symptom, expected behavior, likely endpoint/domain,
evidence/reproduction, and blocking status for a separately authorized API
pass.

## Project-folder rule

`D:\Projects` is an orchestration root, not a project repository. Temporary,
recovery, integration, audit, support, and worktree directories for GlenTown
or TownBoss belong inside that owning project’s governed directory (for
example, `D:\Projects\GlenTown\Worktrees\...` and
`D:\Projects\TownBoss\Worktrees\...`). This record applies the standing
folder rule in `governance/DEVELOPMENT_RULES.md`; it does not authorize changes
to legacy folders.

## Documentation Compliance Receipt

**Phase:** P-GOV  
**Deliverable:** D-GLENTOWN-BASELINE  
**Task:** T-GLENTOWN-TOWNBOSS-RECONCILIATION-20260921

Planning review covered the TownBoss governance corpus and GlenTown Current
State, dashboard, capability, blocker, validation, Memory, decision, and
visual-authority records. Execution re-check confirmed the clean isolated
TownBoss worktree and source App baseline. Final review updated only
TownBoss documentation/governance records; no executable source changed.
Historical evidence was retained and explicitly marked where superseded.
Risk Register: no material risk truth changed. Validation: documentation
inspection and `git diff --check`. Conflicts: none. Exceptions: none.
