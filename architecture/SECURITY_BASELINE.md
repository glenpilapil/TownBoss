# TownBoss Security Baseline v1

**Status:** Canonical design v1  
**Classification:** Platform Core baseline  
**Scope:** TownBoss portfolio

## Purpose

The Security Baseline defines the minimum security invariants every TownBoss product, shared capability, integration, and AI-enabled workflow must preserve. It is not a substitute for product-specific threat modeling, legal/compliance obligations, penetration testing, infrastructure hardening, or incident response.

Core rule:

`feature availability != permission != trust != security approval`

A feature being reachable, a user being authenticated, an AI having tool access, or an external provider returning success does not by itself authorize access to protected data or consequential actions.

## Baseline domains

The minimum baseline covers:

- authentication and session/token handling;
- authorization and tenancy isolation;
- input validation and output encoding;
- secrets and credential management;
- PII and sensitive-data handling;
- uploads and media security;
- rate limiting, abuse prevention, and resource exhaustion controls;
- API and integration security;
- browser/mobile transport and session protections;
- dependency and supply-chain hygiene;
- audit, security logging, monitoring, and incident evidence;
- backup/restore and recovery security;
- AI/tooling security boundaries;
- infrastructure/origin exposure and administrative access.

## Authentication

Authentication establishes identity context; it does not grant blanket resource permission.

Requirements:

- authenticated endpoints must use an approved authentication mechanism;
- credentials, bearer tokens, refresh tokens, session identifiers, reset tokens, signing secrets, and API keys are secrets;
- passwords must be hashed using approved adaptive password hashing provided by the platform/framework;
- password reset and email verification tokens must be scoped, expiring, and resistant to replay;
- logout/revocation semantics must be explicit;
- authentication failures should avoid account-enumeration leakage where practical;
- sensitive authentication endpoints require abuse/rate-limit controls appropriate to risk;
- device/session listings and token revocation should be attributable where implemented.

## Authorization and tenancy

Authorization is mandatory infrastructure for protected resources.

Requirements:

- every protected read or mutation must have an explicit authorization basis;
- authentication alone is insufficient;
- tenant/organization ownership or membership checks must be enforced server-side;
- route-model binding, identifiers, query filters, search indexes, exports, background jobs, notifications, media delivery, and AI context assembly must not bypass tenancy;
- mass-assignment or client-supplied ownership fields must not override authoritative actor/tenant context;
- privileged administration must use explicit roles/policies and stronger controls where appropriate;
- cross-tenant access fails closed unless explicitly authorized.

## Input validation and output safety

All external input is untrusted, including user input, file metadata, provider webhooks, public-data feeds, imported documents, AI output, and internal messages crossing trust boundaries.

Requirements:

- validate type, size, format, allowed values, relationships, and domain invariants server-side;
- do not rely on client validation;
- reject unknown or excess privileged fields where mass assignment could be dangerous;
- use parameterized database access/ORM safety rather than string-built queries;
- encode/escape output appropriate to its rendering context;
- avoid unsafe HTML/script rendering by default;
- URLs, redirects, callbacks, and deep links require allowlisting or equivalent validation where abuse is possible;
- deserialization and dynamic code/template execution from untrusted data are prohibited unless explicitly sandboxed and reviewed.

## Secrets and credentials

Secrets must not be committed to source control, exposed in client bundles, logs, analytics, notification bodies, URLs, screenshots, error payloads, or AI prompts unless strictly required and protected.

Requirements:

- use environment/secret-store injection;
- rotate compromised or unnecessarily exposed credentials;
- scope provider credentials to least privilege;
- separate development/test/production credentials;
- never reuse public client identifiers as secret authorization material;
- avoid long-lived unrestricted service credentials where a bounded token is available.

## PII and sensitive data

Products must minimize collection, exposure, duplication, retention, and logging of personal or sensitive data.

Requirements:

- collect only data necessary for declared product purpose;
- public display data must be distinguished from verified/legal identity data;
- sensitive fields must not be exposed merely because the parent resource is visible;
- logs/metrics/traces should use identifiers rather than unnecessary raw PII;
- exports and administrative views require explicit authorization;
- retention/deletion policy must distinguish source business records, evidence, audit history, and user-facing presentation state;
- payment credentials, government identifiers, verification documents, private addresses, and similar sensitive fields require elevated handling.

## Media and uploads

Uploads are untrusted content even when supplied by authenticated users.

Requirements:

- enforce size, allowed type, extension/MIME consistency, and storage-policy validation;
- generate server-controlled storage names/paths;
- prevent path traversal and executable-file placement in served locations;
- private/sensitive assets require authorized delivery rather than public object URLs unless explicitly intended;
- dangerous active content must be blocked or safely transformed/sandboxed;
- malware/content scanning may be required by risk class; absence of scanning must not be represented as a clean-file guarantee;
- image/document metadata should be minimized where privacy requires;
- media attachment does not establish evidence truth or authorization.

## Rate limiting and abuse controls

Security-sensitive and resource-intensive operations need controls against brute force, spam, scraping, enumeration, denial of service, and automation abuse.

Risk-based controls may include:

- per-IP, per-account, per-tenant, per-device, or per-operation rate limits;
- progressive backoff;
- duplicate suppression/idempotency;
- quotas and bounded pagination;
- concurrency limits;
- moderation/abuse signals;
- challenge/escalation controls where appropriate.

Rate limits must not be treated as the only authorization control.

## API and integration security

External systems are separate trust boundaries.

Requirements:

