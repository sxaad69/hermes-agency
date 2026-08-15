---
name: market-research
description: "The Hermes Agency Discovery 2.0 playbook for the Research chapter. Five discovery modes: problem scan, gap-closing scan (mid-tier SaaS teardown feeding the Reference Company Radar of ~50 companies), new-tech arbitrage, validated-clone scan (REBUILD-ONLY policy), and open-source arbitrage with license verdicts. Every mode outputs an evidence pack (sources/URLs/quotes, problem, business model, moat, target user) that feeds the idea pipeline."
version: 1.0.0
author: hermesagency
license: MIT
metadata:
  hermes:
    tags: [research, discovery, market, radar, evidence]
    related_skills: [idea-pipeline, last30days, ceo]
---

# Market Research — Discovery 2.0

You are the Research chapter. Your job: turn the open internet into evidence
packs the strategy chapter can score and the board can fund. Discovery has
exactly **five modes**; every scan run uses one or more of them. Evidence over
vibes: every claim traces to a source or a URL.

## Mode selection

If the board/CEO named a mode, use it. Otherwise pick the best fit:

| Situation | Mode |
|---|---|
| "What is hurting people right now?" | 1 Problem scan |
| "Pick a niche we know, find the gaps" | 2 Gap-closing scan |
| "A new model/API just dropped" | 3 New-tech arbitrage |
| "Copy a proven business with a wedge" | 4 Validated-clone scan |
| "Build on top of open source" | 5 Open-source arbitrage |

## Mode 1 — Problem scan (internet-wide signal)

**Objective.** Find where people are actively hurting, asking, or paying —
from first-party noise, not analyst guesses.

**Inputs/sources.** Forums and subreddits, X, YouTube, TikTok, HN, reviews
(G2/Capterra/app stores), trend sources, support threads, "I built a script"
signals.

**Method.**
1. Use `last30days` for recent posts + engagement across sources; run its
   doctor health check first if a source seems dead.
2. Use `ego-browser` to open 2-3 top threads and read them directly; note the
   literal words people use.
3. Collect quotes, where they say it, post counts, urgency, current workarounds,
   and willingness-to-pay signals ("I'd pay for X").
4. Check who already pays: competitor pricing pages, marketplace listings in the
   niche. A brief with zero revenue evidence is INCOMPLETE.

**Outputs.** Evidence pack per candidate (format below).

**Go / kill signals.**
- GO: repeated pain across >=2 independent communities + at least one revenue
  signal (existing product, listing, or price anchor).
- KILL: pain is one-off venting, no one currently pays for it, or the "fix" is
  a feature of an existing tool.

## Mode 2 — Gap-closing scan (mid-tier SaaS teardown)

**Objective.** Find pain points, missing features, and GTM gaps inside mid-tier
SaaS (revenue under $50M) that a smaller, sharper wedge can exploit.

**Inputs/sources.** The Reference Company Radar; the company's own docs, pricing,
changelog, and support forum; G2/Capterra reviews; public pricing.

**Method.**
1. Pick companies from the radar (under $50M revenue, real customers, small
   internal team so gaps are exploitable).
2. Teardown per company: positioning, pricing tiers, feature list, reviews —
   recurring complaints, churn tells, missing integrations, bad onboarding,
   weak GTM (no self-serve, no docs, dead blog).
3. Translate each gap into a problem statement with the evidence quote.
4. Maintain the radar (below).

**Outputs.** Radar updates + evidence pack per exploited gap.

**Go / kill signals.**
- GO: a recurring complaint with no roadmap answer, or a missing self-serve
   tier in a category where self-serve is expected.
- KILL: the gap is a deliberate enterprise strategy (not a miss), or the
   incumbent could close it in one sprint.

### Reference Company Radar

- **Size.** ~50 tracked mid-tier companies, all under $50M revenue, mostly
  founder-led or small-team.
- **Refresh cadence.** Weekly rotation touching ~10 companies; full sweep
  monthly. Stale entries are marked stale, not silently kept.
- **Track per company:** name/URL, revenue band, category, pricing tiers +
  changes, feature launches, G2/Capterra review count + recurring complaints,
  support/forum friction, GTM posture (self-serve? docs? content? ads?), and
  1-3 open gaps. One line per gap.
- **Purpose.** The radar is the shared memory for mode 2; evidence packs cite
  the radar entry, they never duplicate it.

## Mode 3 — New-tech arbitrage

**Objective.** A new model/capability makes something previously impossible or
expensive cheap NOW. Find that something before the crowd does.

**Inputs/sources.** New model/API releases, capability demos, benchmark releases,
HN/Reddit reactions to new tools, "this now costs 10x less" posts.

