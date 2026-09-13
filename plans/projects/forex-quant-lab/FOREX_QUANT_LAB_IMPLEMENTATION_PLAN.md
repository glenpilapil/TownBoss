# Forex Quant Lab Implementation Plan / Development Dashboard

**Status:** RESEARCH / PLANNED  
**Dashboard rule:** checkboxes are authoritative completion markers.

## Governing progression
`Research -> Data validation -> Backtest -> Walk-forward/out-of-sample -> Paper/simulation -> Small controlled live experiment -> Review -> Scale decision`

## Dashboard summary
- [ ] Research hypotheses defined.
- [ ] Data/feed validation complete.
- [ ] Backtest framework validated.
- [ ] Walk-forward/out-of-sample evidence complete.
- [ ] Paper/simulation gate passed.
- [ ] Small controlled live experiment authorized and completed.
- [ ] Review/scale decision complete.

## Mission
Build an explainable, controlled systematic trading research environment focused on day trading/scalping research, London/New York sessions, news awareness and strict risk controls.

## Architecture checklist
- [ ] Python research environment reproducibly configured.
- [ ] MT5 integration isolated behind an execution adapter.
- [ ] Market/news data provenance recorded.
- [ ] Strategy logic separated from risk approval and execution.
- [ ] Persistent decision/evidence logs maintained.
- [ ] Configuration/versioning reproducible.

## Phase 0 — Research definition
**Status:** NEXT
- [ ] Define testable strategy hypotheses before optimization.
- [ ] Define quantitative sniper-entry criteria.
- [ ] Define session/regime filters.
- [ ] Define exits/invalidation.
- [ ] Define validation metrics and rejection criteria.

### Gate
- [ ] Research hypotheses and evaluation protocol approved before optimization.

## Phase 1 — Data validation
- [ ] Broker/feed selected for research.
- [ ] Timestamp/timezone/session normalization verified.
- [ ] Spread/slippage/commission modeling verified.
- [ ] News-event dataset and behavior/exclusion rules verified.
- [ ] Missing/corrupt data handling documented.

### Gate
- [ ] Data-quality/provenance gate passes.

## Phase 2 — Backtest and robustness
- [ ] Backtest engine validated against known cases.
- [ ] Leakage/overfitting checks pass.
- [ ] Transaction costs modeled realistically.
- [ ] Parameter sensitivity/stability reviewed.
- [ ] Monte Carlo/robustness analysis completed where applicable.

### Gate
- [ ] Backtest evidence meets predefined criteria without relying on headline return alone.

## Phase 3 — Walk-forward / out-of-sample
- [ ] Out-of-sample periods predefined.
- [ ] Walk-forward protocol executed.
- [ ] Results compared with training/backtest expectations.
- [ ] Failure/regime boundaries documented.

### Gate
- [ ] Out-of-sample evidence supports continued experimentation.

## Phase 4 — Paper / simulation
- [ ] Paper environment configured.
- [ ] Execution adapter behavior verified.
- [ ] Risk engine enforced.
- [ ] Session/news behavior monitored.
- [ ] Paper evidence collected for predefined period/sample.

### Gate
- [ ] Paper/simulation criteria pass before any live experiment.

## Risk engine checklist
- [ ] Per-trade risk enforced.
- [ ] Daily loss limits enforced.
- [ ] Exposure/correlation limits enforced.
- [ ] Kill switch verified.
- [ ] Execution sanity checks verified.
- [ ] Funded-account rules remain a later profile rather than initial design authority.

## Phase 5 — Small controlled live experiment
- [ ] Explicit operator authorization obtained.
- [ ] Live experiment parameters/limits documented before activation.
- [ ] Evidence captured without redefining thresholds after results are known.
- [ ] Drawdown/kill criteria enforced.

### Gate
- [ ] Live experiment closed and reviewed before any scale decision.

## Phase 6 — Review / scale decision
- [ ] Research, out-of-sample, paper and live evidence reviewed together.
- [ ] Failure modes documented.
- [ ] Continue/modify/stop decision recorded.
- [ ] Scaling permitted only when predefined evidence thresholds are satisfied.

## Evidence rule
No strategy progresses because of headline backtest returns alone. Every promotion requires evidence appropriate to the current stage, and unsuccessful hypotheses remain part of project Memory.
