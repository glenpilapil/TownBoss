# Glen AI Character Profiles v1

**Status:** Canonical design v1  
**Parent capability:** Glen AI Foundation  
**Classification:** Platform Core presentation/persona sub-contract  
**Scope:** TownBoss portfolio

## Purpose

Glen AI may be presented through multiple selectable character/personality profiles while retaining one shared intelligence, skill, grounding, authorization, orchestration, and AI Authority foundation.

The global default character is **Glen**. Products may define context-appropriate defaults, and users may choose another available character. The canonical female counterpart is **Anji**, with a female voice by default where voice is enabled. Additional profiles may be introduced over time.

A character profile changes presentation and interaction style. It does **not** change what the AI knows, which product records it may access, which skills are available, what evidence is authoritative, or what actions it is permitted to perform.

## Core rule

`character/personality != capability != authorization != AI authority`

Changing character must never increase access, bypass approval, unlock tools, alter professional/government authority, or weaken safety and policy controls.

## Character Profile

A Character Profile is a machine-readable presentation configuration that may declare:

- stable profile identifier and version;
- display name;
- presentation gender/identity where intentionally defined;
- avatar/visual identity reference;
- preferred voice profile and supported voice alternatives;
- speaking style and conversational personality traits;
- formality and verbosity tendencies;
- locale/language/accent preferences where supported;
- emotional expressiveness range;
- humor/playfulness level;
- domain/context suitability tags;
- accessibility variants;
- disclosure metadata for synthetic voice/avatar presentation;
- product availability and feature-flag state.

Profiles must not contain hidden authority grants, credentials, unrestricted tool permissions, or domain policy overrides.

## Global default

The canonical global fallback profile is:

- `profile_id: glen`
- display name: `Glen`
- presentation: male/masculine where voice/avatar presentation makes gender relevant;
- voice: masculine voice by default where voice output is enabled;
- style: clear, capable, practical, locally aware where relevant, and adaptable to the user's language and context.

The exact synthetic voice model/provider is not canonical. Voice providers may change without changing the Glen profile's identity or authority semantics.

## Anji — canonical female counterpart

The canonical first-class female character profile is:

- `profile_id: anji`
- display name: `Anji`
- canonical spelling: `Anji` (intentionally distinct from the more common `Angie` spelling)
- presentation: female/feminine where voice/avatar presentation makes gender relevant;
- voice: female voice by default where voice output is enabled;
- role: first-class alternative to Glen, not a subordinate or reduced-capability character;
- behavior: its own coherent conversational personality rather than merely changing voice pitch;
- authority: exactly the same capability, grounding, safety, authorization, and AI Authority boundaries as Glen.

Anji is authorized to use the likeness and voice of the real person who approved that use for the character. The canonical technical contract must record that authorization through consent/provenance metadata, but must not unnecessarily expose private identity details in public runtime payloads or logs.

The visual identity, exact personality tuning, synthetic voice provider/model, accent set, and product-specific use of Anji may evolve without changing the canonical identity or authority semantics, subject to the continuing scope of the underlying likeness/voice consent.

## Additional characters

Future profiles may vary by interaction preference or product context, for example:

- concise/professional;
- warm/supportive;
- energetic/coach-like;
- educational/tutor-like;
- travel-guide style;
- business-focused;
- accessibility-oriented or low-stimulation presentation.

These are presentation modes, not separate autonomous agents with independent permissions.

## Profile resolution

When selecting the active profile, precedence should normally be:

1. explicit user selection for the current interaction/session;
2. saved user preference where permitted;
3. explicit product/workflow/context default;
4. product default;
5. global fallback `glen`.

A product may suggest a context-appropriate profile, but should not unexpectedly replace an explicit user choice during an active interaction unless the user has opted into automatic context switching.

## Context defaults

Products may set defaults by surface or workflow. Context defaults affect presentation only. Skill routing still follows the Glen AI skill contract, and consequential execution still follows Orchestration and AI Authority.

## User preference

Where persistent personalization is supported, users may save a preferred character and voice. A saved preference is governed durable user preference data, not unrestricted AI memory. It should have explicit scope and be removable/resettable. Users should be able to return to `Glen` easily.

## Voice model

Character identity and voice implementation are separate. A character may support one preferred voice plus compatible alternatives for language, accent, accessibility, availability, or provider fallback.

Voice selection must not change interpreted authority, authentication state, tool permissions, user intent semantics, approval requirements, evidence quality, or safety policy.

## Personality dimensions

Profiles should use bounded, explicit personality dimensions instead of large opaque prompts where possible. Dimensions may include directness, warmth, formality, brevity/detail preference, humor, enthusiasm, coaching tendency, next-step initiative, local-language/code-switching, and emotional expressiveness.

Personality traits may influence wording and interaction pacing, but must not influence factual truth, evidence hierarchy, constraint results, or permission decisions.

## Stable truth across profiles

