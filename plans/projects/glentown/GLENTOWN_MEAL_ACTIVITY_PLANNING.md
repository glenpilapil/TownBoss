# GlenTown Meal Planner and Activity Plan

**Status:** CANONICAL PRODUCT DIRECTION / PLANNED  
**Project:** GlenTown  
**Scope:** Foods Meal Planner, Achieve integration, Activity Plan, Calendar integration, recipes/content, meal check-ins, professional referral  
**Implementation truth:** Planned unless a concrete App/API checkpoint is cited elsewhere. This document does not by itself establish implementation.

## Purpose

Meal Planner is GlenTown's household food-planning and execution surface. It should help a resident turn budget, schedule, household needs, chosen eating preferences/patterns, recipes, local food availability, and personal goals into a practical plan that can be reviewed, adjusted, placed on Calendar, and carried out through GlenTown Foods and related capabilities.

Meal Planner is not a medical nutrition system and must not diagnose, prescribe, or claim that a generated plan will medically treat a condition or guarantee a health outcome.

Core product rule:

`GlenTown informs and organizes -> the resident chooses -> qualified professionals advise where individualized health guidance is needed.`

## Ownership and capability boundaries

- **Foods / Meal Planner** owns meal-planning UX, meal-plan composition, food/recipe relationships, meal check-ins, and food-execution handoffs.
- **Achieve** owns the resident's goal and progress objective. A goal such as changing body weight remains an Achieve goal; Meal Planner and Activity Plan are supporting plans.
- **Activity Plan** is the approved broad planning concept for intentional movement/activity. It is not limited to formal workouts.
- **Calendar / Scheduling** owns shared time coordination and projections, not the underlying goal or meal/activity truth.
- **Glen AI** may explain, compare, summarize research, help compose/revise plans, and orchestrate permitted handoffs. It must not create medical authority or silently execute consequential actions.
- **Doctors and qualified nutrition professionals** remain the appropriate source of individualized medical/nutrition advice when the resident's circumstances warrant it.

## Meal Planner entry modes

The planner should support multiple starting intents rather than forcing every resident through one long questionnaire.

Initial product flow:

1. **Plan by Budget**
2. **Plan by Goal**
3. **Plan From My Calendar**
4. **Browse Recipes**
5. **Continue Current Plan**

These are product-direction labels and may receive later copy refinement without changing the underlying capability.

## Planning horizon and budget

Supported planning horizons should include:

- Today
- This Week
- 2 Weeks
- This Month

Use **2 Weeks** rather than **Bi-weekly** in customer-facing copy because "bi-weekly" is ambiguous.

Budget-first planning accepts a total budget for the chosen horizon and may consider:

- number of people/household composition;
- meals to include;
- cook-at-home versus ready-to-eat balance;
- ingredient reuse and leftovers;
- local food/listing availability;
- preparation time;
- calendar conflicts or meals already covered elsewhere;
- resident-selected food preferences and dislikes.

For a monthly budget, the default planning behavior should favor a monthly budget envelope with rolling weekly detail rather than assuming that 30 days of detailed food choices, prices, schedules, and availability will remain static.

The planner should show estimated plan cost against the resident's stated budget and should distinguish estimates from authoritative checkout/order prices.

## Household context

Meal Planner may support:

- just me;
- couple;
- family/household;
- adults and children counts;
- resident-entered preferences/dislikes;
- resident-entered allergies/intolerances or other cautions where the product can handle them safely.

Sensitive or health-related context must be minimized, access-controlled, and used only for the requested planning purpose.

## Eating Pattern Library: information, not prescription

Meal Planner may expose common eating patterns or nutrition approaches as options, including examples such as intermittent fasting, but GlenTown must not prescribe one for a resident.

The resident chooses whether to adopt an eating pattern. GlenTown may organize meals around that explicit choice.

Each Eating Pattern information card should include, where available:

- plain-language description;
- what outcomes have been studied or claimed;
- populations/context represented in the cited evidence;
- important limitations, uncertainty, or conflicting findings;
- circumstances in which individualized professional guidance is advisable;
- links to primary research, systematic reviews, or recognized health/public-health sources;
- source/provenance metadata;
- a **last reviewed** date.

The informational surface must keep a visible disclaimer such as:

**Consult Your Doctor/Nutritionist-Dietitian**

and clarify that the material is general information, not diagnosis, medical advice, nutrition treatment, or a personalized prescription.

