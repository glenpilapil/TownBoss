# api.glentown.com — GlenTown API Implementation Plan

**Status:** IMPLEMENTED / ACTIVE; Laravel backend exists and has substantial verified coverage.

## Host behavior

- `api.glentown.com/` should preferably redirect to `https://dev.glentown.com/` once the developer portal exists.
- API routes remain available under the canonical versioned API path.
- Do not create a decorative frontend as a security mechanism.

## Security boundary

Every endpoint is protected according to its semantics through server-side controls:

- authentication where required;
- authorization, policies, and permissions;
- tenant and ownership checks;
- validation;
- rate limiting and abuse controls;
- CORS policy;
- WAF and origin protection;
- idempotency and locking for applicable mutations;
- audit logging;
- managed service credentials for non-user integrations.

## Implementation workstreams

### API governance
- canonical `/api/v1` or current repository-standard versioning;
- deprecation policy;
- consistent errors and pagination;
- OpenAPI generation and maintenance;
- idempotency conventions;
- webhook and event conventions when introduced.

### Production infrastructure
- HTTPS only;
- Cloudflare proxy and origin protection;
- production database and backups;
- queue and scheduler workers;
- object and media storage;
- centralized logs and error monitoring;
- health and readiness endpoints with safe exposure;
- deployment and rollback procedure.

### Developer integration
OpenAPI schemas and examples feed `dev.glentown.com`; public documentation must not expose internal-only routes or sensitive operational details.
