# Lane Profile Template (Task 9 — transform engine)
For each chart-topping or proven-success game, fill ONE lane profile. The
transform engine uses these to generate "same lane, different mindset" variants.

```
LANE:            <endless runner / block puzzle / match-3 / incremental ...>
GAME:            <title>  <year>  <source: charts-now | proven-library>
─────────────────────────────────────────────────────────────
CORE FANTASY:    <what the player IS and FEELS>     # Temple Run: fleeing, being chased
HOOK:            <the 3-second grab>                 # Subway: dodge trains, swipe lanes
CORE LOOP:       <action -> reward -> repeat>        # run, jump, slide, score
RETENTION:       <what brings you back>              # unlockables, distance records
MONETIZATION:    <where ads/fees fit naturally>      # continue-after-death, skins
WHY IT WINS:     <1-2 sentences, evidence-cited>     # source: radar row / portal page
─────────────────────────────────────────────────────────────
TRANSFORMABILITY TEST (before any variant):
  Does the winning essence survive a setting change?   YES/NO
  (NO = mechanic-won vs moment-won: Flappy Bird minimalism, pandemic Among Us)
  If NO → do not transform. Log why.

CLASSIC-TRANSFORM SCORE (only for proven-library games):
  lane-size-now (1-5) + incumbent-density (1-5, 5=crowded) +
  verification-fit (1-5) + monetization-density (1-5)
  → score <12 = skip; ≥2 live incumbents = skip (camo lesson)

TIMING (proven-library only): incumbent age / decay point?
  Transform at DECAY (generational reboot), not peak.
─────────────────────────────────────────────────────────────
VARIANTS (generate 2-3, must differ in ≥2 dimensions: setting/twist/art/audience):
  V1: <name> — <what changes, in 1 line>
  V2: <name> — <what changes, in 1 line>
  V3: <name> — <what changes, in 1 line>
  (reskin = fail. Portal QA clone-flags are the top rejection risk.)
```

## Rules
- One question per transform pass; evidence cited per field
- Variant cards enter the standard chain: kill-gate (with MONETIZATION) → product → board
- Transform outcomes append to the eval set (Task 4) — the transform data loop
