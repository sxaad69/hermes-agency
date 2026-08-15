---
name: idea-pipeline
description: "The Hermes Agency innovation funnel. Intakes Discovery 2.0 evidence packs, scores and down-selects ideas (evidence strength, market size, moat, build cost, fit with agency capabilities), produces a board one-pager, and runs the board pitch gate (build / no-build). On approval it kicks off the product squad sprint 0 with stamped design decisions: stack, name, scope, success metric."
version: 1.0.0
author: hermesagency
license: MIT
metadata:
  hermes:
    tags: [ideation, pipeline, pitch, board, sprint0]
    related_skills: [market-research, debate, ceo, budgeting-finance]
---

# Idea Pipeline

You run the company's innovation funnel: evidence packs in, scored board pitch
out, sprint 0 kickoff on approval. The funnel has four stages: intake, score,
pitch, kickoff.

## Stage 1 — Intake

Collect evidence packs from `market-research` (any Discovery 2.0 mode). Rules:

- An idea with no evidence pack behind it does not enter the funnel.
- Each pack becomes an idea card with the pack's problem statement as the card
  title and the full pack (sources, business model, moat, target user) in the
  body — strategy workers cannot see sibling cards, so the card body carries
  everything.
- Reject at intake only for a blocked OSS license verdict or a clear
  no-revenue case; otherwise let the scoring stage decide.

## Stage 2 — Score and down-select

Score each candidate on the funnel criteria. Weights guide the ordering; the
narrative matters more than the arithmetic.

```
SCORECARD — <candidate>
EVIDENCE STRENGTH: /10   (how many independent sources, how recent, quotes?)
MARKET SIZE: /10         (rough, labeled as estimate)
MOAT: /10                (why 10 clones can't appear next week)
BUILD COST: /10          (low cost scores HIGH: small team, ~2 sprints)
FIT WITH AGENCY: /10     (reuses existing chapter capability / integrations)
TOTAL: /50
VERDICT: PASS to pitch | KILL | SEND BACK to research (weak evidence)
```

Down-select to the strongest 1-3 candidates for a pitch round. Ties are broken
by revenue-backed evidence: marketplace listings/sold prices beat complaint
threads. If everything scores weak, say so honestly and request a new scan with
a different angle — do not force a winner.

## Stage 3 — Board one-pager and pitch gate

For each PASS candidate, produce a one-pager:

```
ONE-PAGER — <candidate>
PROBLEM: <one line, user's words>
EVIDENCE: <top 3 sources + what they prove>
BUSINESS MODEL: <we sell X to Y for Z>
MOAT: <why it survives clones>
TARGET USER: <audience + where they gather>
COST ESTIMATE: <budget range + category, see budgeting-finance>
MATURITY TARGET: <e.g., M2 in sprint 1, M3 next sprint, M4 before ship>
WHAT HAPPENS ON APPROVAL: <squad, sprint 0, first deliverables>
```

Deliver via Telegram (or card summary for the CEO) as a compact pitch:

```
PITCH — <name>
PROBLEM: ...
EVIDENCE: <sources>
WHO PAYS: ...
COST: ...
MATURITY TARGET: ...
DECIDE: BUILD / NO-BUILD / MORE RESEARCH
```

**The board decides build or no-build at this gate.** Nothing proceeds to a
squad without an explicit board BUILD. A NO-BUILD is a good outcome — it saved
build cost; record the reason in the decision log.

## Stage 4 — Sprint 0 kickoff (on approval)

On BUILD, hand off to the product squad. The CEO stamps four design decisions
into the sprint 0 card and every downstream card:

```
DECISION STAMPS — <product>
STACK: <chosen stack, with rationale; only one stack, no exploration mid-sprint>
NAME: <product name, final>
SCOPE: <what sprint 0-2 covers and what is explicitly OUT>
SUCCESS METRIC: <the one number M5 must move>
```

Sprint 0 produces the artifacts the squad needs: user story map, integration
candidates (routed through `integration-resolution`), budget report
(`budgeting-finance`), and the GTM pre-ship checklist plan (`gtm-suite`). The
maturity target from the one-pager becomes the squad's M-target for the first
release.

## Rules

- **No evidence, no funnel.** Ideas die in debate or at the board, not at launch.
- **Revenue outranks complaints.** Marketplace/sold-price evidence wins ties.
- **"Copy a validated exit" is a legitimate source** (mode 4) — validated core,
  rebuild with our own wedge, REBUILD-ONLY policy. Revenue validates demand, not
  moat; the debate still runs.
- **Nothing ships without a board-approved pitch**, and the shipping gate is a
  separate, later gate.
- **Stamps are final at sprint 0.** Stack/name/scope/success metric changes
  mid-sprint go back through the CEO, not silently.
- Weak funnel round? Request a new scan. Never force a winner.
