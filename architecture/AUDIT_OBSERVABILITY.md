# TownBoss Audit & Observability v1

**Status:** Canonical design v1  
**Classification:** Platform Core  
**Scope:** TownBoss portfolio

## Purpose

Audit & Observability provides the shared TownBoss contract for answering two different but related questions:

1. **Audit:** who or what did what, to which governed resource or decision, under what authority, with what result, and with what attributable evidence?
2. **Observability:** what is happening inside the system now, why is it behaving that way, and what is degrading, failing, retrying, or becoming unsafe?

These concerns share correlation and telemetry primitives but must not be collapsed into one undifferentiated log stream.

## Core rule

`audit record != application log != metric != trace != evidence source of truth`

Audit records are durable accountability records. Logs, metrics, traces, and health signals are operational telemetry. Evidence & Provenance records source/claim lineage. Each may reference the others, but none substitutes automatically for another.

## Architectural posture

TownBoss owns the canonical semantics, minimum fields, invariants, correlation model, retention classes, and cross-capability integration rules. Product repositories implement thin adapters using local frameworks/providers until reuse evidence justifies physical extraction.

The contract is provider-neutral and compatible with OpenTelemetry-style traces/metrics/log correlation, structured logging systems, APM providers, SIEM/security tooling, and product-specific monitoring stacks.

## Core entities

### Audit Event
An append-oriented attributable record of a governed action, decision, approval, authority evaluation, administrative mutation, security-sensitive operation, or other event requiring durable accountability.

### Actor Reference
Identifies the actor class and attributable identity where applicable: human user, service account, system component, external integration, AI interaction, automated worker, administrator, or unknown/unresolved actor.

### Subject Reference
Identifies the governed resource, decision, workflow, integration, flag, payment/credit action, message/moderation action, verification record, or other object affected by the event.

### Action
A stable semantic action identifier such as `feature_flag.updated`, `payment.approval.granted`, `ai_authority.evaluated`, `orchestration.execution.started`, or `verification.completed`.

### Outcome
The result classification: success, denied, failed, partial, cancelled, expired, superseded, no-op, or unknown where necessary.

### Authority Context
References the authorization policy/result, AI Authority level/result, approval/delegation, consent/right, entitlement, constraint result, or other gate that materially governed the operation.

### Correlation Context
Links related events and telemetry across request, trace, session, workflow, orchestration plan/task, job, integration call, payment/order/booking, AI interaction, or other bounded execution context.

### Operational Log Event
Structured diagnostic/runtime event intended primarily for engineering and operations, not durable business accountability.

### Metric
A numeric time-series or aggregate measurement such as latency, error rate, queue depth, retry rate, saturation, availability, guardrail degradation, or business-operational health.

### Trace / Span
A causally linked execution path across components, services, jobs, external integrations, and asynchronous work.

### Health Signal
A bounded state indicator for service/component/dependency readiness, liveness, degradation, or recovery.

### Alert
A rule-triggered operational signal requiring attention, escalation, or automated remediation.

### Incident Record
A governed record describing an operational/security failure, impact, timeline, mitigation, recovery, evidence, and follow-up actions.

## Audit event minimum contract

A governed audit event should carry, where applicable:

- stable event ID;
- event type/action;
- occurred timestamp;
- recorded timestamp if different;
- actor class and actor reference;
- subject/resource type and identifier;
- tenant/organization/product/environment scope;
- request/trace/correlation/workflow identifiers;
- authority/approval/consent/constraint references relevant to the action;
- before/after or change summary where safe and appropriate;
- outcome/status;
- reason/reason-code for denial/failure/override where appropriate;
- idempotency/retry linkage for retry-sensitive mutations;
- source component/service;
- evidence/provenance references where the event depends on evidence;
- external-system reference when an authoritative external system is involved;
- schema/version metadata.

Audit records should avoid duplicating entire domain objects. Prefer identifiers, typed change summaries, hashes, and references to authoritative records.

## Append-oriented accountability

Audit records should be append-oriented. Corrections are represented through superseding/corrective records rather than silent historical mutation where accountability would be lost.

