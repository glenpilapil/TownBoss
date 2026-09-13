# Code Project Supervisor — Authority Matrix

**Status:** CANONICAL / INITIAL  
**Purpose:** Define who may decide and act at each level of CPS-supervised development.

## Principles

- Human authority is reserved for genuine product, risk, destructive, external, or exception decisions.
- CPS may resolve ordinary technical choices inside approved architecture and task scope.
- Workers may implement within their task contracts but may not redefine portfolio/project authority.
- Explicit exceptions must be recorded; silence is never approval.

## Authority Table

| Action / Decision | Worker | CPS | Operator |
|---|---:|---:|---:|
| Read repository/docs/state | Yes | Yes | Yes |
| Diagnose defect within task scope | Yes | Yes | Yes |
| Select ordinary implementation detail consistent with architecture | Yes | Yes | Yes |
| Choose worker/provider for a defined task | No | Yes | Yes |
| Decompose approved objective into bounded tasks | No | Yes | Yes |
| Modify files within approved task scope | Yes | Supervises | Yes |
| Expand scope beyond task contract | No | Propose only | Yes |
| Change canonical architecture materially | No | Propose only | Yes |
| Supersede approved product decision | No | Propose only | Yes |
| Create checkpoint when contract permits | Within explicit task policy | Yes after gates | Yes |
| Push/publish externally | Only if explicitly authorized | Only if explicitly authorized | Yes |
| Destructive repository/data action | No by default | No by default | Explicit approval required |
| Production deployment | No by default | No by default | Explicit approval required unless standing policy exists |
| Secret/credential handling beyond approved mechanism | No | No | Controlled by security policy/operator |
| Accept unresolved high-risk verification failure | No | No | Explicit risk acceptance only |
| Waive TownBoss development rule | No | No | Explicit scoped exception only |
| Mark task VERIFIED | No | Yes after evidence/review | Yes |
| Mark project milestone operational | No | Recommend | Yes / defined acceptance gate |

## Standing Exceptions

Standing approvals must be documented with scope, expiry/review condition, and evidence. A standing exception cannot be inferred from earlier convenience or prior behavior.

## Fail-Closed Rule

When authority is unclear, the action does not proceed. CPS should reduce the question to the smallest meaningful human decision rather than escalating ordinary implementation details.