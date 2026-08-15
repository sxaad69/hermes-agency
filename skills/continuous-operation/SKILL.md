---
name: continuous-operation
description: "The Hermes Agency's never-idle doctrine. Workers never wait for work: finish -> pull next -> hunt. Blocked on the human -> park as scheduled with an ask-the-board note (4h default) and pull the next task. Empty backlog -> the CEO generates work immediately, in priority order: sprint decomposition, Idea Cycle 2 (research, score, AND build — autonomous), Discovery 2.0 scans, product hardening. Idle is a bug, never a state. The only legal idle is a discovery scan that returns nothing, and the hunt resumes on the next cycle regardless."
version: 1.0.0
author: hermesagency
license: MIT
metadata:
  hermes:
    tags: [operations, autonomy, never-idle, ceo, research, backlog]
    related_skills: [ceo, board-report, market-research, idea-pipeline, scrum-ops, ask-the-board]
---

# Continuous Operation (Never-Idle Doctrine)

Idle is a bug, not a state. The agency runs 24/7: every worker, every role,
every hour. Backlog depth is the CEO's problem, never a worker's excuse to
stop. Workers stop hunting only when a discovery scan genuinely returns
nothing — and even then the next cycle re-scans.

## Worker rules (apply to every profile)

1. **Finish -> pull next.** When a card completes, immediately claim the next
   ready card. Never wait for someone to hand you work.
2. **Blocked on the human -> park and pivot.** If a task needs the board
   (money, credentials, out-of-scope scope): `kanban_block` it (or move to
   `scheduled`) with reason + the ask-the-board options + 4h default, send the
   Telegram ask, then **pull the next ready card**. A blocked card stops the
   card, never the worker.
3. **Blocked on a dependency -> work around.** If a linked upstream card is
   stuck, pick the highest-value ready card that does NOT depend on it
   (anti-waterfall). Only when literally nothing independent exists does the
   dependency become a reason to generate new work — never to idle.
4. **Never claim "nothing to do".** If your board has no ready card for you,
   say so explicitly in the report — the CEO's generation loop will fill it
   within one cycle.

## CEO generation rules

1. **Backlog floor.** The CEO keeps at least **6 ready cards** across boards,
   at least **1 per active profile** (research, strategy, design, engineering,
   qa, marketing/content, finance). If ready+running falls below the floor,
   generate immediately — do not wait for the next ritual.
2. **Generation priority** (in order):
   1. Sprint decomposition: break the current sprint goal / parent card into
      stamped, assignable child cards (see `ceo` decomposition playbook).
   2. **Idea Cycle 2**: run research -> score -> select AND BUILD, fully
      autonomous. The board has granted build authority; do not ask before
      building. Ask-the-Board applies only to money, credentials, and
      out-of-scope work.
   3. **Discovery 2.0 scans** (`market-research`, any of the 5 modes): problem
      scan, gap-closing scan against the radar, new-tech arbitrage,
      validated-clone scan (REBUILD-ONLY), open-source arbitrage. Produce
      2-4 evidence packs per scan run.
   4. **Product hardening**: tests, QA findings fixes, landing pages, copy,
      docs, accessibility, performance, security review.
3. **Never run out of hunt.** When sprint work is done AND ideas are scored
   AND discovery just returned empty, start a NEW scan with a different mode
   or angle. The radar always has companies to teardown; the internet always
   has problems to find.

## Ritual trigger (board-supervisor)

Every board-supervisor run (every 30m):

- Auto-assign + dispatch any unassigned `ready` card (match the profile by
  skill/roster; see `ceo`).
- If idle capacity exists — ready+running < 3 across all boards, OR any
  active profile has 0 cards — trigger a CEO generation pass immediately.
- Report to Telegram: what moved, what is blocked (with asks), what was
  generated, next generation due.

## Rules

- **Idle is a bug.** If a worker ever reports waiting, fix the generation
  loop, not the worker.
- **Blocked is per-card, never per-worker.** The card parks; the worker moves.
- **Board authority stays absolute.** Autonomy covers unblocked work within
  the mission. Money, credentials, and out-of-scope still go through
  ask-the-board with 4h default.
- **Evidence over vibes.** Generated cards carry stamps (stack, name, scope,
  success metric) and evidence links; research packs follow the
  `market-research` format.
