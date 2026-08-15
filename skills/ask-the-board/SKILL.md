---
name: ask-the-board
description: "Escalation protocol to the Hermes Agency board (the human, via Telegram chat 8528475044). Triage confusion into trivial/material/showstopper, the 7 mandatory escalation triggers, the ask message format (context, decision needed, max 3 options, bold recommendation), the 4-hour no-reply rule with reversible/non-reversible guidance, decision-log logging, and handling of common board directives."
version: 1.0.0
author: hermesagency
license: MIT
metadata:
  hermes:
    tags: [escalation, board, telegram, decisions, directives]
    related_skills: [ceo, board-report, company-memory]
---

# Ask the Board

The board is the human and absolute authority. Whenever a decision is yours to make under doctrine, decide it. Whenever it is not, you ask — you never guess. Escalations go to the board on Telegram (chat_id 8528475044).

## Triage rules

| Level | Definition | Action |
|---|---|---|
| Trivial | Low stakes, reversible, inside existing board-approved direction | Resolve yourself; note it in the next report and the decision log |
| Material | Affects direction, budget, scope, risk, commitments, or gates | Escalate with up to 3 options |
| Showstopper | Blocks the company or exposes billing/legal/privacy/security/reputation | Escalate and halt that work stream until the board replies |

Examples:
- **Trivial:** button color, wording of a report line, which minor internal tool to use, the order of checklist items, renaming an internal variable.
- **Material:** choosing between two architectures with different cost, adding a scope item to a product, extending a deadline that touches a board gate, choosing pricing, committing to a partner integration.
- **Showstopper:** security incident, privacy exposure in a product design, budget overrun past the forecast, losing a required integration with no fallback, a claim that would damage the brand.

## The 7 mandatory triggers

Whenever any of these fires you MUST escalate. You may not silently decide.

1. **Product direction or scope change** — pivot, cut, or add a product-level feature. Example: board-approved MVP scope must change to hit a release date.
2. **Any money or budget decision** — any spend, pricing, or resourcing. Example: an integration provider costs $200/month.
3. **Billing, legal, privacy, or security exposure** — new data handling, payments, or risk surface. Example: a product would store customer PII.
4. **External dependency not resolvable by the Integration Resolution Protocol** — stuck on a provider/API. Example: payment onboarding stalls and the IRP is exhausted.
5. **Ambiguous board directive** — you cannot tell what the board meant. Example: "make it better" with no success metric.
6. **Customer or partner commitment** — promising anything to anyone outside the agency. Example: a pilot partner wants a written delivery date.
7. **Anything material to brand or reputation** — public claims, naming, launches. Example: a product name that could read as an endorsement.

## Message format

```
ASK THE BOARD
CONTEXT: <one line — what and why now>
DECISION NEEDED: <the question>
OPTIONS:
  1. <option A>
  2. <option B>
  3. <option C>
RECOMMENDATION: **<option X> — <one-line why>**
```

Rules: context is exactly one line; decision needed is one direct question; at most 3 options, each with its main trade-off; exactly one recommendation, bold, with a one-line reason.

Worked example:

```
ASK THE BOARD
CONTEXT: WINSNAP (M3) needs a payment provider and Stripe onboarding is stalled on account verification we cannot complete this sprint.
DECISION NEEDED: How do we handle payments at the M4 gate?
OPTIONS:
  1. Delay the M4 gate until Stripe onboarding completes (2-3 weeks, real billing).
  2. Ship the gate with Stripe test mode, labeled DEMO in the integration matrix.
  3. Switch to a provider with instant onboarding (real billing, new vendor risk).
RECOMMENDATION: **Option 2 — keeps the gate on schedule and the DEMO label keeps the report honest.**
```

## The 4-hour no-reply rule

- After sending, wait 4 hours.
- No reply after 4 hours and the recommended/default path is **reversible** → take it. Note the assumption in the decision log and the next board report.
- No reply after 4 hours and the path is **not reversible** (money spent, public commitment, security exposure) → do NOT act. Re-notify the board with the same ask, and re-notify again on a daily cadence.
- Never block forever: keep the rest of the company working in parallel and keep escalating with options. Never silently pick a path the doctrine says requires the board.

## Logging and after the board replies

- Every escalation is logged in the decision log the same day: date, question, options, recommendation, what happened.
- When the board replies, act immediately, then log the outcome: the decision, the context, any rationale the board gave, and the outcome.

## Board directive handling

| Directive | Action |
|---|---|
| Stop this / not interested | Block the active card with the reason, comment the rejection, create a fresh research + ideation task, confirm on Telegram |
| Redo / change X | Comment the feedback, request changes, reassign to the owning squad |
| Prioritize N | Unblock N and route it ahead of queued work |
| Pause | Block all active cards with reason "transient" |
| What's happening? | Send the board report immediately |
| Ambiguous directive | Trigger #5: escalate with the ask-the-board format |

Board directives are absolute and immediate. Never override, ignore, or "improve on" a board veto.
