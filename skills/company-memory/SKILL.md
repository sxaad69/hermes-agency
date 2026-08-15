---
name: company-memory
description: "Company memory for the Hermes Agency. Manages the wiki (decision-log, adrs, runbooks, retros) in the version-controlled agency-ops repo: what lands in each area, entry formats, the same-day rule for decisions, and when to update memory automatically after gates, retros, board decisions, and integration resolutions."
version: 1.0.0
author: hermesagency
license: MIT
metadata:
  hermes:
    tags: [memory, wiki, decision-log, adr, runbook, retro]
    related_skills: [ceo, board-report, ask-the-board, scrum-ops]
---

# Company Memory

The agency remembers in the wiki so every decision traces to its source and no rationale is lost. You keep the wiki current; a decision you did not write down was never made.

## Where memory lives

- Physical home: the `wiki/` directory of the agency-ops repo. Version-controlled (git), public by default.
- Four areas: `wiki/decision-log`, `wiki/adrs`, `wiki/runbooks`, `wiki/retros`.
- Entries are files committed to the repo — not scratch notes.

## What lands in each area

| Area | Contents | When |
|---|---|---|
| decision-log | Every significant decision: board replies, gate outcomes, budget choices, integration resolutions, model/fallback decisions, scope changes | Same day |
| adrs | Architectural decisions that are hard to reverse: stack, data model, integrations, security approach | When made, before heavy implementation |
| runbooks | Repeatable operational procedures: deploy, rollback, incident response, integration wiring, credential setup | First time you do it; updated on change |
| retros | Every sprint retro, one entry per retro | Same day as the retro |

## Decision-log entry format

```
# 2026-08-15: WINSNAP payments at M4 gate — Stripe test mode labelled DEMO
- DATE: 2026-08-15
- DECISION: Ship the M4 gate with Stripe test mode, labelled DEMO in the matrix.
- CONTEXT: Stripe onboarding stalled on account verification; the gate was at risk.
- OPTIONS CONSIDERED: (1) delay the gate, (2) test mode labelled DEMO, (3) switch provider.
- RATIONALE: Board chose option 2; keeps the gate on schedule and the DEMO label keeps the report honest.
- OUTCOME: M4 gate passed 2026-08-15; real billing deferred to M5.
```

## ADR format

```
# ADR-014: Payment provider strategy
- STATUS: Accepted (2026-08-15)
- CONTEXT: <what problem the decision addresses>
- DECISION: <the architectural choice>
- CONSEQUENCES: <trade-offs, what becomes easier/harder, follow-ups>
```

## Runbook format

```
# Runbook: <name>
- PROBLEM: <when this runbook applies>
- STEPS: <numbered, concrete commands/procedures>
- VERIFICATION: <how you know it worked>
- OWNER: <who keeps it current>
```

## Retro format

```
# Retro: sprint-014 WINSNAP squad
- WHAT WENT WELL: <...>
- WHAT WENT WRONG: <...>
- PROCESS CHANGE: <one concrete change>
- OWNER: <...>
- DEADLINE: <...>
- STATUS: implemented / pending
```

## The same-day rule

Every significant decision lands in the decision log the same day it is made: board reply, gate result, budget choice, integration resolution, model fallback decision. Same day or the memory is stale, and the next report is built on stale memory.

## When to update memory automatically

- After any gate (maturity, release/shipping) — decision log, and the adr/runbook if a decision or procedure emerged.
- After any retro — write the retro to `wiki/retros` and implement the process change.
- After any board decision or ask-the-board resolution — decision log.
- After any Integration Resolution Protocol resolution — decision log, plus a runbook if a repeatable procedure emerged.
- Whenever model fallbacks are used — logged for reporting.
- Whenever a board directive changes scope — decision log.
