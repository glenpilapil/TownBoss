# GlenTown Validation Profiles

**Status:** CANONICAL / MANDATORY BASELINE

Validation must match the actual completion claim. Focused checks do not substitute for checkpoint/release gates.

## SHA-Bound Validation Model

"PASS" is always bound to an exact source checkpoint/SHA. Acceptance belongs to the exact validated SHA; a later SHA does not inherit affected runtime/visual acceptance automatically.

### Validation Dimensions

Validation dimensions are distinguishable and must be recorded independently:

- **FORMAT** — formatting/static validation (Pint, changed-syntax check, diff check)
- **ANALYZE** — analyzer/lint validation (flutter analyze, equivalent)
- **TESTS** — automated tests (focused + full suite where required; record exact counts)
- **ANDROID_BUILD** — Android build success
- **WEB_BUILD** — Web build success
- **WEB_BROWSER_ACCEPTANCE** — browser runtime acceptance (human or interactive evidence)
- **ANDROID_PHYSICAL_ACCEPTANCE** — physical Android/device acceptance (human or interactive evidence)

### Example Semantic Model

```
CHECKPOINT: <SHA>

FORMAT: PASS
ANALYZE: PASS
TESTS: PASS <exact count> / <exact assertion count> / <exact failure count>
ANDROID_BUILD: PASS
WEB_BUILD: PASS
WEB_BROWSER_ACCEPTANCE: NOT_RUN
ANDROID_PHYSICAL_ACCEPTANCE: NOT_RUN
```

Do not claim "all tests pass" or vague counts such as "380+". Record exact counts from the terminal output for the exact checkpoint being validated.

### Validation Freshness Rules

- Acceptance belongs to the exact validated SHA; a later SHA does not inherit affected runtime/visual acceptance automatically.
- Only impacted acceptance dimensions need revalidation after a change.
- Unrelated accepted areas need not be invalidated without a dependency or shared-code reason.
- Automated tests/builds do not establish browser/device visual acceptance; those require explicit human or interactive evidence.
- Stale test output is historical, not current verification.

## Flutter UI / regression recovery
- Focused tests for changed behavior.
- `flutter analyze` for affected code; full analyze at coherent checkpoint.
- `git diff --check`.
- Full Flutter suite before checkpoint/release promotion where material.
- Screenshot audit when visual authority is involved.
- Samsung/representative physical-device verification for mobile release-critical behavior.
- Reconcile canonical UX/regression documentation before final report.

## Laravel API / domain contract
- Focused feature/unit tests for changed contract.
- Authorization, ownership and tenancy tests where applicable.
- Validation/idempotency/concurrency tests where applicable.
- Full Laravel suite before coherent checkpoint/release promotion.
- Formatting check limited to changed scope unless broader cleanup is explicitly authorized.
- Migration verification for schema changes, including PostgreSQL target behavior.
- `git diff --check`.

## Seed/demo data
- Guard against accidental production execution.
- First run succeeds.
- Second run succeeds without duplicate canonical entities.
- Expected relationship/count assertions are recorded.
- Populated demo credentials/identity are verified where applicable.
- Seeded data exercises intended product categories and states rather than only happy-path single-category content.
- Media sources/provenance and claimable-business semantics are preserved.

## Commerce / booking / financial boundary
- Server-authoritative pricing/state-transition checks.
- Ownership/tenancy/permission tests.
- Idempotency and duplicate-submission checks.
- Availability/inventory revalidation where applicable.
- Cancellation/refund/deposit boundary tests where applicable.
- End-to-end runtime journey before release promotion.

## Messaging
- Conversation creation/participant authorization.
- Send/read/unread/request/mute flows as applicable.
- Idempotency and pagination.
- Cross-user privacy/tenancy tests.
- Flutter/API contract alignment.
- Physical-device end-to-end verification for release gate.

## Security/privacy/compliance
- Authentication/authorization review.
- Tenant/ownership isolation.
- Sensitive-data and private-media leakage review.
- Secret/configuration handling.
- Abuse/rate-limit considerations where applicable.
- Auditability/provenance for consequential state transitions.
- Independent review for high-risk changes.

## Release candidate
- Concrete API/App/TownBoss refs recorded.
- Fresh full API/database verification bound to exact checkpoint SHA.
- Fresh Flutter analyze/full suite bound to exact checkpoint SHA.
- Critical operational acceptance test.
- Required physical-device/browser checks bound to exact checkpoint SHA.
- Security/privacy/compliance gate.
- Nationwide seed/readiness gate for enabled geography.
- Known blockers/deferrals explicitly recorded.
- Release evidence manifest completed.
