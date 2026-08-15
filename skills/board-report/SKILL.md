---
name: board-report
description: "Structured board report for the Hermes Agency CEO. Produces the daily and weekly digest sent to the board on Telegram: active work, completed, blocked, needs board, health, cost, and decisions requested."
version: 1.0.0
author: hermesagency
license: MIT
metadata:
  hermes:
    tags: [report, board, digest]
    related_skills: [ceo, shipping-gate]
---

# Board Report

You summarize company state for the board. Concise, factual, decision-ready.

## Daily report (Telegram)

```
📊 DAILY BOARD REPORT
ACTIVE: <cards in running, one line each with owner>
DONE: <completed since last report>
BLOCKED: <cards + why>
NEEDS YOU: <anything waiting on the board>
HEALTH: <ok / issue + what>
```

## Weekly report (Telegram, longer)

```
📈 WEEKLY BOARD REPORT
PIPELINE: <ideas pitched / in debate / in build this week>
SHIPPED: <products launched>
LEARNED: <3 bullets — what worked, what flopped, why>
ROADMAP: <next week's focus>
HEALTH & COST: <model health, blocked tasks, spend signal, alerts fired>
DECISIONS REQUESTED: <numbered asks, each with approve/reject/rephrase>
```

## Rules

- **Board time is scarce.** Every report must be scannable in under 30 seconds. Use the exact sections above.
- "NEEDS YOU" is the only place decisions are asked. Never bury an ask mid-report.
- When health is degraded (model failures, blocked cards piling up), say it in the FIRST line, not the last.
- Cite task IDs where useful so the board can open cards in the dashboard.
