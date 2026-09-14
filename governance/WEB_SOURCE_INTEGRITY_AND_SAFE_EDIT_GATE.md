# TownBoss Web Source Integrity and Safe Edit Gate

**Status:** CANONICAL / PORTFOLIO-WIDE / MANDATORY FOR WEB SOURCE CHANGES  
**Applies to:** React, Next.js, JSX/TSX, JavaScript/TypeScript web applications, public websites, browser-delivered applications, and equivalent component/template systems where text-based edits can corrupt source structure.

## 1. Purpose

This gate exists to prevent a recurring class of development failures caused by unsafe source editing rather than by product logic itself. Typical failures include malformed JSX/TSX, duplicate or spliced component bodies, stale validation evidence, accidental whole-file rewrites, broad regex/text replacements across source trees, transient hot-reload errors being misclassified as final-state defects, and worker reports claiming PASS using evidence that predates the final material edit.

The objective is not to prohibit efficient automated editing. The objective is to require editing methods that preserve source integrity and produce evidence tied to the final saved state.

## 2. Core rule

For structured web source, workers must prefer the smallest safe edit that satisfies the task. Broad textual mutation is prohibited when a bounded structural edit is available.

A task cannot be promoted to `VERIFIED`, `CHECKPOINTED`, or `RELEASE_READY` while source-integrity evidence is stale, ambiguous, or contradicted by the repository state.

## 3. Prohibited unsafe edit patterns

Unless explicitly justified and independently verified, workers must not:

- recursively rewrite JSX/TSX/JS/TS files using blanket `Set-Content`, `Out-File`, shell redirection, or equivalent whole-tree replacement;
- run file-wide or directory-wide regex/string replacement across structured source when the replacement can affect syntax, literals, imports, JSX text, HTML entities, or code semantics;
- replace every occurrence of punctuation such as apostrophes/quotes across JSX/TSX files merely to satisfy lint;
- generate a complete replacement component/page for a small bounded change without first inspecting the current file and explaining why a whole-file rewrite is safer;
- paste an older transcript/session snapshot over a current source file as ordinary editing;
- restore an earlier file version from logs/transcripts unless the task is explicitly a recovery operation and the recovery source is verified as the intended state;
- mutate multiple structural JSX/TSX files in one opaque batch without per-file or bounded-group validation;
- report success based on lint/typecheck/test/build output captured before the final material source edit;
- treat a transient hot-reload parse error observed during an in-progress file write as final-state evidence without rechecking the completed saved file;
- suppress, weaken, or bypass parser/type/lint/build checks merely to proceed.

## 4. Required safe-edit workflow

For every material JSX/TSX or equivalent structured-source edit:

1. **Inspect current file** — read the current relevant source before mutation.
2. **Identify bounded target** — name the component/section/function/markup block being changed.
3. **Choose minimum sufficient edit** — modify only the necessary region when practical.
4. **Preserve current accepted behavior** — do not overwrite unrelated work or adjacent accepted content.
5. **Inspect resulting diff** — review the changed file diff before moving on from a structural edit.
6. **Run fast syntax/type validation** — use the fastest deterministic parser/typecheck/lint/build check appropriate to the repository after each material structural edit or small coherent group.
7. **Stop on corruption evidence** — if duplicate roots, unmatched tags, duplicate imports/exports, file splicing, or unexpected large diff appears, diagnose and repair before further feature work.
8. **Continue only from a valid saved state**.

For React/Next.js projects, modified `.tsx`/`.jsx` files must parse/typecheck successfully before the task proceeds to broad validation unless the task is explicitly in the middle of an atomic generated transformation that cannot be observed safely in partial state.

## 5. Whole-file rewrite rule

A whole-file rewrite is allowed only when one or more of the following is true:

- the task explicitly replaces the file/component architecture;
- the current file is demonstrably corrupted and recovery requires reconstruction;
- generated-source tooling owns the file and deterministic regeneration is the canonical mechanism;
- the resulting whole-file replacement is smaller/safer than incremental mutation and the worker records that justification.

After a whole-file rewrite, the worker must:

- inspect the complete resulting file;
- inspect the full diff;
- verify no unrelated accepted content disappeared;
- run immediate parser/typecheck validation before editing additional structural files.

Unexpected large rewrites for small tasks are a review trigger.

## 6. Source-integrity checks

Before final validation, inspect modified structured-source files for:

- duplicate imports;
- duplicate exports;
- duplicate component/function bodies;
- multiple unintended JSX roots;
- unmatched or interleaved tags;
- duplicated sections from old/new implementations;
- conflict-marker remnants;
- transcript/log/session artifacts pasted into source;
- malformed JSX entities or text substitutions;
- accidental encoding/line-ending corruption where material;
- missing closures caused by partial replacement;
- unexpectedly deleted accepted content;
- unrelated broad formatting or content churn.

