# TownBoss Approved Upstream Implementation Ledger

**Status:** Canonical governance control v1  
**Purpose:** Preserve approved upstream recommendations, their implementation triggers, and the evidence required before they are treated as implemented.

## Core rule

An approved upstream source is not automatically a production dependency. Approval means its patterns, controls, or tooling are accepted for portfolio use according to the classification below. Implementation occurs only when the defined trigger/stage is reached and project-specific validation passes.

CodeBisor and other portfolio supervisors should consult this ledger during planning, release preparation, security audits, capability extraction, and dependency evaluation.

A recommendation is not considered implemented merely because it is documented. Completion requires evidence appropriate to the control: configuration, CI run, test result, scan result, runtime verification, release artifact, architecture decision record, or other receipt.

## Priority order

1. Security and supply-chain controls
2. Correctness, reliability, and durable execution
3. Observability and operational evidence
4. Shared authorization/identity infrastructure when cross-product demand exists
5. Domain-specific architecture and tooling
6. Optional productivity or convenience tooling

## Approved implementation ledger

| Source / repo | Classification | Primary projects | Trigger / stage | Expected action | Validation / receipt | Status |
|---|---|---|---|---|---|---|
| `OWASP/ASVS` | **Security authority / baseline** | All products | **NOW / Security Baseline v1** | Use ASVS 5.x as the portfolio application-security verification baseline, supplemented by TownBoss-specific controls. Map applicable requirements to automated/manual evidence. | Versioned ASVS applicability matrix + PASS/GAP/N/A evidence | **APPROVED — IMPLEMENT WHEN SECURITY BASELINE IS FORMALIZED** |
| `aquasecurity/trivy` | **Portfolio security scanning tool / candidate CI dependency** | GlenTown-API, GlenTown-App, GeoPlotter, CodeBisor, future deployables | **NOW / CI Security Wave 1** | Add repository/dependency/secret/misconfiguration scanning where compatible; use SBOM/license capabilities as appropriate. | CI scan receipt; blocking policy documented; false-positive suppressions justified | **APPROVED — NEAR-TERM IMPLEMENTATION** |
| `semgrep/semgrep` | **SAST + architecture-policy enforcement tool** | All codebases, especially CodeBisor/GlenTown | **NOW / CI Security Wave 1** | Add baseline security rules, then TownBoss-specific rules for critical architectural invariants such as AI authority, server-authoritative pricing, unsafe shell execution, hostile upload handling, and risk-gate bypass. | CI SAST receipt + versioned custom rules + tested positive/negative fixtures | **APPROVED — NEAR-TERM IMPLEMENTATION** |
| `gitleaks/gitleaks` | **Dedicated secret-scanning reference/tool** | All repositories | **NOW / CI Security Wave 1**, if dedicated secret coverage materially improves Trivy baseline | Evaluate as a second independent secret-scanning layer. Avoid redundant complexity if Trivy + GitHub controls provide equivalent evidence. | Secret-scan receipt + comparison against existing controls | **APPROVED PATTERN — IMPLEMENT IF GAP REMAINS** |
| `schemathesis/schemathesis` | **API property/contract testing tool** | GlenTown-API, GeoPlotter APIs, future TownBoss APIs | **After canonical OpenAPI contract exists** | Generate malformed/edge/stateful API sequences and enforce schema/behavior properties, especially authz/ownership/idempotency boundaries. | Versioned OpenAPI + Schemathesis CI/release receipts + reproducible failing cases | **APPROVED — TRIGGERED BY OPENAPI MATURITY** |
| `zaproxy/zaproxy` | **DAST security verification tool** | GlenTown staging, GeoPlotter web/API, TownTraveler/future web apps | **Beta/release candidate / staging available** | Run authenticated DAST against a representative staging environment. Do not require full DAST on every local commit. | DAST report + triage + accepted-risk record for unresolved findings | **APPROVED — RELEASE/STAGING GATE** |
| `MobSF/Mobile-Security-Framework-MobSF` | **Mobile release security tool** | GlenTown-App | **Beta/release candidate APK** | Scan packaged APK/AAB for manifest, exported component, network, permission, embedded secret, signing/debug, WebView, storage, and privacy issues. | MobSF report tied to artifact hash + remediation/acceptance record | **APPROVED — GLENTOWN MOBILE RELEASE GATE** |
| `Cisco-Talos/clamav` | **Malware scanning / hostile-upload defense reference** | GeoPlotter, GlenTown verification/media, TownBoss CRM attachments | **Before untrusted documents/uploads are processed in production** | Quarantine uploads, validate type/size/signature, malware-scan, then pass only accepted files to parsers/processors. | Upload security integration tests + malware-test fixture + quarantine/audit evidence | **APPROVED PATTERN — IMPLEMENT BEFORE HOSTILE FILE PIPELINES GO LIVE** |
| `sigstore/cosign` + SLSA | **Artifact signing / provenance architecture** | GlenTown release artifacts, services, future containers | **Production/release supply-chain hardening** | Produce artifact hashes, SBOM/provenance, and signatures where deployment channel supports it. Connect source commit, workflow, tests, security receipts, and distributed artifact. | Verifiable signature/provenance + artifact hash + build receipt | **APPROVED — RELEASE SUPPLY-CHAIN STAGE** |
| `ossf/scorecard` | **Upstream dependency governance reference/tool** | CodeBisor capability/provider registry; all dependency decisions | **When evaluating new external repos/dependencies** | Add repository security posture as one input to dependency/provider approval; never use score alone as authority. | Dependency review record including security posture, license, activity, provenance, maintenance | **APPROVED — CONTINUOUS EVALUATION CONTROL** |
| `openfga/openfga` | **Fine-grained authorization / ReBAC architecture reference** | TownBoss, GlenTown, RealWise/GeoPlotter | **When 2+ products require shared relationship-based authorization, or role/policy drift becomes material** | Model organization/member/resource relationships and evaluate shared authorization runtime. Do not replace stable Laravel policies prematurely. | Cross-product authorization model + denial/tenancy tests + migration/latency/security evaluation | **APPROVED REFERENCE — DEFER RUNTIME UNTIL TRIGGER** |
| `open-policy-agent/opa` | **General contextual policy-enforcement reference** | CodeBisor, Glen AI, deployment/governance policies | **When contextual policy rules outgrow local deterministic gates** | Evaluate for machine-enforced action/deployment/security policies; keep simple deterministic gates local where sufficient. | Policy tests + fail-closed behavior + decision logging | **APPROVED REFERENCE — CONDITIONAL IMPLEMENTATION** |
| `temporalio/temporal` | **Durable orchestration architecture reference** | TownBoss orchestration, CodeBisor, Day/Trip/Event/Financial planners, Achieve | **When long-lived workflows require persisted timers/retries/recovery across process failures or multiple products need shared orchestration runtime** | Mine deterministic workflow/activity/history/cancellation/retry semantics first; compare against native Orchestration Engine before dependency adoption. | Architecture comparison + failure/recovery scenarios + operational/security burden assessment | **APPROVED HIGH-PRIORITY REFERENCE — DEFER RUNTIME UNTIL TRIGGER** |
| `open-telemetry/opentelemetry-collector` | **Shared observability architecture reference / candidate dependency** | All runtime products | **When centralized portfolio telemetry becomes operationally useful or multiple backends require common instrumentation** | Standardize engineering traces/metrics/logs with vendor-neutral telemetry; keep product analytics separate. | End-to-end trace/log/metric receipt + sampling/privacy/PII policy | **APPROVED — P1 SHARED INFRASTRUCTURE CANDIDATE** |
| PostHog | **Product intelligence / experimentation / observability reference + candidate dependency** | GlenTown Beta, CodeBisor AI observability, later products | **After current physical-device gate / before meaningful Beta analytics rollout** | Evaluate product analytics, replay, errors, experiments, surveys and AI telemetry; compare experimentation overlap with GrowthBook. | Privacy review + event taxonomy + data-retention/PII rules + sample dashboard/experiment receipt | **APPROVED — BETA PRODUCT-INTELLIGENCE CANDIDATE** |
| GrowthBook | **Feature flags / experimentation reference + candidate dependency** | GlenTown, TownBoss products | **Before controlled Beta/cohort rollouts need robust flags/experiments** | Compare with PostHog; avoid redundant platforms unless responsibilities are clear. | Flag lifecycle/kill-switch tests + experiment governance + provider decision | **APPROVED — CONDITIONAL PRODUCTION CANDIDATE** |
| Keycloak | **IAM / multi-organization identity architecture reference + future shared identity candidate** | TownBoss portfolio | **Before portfolio-wide SSO/shared identity consolidation** | Evaluate Organizations, OIDC/SAML, passkeys, federation, fine-grained administration; do not migrate GlenTown auth during current Beta preparation. | Identity architecture ADR + migration risk plan + tenancy/authz separation review | **APPROVED — FUTURE SHARED IDENTITY CANDIDATE** |
| `geopython/pygeoapi` | **Geospatial API / OGC standards implementation reference** | GeoPlotter | **As real geospatial APIs/process endpoints are implemented** | Align API/resource/process semantics with relevant OGC API standards where appropriate without turning GeoPlotter into pygeoapi. | API design review + CRS/GeoJSON/OpenAPI/OGC conformance evidence where applicable | **APPROVED — GEOPLOTTER IMPLEMENTATION REFERENCE** |
| GeoNode | **Geospatial governance/metadata/permissions reference** | GeoPlotter | **As GeoPlotter manages published/shared geospatial assets and provenance** | Mine metadata, permissions, lifecycle, provenance and sharing patterns; do not adopt wholesale without separate evaluation. | Geospatial governance ADR + provenance/permission tests | **APPROVED REFERENCE — LATER GEOPLOTTER STAGE** |
| `nautechsystems/nautilus_trader` | **Very high-priority quantitative trading / risk / execution engine reference** | Forex Quant Lab | **During deterministic risk/execution-engine development and before live automation** | Study event-driven architecture, shared backtest/live semantics, execution simulation, RiskEngine, reconciliation, order/position state. AI must not bypass deterministic controls. | Point-in-time data validation + risk-gate tests + paper/demo reconciliation + backtest/live parity review | **APPROVED — PRIMARY FOREX REFERENCE** |
| `QuantConnect/Lean` | **Mature backtest/live simulation benchmark reference** | Forex Quant Lab | **During simulator/backtest validation** | Compare data normalization, fees, slippage, fill models, broker semantics and live/backtest assumptions. | Simulation-assumption comparison + robustness tests | **APPROVED REFERENCE** |
| `TraderAlice/Auto-Quant-V2` | **Primary quant research-methodology reference** | Forex Quant Lab | **NOW / research workflow design** | Use bounded studies, immutable runs, fixed evaluation questions, resumability, evidence-bound reports, OOS/robustness validation. | Study/run dossier + immutable result metadata + OOS/robustness receipts | **APPROVED — PRIMARY FOREX METHODOLOGY** |
| `TauricResearch/TradingAgents` | **AI-trading research/pattern source** | Forex Quant Lab | **Research-agent design** | Study analyst specialization, adversarial debate, decision logs, checkpoint/resume, point-in-time protections. | `POINT_IN_TIME_DATA_VALIDATION` gate + structured evidence logs | **APPROVED — HIGH-PRIORITY REFERENCE** |
| `The-Swarm-Corporation/AutoHedge` | **AI-trading architecture/pattern source** | Forex Quant Lab | **Decision/risk/execution architecture design** | Preserve Director/Quant/Risk/Execution separation; do not treat repo claims as profitability evidence. | Trade proposal → independent validation → risk approval → deterministic execution receipt | **APPROVED REFERENCE** |
| `TraderAlice/OpenAlice` | **Controlled agent-action / trading workspace reference** | Forex Quant Lab; CodeBisor mutation patterns | **Agent mutation/execution workflow design** | Use proposal/commit/approval semantics; simulator/demo before live funds. | Intent/plan/approval/execution/verification receipt | **APPROVED REFERENCE** |
| `rohitg00/agentmemory` | **Agent memory/context infrastructure reference** | CodeBisor/TownBoss/Glen AI | **When shared cross-agent persistent memory runtime is required** | Keep CodeBisor authoritative for truth/decisions; memory runtime handles retrieval. Enforce project/agent/sensitivity boundaries. | Memory provenance/authority model + isolation tests + deletion/governance behavior | **APPROVED HIGH-PRIORITY REFERENCE** |
| `danielmiessler/LifeOS` + `ruvnet/RuView` | **Evidence/receipt/verifiability references** | CodeBisor | **NOW / supervisor completion semantics** | Require claims to be backed by evidence and deterministic validation before DONE. | `Claim → Evidence → Validator → Verdict/Receipt` stored with task result | **APPROVED — CORE CODEBISOR PRINCIPLE** |
| Medusa | **Commerce + durable workflow architecture reference** | GlenTown/TownBoss commerce | **When auditing or expanding commerce** | Mine modular commerce primitives and compensation workflows; GlenTown remains authoritative for local domain rules. | `GLENTOWN_COMMERCE_VS_MEDUSA_AUDIT` + domain-preservation tests | **APPROVED HIGH-PRIORITY REFERENCE** |
| Cal.diy | **Scheduling/availability/booking architecture reference** | GlenTown services, Your Calendar, planners | **Before/while expanding mature scheduling semantics** | Mine conflict, timezone, recurrence, buffers, capacity, team/resource, reschedule/cancel edge cases. Do not adopt as GlenTown scheduling infrastructure by default. | `GLENTOWN_BOOKING_ARCHITECTURE_VS_CALDIY_AUDIT` | **APPROVED REFERENCE** |
| ERPNext | **ERP/business operations/accounting architecture reference** | TownBoss, RealWise | **When finance/accounting/procurement/inventory/commission operations are implemented** | Mine mature accounting, CRM, sales, procurement, inventory, assets, HR/payroll, permissions, audit and reporting semantics. Avoid wholesale platform adoption without separate decision. | Domain ADR + accounting/inventory invariants + licensing review | **APPROVED HIGH-PRIORITY REFERENCE** |
| Strapi | **Headless CMS / structured editorial content reference** | TownTraveler, Help Center, Glen AI curated knowledge, RealWise editorial | **Before editorial CMS implementation** | Compare against headless WordPress/other CMS; keep transactional truth in domain APIs. | CMS comparison ADR + content provenance/permission model | **APPROVED REFERENCE / CANDIDATE DEPENDENCY** |
| `santifer/career-ops` | **Career Journey orchestration reference** | GlenTown Career | **When Career Journey implementation resumes** | Treat career as goal/profile/gap/opportunity/application/interview/offer/progression pipeline rather than only job listings. | Career orchestration design + source-evidence rules | **APPROVED REFERENCE** |
| `coreyhaines31/marketingskills` | **Marketing skills/capability reference** | TownBoss marketing, GlenTown/RealWise growth | **When marketing automation/agent capability registry is implemented** | Separate SEO/CRO/social/copy/analytics/campaign skills instead of a monolithic marketing prompt. | Skill registry + capability boundaries + quality/evaluation criteria | **APPROVED REFERENCE** |
| `reacherhq/check-if-email-exists` | **Email-quality signal reference** | TownBoss CRM / outreach | **When email verification becomes a real workflow requirement** | Treat verification as a signal, not proof of identity; resolve AGPL/commercial licensing before proprietary integration. | Licensing decision + privacy review + signal semantics tests | **APPROVED REFERENCE — LICENSING GATE REQUIRED** |
| `kawsarlog/social-media-apis` + `kawsarlog/Ultimate-API-List` | **External API discovery sources** | TownBoss Provider Registry | **Continuous discovery only** | Discover candidates; every provider must pass security, privacy/legal, licensing, cost, reliability, authority/provenance and architecture review. | Provider approval record | **APPROVED DISCOVERY SOURCES — NEVER AUTO-INTEGRATE** |
| `ashishpatel26/500-AI-Agents-Projects` | **AI-agent discovery catalog** | CodeBisor/Glen AI/TownBoss | **Continuous discovery only** | Use as catalog-of-candidates; separately vet every discovered project. | Candidate scorecard + license/activity/security/duplication review | **APPROVED DISCOVERY SOURCE** |
| `JoyGhoshs/0install` | **Security-tool discovery catalog** | CodeBisor security capability registry | **Continuous discovery only** | Mine tool inventory/workflow patterns; do not adopt/run the machine-level installer. Vet each tool independently. | Individual tool review before adoption | **APPROVED DISCOVERY SOURCE — INSTALLER NOT APPROVED** |
| `SNOWTEAM2023/Cognivia` | **AI reasoning/evaluation research reference** | Glen AI | **When specialist reasoning/router/evaluation is implemented** | Use classification/routing/evaluation patterns only; do not commercially reuse CC BY-NC dataset/model without licensing. Mental-health capability requires separate clinical/safety/regulatory review. | Router/evaluation tests + licensing/safety gate | **APPROVED REFERENCE — RESTRICTED CONTENT BOUNDARY** |
| Daytona public OSS repo | **Historical sandbox architecture reference only** | CodeBisor | **No runtime adoption trigger** | Retain concepts: isolated filesystem/network/resources/credentials. Search for a maintained alternative before selecting sandbox infrastructure. | New sandbox-candidate evaluation | **DEFERRED / NOT AN APPROVED DEPENDENCY** |

