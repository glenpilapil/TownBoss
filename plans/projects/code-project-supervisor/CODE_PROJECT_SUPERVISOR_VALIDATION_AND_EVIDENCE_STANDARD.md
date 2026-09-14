# Code Project Supervisor — Validation and Evidence Standard

**Status:** CANONICAL  
**Purpose:** Define what counts as acceptable evidence for implementation, verification, review, and checkpoint promotion.

## Evidence Classes

1. **Repository evidence** — files, schema, configuration, diff, branch/commit state.
2. **Static verification** — lint, analyze, typecheck, formatting, policy checks.
3. **Automated tests** — unit, integration, contract, regression, security, migration tests.
4. **Build/package evidence** — successful production/build/package generation.
5. **Database/migration evidence** — migration application, schema verification, idempotency, rollback/compatibility where required.
6. **Runtime evidence** — service startup, health, real request/response, process lifecycle, integration behavior.
7. **UI/device/browser evidence** — visual/responsive/physical-device acceptance when user experience matters.
8. **Security evidence** — auth/authorization/tenant boundaries, secret handling, dependency/application security checks.
9. **Independent review evidence** — separate reviewer findings and disposition.
10. **Checkpoint evidence** — coherent commit/PR/checkpoint tied to the verified state.
11. **Documentation evidence** — canonical documents and Memory reconciled with implementation.
12. **Web quality evidence** — SEO/indexability, metadata, links, media, Core Web Vitals, accessibility/responsiveness, frontend performance, API/database efficiency, HTTPS/security and deployment-delivery evidence required by `governance/WEB_APPLICATION_QUALITY_GATE_STANDARD.md`.

## Promotion Rules

- `IMPLEMENTED`: required implementation exists.
- `TESTED`: required automated/static gates for the task have passed.
- `VERIFIED`: completion contract is satisfied with sufficient evidence and any required independent review is resolved.
- `CHECKPOINTED`: verified state is durably captured in the approved repository/checkpoint mechanism.

Worker narrative alone is never sufficient for VERIFIED when deterministic evidence is available.

## Risk-Weighted Evidence

### R0 — Read-only/research
Normally requires source/provenance review, factual reconciliation, and a clear report.

### R1 — Low-risk scoped change
Normally requires targeted tests/static checks plus diff review.

### R2 — Normal feature work
Requires relevant automated suites, integration evidence where appropriate, build/typecheck/lint as applicable, diff review, and checkpoint validation.

### R3 — High-impact/security/data/schema/infrastructure
Requires R2 evidence plus independent review and domain-specific verification such as migration/security/tenant/runtime gates.

### R4 — Production/destructive/external commitment
Requires explicit human authorization, R3 evidence, production/deployment safeguards, rollback or recovery plan where applicable, and post-action verification.

## Evidence Quality Rules

- Evidence must be tied to the repository state actually being accepted.
- Stale test output is historical, not current verification.
- A passing test suite is insufficient if the required contract is untested.
- Tests must not be weakened merely to produce green status.
- Manual evidence should be used only where automation is inadequate or where human visual/operational acceptance is inherently required.
- Unresolved contradictions between documentation, tests, and implementation block VERIFIED status.
- For web projects, validation captured before the final material source edit is stale for release/checkpoint promotion.
- A green lint/typecheck/test/build suite does not substitute for applicable web-quality evidence.
- A green automated accessibility scan does not prove keyboard-only operability, correct focus behavior, screen-reader usability or end-to-end accessible task completion.

## Mandatory Web Project Validation Profile

For any website, web application, web portal, PWA or browser-delivered product, Code Project Supervisor must inherit `governance/WEB_APPLICATION_QUALITY_GATE_STANDARD.md` and classify each gate family as `PASS`, `FAIL`, or justified `NOT_APPLICABLE`.

At minimum, verify where applicable:

- intended public routes are not accidentally `noindex`;
- private/staging routes are intentionally excluded from indexing;
- unique meta titles and useful meta descriptions;
- canonical tags/URLs;
- exactly one primary `h1` per page unless a documented exception applies;
- clean URL slugs and useful internal links;
- Open Graph metadata including `og:image` for shareable public pages;
- truthful schema markup where supported/applicable;
- valid sitemap and robots behavior for public SEO-facing products;
- no broken critical links or CTAs;
- meaningful image alt text and optimized/compressed media;
- representative Core Web Vitals/performance evidence;
- mobile responsiveness and accessibility;
- complete keyboard-only operability across release-critical journeys, with no mouse/cursor/touch dependency;
- logical focus order, visible focus states, no keyboard traps and correct modal/menu/dropdown/custom-widget keyboard behavior;
- appropriate semantic structure, accessible names/labels, form-error association and dynamic-state announcements;
- representative screen-reader/accessibility-tree inspection for critical flows where applicable;
- zoom/reflow, contrast and reduced-motion behavior;
- production minification, code splitting, lazy loading and non-critical script deferral where appropriate;
- unnecessary re-render and unused-dependency review;
- API caching/payload efficiency where safe;
- database indexing, pagination/bounded lists and no known N+1 query behavior on release-critical paths;
- expensive-query/server-side caching where safe and justified;
- CDN, load-balancing and database connection pooling applicability based on deployment scale/architecture;
- HTTPS, transport security, security headers/secrets/form abuse controls as appropriate.

For keyboard accessibility specifically, CPS must require a human or equivalent interactive walkthrough proving that every release-critical task can be completed from start to finish with keyboard input alone. Automated scanners may supplement but may not replace this evidence.

Release-critical failures in this profile block `VERIFIED`/`RELEASE_READY` unless an explicit operator-approved exception exists.

## Final Verification Checklist

Before final report/checkpoint:

- Confirm target repo/worktree/branch/HEAD.
- Review diff and unrelated changes.
- Run required validation profile.
- For web projects, run the mandatory web application quality gate and record PASS/FAIL/NOT_APPLICABLE evidence.
- For release-critical web flows, attach keyboard-only accessibility evidence and record any accessibility defects separately from generic visual defects.
- Confirm no prohibited scope was introduced.
- Resolve or explicitly classify failures.
- Perform required independent review.
- Re-read governing documentation.
- Update Memory and affected docs.
- Produce Documentation Compliance Receipt.
- Record checkpoint identifier when created.