# Eval Ruleset (Task 4) — regression checklist derived from real failures
Every release must pass this before QA sign-off. Maintained by QA; additions approved by product.

## Build & export
- [ ] Web build boots on the PUBLIC playtest URL (HTTPS), not just localhost
- [ ] 0 console errors on load; canvas initialized (not 300x150 error state)
- [ ] Export <20MB gz; export_presets: user-scalable=yes + experimental_virtual_keyboard=true
- [ ] .env / secrets absent from the build artifact

## Audio
- [ ] Music unlocks on first user input (`[music] unlocked-by-input` marker)
- [ ] Loudness audible (~−10 to −14 LUFS at bus), no clipping
- [ ] Loop wraps cleanly; stems phase-locked; no DC offset
- [ ] Mute toggle exists and mutes BOTH Music + SFX buses

## Playtest & handoff
- [ ] Playtest URL curl-verified (200 + correct title) before giving to the board
- [ ] Handoff names the URL that was actually tested (never an assumed path)

## Process
- [ ] Findings carded at the source (close-the-loop) — no silent declines/defects
- [ ] Card ran within its lane runtime cap; DECISIONS.md exists in workspace
- [ ] Pinned-rules re-read after compaction (model lock intact: deepseek-v4-flash/opencode-go)
