---
name: scrum-ops
description: "Sprint operating model for the Hermes Agency. Runs parallel 2-week product squad sprints: chapter vs squad responsibilities, the sprint lifecycle with exact phases and who does what, ritual definitions and cadence, sprint board conventions (grooming, WIP limits, sprint labels, capacity planning), the anti-waterfall rule, sprint definition of done, and retros that produce implemented process changes."
version: 1.0.0
author: hermesagency
license: MIT
metadata:
  hermes:
    tags: [scrum, sprints, agile, rituals, kanban, capacity]
    related_skills: [ceo, board-report, ask-the-board, company-memory]
---

# Sprint Operating Model

The agency runs on Scrum: one cross-functional squad per product, all squads in parallel, 2-week sprints. You keep the engine running. The board is absolute authority; the CEO orchestrates; chapters supply specialists; squads deliver.

## Chapters vs squads

| | Chapters (capability pools) | Product squads |
|---|---|---|
| What they are | Pools of specialists per discipline: research, product, design, engineering, platform, QA/release, security/AI-safety, finance, marketing/content/SEO, paid growth, sales/customer success, growth analytics, legal | One cross-functional team per product |
| Own | Standards, methods, quality bars, templates, review checklists | The product and its outcome |
| Supply | Specialists to squads each sprint (allocated at planning) | The cross-functional composition: product + design + engineering + QA at minimum |
| Judge | Quality of their discipline's output (independent review, no self-approval) | Sprint delivery: committed cards done, demo given, evidence present |

## Sprint lifecycle (2 weeks)

**Phase 0 — Planning (start of sprint, day 1).**
- CEO/Operations: set the sprint number and dates, confirm squad rosters, scan the portfolio for cross-squad dependency conflicts.
- Squad: pull the highest-priority evidence-backed backlog items, agree a sprint goal, estimate, set WIP limits for the sprint, label every committed card with the sprint label and the product's maturity label. Confirm capacity. Flag cross-squad dependencies now, not mid-sprint.
- Chapter leads: allocate specialists to squads and verify each discipline's standards are represented on the board.

**Phase 1 — Execution (days 1–9).**
- Daily standup each day: what I did yesterday, what I do today, blockers.
- Work moves in-progress → review → done. No card enters done without evidence (tests, preview URL, files).
- Blockers: trivial → resolve yourself; material → ask-the-board; showstopper → ask-the-board and halt that work stream. Log every escalation in the decision log.
- Independent review runs in parallel with implementation — never as a serial tail at the end of a sprint.
- Maturity labels and REAL vs DEMO markers update as work lands, not at the review.

**Phase 2 — Review + demo (day 9–10).**
- Squad demonstrates working results with evidence: preview URL, tests run, REAL vs DEMO matrix accurate.
- Chapter reviewers sign off their discipline's part. No one approves their own work.
- CEO judges the handoff against the card's success criteria and updates the maturity label if a gate fired.

**Phase 3 — Retrospective (same day as review).**
- 30–60 minutes. Produces at least one implemented process change with an owner and deadline, tracked on a card. See the retro section below.

**Phase 4 — Close and next (same day).**
- Update the decision log if any decision was made. Send the board report. Groom the backlog for the next sprint.

## Rituals and cadence

| Ritual | Cadence | Who | Purpose |
|---|---|---|---|
| Daily standup | Daily, 15 min | Squad | Sync, unblock, surface risks |
| Sprint planning | Start of each sprint | Squad + CEO + chapter leads | Goal, commitment, capacity, dependencies |
| Sprint review + demo | End of each sprint | Squad + chapter reviewers + board (invite) | Evidence of done work, maturity update |
| Retrospective | End of each sprint (biweekly) | Squad | Process change with owner + deadline |
| Product council | Weekly | Product chapter + squad product leads + CEO | Product decisions, scope disputes, prioritization |
| Growth council | Weekly | Growth/marketing/analytics + CEO | Funnels, launch, acquisition, revenue experiments |
| Release council | Weekly | QA/release + engineering + security + CEO | What is safe to release, fire gates |
| Portfolio review | Monthly | CEO + board | Maturity across products, kill/reinvest, reallocation |

## Sprint board conventions

- **Backlog grooming:** continuous; at minimum before each planning. Cards are sized, de-risked, evidence-linked, and prioritized. No half-groomed card enters a sprint.
- **WIP limits:** set per column at planning. Defaults: in-progress ≤ 3 per squad, review ≤ 2 per squad. Never exceed; a full column blocks new pulls.
- **Sprint labels:** every card carries the sprint label (sprint-<n>) and the product's maturity label (M0–M6). Kanban lanes are grouped by product, not by discipline.
- **Capacity planning:** capacity = squad size × focus factor (default 0.7) × 2 weeks. Commit at most 100% of capacity. Track velocity per squad across sprints and use it to size the next commitment.
- **Pull, don't push:** work moves only when the next column has room.

## Anti-waterfall rule

- Squads run in parallel; no single serial product chain.
- Within a squad, disciplines work concurrently: design, engineering, and QA overlap.
- Only true dependencies block work. When a card depends on another, link it and continue all independent work — never idle a squad waiting on a downstream queue.
- A product's lifecycle (research → prototype → integrations → release) is a maturity progression, not a serial handoff chain: an early-stage product and a shipping product run at the same time in different squads.

## Definition of done for a sprint

1. Every committed card meets its card-level DoD: evidence present, tests run, preview URL linked.
2. Demo given at review; REAL vs DEMO matrix accurate; maturity labels current.
3. Independent reviews done — no self-approval.
4. Retro held and produced a process change with owner + deadline, tracked on a card.
5. Decision log updated for any decision made this sprint.
6. Board report sent.
7. Next sprint's backlog is groomed.

## Retro that yields implemented process changes

Entry format:

```
WHAT WENT WELL: <...>
WHAT WENT WRONG: <...>
PROCESS CHANGE: <one concrete change>
OWNER: <...>
DEADLINE: <day 3 of the next sprint>
```

Rules:
- Every retro produces at least one process change. It must be concrete and tracked as a card with owner + deadline.
- The change is implemented within the next sprint and verified in the next retro: did it land, yes or no? A change that never lands is a failed retro.
- Write the retro to wiki/retros the same day. Retro conclusions change process; they are not just written down.

## Kanban card fields to keep current

- id, product, squad
- sprint label (sprint-<n>) and maturity label (M0–M6)
- type: task / bug / spike
- status: backlog / in-progress / review / done / blocked (with reason)
- estimate and time spent
- dependencies (linked cards)
- owner
- evidence links (preview URL, tests, files changed)
- REAL vs DEMO marker where applicable
- summary, written before the card is judged done
