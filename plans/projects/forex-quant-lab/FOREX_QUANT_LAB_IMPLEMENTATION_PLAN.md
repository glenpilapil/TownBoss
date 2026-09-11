# Forex Quant Lab Implementation Plan

**Status:** RESEARCH / PLANNED

## Mission

Build an explainable, controlled systematic trading research environment focused on day trading/scalping research, London/New York sessions, news awareness and strict risk controls.

## Non-negotiable progression

`Research -> Data validation -> Backtest -> Walk-forward/out-of-sample -> Paper/simulation -> Small controlled live experiment -> Review -> Scale decision`

No strategy progresses because of headline backtest returns alone.

## Architecture

- Python research environment.
- MT5 integration isolated behind an execution adapter.
- market/news data provenance.
- strategy modules separated from risk approval and execution.
- persistent decision/evidence logs.
- reproducible configuration/versioning.

## Agent architecture references

TradingAgents and similar upstream projects are research/pattern sources, not architectural authorities. Useful patterns include specialized analysis agents, adversarial bull/bear analysis, explicit risk approval, and separation of analysis/decision/execution.

## Workstreams

### Data
- broker/feed selection;
- timestamp/timezone/session normalization;
- spread/slippage/commission modeling;
- news-event dataset and exclusion/behavior rules.

### Strategy research
- define hypotheses before optimization;
- sniper-entry criteria expressed quantitatively;
- regime/session filters;
- exits and invalidation;
- parameter stability analysis.

### Risk engine
- per-trade risk;
- daily loss limits;
- max exposure/correlation;
- kill switch;
- execution sanity checks;
- funded-account rules as a later profile, not the initial design authority.

### Validation
- leakage/overfitting checks;
- out-of-sample and walk-forward;
- Monte Carlo/sensitivity;
- realistic transaction costs;
- paper-trading evidence.

### Live gate
A small live account is an experiment, not proof of sustainable income. Scaling requires predefined evidence thresholds and drawdown controls.
