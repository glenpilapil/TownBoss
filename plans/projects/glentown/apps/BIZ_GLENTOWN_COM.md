# biz.glentown.com — GlenTown Business Portal

**Status:** PLANNED as independent surface; underlying business/seller API and Flutter capabilities partially exist.

## Purpose

Dedicated operating portal for merchants, service providers, professionals and organizations.

## MVP domains

- business onboarding, setup, and verification;
- organization, profile, and place management;
- products, services, food, and other permitted listings;
- orders, bookings, and reservations;
- calendar and availability where applicable;
- messaging and customer communication;
- reviews and reputation;
- account transaction views where authorized;
- staff, role, and permission management;
- basic performance dashboard.

## Architecture decision

Evaluate Flutter Web reuse against desktop-business workflow requirements. Reuse domain/API packages and design tokens regardless of UI stack.

## Security

Strong organization tenancy, granular permissions, audit logging, confirmation for sensitive actions, and server-authoritative order and booking state.
