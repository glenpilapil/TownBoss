# GlenTown App Site Validation and Evidence Standard

**Status:** ACTIVE

## 1. Evidence Principle

Status is evidence-backed. Planning text, agent confidence, and successful code generation are not implementation proof by themselves.

For visual work, maintain two independent evidence tracks:

- **Engineering evidence** — code quality, tests, build, route behavior.
- **Visual evidence** — browser/device inspection and human acceptance.

A phase may be Engineering PASS / Visual FAIL.

## 2. Baseline Evidence Before Mutation

Before a substantial implementation pass record:

- repository path;
- branch;
- HEAD;
- working-tree status;
- relevant uncommitted work;
- affected routes/components;
- current automated validation status where practical.

Never reset or overwrite a dirty working tree without first reconciling the work.

## 3. Engineering Evidence

Expected routine checks:

- `npm run lint`
- `npm run typecheck`
- `npm run test`
- `npm run build`
- `git diff --check`

Where relevant also verify:

- dev server starts;
- `/`, `/features`, `/download`, `/beta` compile and return HTTP 200;
- releaseConfig behavior matches tests;
- no invented external URLs were introduced;
- no neighboring repository was modified.

## 4. Visual Evidence

Visual acceptance requires actual rendered inspection. Headless source-code review cannot claim visual PASS.

Minimum evidence for major composition gates:

- desktop light screenshot/review;
- desktop dark screenshot/review;
- mobile light screenshot/review;
- mobile dark where practical;
- tablet/responsive sanity review;
- interaction review for scrolling/navigation/carousels.

Record findings in `GLENTOWN_APP_SITE_VISUAL_AUDIT_LEDGER.md` with explicit status:

- PENDING
- FIXED
- VERIFIED
- REJECTED
- DEFERRED
- BLOCKED

## 5. Reference-Fidelity Evidence

Template-led implementation must identify:

- source/reference component or composition;
- what was preserved;
- what was substituted with GlenTown content/media;
- intentional deviations;
- licensing/provenance considerations where code/assets are reused.

A result that merely claims to be "inspired by" an approved reference is insufficient if the composition materially diverges without explicit approval.

## 6. Product-Truth Evidence

For any marketing claim, distinguish:

- verified current product fact;
- approved strategic direction;
- future capability;
- hypothesis;
- unsupported claim (must not ship).

For download/Beta CTAs, evidence must include the configured state and authoritative URL source when actionable.

## 7. Asset Evidence

Record origin/category for material assets:

- GlenTown official brand asset;
- verified app screenshot;
- licensed/approved photography;
- official platform mark;
- template/demo asset that must be replaced.

Do not assume an upstream code license grants independent rights to third-party demo imagery/fonts/assets.

## 8. Checkpoint Evidence

A checkpoint report should include:

- branch;
- commit SHA;
- scope changed;
- tests/counts;
- build status;
- visual-audit status;
- known limitations;
- deferred findings;
- confirmation of push/merge state.

## 9. Status Promotion

- `IMPLEMENTED` requires code/configuration exists.
- `VERIFIED` requires defined engineering evidence and, for visual features, required visual evidence.
- `DEPLOYED` requires production deployment evidence.
- `OPERATIONAL` requires deployment plus repeatable operating ownership/process.

Never promote a visually rejected composition to VERIFIED because lint/tests/build pass.