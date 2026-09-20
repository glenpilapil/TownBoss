# GlenTown Authority Matrix

**Status:** CANONICAL / MANDATORY

## Principles
- Workers implement within bounded task contracts; they do not redefine product or portfolio authority.
- The GlenTown supervisor may resolve ordinary technical choices consistent with approved architecture, UX authority, and task scope.
- Material product, architecture, risk, destructive, external-publication, and exception decisions require operator authority.
- Silence is never approval. When authority is unclear, fail closed and reduce the issue to the smallest meaningful operator decision.

| Action / Decision | Worker Agent | GlenTown Supervisor | Operator |
|---|---:|---:|---:|
| Read repositories, canonical docs and current state | Yes | Yes | Yes |
| Diagnose a defect inside approved scope | Yes | Yes | Yes |
| Choose ordinary implementation detail consistent with canonical authority | Yes | Yes | Yes |
| Decompose approved objective into bounded tasks | No | Yes | Yes |
| Modify files inside approved task scope | Yes | Supervises | Yes |
| Expand scope beyond task contract | No | Propose only | Yes |
| Change canonical architecture materially | No | Propose only | Yes |
| Supersede approved UX/product decision or regression ledger authority | No | Propose only | Yes |
| Introduce a new product module/capability | No | Propose only | Yes |
| Add compatible API support required by an already-approved product contract | Implement when explicitly tasked | May authorize within architecture | Yes |
| Create checkpoint/commit | Only when task policy permits and gates pass | Yes after gates | Yes |
| Push/publish externally | Only if explicitly authorized | Only if explicitly authorized | Yes |
| Destructive repository/data action | No by default | No by default | Explicit approval required |
| Production deployment | No by default | No by default | Explicit approval/standing policy required |
| Accept unresolved high-risk verification failure | No | No | Explicit risk acceptance only |
| Waive TownBoss/GlenTown development rule | No | No | Explicit scoped exception only |
| Mark task VERIFIED | No | Yes after required evidence/review | Yes |
| Mark capability PHYSICAL_VERIFIED | No | Yes after recorded physical evidence | Yes |
| Mark release RELEASE_READY | No | Recommend only | Yes / release gate |

## Conflict Resolution and Evidence Rules

A. **Later explicit supersession overrides older decisions.** An explicit later supersession entry in `GLENTOWN_SUPERSESSION_REGISTER.md` overrides any conflicting earlier product or documentation decision. Historical evidence remains as historical evidence; it does not silently re-become current authority.

B. **Canonical TownBoss product/governance authority overrides conflicting App-local recovery documentation for product policy.** Product and governance decisions established at the TownBoss portfolio level or in canonical GlenTown project documents override App-local recovery documentation that conflicts with product policy. App/repository evidence may establish implementation state but does not silently change product authority.

C. **App/repository evidence may establish implementation state but does not silently change product authority.** The existence of code, a passing test, or a repository artifact does not constitute a product or UX authority change without an explicit documented decision.

D. **Code existence does not make a feature approved.** Implementation existence (repository state, tests passing, build green) is `IMPLEMENTED` evidence at most. Higher verification states such as `VERIFIED`, `PHYSICAL_VERIFIED`, or `RELEASE_READY` require the explicit evidence required by the applicable `GLENTOWN_VALIDATION_PROFILES.md` validation profile.

E. **Automated tests/builds do not establish browser/device visual acceptance.** A passing automated test suite or build does not constitute browser runtime acceptance or physical-device acceptance. Those require explicit human or interactive evidence as required by the validation profile.

F. **A code fix does not close a physical visual-audit finding until the required runtime/device validation occurs.** A visual or physical-device audit finding remains open until the required runtime, browser, or physical-device validation is recorded against an exact checkpoint. Code changes alone may move a finding to `CODE_FIXED_NOT_PHYSICALLY_VERIFIED`; only the required validation moves it to `VERIFIED_FIXED` or equivalent.

G. **Historical reports remain evidence but cannot silently become current authority after supersession.** Older reports, audits, or implementation checkpoints remain valid historical evidence. They must be clearly marked as historical when cited. They do not override later explicit authority or current-state resolution through `GLENTOWN_CURRENT_STATE.md`.

H. **If evidence is unresolved, status must remain provisional/open rather than being guessed.** Where required evidence for a status claim is absent, the status must remain `PROVISIONAL`, `OPEN`, `ATTENTION`, or equivalent rather than being inferred from memory, prior reports, or conversational context.

## Claim Provenance / Confidence Classes

These are orchestration evidence classes, NOT replacements for implementation states such as DECIDED, PLANNED, IMPLEMENTED, VERIFIED, DEPLOYED, OPERATIONAL, BLOCKED, DEFERRED, SUPERSEDED.

| Class | Meaning |
|---|---|
| `CANONICAL` | Directly established by current project authority (canonical document, explicit decision, or supersession entry). |
| `VERIFIED_CURRENT` | Proven against current repository/runtime/evidence with all required validation profile gates satisfied for the exact checkpoint. |
| `HISTORICAL` | Supported at an older checkpoint but not sufficient as current state without fresh reconciliation against current authority and evidence. |
| `PROVISIONAL` | Plausible/currently inferred but requires reconciliation before being treated as authoritative current state. |

Conversational or model memory may provide `PROVISIONAL` discovery context only. It never establishes `CANONICAL` or `VERIFIED_CURRENT` status.

## Standing exceptions

Any standing approval must state scope, review/expiry condition, and evidence. Prior convenience or historical behavior does not create standing authority.
