---
name: shipping-gate
description: "Hermes Agency release gate. Risk-tiered approval matrix, dual readiness (Product readiness AND GTM readiness), the dev -> integration sandbox -> staging/preview -> pilot -> production environment ladder, trycloudflare policy, board approval requirement for new product / billing / legal / privacy / security, evidence-before-claim, and the mandatory release record contents. Nothing ships without approval at the correct tier."
version: 2.0.0
author: hermesagency
license: MIT
metadata:
  hermes:
    tags: [shipping, launch, approval, gate, release]
    related_skills: [ceo, board-report, peer-review, product-standard]
---

# Shipping Gate

The company's hard rule: **nothing ships to production without approval at the
correct risk tier.** You run the gate. Do not ship anything until the gate
passes, and never self-approve.

## When to invoke

A product has passed QA and holds an independent review verdict (see
`peer-review`). It wants to move to the next environment on the ladder or to
production. Do NOT ship. Invoke the gate.

## 1. Risk-tiered approval matrix

Determine the tier of the change, then use the matching approval path.

| Tier | Applies to | Approval path |
|---|---|---|
| LOW | Small fixes, dependency bumps, docs, non-user-visible changes | Continuous delivery after automated checks (CI green + review verdict on the PR). |
| NORMAL | Feature changes, UI changes, medium-size improvements | Weekly release review by the CEO/Operations; board notified in the weekly report. |
| HIGH | New product, billing/payments, legal, privacy, security-sensitive change | Board approval. The card blocks until the board explicitly approves. |

Rules:

- When in doubt, tier up. Billing, legal, privacy, and security are always
  HIGH; they can never be routed as LOW.
- A HIGH-tier change cannot be split into LOW-tier commits to dodge the gate.
- The board is the absolute authority. If the board says stop, it stops.

## 2. Dual readiness

A release claim requires BOTH. Neither can be skipped.

### Product readiness

- [ ] Integration matrix shows the required integrations REAL (see
  `product-standard`); any STUBBED/DEMO entries are disclosed and capped
- [ ] Real integrations wired and sandbox-tested at M3+
- [ ] Critical flows verified
- [ ] Security status recorded (secrets scanned, keys in vault)
- [ ] Rollback plan written
- [ ] Independent review verdict(s) attached, no open P0/P1

### GTM readiness

- [ ] Landing page live at the preview URL
- [ ] Marketing assets ready (copy, visuals, channels)
- [ ] Pricing decided (where applicable)
- [ ] Budget report + forecast attached, including CAC forecast for paid growth
- [ ] Known limitations written for customer-facing use

## 3. Environment ladder

A product climbs one rung at a time. Skipping rungs is only allowed when the
board explicitly approves the skip.

| Rung | Name | What it requires |
|---|---|---|
| 1 | dev | Local development; seeded/mocked data allowed. |
| 2 | integration sandbox | Real integrations wired against sandbox/test accounts; sandbox tests recorded. |
| 3 | staging/preview | Full artifact set, independent review passed, dual readiness drafted. The board reviews the real thing here. |
| 4 | pilot | M5: real users with outcome telemetry defined and firing; consent/ToS for real users present. |
| 5 | production | Board-approved release at the correct tier, release record complete, rollback plan rehearsed. |

**Trycloudflare policy:** trycloudflare is an acceptable preview and pilot
environment. Hosting is not the quality bar; real integration, evidence,
security, testing, and operational ownership are. Any preview URL must carry
an environment label so nobody mistakes a pilot for production.

## 4. Protocol

1. **Prepare.** Assemble the release record (section 6) with the launch brief:
   name + one-liner, what changed vs the idea, preview URL + environment
   label, key metrics/tests, risks + residual issues, cost so far.
2. **Tier it.** Classify LOW / NORMAL / HIGH (section 1).
3. **Block the card.** `kanban_block` the shipping/launch task with reason
   `needs_input` and the release record as the reason text. HIGH-tier changes
   go to the board. NORMAL-tier changes go to the weekly release review.
4. **Notify the board.** For HIGH-tier changes, send the launch brief on
   Telegram and wait. For NORMAL-tier, the weekly report carries it.
5. **Wait.** The card stays blocked. Do not proceed, do not pester. One gentle
   reminder per day if the board is silent, then leave it.

## 5. On the board's reply

- **Approve** -> `kanban_unblock` the task, deploy to the target environment,
  post the live URL, announce. Mark the card done and record the release.
- **Reject** -> the card stays blocked; comment the rejection; archive or send
  back to the responsible squad with the reason. Do not ship.
- **Changes requested** -> `kanban_comment` the feedback,
  `kanban_request_changes`, reassign to the squad, re-run review and gate when
  ready.

For LOW-tier continuous delivery, no board round-trip: CI green + review
verdict is sufficient, and the release is recorded.

## 6. Release record (mandatory contents)

Every release, at every tier, produces a record containing:

1. Release commit (full SHA)
2. Version tag (semantic version)
3. Changelog entry referencing the review verdicts
4. Preview URL + environment label
5. Integration matrix (REAL vs DEMO/STUBBED)
6. Review verdicts (reviewer context id + severity + verdict per `peer-review`)
7. Rollback plan
8. Known limitations

**Evidence-before-claim:** a release record with missing items is not a
release. "Ready to ship" is prohibited without the artifact set and the review
verdicts (`product-standard` section 7). If shipping is blocked by missing
credentials (Supabase/Stripe/etc.), state exactly which key or account is
needed in the brief.

## 7. Related skills

- `product-standard` - the maturity and artifact definitions the gate enforces
- `peer-review` - the review verdicts the gate requires
- `board-report` - where NORMAL-tier releases and health are reported
- `github-standard` - repo, tags, changelog mechanics behind the record