## Stage gates

### Security Wave 1 — CI / development baseline

When the repository/tooling permits, prioritize:

- ASVS applicability baseline
- Trivy
- Semgrep
- secret scanning
- dependency vulnerability scanning
- repository/configuration scanning
- documented suppressions and accepted risk

These controls should not block active Beta work merely because integration mechanics are incomplete, but security findings classified as release-blocking must not be ignored to preserve schedule.

### API maturity gate

Before treating a growing public/internal API as mature:

- maintain an authoritative OpenAPI contract where practical;
- use schema/property-based testing such as Schemathesis;
- explicitly test authorization/tenancy/ownership boundaries;
- test idempotency/concurrency for mutation endpoints;
- retain reproducible failure receipts.

### Release candidate security gate

For relevant products:

- run DAST against representative staging/release environment;
- run MobSF against GlenTown mobile release artifacts;
- produce SBOM/provenance/signature evidence where the release channel supports it;
- verify production configuration, secrets, headers, network exposure, and least privilege;
- attach security receipts to the release decision.

### Shared-runtime trigger gate

Do not introduce OpenFGA, Temporal, Keycloak, OpenTelemetry Collector, or other shared infrastructure solely because it is approved. Trigger a formal dependency/adoption evaluation when real cross-product demand, security isolation, operational scale, or repeated implementation drift demonstrates the need.