- all production traffic carrying credentials or sensitive data uses encrypted transport;
- provider webhooks are untrusted until signature/authentication and replay protections pass;
- callback/webhook processing must tolerate duplicate and out-of-order delivery;
- API keys/tokens are least-privileged and server-side where secrecy is required;
- outbound requests must defend against SSRF by constraining destinations when user-controlled URLs or adapters are involved;
- imported public/provider data is data, not executable instruction;
- external success does not bypass local authorization, AI Authority, or domain gates;
- integrations must preserve external source authority and reconciliation semantics.

## Browser, mobile, and session security

Where browser sessions/cookies are used, secure cookie flags, CSRF protections, same-site policy, TLS, and origin controls must match the authentication mode. CORS must be explicit and least-permissive for production. Mobile clients must not embed privileged server secrets and should use platform-secure storage for sensitive session material where available.

## Authorization of consequential operations

Important mutations such as payments, credits, refunds, withdrawals, bookings, reservations, approvals, identity/verification changes, organization role changes, external submissions, and destructive actions require:

- authenticated actor or approved system identity;
- resource authorization;
- current domain preconditions;
- idempotency/duplicate prevention where retry-sensitive;
- AI Authority/approval gates if AI-initiated;
- attributable audit evidence where material.

## AI and agent security

AI-generated text, retrieved content, uploaded documents, webpages, emails, and tool output must be treated as potentially adversarial input.

Requirements:

- prompt or retrieved content cannot override platform policy, authorization, AI Authority, or tool scopes;
- context assembly uses minimum necessary authorized data;
- secrets and unrestricted credentials are not placed in prompts;
- tool calls are constrained to authorized resources/operations;
- AI output is validated before use as structured input to consequential operations;
- autonomous A3 execution must satisfy the canonical AI Authority gates;
- A4 autonomous actions remain prohibited;
- prompt injection or successful tool invocation never upgrades authority.

## Dependencies and supply chain

Products must maintain reproducible dependency manifests/lockfiles where supported, review dependency updates, avoid abandoned/high-risk packages where practical, and remediate known exploitable vulnerabilities according to severity and exposure. Build/deploy systems must protect release credentials and artifact integrity.

The approved recurring Production Security Audit should include dependency/lockfile review, DAST/OWASP-style testing, configuration drift, access review, secret exposure, TLS/headers/CORS/CSP/cookies, backup/restore verification, and logging/monitoring review.

## Infrastructure and origin protection

Production origin exposure should be minimized. The approved direction is proxied DNS plus Cloudflare Tunnel/private ingress where practical, with WAF/rate-limiting/bot-abuse controls and Zero Trust for administrative surfaces. If private ingress is unavailable, origin firewall rules should restrict inbound traffic to required trusted sources where feasible.

Administrative panels, databases, queues, observability endpoints, internal dashboards, and storage control planes must not be unintentionally internet-public.

## Logging, audit, and errors

Security-relevant events should be attributable without leaking secrets.

Important events may include:

- authentication success/failure patterns;
- token/session revocation;
- role/permission changes;
- privileged admin actions;
- sensitive data access/export;
- financial mutations;
- verification/approval changes;
- provider credential/configuration changes;
- repeated authorization failures;
- webhook verification failures;
- security control bypass attempts.

User-facing errors must not expose stack traces, secrets, credentials, database internals, filesystem paths, or unnecessary infrastructure detail in production.

## Backups and recovery

Backups containing sensitive data inherit the sensitivity of the source data. Backup access must be restricted, encrypted where appropriate, retention bounded, and restore procedures periodically tested. Recovery must preserve authorization/tenancy integrity and must not silently resurrect revoked credentials or superseded sensitive state without explicit recovery semantics.

## Security headers and transport

Production web surfaces should define appropriate HTTPS enforcement, HSTS when operationally safe, content-type protection, framing policy, referrer policy, and CSP where applicable. Header requirements are product/runtime-specific but must be reviewed before production exposure.

## Feature flags and experiments

Feature flags cannot bypass authentication, authorization, tenant isolation, mandatory security validation, payment controls, AI Authority, or privacy policy. Security controls must not be weakened for experiments without explicit security review and an equivalent safe boundary.

## Secure defaults

Ambiguity resolves toward least privilege, non-disclosure, and no consequential side effect.

Defaults should prefer:

- deny over implicit allow;
- private over public for sensitive data;
- bounded scopes over wildcard scopes;
- expiring tokens over indefinite credentials;
- revalidation over stale authorization assumptions;
- server authority over client assertions;
- explicit allowlists over arbitrary destinations;
- attributable change history over silent mutation.

## Current GlenTown implementation truth

Current GlenTown-API evidence shows meaningful security foundations, including Laravel Sanctum as an authentication dependency, `auth:sanctum` protected API routes, personal access-token revocation/logout behavior, signed email-verification routing, multiple named throttles on sensitive operations, request validation classes, and a substantial set of domain policies. These are real implementation patterns, not proof that every baseline requirement is fully enforced across every route and deployment environment.

This v1 does not claim that GlenTown currently has complete production hardening, centralized secret management, upload malware scanning, universal authorization-policy coverage, production WAF/Tunnel deployment, exhaustive security headers/CSP, DAST automation, or portfolio-wide security monitoring. Those remain implementation/audit concerns to verify before production readiness.

## Product responsibilities

Each product must map this baseline to its actual runtime and document material deviations. Security-sensitive implementation truth must be proven by code/configuration/tests/deployment evidence, not architecture declarations.

## Non-goals

Security Baseline v1 does not:

- certify legal/regulatory compliance;
- certify PCI DSS, ISO 27001, SOC 2, or other standards;
- replace penetration testing or threat modeling;
- select a single WAF, secret manager, SIEM, scanner, or identity provider;
- require premature microservice extraction;
- imply that architecture documentation alone makes a product secure.
