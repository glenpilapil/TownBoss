# TownBoss Notifications v1

**Status:** Canonical design v1  
**Classification:** Platform Core  
**Scope:** TownBoss portfolio

## Purpose

Notifications is the shared TownBoss capability for turning domain and platform events into attributable, preference-aware, retry-safe delivery attempts across approved channels such as in-app, push, email, SMS, and future external adapters.

It coordinates notification intent, recipient targeting, urgency, channel policy, delivery state, interaction state, deduplication, retries, expiry, batching, and provider reconciliation. It does not become the source of truth for the event being communicated.

## Core invariants

`notification != message != authoritative domain state`

`delivery != read != acknowledgment != action completion`

A notification can inform or direct a user to an action. It cannot grant authorization, satisfy an approval, complete an orchestration task, change a payment/order/booking state, or make a non-authoritative source authoritative.

## Architectural posture

TownBoss owns canonical notification semantics. Products own domain-specific notification types, copy, business triggers, and channel adapters. Physical centralization is deferred until reuse evidence justifies it.

## Core entities

### Notification Intent
An immutable or append-oriented request to notify one or more recipients about a defined source event or state transition. It contains a stable type, source reference, recipient scope, presentation data or template reference, urgency, expiry, deduplication metadata, and permitted actions.

### Recipient Reference
An attributable recipient or recipient scope. Recipient resolution must preserve tenancy, authorization, blocking/privacy policy, and geographic targeting rules where applicable.

### Notification Type
A stable identifier describing why a notification exists. Types define default priority, permitted channels, preference behavior, whether delivery is optional or mandatory under explicit policy, and expected action semantics.

### Channel Policy
The ordered rules that select eligible channels from in-app, push, email, SMS, and future adapters while respecting preferences, availability, urgency, cost, privacy, quiet hours, and provider health.

### Delivery Attempt
One attempt to deliver a notification through one channel/provider endpoint. Attempts are attributable and retry-aware.

### Delivery State
Canonical states should distinguish at least queued, attempted, provider-accepted, delivered where the provider can prove it, failed-transient, failed-permanent, suppressed, expired, and cancelled where supported.

Provider acceptance is not equivalent to device/user delivery unless the provider contract establishes that meaning.

### Interaction State
User-facing state such as unseen/seen/read, opened, dismissed, or action-invoked. Interaction state is separate from delivery state and from the source domain outcome.

### Preference
A user- or organization-scoped preference controlling categories/types/channels, digests, quiet hours, locale, and other presentation choices. Mandatory notices may bypass preferences only when an explicit policy classifies them as mandatory.

### Urgency
A bounded classification such as normal, important, urgent, or critical. Urgency is policy-controlled and must not be inflated merely to improve engagement.

### Deduplication Key
A stable key preventing retry storms or duplicate source events from creating repeated notifications beyond the intended policy.

### Action Reference
A safe deep-link or action descriptor pointing to a product surface. Following it must re-evaluate current authorization and domain state.

## Notification lifecycle

A typical lifecycle is:

`source event -> notification intent -> recipient resolution -> preference/policy evaluation -> channel selection -> delivery attempts -> interaction -> expiry/retention`

Each stage may fail independently. Failure to notify must not silently roll back or reinterpret the source domain transaction unless the owning workflow explicitly makes successful notification a requirement.

## Channels

The canonical capability is provider-neutral and may support:

- in-app notification inbox;
- mobile/web push;
- email;
- SMS;
- future external messaging-channel adapters where justified.

A product may implement only a subset. Channel availability is not a promise that delivery will succeed.

## Preferences and quiet hours

Users should be able to control optional notification categories and channels at a useful granularity without requiring a preference for every individual event.

Preferences may include:

- type/category enablement;
- per-channel enablement;
- digest vs immediate delivery;
- quiet hours;
- timezone;
- locale/language;
- preview/privacy behavior where supported.

Mandatory account-security, transactional, legal, safety, or other notices may be non-disableable only through an explicit documented policy. The product must not relabel promotional notifications as mandatory.

