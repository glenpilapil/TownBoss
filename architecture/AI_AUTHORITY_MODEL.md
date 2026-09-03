# TownBoss Portfolio AI Authority Model v2

**Status:** Canonical architecture v2

## Purpose

TownBoss uses one portfolio-wide authority model for AI-assisted behavior across products and shared capabilities. The model defines the maximum class of action an AI system may perform, the approvals and execution gates that must exist before consequential state changes, and the boundaries that AI must never cross autonomously.

This model applies to Glen AI and any AI, agent, assistant, automation, model-driven workflow, or delegated execution mechanism used by TownBoss products.

The core rule is simple: **capability does not create authority**. An AI may be technically able to infer, plan, call a tool, satisfy a constraint, or reach an external system while still lacking authority to perform the consequential action.

## The A0–A4 authority model

### A0 — Inform / Explain

AI may retrieve, summarize, explain, compare, classify for presentation, and surface evidence without changing authoritative state.

Typical outputs include explanations, summaries, search results, evidence views, status descriptions, and non-consequential calculations.

A0 does not permit AI to convert an inference into an authoritative record or to represent itself as the source authority.

### A1 — Recommend / Draft

AI may generate recommendations, plans, scenarios, drafts, candidate classifications, proposed decisions, or candidate actions. The output remains advisory until an authorized actor or downstream domain process adopts it.

Typical outputs include itinerary suggestions, draft messages, development concepts, proposed classifications, financial scenarios, suggested workflows, and candidate remediation steps.

A1 may use Evidence & Provenance, Scenario Engine, and Constraint Engine, but their outputs remain inputs to a decision rather than approval or execution authority.

### A2 — Prepare for Approval

AI may prepare a consequential action or transaction in a complete, reviewable form, including collecting inputs, performing preflight checks, evaluating constraints, creating a proposed payload, and presenting the consequences to the required approver.

AI must stop before the authoritative mutation unless and until the required approval is valid for that exact action and context.

Approval must be attributable to an authorized human, licensed professional, external authority, policy-controlled service, or other explicitly recognized authority as required by the domain. Approval is not inferred from confidence, silence, prior unrelated approval, or the fact that all constraints passed.

### A3 — Bounded Execution

AI may execute only when authority to execute has already been explicitly granted by an authorized source and the execution is bounded by deterministic controls.

A3 requires, as applicable:

- an authenticated actor or service identity;
- authorization for the exact operation and resource scope;
- an explicit delegation, approval, standing policy, or other valid authority source;
- deterministic constraints and risk limits appropriate to the domain;
- validation that required approvals remain current and applicable;
- idempotency or duplicate-prevention for retry-sensitive mutations;
- auditability and material evidence/provenance links;
- observable execution state and failure handling;
- rollback, compensation, cancellation, or another recovery mechanism where the domain permits it;
- no unresolved hard constraint, unknown treated as pass, or authority ambiguity.

A3 is **bounded execution**, not general autonomy. It does not allow AI to reinterpret its mandate, widen its scope, waive a required approval, invent an exception, or delegate itself additional powers.

### A4 — Prohibited Autonomous Authority

A4 identifies actions for which AI must not independently claim, create, approve, or exercise authority reserved for another authority holder.

Examples include, when the relevant domain requires such authority:

- government determinations, official records, permits, eligibility decisions, or agency acts;
- licensed-professional certifications, judgments, attestations, or sign-offs;
- legal signatures, fiduciary decisions, or binding representations reserved for authorized persons;
- financial custody, transfer, trading, credit, payout, withdrawal, or risk-taking beyond explicitly delegated and bounded execution policy;
- irreversible or materially consequential decisions requiring a human or designated institutional approver;
- moderation, enforcement, identity, safety, access, or account actions where policy reserves the final decision for an authorized human or service;
- any action whose authority source cannot be established.

A4 is not an execution tier above A3. It is a prohibition boundary: the AI may support the workflow at A0–A2, and may perform separately permitted A3 sub-actions, but it may not autonomously become the required authority holder.

## Non-equivalence rules

The following equivalences are prohibited across the portfolio:

