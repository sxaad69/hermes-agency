# AGENCY SHUTDOWN — board directive (2026-08-17)

**Decision (Saad, board):** Shut down the agency until the board asks to reopen.

## What was stopped
- **games-supervisor** cron (7a47c30137c5): PAUSED — no autonomous board-reply execution, no invariants
- **games-radar** cron (6fbaa2030e64): PAUSED — no portal sweeps
- **cloudflared tunnels**: ALL killed — cf-games, cf-agentscope, cf-crossstate, cf-nomarkup systemd services STOPPED + DISABLED (0 tunnels live)
- **http servers**: killed (8090/8091)
- **kanban workers**: 0 running; nothing dispatchable (dispatcher paused with supervisor)

## What was kept alive (deliberate)
- **This Telegram board chat** — so "reopen" works in one message
- **backup-daily** + **skill-audit** no-agent maintenance scripts — system hygiene, not agency work

## Reopen trigger
Board message "reopen" / "open the agency" → resume supervisor + radar, re-enable tunnel services as needed, dispatch as directed.

## Current board state (frozen, all preserved)
- Set-Piece Master: built, QA-green, portal-submit HELD (board fun-verdict pending)
- Landing Order: built, QA-green, portal-submit blocked pending board decision
- Rulebreaker: parked (enhancements pending)
- All pick-gates, W1-W5 done; no live workers