Deletion or redaction, where required by law/policy, must itself be controlled and auditable. The architecture does not assume audit data is permanently immutable regardless of legal/privacy obligations.

## Actor classes

Canonical actor classes include:

- `human-user`
- `administrator`
- `service-account`
- `system-component`
- `automated-worker`
- `ai-assistant`
- `external-system`
- `anonymous-or-unresolved`

An AI-generated proposal executed after human approval should preserve both the AI proposal provenance and the approving/executing human or bounded autonomous authority context rather than attributing the final action only to "AI".

## Correlation

Correlation identifiers should be propagated across synchronous and asynchronous boundaries where feasible.

Useful canonical identifiers may include:

- `request_id`
- `trace_id`
- `span_id`
- `correlation_id`
- `session_id`
- `interaction_id`
- `orchestration_plan_id`
- `task_id`
- `execution_attempt_id`
- `job_id`
- `idempotency_key`
- domain transaction reference
- external-system request/reference ID

Not every event requires every identifier. Products should propagate the smallest useful set that allows reconstruction without creating unnecessary cross-context tracking.

## Structured logging

Operational logs should be structured, machine-queryable, and use stable event names/fields where practical.

Logs should contain enough context to diagnose failures without dumping whole requests, secrets, authentication tokens, payment data, message bodies, government records, private documents, or unrelated PII.

Production logs should avoid ad-hoc free-text-only diagnostics for important failure paths when structured fields are feasible.

## Metrics

Portfolio capabilities should expose metrics appropriate to their risk and behavior. Common classes include:

- request rate, error rate, latency, saturation;
- queue depth and age;
- retries and retry exhaustion;
- dependency health;
- external integration success/failure/latency;
- idempotency conflicts/duplicate suppression;
- authorization denials;
- AI Authority denials/escalations;
- orchestration blocked/failed/recovery states;
- verification pending/expired/unresolved counts;
- feature-flag/experiment guardrail degradation;
- payment/credit reconciliation failures;
- notification delivery failures;
- security-significant anomalies.

Metrics must not silently become a source of truth for individual business records.

## Tracing

Distributed tracing should be used where it materially improves diagnosis of multi-step or cross-service work. Traces should preserve causal boundaries across API requests, jobs, outbox/event consumers, orchestration steps, AI/model/tool invocations, and approved external integrations.

Sampling policies may differ by environment and risk. Security/audit-critical events must not depend solely on sampled traces for accountability.

## Health, readiness, and dependency state

Services/components should distinguish liveness from readiness where useful. A process being alive does not mean it is ready to perform consequential operations.

Dependency health should distinguish healthy, degraded, unavailable, and unknown where those states materially affect product behavior.

Fail-closed capabilities should surface why they are refusing execution rather than hiding dependency uncertainty behind a generic error.

## Alerts

Alerts should be tied to actionable conditions. Avoid alerting on every error individually when aggregation, thresholds, or burn-rate style detection provides better signal.

Alert definitions should identify owner, severity, scope, runbook/recovery expectation, and suppression/deduplication behavior.

Operational alerts must remain separate from user-facing product notifications, even if the same Notification capability ultimately delivers some administrative messages.

## Incident records

Material production/security incidents should support a durable record including:

- incident ID;
- detected/started/resolved timestamps;
- affected products/capabilities/environments;
- impact and affected scope;
- detection source;
- relevant alerts/traces/log/audit/evidence references;
- mitigations and kill-switch/rollback actions;
- recovery/reconciliation work;
- root cause or current hypothesis;
- corrective/preventive actions;
- follow-up owner and status.

Incident narratives should distinguish confirmed facts from hypotheses.

## Security audit events

At minimum, products should consider durable audit for security-sensitive operations such as:

- login/authentication security events where policy requires;
- password/credential/security-setting changes;
- role/permission/policy changes;
- administrator impersonation or elevated access;
- tenant/organization membership changes;
- secret/configuration changes where safe to record metadata;
- production feature flag/kill-switch changes;
- security-control bypass attempts;
- data export/deletion/redaction operations;
- suspicious repeated authorization denials or abuse actions where appropriate;
- moderation enforcement decisions with material user impact.