- **confidence ≠ authority** — high model confidence cannot create permission, approval, jurisdiction, professional competence, or institutional authority;
- **inference ≠ authoritative record** — an AI-derived claim remains an inference until the owning domain or authoritative source adopts or validates it through the required process;
- **simulation ≠ approval** — Scenario Engine output models a possible result and never approves the represented real-world action;
- **constraint pass ≠ execution authority** — Constraint Engine determines whether encoded conditions are satisfied; it does not authorize execution or supply the authority that authored the underlying rule;
- **tool access ≠ permission** — possession of credentials, API access, a function, or a writable integration does not establish authority to use it for a particular action;
- **orchestration ≠ authority** — sequencing a task does not grant permission to perform it;
- **authorization ≠ AI authority level** — authorization establishes whether an actor may perform an operation, while this model establishes what class of behavior an AI may autonomously undertake under that authorization;
- **previous approval ≠ blanket delegation** — approval is scoped to the action, subject, parameters, time, authority source, and conditions that were actually approved.

## AI Authority vs Authorization vs Orchestration

These are separate platform concerns and must remain separate in implementation.

### AI Authority

AI Authority answers: **What may the AI autonomously do in this context?**

It supplies the A0–A4 classification, maximum permitted AI behavior, approval requirements, prohibited-autonomy boundaries, and execution preconditions.

### Authorization

Authorization answers: **May this actor or service perform this operation on this resource?**

Authorization consumes actor identity from Identity & Trust and organization/tenancy context from Organizations & Tenancy. It owns resource-authorization policy, roles and permissions as authorization semantics, tenant-aware resource-scope enforcement, policy checks, and domain-specific access decisions. Identity & Trust remains the identity source of truth, and Organizations & Tenancy remains the organization/tenant source of truth. AI Authority does not replace authorization. A3 execution must pass both.

### Orchestration

Orchestration answers: **How does an approved goal or action proceed through tasks, dependencies, validations, scheduling, execution, exceptions, and completion?**

Orchestration may invoke AI, Scenario Engine, Constraint Engine, authorization checks, humans, professionals, and external systems. It cannot promote an AI to a higher authority level or convert an unapproved task into an authorized one.

## Canonical decision flow

```text
Evidence / Inputs
      |
      v
AI inference or proposal (A0/A1)
      |
      v
Scenario / preflight where applicable
      |
      v
Constraint evaluation
      |
      v
Required authority identified
      |
      v
Authorization + approval/delegation validation
      |
      +---- insufficient / prohibited ----> stop, explain, escalate
      |
      v
A2 review boundary if consequential approval is required
      |
      v
A3 bounded execution only when every execution gate passes
      |
      v
Audit / evidence / resulting authoritative state owned by domain
```

No component in this flow may silently skip the required-authority step.

## Evidence & Provenance boundary

Evidence & Provenance records sources, artifacts, observations, claims, assessments, confidence, lineage, correction, and supersession. It improves traceability; it does not create decision authority.

Material AI-derived claims should retain model/pipeline and input lineage where meaningful. Human or authoritative validation should be recorded as a distinct assessment or provenance relationship rather than rewriting the AI inference as though it originated from the authority.

When evidence is missing, stale, ambiguous, contradictory, or insufficient for a consequential action, the system must surface that condition and follow domain policy. Confidence alone cannot resolve an authority gap.

## Scenario Engine boundary

Scenario Engine models hypothetical futures, assumptions, runs, outcomes, comparisons, and trade-offs. AI may create and explain scenarios at A1 and may use them to prepare A2 actions.

A scenario remains hypothetical even if its method is deterministic and its inputs are high-confidence. Adoption of a scenario into authoritative state is a separate domain decision.

## Constraint Engine boundary

Constraint Engine represents and evaluates explicit conditions. It may produce pass, fail, warning, unknown, not-applicable, or error results and may retain authorized override records.

The Constraint Engine does not author government rules, professional requirements, permissions, or domain policy merely by encoding them. `unknown` is not `pass`. A passed constraint set does not approve the action and does not grant A3.

An override requires authority from the owning domain; AI cannot create override authority.

## Human and consequential-action boundaries

A consequential action is any action that can materially affect rights, money, safety, legal position, government status, professional reliance, identity/access, significant property interests, public communications, or another person's interests.

Consequential actions default to A2 unless a domain-specific policy explicitly defines a safe A3 path with bounded authority and deterministic controls. Ambiguity resolves downward: if the authority level or required approver is unclear, the AI must not execute.

