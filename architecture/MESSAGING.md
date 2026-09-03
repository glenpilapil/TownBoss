# TownBoss Messaging v1

**Status:** Canonical design v1  
**Classification:** Platform Core  
**Scope:** TownBoss portfolio

## Purpose

Messaging is the shared TownBoss capability for durable person-to-person, group, product-context, and system-assisted conversations across portfolio products.

It owns conversation state, participants, messages, attachments, delivery/read state, moderation hooks, and lifecycle semantics. It does not own the business transaction that a conversation may discuss.

## Core rule

`conversation context != business authority != transaction state`

A message may refer to an order, booking, property inquiry, job, service request, government-service task, or other domain object. Messaging must never become the source of truth for that domain object's authoritative state.

## Architectural posture

TownBoss owns the canonical messaging semantics. Product repositories implement adapters and product-specific entry points. Physical extraction into a shared runtime is deferred until reuse evidence justifies it.

## Core entities

### Conversation
A durable container for messages with stable identity, type, lifecycle state, participant set, visibility policy, and optional domain context references.

### Participant
A user, organization representative, system identity, or approved pseudonymous identity with a role and membership lifecycle in a conversation.

### Message
An immutable-at-send communication record with sender reference, conversation reference, client/idempotency key where applicable, message type, content envelope, created/sent timestamps, and moderation/delivery metadata.

Edits and deletions should preserve accountable history where policy requires it rather than silently rewriting prior state.

### Message attachment
A reference to Media-owned content. Messaging owns the attachment relationship and message presentation metadata, not blob storage or media processing.

### Delivery state
Recipient/channel delivery status such as queued, sent, delivered, failed, or unavailable.

### Read state
Per-participant state indicating when a message/conversation was last read. Read receipts may be configurable by product/privacy policy.

### Conversation context reference
A typed pointer to a product/domain object such as order, listing, booking, property inquiry, service inquiry, job application, event, or orchestration task.

The reference provides context only. Messaging cannot mutate the referenced object's business state merely by changing the conversation.

## Conversation classes

Canonical classes may include:

- direct message;
- group conversation;
- inquiry/support conversation;
- transaction-linked conversation;
- organization/team conversation;
- anonymous/pseudonymous room where explicitly allowed;
- system/assistant-assisted conversation.

Products may define additional presentation-specific classes without changing the shared invariants.

## Participant semantics

Membership changes must be explicit and attributable. Products must define who may create a conversation, invite/remove participants, leave, rejoin, or view prior history.

A user's ability to access a conversation is authorization-sensitive and must be re-evaluated independently from simple participant-row existence where applicable.

Organization participation must distinguish the organization from the individual representative acting on its behalf.

## Identity and pseudonymity

Messaging integrates with Identity & Trust and Authorization.

Where products permit pseudonymous/anonymous rooms, Messaging may expose an approved presentation identity while preserving the internal accountable identity linkage required by platform safety, abuse handling, and lawful obligations.

Pseudonymity must not mean that the platform loses the ability to apply safety, blocking, or enforcement controls.

## Message lifecycle

A message lifecycle may include:

`DRAFT/LOCAL -> ACCEPTED -> QUEUED -> SENT -> DELIVERED`

Exceptional outcomes may include:

- `FAILED`
- `REJECTED`
- `MODERATED`
- `REDACTED`
- `DELETED_BY_POLICY`

Local client drafts are not server messages until accepted.

## Idempotency and ordering

Message-send mutations should support client-generated idempotency keys or equivalent duplicate suppression so retries do not create duplicate messages.

Conversation ordering should use server-assigned stable ordering metadata rather than trusting device clocks.

Delivery order and creation order may differ; implementations must not claim strict real-time ordering guarantees they cannot provide.

## Editing and deletion

Products may permit editing or deletion within policy-defined windows.

Where edits are supported, the system should preserve at least the fact and timestamp of modification; high-risk contexts may require version history.

Deletion semantics must distinguish:

- hide for current user;
- remove from normal presentation for all participants;
- policy/moderation redaction;
- legal/privacy deletion where applicable;
- retention of minimal audit metadata.

A client-side delete must not imply that all server backups/audit records are immediately erased when law/policy requires retention.

## Attachments

Attachments use Media capability references. Messaging must validate that the sender is authorized to use the media and that recipients are authorized to access the resulting attachment.

Attachment upload success is not equivalent to message-send success; partial failure and retry behavior must be defined.

## Delivery and realtime transport

Messaging semantics are transport-independent. Products may use WebSocket, push notification, polling, server-sent events, or other mechanisms.

Realtime transport is an optimization/presentation concern; durable server state remains authoritative for accepted messages.

A transient delivery failure must not automatically delete an accepted message.

## Notifications

Messaging produces notification-worthy events, but Notifications owns cross-channel notification delivery and user notification preferences.

A message's unread state and a push notification's delivery state are separate.

Notification failure must not invalidate the durable message.

## Blocking and safety

Blocking relationships and safety policy must be applied before allowing new communication where required.

Products must define how blocking affects:

- new direct conversations;
- sending into existing conversations;
- visibility of history;
- group conversations;
- transaction/support contexts where communication may still be operationally necessary.

Blocking must not erase audit history or authoritative transaction records.

## Moderation

Messaging exposes hooks for automated and human moderation without making the messaging subsystem the author of all moderation policy.