GlenTown must not infer that an eating pattern is suitable merely from profile data, a goal, model confidence, or lack of a disclosed condition.

If the resident discloses circumstances such as pregnancy, medication use, a medical condition, or another health-sensitive situation, GlenTown should avoid individualized prescriptive conclusions and should make the professional-help path prominent. It must not diagnose the condition.

## Professional connection

The safety/disclaimer path should be useful rather than a dead end.

Where supported by actual GlenTown data and eligibility/verification rules, Meal Planner may offer actions such as:

- **Find a Doctor**
- **Find a Nutritionist-Dietitian**
- view eligible professional profiles;
- message/contact the professional where permitted;
- book/request an appointment where the relevant service/booking capability supports it.

Professional listings and credentials remain authoritative to their owning verification/directory/service domains. Glen AI must not represent itself as the professional.

## Recipes as a first-class Foods content type

Recipes should be a reusable Foods content type rather than merely text generated inside a plan.

A Recipe may include:

- title and description;
- servings;
- ingredients and quantities;
- preparation/cooking steps;
- estimated preparation/cooking time;
- difficulty;
- meal type/tags;
- substitutions;
- estimated local cost when sufficient data exists;
- related Foods listings/products where appropriate;
- images/video;
- creator/source/provenance;
- sponsorship/brand relationship where applicable.

Useful recipe actions include:

- **Add to Meal Plan**
- Save
- Swap into a planned meal
- Use as an alternative
- View ingredients
- Shop/order available ingredients or related food where supported

## Curated, creator, community, and brand-partner recipes

Recipe/content provenance should distinguish at least:

- GlenTown Curated;
- Local Creator;
- Business/Restaurant;
- Community;
- Brand Partner / Sponsored.

GlenTown may support cooking-program-style or curated recipe content in which a brand's product is intentionally a featured ingredient.

Brand-partner or sponsored recipe content must be clearly disclosed and must not masquerade as an independent Glen AI recommendation. Commercial relationships must not silently alter research/evidence summaries or professional-health guidance.

## Plan generation and review

A generated meal plan may include:

- date and meal slot;
- recipe or ready-to-order option;
- servings;
- estimated cost;
- estimated preparation time;
- substitutions;
- ingredient reuse/leftover opportunities;
- required shopping/order actions;
- relationship to a resident-selected eating pattern or Achieve goal.

Before commitment, the resident should be able to revise individual items with actions such as:

- Swap
- Another Recipe
- Cheaper Option
- Faster Option
- Order Instead
- Skip
- Move to Another Day

Glen AI may help re-plan only within authorized resident choices and available evidence/data.

## Calendar integration

Calendar integration is fundamental to Meal Planner.

Meal Planner may read authorized Calendar context to avoid planning meals that conflict with known commitments, for example when a resident will be at an event, traveling, or already has a meal provided elsewhere.

Once the resident accepts a plan, Meal Planner may create/project meal and preparation entries into Calendar through the canonical Scheduling boundary.

Examples include:

- planned meal time;
- preparation/start-cooking reminder;
- grocery/prep reminder;
- meal-prep batch session.

Calendar entries must preserve a source reference back to the Meal Plan. Editing a calendar projection must not silently rewrite the plan unless the action is routed through the owning planner.

## Achieve integration

Achieve owns the goal. Meal Planner and Activity Plan are supporting plans that may be invoked when relevant.

Example:

`Achieve goal -> Meal Plan + Activity Plan -> Calendar -> Check-ins -> Progress -> Replanning`

For a resident-entered goal such as moving from 90 kg to 70 kg, GlenTown may help the resident organize selected eating choices, activities, schedules, check-ins, and progress tracking. It must not independently prescribe a therapeutic diet, calculate an individualized medical treatment regimen, or claim that a particular plan will guarantee the target outcome.

The resident may also use Meal Planner without any Achieve goal.

## Activity Plan

**Activity Plan** is the approved concept; do not reduce it to **Workout Plan**.

It may include resident-selected or generally available activities such as:

- walking;
- active commuting;
- cycling;
- hiking;
- swimming;
- sports;
- household/yard activity;
- gym or strength workouts;
- other intentional movement.

The reason for the broader name is product semantics: useful activity is not limited to formal workouts.

Activity Plan may project activities/reminders into Calendar and report completion/check-in state back to the linked Achieve goal.