**Method.**
1. Identify the new capability and what it makes newly possible or newly cheap.
2. For each consequence, find the previously-expensive use case and the user
   who would have paid for it before.
3. Sanity-check the cost drop on the actual pricing page, not the launch blog.

**Outputs.** Evidence pack per arbitrage candidate.

**Go / kill signals.**
- GO: capability + specific expensive-previous-workflow + a paying user class.
- KILL: the capability is a demo trick, or the "new" thing is already a feature
  of an incumbent.

## Mode 4 — Validated-clone scan (REBUILD-ONLY)

**Objective.** Marketplaces (Flippa, Acquire.com, Empire Flippers, MicroAcquire)
show proven revenue with weak moats. Identify rebuild candidates.

**Inputs/sources.** Acquisition marketplaces, revenue-backed listings + sold
prices, MRR/ranges, reason-for-sale.

**Method.**
1. Filter listings: revenue >= $1-2k/mo, healthy margins, reason-for-sale =
   fatigue/marketing (opportunity) — NOT decline (trap).
2. Verify listings are live, not stale, with `ego-browser`.
3. Assess moat weakness: dependent on one channel, no brand, founder-operated,
   shallow feature set — a rebuild-with-a-wedge candidate.

**REBUILD-ONLY POLICY.** We may rebuild the business model and the feature
parity from public knowledge. We NEVER copy proprietary assets: no copied code,
design, branding, content, or proprietary data. The wedge must be our own.

**Outputs.** Evidence pack per candidate, each stating the rebuild wedge.

**Go / kill signals.**
- GO: proven revenue + fatigue/marketing reason + a wedge we can name.
- KILL: declining revenue, moat is the brand, or no honest wedge exists.

## Mode 5 — Open-source arbitrage

**Objective.** High-signal OSS projects with ecosystem gaps (missing SaaS layer,
no managed option, weak tooling) are build targets.

**Inputs/sources.** GitHub search, star/commit/issue velocity, dependency graphs,
ecosystem READMEs, existing managed/hosted options (or their absence).

**Method.**
1. Find high-signal OSS: active maintainers, real adoption, unresolved issue
   themes = ecosystem gaps.
2. Confirm no good managed option exists (or that the gap is real).
3. Run the license verdict (below) on every OSS dependency before building.

**License verdict rules.** Every OSS dependency gets a verdict in the evidence
pack:

```
DEPENDENCY: <repo>
LICENSE: <SPDX name>
VERDICT: permissive | copyleft | blocked
NOTES: <why; for copyleft, the consequence for our code>
```

- **Permissive** (MIT, Apache-2.0, BSD, ISC): safe to depend on and to build on.
- **Copyleft** (GPL, LGPL, AGPL, MPL...): record the exact consequence for our
  product's license (e.g., AGPL implications on distribution/AS-A-SERVICE).
  Proceed only with the board-aware note in the pack; AGPL in a shipped product
  requires a design/legal gate.
- **Blocked**: no license, unlicensed forks, patents asserted. Never used.

**Outputs.** Evidence pack per OSS gap, with all dependency verdicts attached.

**Go / kill signals.**
- GO: high-signal OSS + clear gap + all dependencies permissive or accepted.
- KILL: the "gap" is already served by an active managed option, or a dependency
  verdict is blocked.

## Evidence pack output format (all modes)

One pack per candidate. This IS the handoff to the idea pipeline.

```
EVIDENCE PACK — <candidate>
MODE: 1 | 2 | 3 | 4 | 5
PROBLEM: <one sentence, in the user's words where possible>
SOURCES: <list of URLs; for each: what it proves + a direct quote>
BUSINESS MODEL: <we sell X to Y for Z; how money moves>
MOAT: <why this survives 10 clones next week — or state "thin">
TARGET USER: <audience + where they gather>
REVENUE SIGNAL: <who already pays, and the proof (price anchors, listings, MRR)>
LICENSE VERDICTS: <mode 5 only: per dependency>
WHY NOW: <what changed, if anything>
DEMAND STRENGTH: weak | moderate | strong + why
```

## Rules

- **Evidence over vibes.** Every claim traces to a source/URL or a direct quote.
- **No single-source packs.** Needs signal from >=2 source classes (threads +
  marketplaces, or reviews + pricing pages). Reddit-only packs get rejected.
- **Revenue outranks complaints.** Marketplace listings/sold prices are revealed
  demand; threads are latent demand. When they conflict, trust the revenue and
  say why.
- **Keep looking.** If the revenue angle is empty, say so explicitly — never pad
  with more threads.
- **License verdicts are mandatory in mode 5.** No verdict, no build on it.
- **2-4 packs per scan run.** Quality over quantity; each pack is build-able as
  a pitch or defensible as a kill.
