---
name: idea-pipeline
description: "The Hermes Agency innovation engine. Runs the full ideation loop: trigger research scan, generate SaaS ideas grounded in real demand signal, queue them for red/blue team debate, and deliver a scored pitch to the board. Use when a new idea cycle starts."
version: 1.0.0
author: hermesagency
license: MIT
metadata:
  hermes:
    tags: [ideation, saas, ideas, pipeline]
    related_skills: [research, debate, ceo]
---

# Idea Pipeline

You run the company's innovation engine. A cycle turns internet signal into a scored, board-ready pitch.

## The loop

### Step 1 — Research
Dispatch a research task (assignee: `research`) that uses the `market-research` skill and returns 2-4 Problem Briefs. Briefs MUST be multi-source: complaint signal (last30days/ego-browser threads) AND revenue-backed signal (acquisition marketplaces: Flippa/Empire Flippers/Acquire.com listings & sold prices; Product Hunt launches; G2/Capterra reviews; incumbent pricing pages). No Reddit-only briefs. If the board gave a niche, that's the focus; otherwise roam.

### Step 2 — Generate
From the briefs, generate **N SaaS ideas** (N = 5 by default). Each idea must:
- Be directly grounded in one of the briefs' problems (cite it)
- Have a clear audience and a clear "we sell X to Y for Z reason"
- Be buildable by a small team in ~1-2 weeks (scope check)

Do NOT invent ideas without a problem brief behind them.

### Step 3 — Debate
For each idea, create a debate card (assignee: `strategy`) running the `debate` skill. Each card body contains the full idea spec so the strategy worker has everything it needs (workers can't see sibling cards).

### Step 4 — Score
Collect each debate's scorecard. Sort ideas by score.

### Step 5 — Pitch to the board
Deliver via Telegram (or card summary for the CEO):

```
IDEA: <name>
PROBLEM: <one line>
SOLUTION: <one line>
WHO PAYS: <audience + willingness evidence>
EVIDENCE: <sources from the brief>
DEBATE VERDICT: <score + one-line rationale>
BUILD COST: <rough, what it needs>
NEXT: <what happens on approval>
```

## Rules

- **Ideas die in debate, not at launch.** A KILL verdict is a good outcome — it saved build cost.
- **Revenue-backed ideas outrank complaint-backed ideas.** Marketplace listings/sold prices are revealed demand (people already pay); Reddit threads are latent demand. When a debate is close, the idea with marketplace evidence wins the tie.
- **"Copy a validated exit" is a legitimate idea source.** A business selling on Flippa/Empire Flippers for fatigue/marketing reasons (not declining revenue) is a rebuild-with-a-wedge candidate: validated core, 1-2 week rebuild, sharper wedge. The debate still runs — revenue validates demand, not moat.
- **No idea ships without a board-approved pitch** (the shipping gate is separate and later).
- If all ideas score weak, say so honestly and propose a second scan targeting a different angle. Do not force a winner.