Urgent/critical alerts may override quiet hours only under an explicit policy appropriate to the source and recipient scope.

## Urgency and emergency/public alerts

Urgency is a delivery/presentation concern, not source authority.

For emergency or public alerts, Notifications may receive an alert from a trusted adapter and deliver it to affected recipients. The authoritative source, geographic scope, effective period, severity, and provenance remain owned by the relevant public-data/domain capability or external authority.

A GlenTown urgent-alert UI, including a red notification indicator for urgent alerts affecting the user's location, is a product presentation decision layered on this contract. It does not make GlenTown the originating authority.

## Deduplication and idempotency

Notification intent creation and provider delivery should support idempotent retry behavior for retry-sensitive flows.

Deduplication should be defined at the appropriate scope, for example:

`notification-type + source-event-id + recipient + material-variant`

Retries of one delivery attempt must not create a new user-visible notification unless policy explicitly calls for repeated reminders/escalations.

## Retries, failure and reconciliation

Adapters should distinguish transient from permanent failure and apply bounded retry/backoff. Where providers expose message IDs or delivery receipts, retain provider references sufficient for reconciliation without storing unnecessary sensitive payloads.

Unrecoverable delivery failures should be observable and, where operationally important, surfaced for reconciliation or dead-letter handling.

Provider fallback must not silently violate user preferences, privacy rules, cost policy, or mandatory-channel requirements.

## Transactional outbox compatibility

Important notification intents generated from committed domain mutations should be compatible with a transactional outbox/event pattern so that a committed state change is not lost merely because downstream notification dispatch failed.

The notification dispatcher must tolerate duplicate event delivery through idempotency/deduplication.

## Scheduling, reminders and digests

Notifications may coordinate intended send time, deferred delivery, reminder cadence, and digest windows. It does not own shared resource availability or booking calendars.

Scheduled notifications should record timezone semantics and expiration. Stale reminders should be suppressed when the source state has changed or the notification has expired, when that can be deterministically checked.

Long-running reminder programs should avoid unbounded recurrence and provide a defined cancellation/supersession condition.

## Deep links and notification actions

Deep links/actions must point to a resolvable product resource or workflow surface without embedding secrets or treating the link as durable authorization.

When opened, the target product must re-check:

- authentication where required;
- authorization;
- current source-domain state;
- current constraints/approvals where relevant.

A notification saying an action is available does not guarantee it remains available when opened.

## Messaging integration

Messaging owns conversations and messages. Notifications may notify participants of message activity.

Message previews must respect conversation privacy, blocking, content policy, lock-screen/privacy settings, and channel limitations. A message notification is not itself the canonical message record.

## Orchestration integration

Orchestration may request reminders, exception notices, approval requests, dependency alerts, and completion notices.

Notification delivery/read state must not automatically advance workflow state unless the workflow has an explicit deterministic rule for the specific interaction. In particular, `read` must not be treated as human approval or task completion.

## Glen AI and AI Authority

Glen AI may summarize notification context, draft copy, classify presentation, or prepare a notification action within its authorized skill boundary.

Consequential outbound notification actions—especially selecting recipients, escalating urgency, impersonating an organization/person, sending externally, or changing mandatory notice policy—must respect AI Authority and Authorization.

AI must not:

- suppress mandatory notices to improve engagement;
- invent source events or authoritative status;
- escalate its own authority by sending a notification;
- impersonate a human or institution without explicit authorized presentation semantics;
- rewrite audit evidence of its own notification actions.

Where AI-generated text is materially user-facing, products should preserve enough attribution/version metadata for investigation without storing unrestricted prompts by default.

## Authorization and tenancy

Recipient resolution and notification viewing must respect product/tenant boundaries. A tenant-scoped notification must not leak existence or details of another tenant's protected resource.

Notifications is not an authorization system. It consumes authorization/visibility policy from owning capabilities.

## Blocking, safety and moderation

