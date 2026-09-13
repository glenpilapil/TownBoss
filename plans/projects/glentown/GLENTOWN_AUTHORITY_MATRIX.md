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

## Standing exceptions
Any standing approval must state scope, review/expiry condition, and evidence. Prior convenience or historical behavior does not create standing authority.
