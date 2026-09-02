# Glen AI Character Profiles v1

**Status:** Canonical design v1  
**Parent capability:** Glen AI Foundation  
**Classification:** Platform Core presentation/persona sub-contract  
**Scope:** TownBoss portfolio

## Purpose

Glen AI may be presented through multiple selectable characters/personality profiles while retaining one shared intelligence, skill, grounding, authorization, orchestration, and AI Authority foundation.

The global default character is **Glen**. Products may define context-appropriate defaults, and users may choose another available character. At minimum, the portfolio should support a female character with a female voice in addition to Glen, with room for additional profiles over time.

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

## Female character requirement

The portfolio must support at least one first-class female character profile with:

- a stable profile ID;
- a user-facing female identity/name chosen through product/brand design;
- a female voice by default where voice is enabled;
- its own coherent conversational personality rather than merely changing voice pitch;
- the same capability, grounding, safety, authorization, and AI Authority boundaries as Glen.

The canonical architecture does not force a permanent female character name in v1. Product/brand design may name and visually define the profile later without changing this contract.

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

Products may set defaults by surface or workflow. Examples:

- GlenTown may default to Glen globally;
- an educational flow may choose a tutor-oriented profile;
- a travel experience may choose a guide-oriented profile;
- a product may choose the female profile as its default for a specific audience or experience.

Context defaults affect presentation only. Skill routing still follows the Glen AI skill contract, and consequential execution still follows Orchestration and AI Authority.

## User preference

Where persistent personalization is supported, users may save a preferred character and voice.

A saved preference is governed durable user preference data, not unrestricted AI memory. It should have explicit scope and be removable/resettable.

Users should be able to return to `Glen` easily.

## Voice model

Character identity and voice implementation are separate.

A character may support one preferred voice plus compatible alternatives for language, accent, accessibility, availability, or provider fallback.

Voice selection must not change:

- interpreted authority;
- authentication state;
- tool permissions;
- user intent semantics;
- approval requirements;
- evidence quality;
- safety policy.

Voice fallback should preserve the character's intended presentation as closely as practical and disclose synthetic presentation where required.

## Personality dimensions

Profiles should use bounded, explicit personality dimensions instead of large opaque prompts where possible. Dimensions may include:

- directness;
- warmth;
- formality;
- brevity/detail preference;
- humor;
- enthusiasm;
- coaching tendency;
- initiative in offering next steps;
- use of local language/code-switching where appropriate;
- emotional expressiveness.

Personality traits may influence wording and interaction pacing, but must not influence factual truth, evidence hierarchy, constraint results, or permission decisions.

## Stable truth across profiles

Given equivalent authorized context and the same material question, different characters may phrase answers differently but should not intentionally produce conflicting facts, policy interpretations, constraint outcomes, or authority decisions merely because their personalities differ.

Profile-specific style must be applied **after** or around grounded reasoning rather than replacing grounded reasoning.

## Skill and tool independence

Skills belong to Glen AI/products/capabilities, not to characters.

Profiles may advertise or emphasize certain experiences, but a character must not own a private duplicate of a skill. Skill eligibility remains determined by product availability, authorization, context, feature flags, constraints, and AI Authority.

A character change must not alter a tool from read-only to write-capable or from A1/A2 to A3.

## Orchestration continuity

Switching characters during a workflow must not create a new hidden orchestration state. The new character continues from the same canonical workflow/session state subject to the same permissions and gates.

Character identity may be recorded as interaction metadata for continuity and evaluation, but is not part of the authoritative workflow state unless a product explicitly needs that presentation preference.

## Safety and reserved authority

No character may present itself as possessing a professional license, government office, financial authority, or human identity it does not actually possess.

A warm, confident, expert-sounding character must not be treated as more authoritative than another character.

All profiles inherit the Portfolio AI Authority Model and the same A0-A4 boundaries.

## Real-person likeness and voice

If a profile uses the likeness or cloned/synthetic voice of a real person, the product must have the required rights/consent and provide appropriate disclosure. A real-person presentation does not convert AI output into human-authored output.

Profiles not based on real people are preferred where rights, consent, impersonation, or continuity would otherwise be unclear.

## Multimodal presentation

Character profiles may control presentation across:

- text;
- voice;
- avatar/portrait;
- animation;
- future embodied or spatial interfaces.

The same profile identity should remain recognizable across modalities where practical, but lack of a visual/avatar implementation must not prevent text or voice use.

## Accessibility

Users should be able to choose voice/accent/speed/accessibility variants independently from personality where technically feasible.

A user who prefers a character's personality should not be forced to use a voice that is difficult for them to understand.

## Product adapter responsibilities

A consuming product may define:

- which canonical/approved profiles are available;
- product-specific names/avatars if allowed by profile policy;
- default profile by context;
- user profile-selection UI;
- voice provider mapping;
- supported locales/voices;
- saved preference behavior;
- feature-flag/experiment rollout;
- accessibility variants.

Products must not weaken the parent Glen AI Foundation invariants through character configuration.

## Initial canonical requirements

For v1:

1. `Glen` is the global default.
2. At least one female character with a female default voice must be supported by the architecture.
3. Character/personality and voice are configurable but separable.
4. User selection should override contextual defaults unless the user opts into automatic switching.
5. Character switching cannot alter capability, data access, authorization, AI Authority, constraints, evidence, or orchestration state.
6. Products may add additional approved profiles without forking Glen AI.
7. Character profiles should be machine-readable and versioned.

## Implementation truth

This document defines the canonical profile architecture only. It does not claim that GlenTown or another TownBoss product already implements character selection, avatar switching, voice synthesis, saved profile preferences, or context-based automatic profile selection.

Implementation should be incremental and tied to real product needs rather than treated as a prerequisite for GlenTown Beta.