Blocking or moderation policy may suppress optional social/message notifications even when the underlying source record exists.

Mandatory account/security notices follow explicit security policy rather than social blocking rules.

Products should support abuse controls for notification storms, repeated mentions, invitations, marketing, and automation-generated traffic.

## Privacy and sensitive content

Use the minimum content required for the selected channel. Push/SMS/email previews may be visible outside the authenticated application and therefore require stronger data minimization than in-app detail views.

Do not place secrets, access tokens, passwords, payment credentials, private keys, or unnecessary PII in notification bodies, URLs, provider metadata, or logs.

Sensitive notifications should prefer neutral previews with authenticated retrieval of details where appropriate.

## Localization and timezone

Notification type and presentation should be localizable. Time-sensitive copy should use the recipient/product timezone policy explicitly rather than assuming server timezone.

Locale or wording changes do not change the source event's semantics.

## Feature Flags & Experimentation

Feature flags may control optional channels, presentation variants, batching, or non-safety delivery experiments. They cannot disable mandatory notices or weaken security/privacy/authority requirements merely to create an experiment variant.

Experiments must not intentionally make critical safety or transactional notifications less reliable.

## Audit & Observability

The capability should support answering:

- which source event created the intent;
- who/what requested it;
- intended recipient scope;
- notification type and urgency;
- which preferences/policies were applied;
- which channel/provider was selected;
- delivery attempt/result and provider reference where available;
- retry/suppression/expiry reason;
- deduplication decisions;
- read/open/action interaction where collected;
- material administrative configuration changes.

Operational logs should avoid storing notification bodies or recipient PII when identifiers/references are sufficient.

Critical notification-policy mutations should produce durable audit events.

## Metrics

Useful operational measures may include intent volume, deduplication rate, queue age, dispatch latency, provider acceptance/failure, retry volume, delivery receipts where trustworthy, open/read rates where appropriate, expiry/suppression rate, and notification storm/abuse signals.

Engagement metrics must not be confused with proof that the recipient understood, approved, or completed the requested action.

## External providers and adapters

Provider-specific payloads, credentials, webhooks, device tokens, sender identities, delivery receipts, quotas, and billing remain behind adapters.

Provider webhooks are untrusted external input until authenticated/validated according to provider requirements. Duplicate/out-of-order receipts must be tolerated.

Changing provider must not silently redefine canonical delivery states.

## Security

Device/channel endpoints and provider credentials are sensitive. Store them with appropriate access controls and revocation lifecycle.

Administrative send/broadcast functions require explicit authorization, rate limits/abuse safeguards, and auditability.

Broadcast or geographically targeted urgent notifications are consequential and should use stronger review/authority controls than ordinary personal notifications.

## Retention

Retention should distinguish notification intent/history, delivery attempt metadata, provider receipts, and interaction state. Product/legal/security requirements determine duration.

Deleting or expiring a notification presentation does not delete the source business record. Conversely, deleting a source record does not automatically require retaining its sensitive details inside a notification body.

## Implementation truth

Current GlenTown-API inspection did not find a dedicated notification controller/runtime, Laravel `Notifiable` usage, `notify(...)` calls, or notification-preference implementation in the searched code. The prior registry's `partial` label therefore should not be interpreted as evidence of a complete notification subsystem.

This TownBoss capability is `canonical-design-v1`. No shared portfolio notification service, push provider, queue/broker, SMS provider, or omnichannel notification platform is claimed implemented by this document.

## Initial consumers

GlenTown is the initial proving-ground consumer. Future consumers include RealWise, TownTraveler, TownDeveloper, Glen AI surfaces, and other TownBoss products where notification delivery is required.

## Non-goals

This contract does not:

- implement GlenTown notifications;
- choose Firebase, OneSignal, Twilio, SendGrid, or another provider;
- replace Messaging;
- become the source of truth for orders, bookings, payments, emergencies, government status, or workflows;
- make read/open state equivalent to approval or completion;
- require all channels for Beta;
- require a centralized microservice before reuse evidence exists.
