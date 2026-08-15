---
name: idea-cycle-2
description: "Idea Cycle 2 runbook for the Hermes Agency: the fully autonomous second ideation cycle. The board has granted build authority, so the loop runs research -> score -> select -> BUILD with no human approval gate. Run whenever the backlog floor dips (continuous-operation doctrine) or on explicit trigger. Money, credentials, and out-of-scope work still go through ask-the-board (4h default); everything else proceeds."
version: 1.0.0
author: hermesagency
license: MIT
metadata:
  hermes:
    tags: [ideation, idea-cycle, autonomous, research, build]
    related_skills: [market-research, idea-pipeline, debate, ceo, continuous-operation, budget-finance, gtm-suite]
---

# Idea Cycle 2 — Autonomous Build Loop

The board approved full build autonomy. Idea Cycle 2 is the second iteration
of the company's ideation cycle with the human approval gate removed. The
cycle runs until the backlog floor is satisfied or the mission is served;
run it whenever `continuous-operation` generation priority reaches it.

## Cycle stages

### 1. Research (Discovery 2.0)

Use `market-research` — pick the mode that best fits the current gap:

- No fresh signal -> Mode 1 problem scan (first-party noise across forums, X,
  HN, TikTok, reviews).
- Radar-driven -> Mode 2 gap-closing scan (teardown 2-3 radar companies,
  translate gaps into problem statements).
- New capability dropped -> Mode 3 new-tech arbitrage.
- Marketplace-validated -> Mode 4 validated-clone scan (REBUILD-ONLY policy).
- OSS gap -> Mode 5 open-source arbitrage (license verdicts mandatory).

Produce 2-4 evidence packs per scan run (format in `market-research`). Each
pack must carry sources/URLs, business model, moat, target user, revenue
signal, and why-now.

### 2. Score and down-select

Run the `idea-pipeline` scorecard on each pack (evidence strength, market
size, moat, build cost, fit). Down-select to the strongest 1-3 candidates.
Ties break on revenue-backed evidence. If everything is weak, do not force a
winner — log the packs, note the dead angle, and re-scan with a different
mode on the next cycle.

### 3. Build (autonomous, no gate)

For each selected candidate, proceed directly to build:

- CEO stamps the four design decisions (stack, name, scope, success metric)
  onto the sprint 0 card (`idea-pipeline` Stage 4).
- Fan out child cards to the product squad (design, engineering, qa) on the
  appropriate board with sprint + maturity labels. **Respect the 3-worker
  hard cap** — never create a card set expecting >3 concurrent workers.
- Route integrations through `integration-resolution`; paid/money items and
  credential requirements go through ask-the-board (4h default) with options.
- Keep the REAL vs DEMO matrix honest; maturity labels update as work lands.
- **Inference = the API (opencode-go deepseek-flash).** Never stamp a card
  that calls for installing/running local models (ollama/llama.cpp) on the
  VPS — it is not suitable hardware and local inference is banned. If a build
  truly needs a stronger model, the card must say "ask-the-board for a model
  upgrade" instead of "run a local model".

### 4. Cycle close

When the selected candidates are in build (or dead), write the cycle summary
to the decision log: what was scanned, what scored, what entered build, what
died and why. Then re-check the backlog floor — if it still sits below the
floor, start the next cycle rather than stopping.

## Rules

- **Autonomy is within the mission.** Money, credentials, out-of-scope scope,
  and legal/security gates still need the board (4h default). Everything else
  is decided internally.
- **No evidence, no funnel.** An idea without an evidence pack never enters
  build, even with autonomy.
- **REBUILD-ONLY stands.** Mode 4 clones rebuild the model and feature parity
  from public knowledge; never copy proprietary assets.
- **Never idle between cycles.** A finished cycle that finds nothing is not an
  excuse to stop — it is a signal to change mode or angle and scan again.
