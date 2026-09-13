# GlenTown Current State

**Status:** ACTIVE DEVELOPMENT / BETA READINESS RECOVERY
**Authoritative dashboard:** `GLENTOWN_IMPLEMENTATION_PLAN.md`

Phase 0 governance/planning foundations are substantially established. Phase 1 is current: Home/floating-navigation and Explore recovery are App-side complete with recorded automated evidence, but both require Samsung physical rechecks. The next eligible work is D1.4 Create recovery (T1.4.1 audit authority/bounded contract); it was not started by this documentation-only checkpoint.

Home recovery evidence ends at `ff6d2e2` (369 Flutter tests, analyze clean, diff check pass). Explore recovery at `3edfb0c` records 33 focused Explore tests, 9 cross-route tests, 369 full tests, analyze clean and diff check pass. These are historical recovery checkpoints, not current release verification. Fresh API current-HEAD full suite/database verification and App current-HEAD release validation remain open.

Explore blockers: universal Search, geographic scope/ranking and real map listings are `BLOCKED_API_CONTRACT`; destination hero media is `BLOCKED_API_DATA`; discovery richness is `BLOCKED_BY_DEMO_DATA`; Jobs/Directory fallback is pending App recovery. Real SMTP verification is `BLOCKED_EXTERNAL`. Full mobile physical audit is pending; Beta is not release ready.
