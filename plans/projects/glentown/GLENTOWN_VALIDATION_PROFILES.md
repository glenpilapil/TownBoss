# GlenTown Validation Profiles

**Status:** CANONICAL / MANDATORY BASELINE

Validation must match the actual completion claim. Focused checks do not substitute for checkpoint/release gates.

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
- Fresh full API/database verification.
- Fresh Flutter analyze/full suite.
- Critical operational acceptance test.
- Required physical-device/browser checks.
- Security/privacy/compliance gate.
- Nationwide seed/readiness gate for enabled geography.
- Known blockers/deferrals explicitly recorded.
- Release evidence manifest completed.
