# TownBoss Task Reporting and Memory Policy

**Status:** CANONICAL / PORTFOLIO-WIDE  
**Applies to:** Every TownBoss-governed project, agent, worker, reviewer, and development supervisor  
**Purpose:** Prevent final reports from becoming so long that they are truncated, while preserving detailed development evidence in durable project Memory and repository artifacts.

## Mandatory rule

Every substantial task must separate **operator reporting** from **durable project memory**.

The final operator-facing report must be short, concise, and decision-oriented. Detailed development history, implementation notes, evidence, lessons, limitations, and handoff context belong in project Memory and task artifacts.

A task is not complete if the final report is truncated before required checkpoint, remote-checkpoint, compliance, blocker, or next-action information is delivered.

## Final report principle

The final report is a summary receipt, not the primary evidence archive.

Default final reports should contain only what the operator needs to understand:

1. **Outcome** — `DONE | BLOCKED | REVIEW_REQUIRED | FAILED`.
2. **What changed** — concise bounded summary.
3. **Validation** — exact high-value results/counts only.
4. **Checkpoint** — phase, deliverable, task ID, commit hash, local branch, remote branch, and clean/dirty status.
5. **Remote checkpoint** — push result, remote SHA, and local/remote match when repository changes exist.
6. **Decisions / attention** — only items requiring operator awareness or authority.
7. **Known limitations / blockers** — concise and material only.
8. **Next action** — one bounded recommended next step.
9. **Documentation Compliance Receipt** — compressed form unless a conflict/exception requires detail.
10. **Memory update** — exact Memory file and confirmation that detailed history was recorded.

Do not repeat large inventories, raw logs, source excerpts, full test-name lists, long architecture explanations, or material already recorded in canonical documents unless the operator explicitly asks for detail.

## Output-size rule

Agents must actively avoid output-limit failure.

Before sending a final report, the agent must:

- compress repetitive detail;
- replace large enumerations with counts plus canonical artifact/file references;
- move detailed findings into Memory or a dedicated task artifact;
- preserve exact commit hashes, remote checkpoint details, gate results, blockers, exceptions, and next action in the final response;
- never rely on the final response as the only copy of important evidence.

If a task produces extensive audit/research output, write the complete detail to a governed repository artifact first, then provide a concise final summary pointing to that artifact.

## Memory detail rule

Project Memory is the durable narrative and handoff record.

For substantial tasks, Memory should capture material details that would otherwise bloat the final report, including where applicable:

- task objective and scope;
- important implementation choices;
- root causes and incidents;
- architecture or dependency decisions;
- significant files/components changed;
- validation evidence and counts;
- limitations and deferred work;
- lessons worth preserving;
- commit/checkpoint identifier;
- remote checkpoint identifier when pushed;
- final status and next action.

Memory should remain structured and useful. Do not paste raw terminal logs or duplicate whole reports.

## Detailed task artifacts

When Memory would become too detailed for a single task, create a dedicated governed artifact such as an audit, migration map, validation report, or investigation note and link it from Memory.

Use:

`final report -> concise operator receipt`

`Memory -> durable project history`

`task artifact -> deep evidence/detail when needed`

## Mandatory final-report compliance fields

Every substantial final report must include, in concise form:

- Phase ID
- Deliverable ID
- Task ID
- Outcome
- Commit hash or `NO_COMMIT_REQUIRED`
- Remote checkpoint result when a commit exists
- Validation result
- Documentation compliance result
- Memory updated: `YES | NO`
- Blocker/attention: `NONE` or concise item
- Next action

For write-capable tasks, the checkpoint information must satisfy `governance/TASK_CHECKPOINT_COMMIT_POLICY.md`, including remote checkpoint verification unless an approved exception applies.

## Reporting compliance gate

Before a task may be considered `DONE` or its final report accepted, verify:

- required detailed evidence exists in Memory or governed artifacts;
- final output is concise enough to avoid likely truncation;
- required local checkpoint receipt is present;
- required remote checkpoint receipt is present when repository changes exist, or an approved exception is stated;
- required Documentation Compliance Receipt is present;
- no material blocker, exception, or next action is omitted merely to shorten the report;
- Memory and dashboard/current-state updates required by the task were completed before reporting.

If any item fails, reporting compliance is `FAIL` and the task cannot be promoted to `DONE`.

## Supervisor enforcement target

CPS should eventually machine-enforce:

- final reports use the required concise receipt schema;
- detailed evidence is linked to Memory/artifacts rather than emitted as oversized output;
- final-report generation refuses completion if required checkpoint/compliance fields are missing;
- a task that risks output truncation writes durable detail before responding;
- remote checkpoint SHA is included and verifiable for changed repositories;
- final `DONE` transition requires `REPORTING_COMPLIANCE=PASS`.
