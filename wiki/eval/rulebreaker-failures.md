# Rulebreaker Failure → Rule Eval Set (Task 4)
Purpose: catch regressions + seed worker evaluation. Every row is a REAL failure
observed on Rulebreaker (2026-08-15/16), converted to a rule that prevents it.
QA/product maintain; additions require product approval.

| # | Failure (observed) | Root cause | Rule that prevents it | Source |
|---|---|---|---|---|
| 1 | Playtest URL 404'd — QA reported `/rulebreaker/` path, nginx serves at root | URL in handoff never verified against actual server config | Every playtest URL is curl-verified (HTTP 200 + title) before handoff; never report a path you didn't test | QA t_21cdd1ff, board playtest 2026-08-16 |
| 2 | Game refused to boot on public HTTP IP (Secure Context) | Godot loader requires secure context; localhost masks it | Playtest URL must be HTTPS (trycloudflare) OR post-processed index.js; QA runs against the PUBLIC url, not just localhost | product review t_1aa8bc8e P1 |
| 3 | No sound in game on mobile | Autoplay policy: AudioContext suspended until user gesture; music started in _ready() | Music system must unlock on first input (restart layers on gesture); QA acceptance checks `[music] unlocked-by-input` marker | board playtest, music accept |
| 4 | Music inaudible (−24 to −28 LUFS) | Stems mastered library-quiet by design | Loudness target ≈ −10 to −14 LUFS at bus; product review includes a loudness check (not just presence) | product review P3, board playtest |
| 5 | No mute button | Never scoped — P3 nit from product | A11y baseline: mute toggle is a build requirement, not nice-to-have (pinned rule) | product review P3 → eng t_83291603 |
| 6 | Mobile keyboard never appears on LineEdit | Godot export defaults: user-scalable=no + experimental_virtual_keyboard=false | Export preset must set user-scalable=yes (head_include) + experimental_virtual_keyboard=true; verify on touch device | board playtest (textbox), godot-export skill |
| 7 | Radars static 8 passes, research re-scanning stale data | Cadence not tied to signal value | Radar full sweep bi-weekly; on-demand on launch wave (Task 8); no re-scan when delta=0 | research-notes t_0aadf2f7 |
| 8 | Product P3 finding sat uncarded until board noticed | No verdict→work loop; CEO triage was discretionary | Close-the-loop at source: reviewer cards findings themselves; CEO triage mandatory (pinned rules 3) | board session 2026-08-16 |
| 9 | Worker ran unbounded (research escalation) | No max_runtime on cards | Lane runtime caps at creation (Task 2) + supervisor reclaim on overrun (Task 5) | board escalation t_0aadf2f7 |
| 10 | Category ambiguity — pipeline had no target | No category policy | D1 approved: multi-category, agent-native verified, PUBG-class excluded (pinned rule 11) | board D1 decision 2026-08-16 |

## Usage
- QA: before releasing a build, re-run this set against the new build (regression gate)
- Workers: after any change touching export/audio/URLs, self-check the relevant rows
- Transform loop (Task 9): new failures append here with product approval; stale rules get retired on evidence