Given equivalent authorized context and the same material question, different characters may phrase answers differently but should not intentionally produce conflicting facts, policy interpretations, constraint outcomes, or authority decisions merely because their personalities differ.

## Skill and tool independence

Skills belong to Glen AI/products/capabilities, not to characters. A character change must not alter a tool from read-only to write-capable or from A1/A2 to A3.

## Orchestration continuity

Switching characters during a workflow must not create a new hidden orchestration state. The new character continues from the same canonical workflow/session state subject to the same permissions and gates.

## Safety and reserved authority

No character may present itself as possessing a professional license, government office, financial authority, or human identity it does not actually possess. All profiles inherit the Portfolio AI Authority Model and the same A0-A4 boundaries.

## Real-person likeness and voice

A character that uses a real person's likeness or cloned/synthetic voice must have a documented authorization basis before production use.

The authorization record should capture, at minimum:

- stable consent/rights record ID;
- character profile covered by the consent;
- consent subject/rights holder reference;
- modalities covered, such as likeness, still image, animation, video, or synthetic/cloned voice;
- approved products, channels, and purposes;
- effective date and version;
- whether derivative transformations are permitted;
- whether model/provider processing is permitted where relevant;
- disclosure requirements;
- modification/restriction history;
- revocation/termination state and effective date if applicable;
- evidence/provenance reference for the authorization.

The actual signed consent artifact or private identity evidence should be stored in an appropriate governed location, not embedded in public character configuration or model prompts.

Consent must be scoped. Permission to use a face does not automatically grant permission to clone a voice, create video, make endorsements, reuse private biography, or sublicense the likeness to unrelated products unless those uses are covered by the authorization.

A revoked or expired authorization must fail closed for new generation or publication that depends on that authorization. Existing published assets require a product/legal handling policy appropriate to the consent terms rather than silently assuming perpetual rights.

## Anji consent and provenance policy

Anji is the first canonical real-person-based Glen AI character.

For Anji, the architecture recognizes an approved likeness-and-voice use relationship, but production implementation must still create a durable consent/rights record before generating or deploying the real-person-based avatar or synthetic/cloned voice.

The Anji consent record must separately identify at least:

- likeness use;
- synthetic/cloned voice use;
- avatar/image transformation use;
- supported product/channel scope;
- any limits on advertising, promotion, endorsements, or commercial use;
- consent evidence/provenance;
- modification and revocation handling.

The public character profile should reference the consent record by stable identifier/status rather than contain unnecessary personal documentation.

## Disclosure and identity separation

Users must be able to understand that **Anji is an AI character**, even though the character uses an authorized real person's likeness and voice.

The system must not imply that:

- the real person is personally participating in the current conversation;
- AI-generated statements are the real person's personal statements, beliefs, endorsements, or advice;
- AI actions were personally performed or approved by the real person merely because Anji's likeness/voice was used;
- the real person possesses or delegates any professional, government, financial, or other authority that the Glen AI system itself does not have.

Appropriate disclosure may be persistent, contextual, or both depending on the surface, but it must be clear enough to avoid reasonable confusion between the AI character and the real individual.

## Biography and personal-data boundary

Authorization to use a likeness or voice does not automatically authorize use of private biography, private communications, private memories, or unrelated personal data as character context.

Any real-life biographical details intentionally incorporated into Anji should be separately approved for that purpose and should be limited to what is actually useful for the character/product experience.

## Multimodal presentation

Character profiles may control presentation across text, voice, avatar/portrait, animation, and future embodied/spatial interfaces.

## Accessibility

Users should be able to choose voice/accent/speed/accessibility variants independently from personality where technically feasible.

## Product adapter responsibilities

A consuming product may define which profiles are available, profile names/avatars, context defaults, profile-selection UI, voice provider mapping, supported locales/voices, saved preference behavior, feature-flag/experiment rollout, accessibility variants, and consent-record references for any real-person-based presentation.

Products must not weaken the parent Glen AI Foundation invariants through character configuration.

## Initial canonical requirements

1. `Glen` is the global default.
2. `Anji` is the canonical first-class female character and uses a female default voice where voice is enabled.
3. Anji is an approved real-person-based likeness/voice character, but production use requires a durable scoped consent/rights record.
4. Character/personality and voice are configurable but separable.
5. User selection should override contextual defaults unless the user opts into automatic switching.
6. Character switching cannot alter capability, data access, authorization, AI Authority, constraints, evidence, or orchestration state.
7. Products may add additional approved profiles without forking Glen AI.
8. Character profiles and real-person consent/rights references should be machine-readable and versioned.
9. Real-person presentation must preserve clear AI/person identity separation and appropriate disclosure.

## Implementation truth

This document defines the canonical profile and consent architecture only. It does not claim that GlenTown or another TownBoss product already implements character selection, avatar switching, voice synthesis, saved profile preferences, consent-record storage, or context-based automatic profile selection.

Implementation should be incremental and tied to real product needs rather than treated as a prerequisite for GlenTown Beta.