Activity Plan must follow the same informational/non-prescriptive boundary when health-sensitive claims or individualized medical suitability are involved.

## Meal Check-ins and optional photos

After a planned meal, GlenTown may prompt for a lightweight **Meal Check-in**.

Possible actions include:

- Take a Photo
- Done
- Changed Meal
- Skipped

A photo is an optional personal record/check-in artifact, not authoritative nutritional proof.

The system must not claim that an image alone reliably establishes:

- exact ingredients;
- portion size;
- calorie or nutrient values;
- compliance with an eating pattern;
- medical/nutritional suitability.

Meal check-in photos should be private by default unless the resident separately chooses to share them through an appropriate Community/social action.

Residents may add notes such as "Loved it", "Too spicy", or "Make this again." Explicit preferences and repeated substitutions may inform future plan personalization where privacy settings permit.

## Activity check-ins

Activity Plan may support similar lightweight completion/check-in states, with optional notes or evidence appropriate to the activity.

Check-ins support resident self-tracking and Achieve progress. They are not medical proof or professional certification.

## Glen AI role

Glen AI may:

- explain Meal Planner options;
- compare eating-pattern information and cited research without selecting one as medically correct for the resident;
- help interpret budget and household constraints;
- suggest recipes from authorized GlenTown data;
- propose plan revisions;
- identify Calendar conflicts;
- help assemble shopping/order actions;
- summarize check-in patterns;
- help coordinate Meal Plan + Activity Plan under an Achieve goal;
- surface professional-help options.

Glen AI must not:

- diagnose;
- prescribe a diet or treatment;
- claim professional nutrition/medical authority;
- invent research findings, providers, recipe provenance, availability, price, or professional credentials;
- silently change a resident's chosen eating pattern;
- autonomously place orders/bookings or mutate protected records without applicable authorization/AI Authority.

## Evidence, provenance, and research governance

Research-backed informational content must retain enough provenance to identify:

- source title/identifier;
- source organization/authors where available;
- publication/review date;
- source type;
- observed/retrieved date where applicable;
- claim or summary supported;
- limitations/material context;
- last content review.

Where evidence changes or is disputed, GlenTown should present uncertainty rather than convert one source into universal truth.

Sponsored recipe/content evidence and health research evidence must remain separate provenance classes.

## Privacy and sensitive information

Meal/activity planning can involve sensitive personal and health-adjacent data.

Implementations must:

- minimize data collected;
- keep health-sensitive inputs purpose-bound;
- provide appropriate visibility/privacy controls;
- avoid using private health context for public Community content without explicit user action;
- separate optional photo check-ins from social sharing;
- preserve authorization around Calendar and Achieve data;
- avoid exposing private goals or medical context to businesses/professionals merely because they appear in GlenTown.

## Commercial boundary

Meal Planner may route to Foods/Products ordering or provider/service booking, but planning does not guarantee current price, stock, availability, fulfillment, or professional appointment capacity.

Checkout/order/booking domains remain authoritative for their own transactions.

Sponsored content must be labeled and must not receive undisclosed preferential treatment in health/research explanations.

## Initial acceptance direction

A future Meal Planner implementation should prove, at minimum:

1. Plan by Budget for Today/Week/2 Weeks/Month.
2. Household size/preferences capture.
3. Recipe content with provenance and **Add to Meal Plan**.
4. Plan review and individual meal replacement.
5. Calendar read/context plus accepted-plan projection.
6. Meal Check-in with optional private photo.
7. Eating Pattern information cards with research links/provenance and visible professional-consultation disclaimer.
8. Professional discovery handoff.
9. Achieve linkage without transferring goal ownership.
10. Activity Plan linkage and Calendar projection.
11. Glen AI orchestration that remains informational/non-prescriptive.
12. Tests for privacy, evidence/provenance, sponsorship disclosure, no fabricated data, and authority boundaries.

## Non-goals

This direction does not authorize:

- medical diagnosis;
- individualized therapeutic diet prescription;
- pregnancy/condition-specific medical decision-making by Glen AI;
- calorie/nutrient estimation from a food photo as authoritative truth;
- automatic public sharing of meal photos or goals;
- undisclosed sponsored recommendations;
- autonomous purchasing/booking merely because a plan was generated;
- treating Calendar as the source of truth for the plan;
- treating a Meal/Activity check-in as professional or medical evidence.
