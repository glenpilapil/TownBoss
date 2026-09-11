# admin.glentown.com — GlenTown Administration Portal

**Status:** PLANNED / existing admin capabilities require repository reconciliation.

## Purpose

Internal operational control plane for GlenTown.

## Domains

- users, organizations, and verification;
- moderation and reports;
- marketplace, service, and order intervention according to policy;
- credits and top-up proof approval;
- geographic activation and readiness;
- content and data seeding oversight;
- permissions and roles;
- audit and security events;
- support tooling;
- feature flags and configuration where authorized;
- operational dashboards.

## Security posture

- application authentication and strong authorization;
- step-up access controls where supported;
- Cloudflare Zero Trust as a candidate production control;
- least privilege;
- high-integrity audit trails for sensitive actions;
- client-side route hiding is not a security boundary.

## Gate

Admin functionality must not launch merely because endpoints exist; operational procedures, permission matrices, and auditability must be validated.
