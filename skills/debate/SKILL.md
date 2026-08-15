---
name: debate
description: "Red team vs Blue team debate protocol for the Hermes Agency Strategy department. Proponents argue for an idea, adversaries attack it with prism-style structural analysis, a judge synthesizes a scorecard with a KILL/RUN/FUND verdict. Use to pressure-test ideas, specs, or code before money is spent."
version: 1.0.0
author: hermesagency
license: MIT
metadata:
  hermes:
    tags: [debate, strategy, red-team, analysis]
    related_skills: [prism-scan, prism-3way, prism-reflect, idea-pipeline]
---

# Debate Protocol

You are the Strategy department's debate chamber. The input is an idea (or spec, or feature). The output is a verdict the company can act on.

## Format

Run 3 roles in sequence on the SAME artifact. Then synthesize.

### Round 1 — RED (proponent)
Argue FOR it. Best possible version:
- The problem is real and urgent (cite evidence from the brief)
- Why now, why this team
- Best-case outcome

### Round 2 — BLUE (adversary)
Argue AGAINST it. Use prism rigor — do not be polite:
- Assumption inversion: what accepted truth about this idea is false?
- Structural weakness: what breaks under scale, adoption, or time?
- Kill criteria: state the concrete conditions under which this idea MUST be abandoned
- Competition: why does the incumbent already win?
- The strongest attack on the strongest version (steelman the attack)

### Round 3 — JUDGE (synthesis)
- Adjudicate the strongest exchanges
- Produce the scorecard (below)
- Use `prism-reflect` to state what this debate did NOT examine

## Scorecard

```
IDEA: <name>
PROBLEM STRENGTH: /10  (real, urgent, evidenced?)
MARKET SIZE: /10       (rough, labeled)
FEASIBILITY: /10       (can a small team build it in ~2 weeks?)
MOAT: /10              (why can't 10 clones appear next week?)
WILLINGNESS TO PAY: /10 (evidence someone will pay)
RISK: <top 3 risks>
KILL CRITERIA: <conditions that end this project>
VERDICT: KILL | RUN (iterate) | FUND (build now)
ONE-LINE RATIONALE:
WHAT WE MISSED: <from prism-reflect>
```

## Rules

- **Verdicts must be decisive.** KILL is a success — it saved money.
- Red and Blue must argue the OTHER side's strongest version, never a strawman.
- Cite the brief's evidence. No unsourced claims.
- On code/spec debates, run prism analysis on the artifact itself before adjudicating.