Human approval must be informed enough to identify the material action being approved. Interfaces should prevent approval laundering through vague buttons, hidden parameter changes, or approval of one action being reused for materially different execution.

## Licensed-professional boundary

AI may assist licensed professionals with research, evidence organization, calculations, drafting, scenarios, preflight checks, and candidate recommendations. It must not present those outputs as the professional's certification, sealed plan, appraisal, legal opinion, diagnosis, engineering judgment, survey result, or other reserved professional act unless the qualified professional has completed the required validation and the domain records that act distinctly.

Professional review can authorize only what the professional is actually empowered to approve. AI cannot infer professional sign-off from participation in the workflow.

## Government and external-authority boundary

Government agencies, LGUs, registries, courts, regulators, payment providers, banks, operators, and other authoritative external systems remain authoritative for records and decisions they own.

TownBoss products may preflight, explain, prepare, link, submit where explicitly authorized, track, reconcile, and orchestrate interactions. They must not duplicate an external authority's decision as though TownBoss made it, fabricate official status, or treat a successful local constraint evaluation as an external approval.

Where an external system returns authoritative status, TownBoss should preserve the source, time, reference, and provenance needed to distinguish that status from local inference.

## Financial boundary

AI may explain balances and rules, prepare budgets and scenarios, detect anomalies, draft transactions, and recommend actions under A0–A2.

A3 financial execution is permitted only where a dedicated domain policy explicitly defines the delegated action, account/resource scope, amount or exposure limits, approval conditions, risk controls, idempotency, audit events, reconciliation, and stop/recovery behavior. Trading and investment automation requires its own risk and execution authority policy.

AI must not expand amount limits, bypass dual control, alter custody rules, grant credits, approve withdrawals, or assume fiduciary authority merely because a transaction is technically possible.

## Messaging, moderation, and public side effects

Drafting a message or moderation recommendation is A1. Preparing a send, enforcement, or publication action for review is A2. Automatic sending, notification, moderation, or publication may be A3 only when an explicit policy defines the allowed audience, content/action class, rate/scope limits, authorization, auditability, and stop conditions.

High-impact enforcement or public statements that require designated human/institutional authority remain behind that boundary even when AI generated the underlying recommendation.

## Self-escalation is prohibited

AI can never grant itself additional authority.

An AI system must not:

- change its own A-level classification;
- manufacture, approve, or reinterpret a delegation in order to widen scope;
- treat successful prior executions as standing permission unless an authorized policy explicitly says so;
- create or waive authorization requirements;
- create or approve its own Constraint Engine override;
- suppress required approval or evidence because confidence is high;
- use orchestration, retries, tool chaining, sub-agents, or another model to bypass an authority boundary;
- ask another AI to perform an action that the requesting AI is not authorized to perform.

Authority changes must originate from an authorized non-AI authority source and be applied through controlled configuration or domain policy with audit history.

## Capability declaration requirements

Every AI-enabled capability that can reach A2 or A3 should declare, in machine-readable policy or contract form:

- maximum default AI authority level;
- allowed actions by level;
- actions that always require approval;
- prohibited autonomous actions;
- valid authority/approval sources;
- required authorization checks;
- evidence/provenance requirements;
- required scenario/preflight and constraint gates where applicable;
- reversibility, compensation, idempotency, and recovery requirements;
- material audit events;
- escalation target when authority or evidence is insufficient.

A product may impose a lower maximum authority than the portfolio model. It may not raise authority beyond this model without an approved canonical architecture change.

## Defaulting and fail-closed rules

- Unclassified AI behavior defaults to A1 for non-consequential output and A2 for consequential action preparation.
- Unclear execution authority means no execution.
- Missing required approval means no execution.
- Missing authorization means no execution.
- Failed or unknown required hard constraints mean no execution unless the owning domain provides an explicit authorized override path and a valid override exists.
- Tool failure, timeout, retry, or partial orchestration must not widen authority.
- A degraded safety/authorization/authority-control dependency must fail closed for consequential execution.

## Portfolio adoption

This document is the canonical human-readable TownBoss AI Authority Model. The companion machine-readable contract is `capabilities/ai-authority/CONTRACT.yaml` and the Capability Registry records the capability as Platform Core canonical design v2.

Products and shared capabilities may extend this model with stricter domain rules, but must preserve A0–A4 semantics and all portfolio invariants defined here.
