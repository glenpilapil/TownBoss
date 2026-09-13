# GlenTown Operational Acceptance Test

**Status:** CANONICAL / BETA RELEASE GATE

This test proves GlenTown works as a coherent product, not merely as individually tested modules.

## Preconditions
- [ ] Release-candidate API/App refs recorded.
- [ ] Required migrations applied to representative environment.
- [ ] Realistic rerunnable demo/Beta seed data loaded.
- [ ] Stable populated demo identities available for required personas.
- [ ] No release-critical blocker remains unresolved without an approved deferral.

## Fresh-install citizen journey
- [ ] Install a fresh build on a supported representative Android device.
- [ ] Verify onboarding against frozen/current authority.
- [ ] Register or sign in through the real API.
- [ ] Complete or intentionally defer profile setup without premature submission.
- [ ] Verify Home branding, universal Search, representative feed and unobstructed navigation.
- [ ] Verify notification tap, selection and swipe behavior plus semantic routing.
- [ ] Verify Explore universal Search and discovery scope.
- [ ] Verify Map-local Search, filters, markers and selected-pin behavior when real data is available.
- [ ] Open representative Place, Food, Product, Service, Event and Stay details using approved detail behavior.
- [ ] Complete at least one supported commerce or booking journey through an order/reservation state.
- [ ] Verify Cart and Orders use real typed source/state behavior.
- [ ] Send and read a message between representative users and verify unread/read state.
- [ ] Create and interact with a community post using applicable Like, Comment, Share and media behavior.
- [ ] Verify applicable You/Profile, calendar, orders, places and settings surfaces.
- [ ] Sign out and sign back in; authoritative state persists correctly.

## Guest journey
- [ ] Guest can browse allowed public surfaces without fabricated real-mode data.
- [ ] Protected actions lead to the appropriate authentication flow.
- [ ] Guest restrictions do not expose private or user-specific state.

## Provider/business/professional journey
- [ ] Sign in with a representative provider identity.
- [ ] Verify relevant organization/provider context and permissions.
- [ ] Verify a representative listing/service/order/booking management flow.
- [ ] Verify citizen-only and business-only actions remain correctly separated.

## Geographic readiness samples
- [ ] Puerto Princesa deepest-pilot experience passes.
- [ ] At least one additional Palawan town/municipality is checked.
- [ ] At least one location outside Palawan is checked for nationwide capability gating and readiness behavior.

## Cross-cutting gates
- [ ] Persistent navigation does not overlap release-critical controls.
- [ ] Real mode does not silently substitute fabricated demo behavior.
- [ ] Error, loading and empty states are truthful and usable.
- [ ] Accessibility/responsive checks pass for release surfaces.
- [ ] Security/privacy/compliance gate passes.
- [ ] Release evidence manifest records the run.

## Result
PASS requires every applicable required item to pass with evidence or have an explicitly approved non-blocking deferral. Otherwise report BLOCKED with the exact failed gates.