Moderation may evaluate text, attachments, links, spam/abuse indicators, sexual content, threats, fraud, or other policy-relevant signals.

Moderation actions must be attributable and auditable when consequential.

The system should distinguish:

- content blocked before acceptance;
- accepted content hidden/redacted later;
- participant sanctions;
- conversation restrictions;
- escalation to human review.

## Private content and privacy

Private message bodies are sensitive content. Logging, analytics, experimentation, AI retrieval, and observability must not ingest raw message content by default unless explicitly required and appropriately governed.

Access to message content must follow least privilege. Administrative/support access should be scoped, attributable, and auditable.

Retention periods may vary by product, conversation type, legal requirement, moderation need, or user deletion policy.

## Encryption

Transport encryption is required in production. Encryption-at-rest should follow the platform security baseline.

End-to-end encryption is not assumed by this v1 contract. A product must not claim E2EE unless its implementation actually provides the relevant cryptographic guarantees and key-management model.

## Search

Search & Discovery may index message content only where the product explicitly supports conversation search and the requesting user is authorized to view the underlying messages.

Message search indexes are derived projections and must not leak removed participants' or unauthorized users' content through results, snippets, counts, or autocomplete.

## AI and Glen AI

Glen AI may participate in or assist with messaging only within explicit product policy and AI Authority constraints.

Examples include drafting replies, summarizing a conversation for an authorized participant, translating, or proposing next actions.

AI must not silently impersonate another human participant. Synthetic/AI-generated content should be distinguishable where user understanding materially depends on it.

AI access to private conversation content must be purpose-limited, authorized, privacy-aware, and auditable at an appropriate level.

An AI-generated draft is not a sent message. Sending on behalf of a user is consequential and must follow AI Authority and authorization rules.

## Orchestration

Orchestration may create messaging tasks or wait for replies, but Messaging does not own workflow state.

A message such as "approved", "paid", or "done" must not automatically be interpreted as authoritative completion unless the owning domain explicitly defines a verified transition based on that message and all required gates are satisfied.

## Transaction-linked conversations

Orders, bookings, property inquiries, service inquiries, jobs, and similar workflows may link to conversations.

The domain owns:

- order/payment/booking/status transitions;
- eligibility;
- pricing;
- inventory/availability;
- contractual acceptance;
- professional/government decisions.

Messaging owns only the communication record and context linkage.

## External messaging channels

Future adapters may bridge approved external channels such as Facebook/Instagram/WhatsApp or other providers.

External systems may remain authoritative for delivery/channel-specific identifiers. TownBoss should store normalized conversation/message references and provenance sufficient for synchronization without pretending to own the external platform's state.

Adapters must define duplicate detection, ordering, deletion/edit mapping, unsupported feature handling, identity resolution, rate limits, and webhook/retry semantics.

## Audit & Observability

Consequential messaging events should support correlation with Audit & Observability, including:

- conversation creation;
- participant add/remove/leave;
- message acceptance/rejection;
- moderation/redaction;
- delivery failures;
- administrative access;
- blocking/safety enforcement;
- external-channel synchronization failures.

Operational telemetry should avoid raw private content whenever identifiers/status metadata is sufficient.

## Feature Flags & Experimentation

Feature flags may control rollout of messaging features, realtime transports, AI assistance, read receipts, or external-channel adapters.

A flag cannot grant access to a conversation, bypass blocking/moderation, or override privacy/authorization rules.

Experiments must not expose private content to unauthorized variants or weaken mandatory safety controls.

## Reliability

Important messaging mutations should be retry-safe and compatible with transactional outbox/event delivery for downstream side effects such as notifications, indexing, moderation workflows, analytics, or external-channel synchronization.

Accepted message persistence should not depend on a downstream notification or analytics service being available.

## Rate limits and abuse resistance

Implementations should support rate limits and anti-abuse controls by sender, conversation, recipient, organization, IP/device risk, or other legitimate dimensions.

Controls should consider spam bursts, repeated unsolicited conversation creation, attachment abuse, automated scraping, and harassment patterns.

## Product adapter responsibilities

Consumers define:

- conversation classes they expose;
- eligibility to create/join/send/read;
- participant roles;
- retention/deletion policy;
- editing behavior;
- read receipt policy;
- blocking semantics;
- moderation policy and escalation;
- realtime transport;
- notification bindings;
- attachment limits;
- domain context types;
- external-channel adapters;
- AI assistance permissions;
- rate limits.

Product-specific rules must not fork the shared lifecycle semantics without an explicit TownBoss contract revision.

## Implementation truth

GlenTown-API currently has no messaging/conversation routes, controllers, models, migrations, services/actions, policies, requests/resources, or messaging tests identified in the current repository review. Its API routes expose many other product domains but no conversation/message API.

Therefore Messaging is `canonical-design-v1`, not implemented.

The architecture deliberately does not select a realtime vendor, websocket provider, external omnichannel provider, or message broker at this stage.

## Non-goals

Messaging v1 does not:

- implement GlenTown messaging immediately;
- create a centralized messaging microservice;
- replace Notifications;
- own business transaction state;
- imply E2EE;
- make omnichannel CRM a GlenTown Beta prerequisite;
- give AI permission to send messages autonomously;
- treat private messages as generic analytics data.