Never record raw passwords, access tokens, API secrets, private keys, or authentication recovery secrets in audit or telemetry.

## AI observability and audit

Glen AI and other AI consumers should emit attributable metadata sufficient to answer:

- which interaction/skill/model-provider route was used;
- which character/profile was presented;
- what authority classification applied;
- whether the output was informational, recommendation, draft, action proposal, refusal, or bounded execution;
- what grounding/evidence references were used where material;
- which tools/integrations were invoked;
- what approval/delegation governed consequential actions;
- what safety/constraint/authorization gate denied or allowed the next step;
- latency, failures, retries, provider fallback, and token/cost telemetry where appropriate.

Do not make raw prompts, retrieved private content, or full model outputs globally queryable merely for convenience. Sensitive AI telemetry requires minimization, scoped access, and retention policy.

Character choice such as Glen or Anji is interaction metadata only and must not alter audit attribution or authority semantics.

## AI Authority integration

Audit & Observability records AI Authority evaluations and consequential execution evidence but does not define A0-A4 semantics.

For A2/A3 behavior, audit should preserve the relevant authority result, approval/delegation reference, resource authorization result, constraints, execution attempt, and outcome.

AI must not be able to suppress, rewrite, or delete mandatory audit events for its own actions. Any bounded A3 access to observability tooling must be explicitly authorized and must not permit disabling required safety/audit controls.

## Orchestration integration

Orchestration should emit lifecycle/correlation events for plan creation/revision, readiness changes, validation-gate outcomes, task execution attempts, retries, exceptions, recovery, cancellation, and completion.

Audit & Observability does not own orchestration state. It provides attributable records and telemetry about transitions owned by Orchestration.

Partial side effects and recovery must remain reconstructable across attempts using correlation and idempotency linkage.

## Evidence & Provenance integration

Evidence & Provenance owns source/claim/artifact lineage. Audit & Observability may reference those records to explain why a decision or execution occurred.

An audit event that says "verified" is not itself sufficient proof of the underlying fact unless linked to the appropriate verification/evidence record.

Operational telemetry can become an Evidence artifact when deliberately captured and governed for that purpose, but telemetry is not automatically evidence merely because it was logged.

## Human Verification integration

Verification requests, reviewer assignment, review completion, expiration, reverification, override, and material disposition changes should be auditable.

The audit event references the verification result; it does not replace the reviewer outcome or professional record.

## Feature Flags & Experimentation integration

Production flag/experiment configuration changes, kill-switch actions, rollout changes, and experiment decision records should be attributable.

Exposure telemetry may be operational/analytic rather than durable audit for every evaluation. However, consequential/risky exposures should retain enough correlation to explain why a user/workflow received a particular variant when needed.

## Payments, Credits, Orders, and other consequential mutations

Financial and retry-sensitive mutations should preserve actor, authorization, idempotency key, amount/value references where policy permits, approval/reconciliation state, external provider references, retries, reversals, and final outcome.

Audit data must not become a second ledger. The authoritative payment/credit/order records remain in their owning domain.

## Government/external authoritative systems

When interacting with government platforms, LGUs, financial providers, or other authoritative external systems, record TownBoss-side submission/attempt/status references and authoritative external reference IDs where allowed.

Do not log entire authoritative records unnecessarily and do not represent TownBoss telemetry as the external authority's official record.

## Messaging and moderation

Messaging audit should focus on governed metadata/actions such as conversation creation, participant changes, moderation actions, reporting, blocking, administrative access, and retention/deletion actions where required.

Do not copy private message bodies into general audit/logging systems by default.

## Privacy and data minimization

Audit and telemetry systems are high-risk aggregation points. Apply strict minimization, access controls, purpose limitation, and retention.

Prefer stable internal identifiers over duplicated names/emails/phone numbers. Redact or tokenize sensitive values. Avoid recording raw request/response bodies except under a narrowly governed diagnostic mechanism.

