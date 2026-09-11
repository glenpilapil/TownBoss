# GlenTown Android/iOS Implementation Plan

**Status:** ACTIVE / primary implementation exists.

## Current focus

- Complete onboarding and sign-in redesign plus connectivity corrections.
- Preserve official GlenTown brand assets and edge-to-edge immersive presentation.
- Verify application service configuration on physical devices.
- Maintain real service mode as default; mock mode only by explicit build define.
- Complete Beta-critical journeys and comprehensive demo seeding.

## Gates

- `flutter analyze` clean.
- full Flutter tests pass.
- Android physical-device visual audit.
- iOS verification before iOS production release.
- permissions, privacy, and store metadata review.
- crash and error telemetry.
- signed production build and release-channel procedure.
