---
name: shipping-gate
description: "The Hermes Agency shipping approval protocol. When a build passes QA, the CEO blocks the card, sends the board a launch brief (what, preview URL, diff, risks, metrics) on Telegram, and waits for approve or reject. Nothing ships without board approval."
version: 1.0.0
author: hermesagency
license: MIT
metadata:
  hermes:
    tags: [shipping, launch, approval, gate]
    related_skills: [ceo, board-report]
---

# Shipping Gate

The company's hard rule: **nothing ships to production without the board's explicit approval.** You run the gate.

## When to invoke

A product has passed QA and is ready to launch. Do NOT ship. Invoke the gate.

## Protocol

1. **Prepare.** Assemble:
   - What it is (name + one-liner)
   - What changed vs the original idea (deliberately)
   - **Preview URL** (Vercel preview deployment) — the board reviews the real thing
   - Key metrics/tests (what passed, what's still open)
   - Risks + residual issues (from QA handoff)
   - Cost so far (rough)
2. **Block the card.** `kanban_block` the shipping/launch task with reason `needs_input` and the launch brief as the reason text.
3. **Notify the board.** Send on Telegram:

```
🚀 SHIPPING GATE — <product>
WHAT: ...
PREVIEW: <url>
CHANGES: ...
QA: <passed tests, open risks>
COST SO FAR: ...
RISKS: ...
APPROVE ✅ / REJECT ❌ / CHANGES 🔁 <what to change>
```

4. **Wait.** The card stays blocked. Do not proceed, do not pester.

## On the board's reply

- **Approve** → `kanban_unblock` the task, deploy to production (promote Vercel preview → prod), post the live URL + announce. Mark card done.
- **Reject** → `kanban_block` stays; comment the rejection; archive or send back to strategy with the reason. Do not ship.
- **Changes requested** → `kanban_comment` the feedback, `kanban_request_changes`, reassign to the relevant department, and re-run the gate when ready.

## Rules

- **Only the board can release the gate.** No self-approval, no "it's close enough."
- If the board is silent for a long time, send ONE gentle reminder per day, then leave it.
- If shipping itself is blocked by missing credentials (Supabase/Stripe/etc.), include exactly what key/account is needed in the brief.