Telemetry access should be role-scoped. Production support access to sensitive traces/logs should itself be auditable where appropriate.

## Retention classes

Products should classify telemetry rather than using one retention period for everything. Suggested classes:

- short-lived debug/verbose logs;
- standard operational logs;
- metrics/time-series;
- traces;
- security events;
- durable business/security audit records;
- incident records.

Exact retention periods depend on product, legal, contractual, security, and cost requirements. The canonical contract defines classification, not universal numeric durations.

## Integrity

Audit pipelines should resist silent loss or tampering. Important audit emission should have defined behavior when the sink is unavailable.

For highly consequential operations, products should decide explicitly whether audit write failure blocks execution, queues through a reliable outbox/event path, or records a durable local fallback. The decision must be risk-based rather than accidental.

Critical audit events should use stable schemas and include schema versions. Consumers must tolerate additive evolution and use explicit migrations for breaking changes.

## Reliability and asynchronous delivery

Where audit/telemetry is emitted asynchronously, important events should use reliable delivery patterns appropriate to their criticality, such as the transactional outbox/event pattern already approved for important side effects.

Retries must avoid duplicate semantic audit records where a stable event ID can provide deduplication. Retry attempts themselves may be separately observable when useful.

## Time semantics

Distinguish occurred-at from recorded/ingested-at when material. Distributed systems may have clock skew; ordering should not rely solely on wall-clock timestamps when causal identifiers or sequence/version information exists.

## Environment separation

Production, staging, development, and test telemetry should remain distinguishable and should not contaminate production metrics, audit searches, experiments, or incident analysis.

Synthetic/test actors and traffic should be labeled where feasible.

## Dashboards and operational views

Dashboards are projections over telemetry, not sources of truth. Useful views may include:

- service/capability health;
- error/latency/saturation trends;
- queue/retry/recovery state;
- external dependency health;
- active incidents;
- security anomalies;
- AI provider/skill/tool health;
- orchestration blocked/attention-required state;
- flag/experiment guardrails;
- audit search for governed actions.

The Development Supervisor may consume these semantics for management-by-exception/Pulse-style views without owning the underlying audit/observability capability.

## SLO/SLI direction

Services and capabilities with meaningful production usage should eventually define service-level indicators/objectives appropriate to user impact and risk, such as availability, latency, successful completion, data freshness, or reconciliation timeliness.

SLOs are not required for every pre-Beta component immediately. The contract preserves a compatible foundation without manufacturing targets before production evidence exists.

## Alert severity

Products may map severities to local incident processes, but a common conceptual scale should distinguish:

- informational;
- warning/degraded;
- high-impact/action-required;
- critical/unsafe-or-major-outage.

Severity should reflect impact and urgency, not merely exception type.

## Provider abstraction

The capability should support local framework logging plus future OpenTelemetry/APM/SIEM/metrics providers through adapters. Product code should prefer canonical event/action/correlation semantics over provider-specific field names where practical.

Provider changes must not silently remove required audit fields, retention classes, security controls, or correlation guarantees.

## Implementation truth

Current implementation evidence is distributed and incomplete:

- GlenTown-API has standard Laravel/Monolog logging configuration with stack, single, daily, Slack, Papertrail, stderr, syslog, errorlog, null, and emergency channels.
- Repository inspection did not surface a canonical shared audit-event model or portfolio-wide observability contract in TownBoss, GlenTown-API, or CodeBisor.
- Existing product/framework logs therefore count as local operational logging, not implementation of this full shared capability.

Status is `canonical-design-v1` / `logical-boundary-defined`, not fully implemented.

## Non-goals

This contract does not:

- require a single centralized logging vendor;
- turn logs into authoritative business records;
- duplicate Evidence & Provenance;
- replace domain event models or ledgers;
- require raw prompt/message/document capture;
- require every debug event to be retained as audit;
- require full OpenTelemetry rollout before GlenTown Beta;
- mandate universal retention durations;
- create production SLO numbers without evidence;
- allow observability tooling to bypass privacy, authorization, AI Authority, or safety controls.
