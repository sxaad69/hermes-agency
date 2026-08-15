# Scrum Configuration

Adopted with the org model (Company Rev 1).

## Cadence

| Sprint element | Cadence | Where |
|---|---|---|
| Sprint length | 2 weeks | kanban board per sprint (e.g. `sprint-1`) |
| Daily standup | 09:00 Mon–Fri | cron `standup` → Telegram |
| Release council | Fri 16:00 | cron `release-council` → Telegram |
| Retrospective | Fri 17:00 | cron `retro` → Telegram |
| Radar refresh | Sun 08:00 | cron `radar-refresh` → Telegram |
| Board supervisor | every 30m | cron `board-supervisor` → Telegram |
| Backups | 03:00 daily | cron `backup-daily` → private repo |

## Kanban conventions

- One board per sprint (`sprint-1`, ...) plus a persistent `agency-ops` board
  for governance/ritual work.
- Card fields kept current: status, assignee (profile), priority, body, comments.
- Title prefix `[S<number>]` marks sprint membership when the board is shared.
- WIP limit: at most 2 active (non-blocked) cards per squad at a time.
  Enforcement is the scrum-master's job (see `scrum-ops` skill), not automated.

## Board routing

- Product work → sprint boards, routed to product squads (parallel, cross-functional).
- Governance/ritual work → `agency-ops` board, routed to chapters.
- Blockers: never silent — a blocked card carries a reason + an Ask-the-Board
  escalation when a trigger fires (see `ask-the-board` skill).