If a tool can deterministically detect these conditions, prefer automated enforcement in CI/supervisor gates.

## 7. Validation freshness rule

Validation evidence is state-bound.

Any material source edit after a validation command makes affected validation evidence stale for checkpoint/release promotion.

After the final material source edit, run the repository's required final validation sequence. For a typical Next.js/TypeScript project this normally includes, in project-defined order:

- lint;
- typecheck;
- automated tests;
- production build;
- `git diff --check` or equivalent source/diff integrity check.

Project-specific validation may add formatting, accessibility, browser, route, security, or performance gates.

A worker must not report `PASS` for a command that was not run against the final material source state.

## 8. Live dev-server / hot-reload rule

Development servers may observe a source file while an editor/tool is still writing it. Therefore:

- parse/build errors captured during an active write may be classified as **transient/unconfirmed**;
- once the write completes, recompile or reload the final saved state;
- if the error disappears without source mutation after a clean recompile/restart, record it as a transient development-server observation rather than a final source defect;
- if the error persists against the final saved file, treat it as a real source-integrity failure;
- restarting the dev server must target only the relevant project process and must not indiscriminately terminate unrelated Node/IDE/session processes.

This rule prevents both false alarms and false dismissals.

## 9. Diff-size and churn guard

Supervisors/workers must compare expected scope with actual diff size.

Review is required when:

- a small UI/text change rewrites most of a component/page;
- line churn is disproportionate to the requested behavior;
- multiple unrelated files change due to formatting/encoding/text replacement;
- accepted content disappears without task authorization;
- generated edits touch all files under a route/component tree without a demonstrated need.

Large diff size is not automatically wrong, but unexplained large churn blocks automatic checkpoint promotion.

## 10. Recovery rule

When corruption is detected:

`OBSERVE -> CONFIRM FINAL SAVED STATE -> IDENTIFY CORRUPTION BOUNDARY -> PRESERVE UNRELATED WORK -> RECOVER MINIMUM NECESSARY SOURCE -> VALIDATE -> REVIEW DIFF`

Do not use destructive repository reset/clean/checkout as the first response.

Transcript/session logs may be used as recovery evidence only when:

- the intended target state is independently identifiable;
- the selected snapshot is verified to be the correct/latest intended version;
- recovery does not overwrite unrelated newer work;
- the recovered result is diff-reviewed and revalidated.

## 11. Checkpoint-blocking failures

The following block `VERIFIED` and `CHECKPOINTED` unless an explicit operator-approved exception applies:

- malformed source that fails parser/typecheck/build;
- duplicate/spliced component bodies;
- unresolved conflict/source corruption;
- unexplained whole-file rewrite for a bounded task;
- broad unsafe text replacement with unreviewed consequences;
- final validation evidence predating the final material edit;
- source diff not reviewed after structural rewrite/recovery;
- worker report claiming PASS contradicted by current repository evidence;
- persistent runtime/build parse error against the final saved state.

## 12. Required evidence receipt

For substantial web-source tasks, the final report/checkpoint evidence must include:

- structured-source files materially edited;
- whether any whole-file rewrite occurred and why;
- confirmation that modified structural files were diff-reviewed;
- immediate syntax/type validation result after structural edits where applicable;
- final validation commands run after the last material edit;
- final `git diff --check`/equivalent result;
- any transient dev-server errors observed and how final-state validity was confirmed;
- any source-integrity incident/recovery performed;
- confirmation that no unsafe blanket source replacement remains unreviewed.

## 13. Supervisor enforcement

Code Project Supervisor must enforce this gate for applicable web tasks.

CPS should eventually support deterministic checks for:

- validation timestamps/state identity relative to the final edit/checkpoint;
- unexpected diff-size/churn thresholds;
- duplicate/conflict-marker detection;
- parser/typecheck failure before broad task continuation;
- prohibited recursive text-replacement commands where command provenance is available;
- mismatch between worker PASS claims and final repository evidence.

Worker prose cannot override failed deterministic source-integrity evidence.

## 14. Relationship to other standards

This gate complements:

- `governance/DEVELOPMENT_RULES.md`;
- `governance/PROJECT_EXECUTION_STANDARD.md`;
- `governance/WEB_APPLICATION_QUALITY_GATE_STANDARD.md`;
- project-specific validation/acceptance criteria;
- Code Project Supervisor task/validation governance.

Project-specific rules may be stricter but may not silently weaken this gate.