The existing `governance/EXTRACTION_POLICY.md` remains authoritative for deciding when logical capabilities should become packages/services/repositories.

### Domain implementation gates

- **GeoPlotter:** use pygeoapi/OGC patterns as real spatial APIs/processes are implemented; hostile document pipelines must gain upload quarantine/validation/scanning before production.
- **Forex Quant Lab:** AutoQuant V2 research discipline and point-in-time validation precede strategy promotion; NautilusTrader/LEAN patterns inform deterministic risk, simulation, execution, and reconciliation before live automation.
- **GlenTown Beta:** product analytics/feature rollout tools are introduced only after current physical-device readiness work unless required to resolve a Beta blocker; mobile/DAST security becomes release-candidate evidence.

## CodeBisor completion contract

For significant implementation tasks, CodeBisor should conceptually move through:

`RUNNING → WORKER_COMPLETE → EVIDENCE_COLLECTED → VALIDATION_PASSED → DONE`

Security-relevant completion should use:

`Claim → Evidence → Validator → Verdict → Receipt`

Mutating operations should prefer:

`Intent → Plan → Dry Run → Validation/Risk → Approval → Apply → Verify → Receipt`

A task must not be marked DONE solely because a worker or agent reports success when an applicable deterministic validation or security gate exists.

## Maintenance rules

- Update this ledger when an upstream recommendation is approved, superseded, deferred, rejected, materially relicensed, archived, or replaced.
- Preserve the distinction between **reference**, **candidate dependency**, **approved tool**, and **production dependency**.
- Re-check maintenance/security/licensing before first real adoption if the prior review is materially stale.
- Record project-specific implementation evidence in the relevant product repository or audit; this ledger records the portfolio governance decision, not the full runtime evidence.
- Security takes precedence over convenience when a recommendation affects credentials, authorization, money movement, private data, untrusted files, agent execution, or production infrastructure.
