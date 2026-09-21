# TownBoss Development Bootstrap

When working under `D:\Projects`:

- Treat `D:\Projects` as an orchestration root, not as a single project repository.
- Resolve the target repository or repositories before any write; never infer it solely from conversation or thread history.
- Before mutation, inspect repository identity, branch, HEAD, status, upstream, and active Git operations.
- Read the target repository's `AGENTS.md` and applicable repository-local authority before implementation.
- For TownBoss-governed projects, read canonical governance from `D:\Projects\TownBoss`.
- Canonical project and TownBoss documentation outranks agent rules, Skills, MCPs, tooling, and conversational memory. Reconcile project/repository documentation first, then TownBoss.
- Do not write into sibling repositories merely because `D:\Projects` exposes them. Use one writer per bounded scope, preserve unrelated dirty work, and do no destructive Git or recovery work under uncertainty.
- Every substantial task requires Phase, Deliverable, and Task identifiers. Validation is exact-SHA-bound.
- Automated tests and builds do not establish visual acceptance; UI implementation agents cannot self-declare visual/design acceptance.
- Required repository documentation/Memory and TownBoss reconciliation are completion gates. A task with governance closeout pending is not DONE.
- If required authority cannot be resolved, fail closed rather than guess. Archived projects such as CodeBisor do not become current authority merely because they are visible under `D:\Projects`.

This is the universal entry contract only. Repository `AGENTS.md` files provide more-specific operating rules; canonical documentation remains the actual project and product authority.
