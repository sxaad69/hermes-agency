---
name: integration-resolution
description: "The Hermes Agency integration doctrine. Resolves any external integration (APIs, SaaS, carrier, payment, AI) through an ordered 5-step protocol: open-search free options first, then free tier/sandbox, then open-source self-hosted, then paid API behind a finance check, then the board with options + recommendation. No card is ever blocked on 'no API key'. Also defines sandbox vs real labeling in the integration matrix and decision-log recording."
version: 1.0.0
author: hermesagency
license: MIT
metadata:
  hermes:
    tags: [integration, api, third-party, sandbox, escalation]
    related_skills: [budgeting-finance, ceo, shipping-gate, peer-review]
---

# Integration Resolution Protocol

The company's hard rule: **a card is never blocked on "no API key."** Every
integration question ends in a decision or an escalation with options. You run
this protocol from the moment a build needs any external dependency.

The promise of the protocol: official/free first, self-hosted next, paid only
with a budget check, and the board always gets options, never a bare blocker.

## The 5-step decision flow

Run the steps IN ORDER. Stop at the first step that yields a viable option.

| Step | Move | Stop condition |
|---|---|---|
| 1 | Open-search for official / free options | A documented official or free option exists (cap research at ~30 min) |
| 2 | Free tier / sandbox / dev mode | Free or test-scoped credentials are obtainable and the quota supports the use case |
| 3 | Open-source self-hosted alternative | A maintained OSS option fits; license verdict is permissive or acceptable |
| 4 | Paid API | Finance/budget check passed (see `budgeting-finance`) |
| 5 | Ask the board via Telegram | Every cheaper option is exhausted or disqualified; present options + recommendation |

### Step 1 — Open-search first (cap ~30 min)

Research an integration fast, in this order:

1. **Official docs first.** Go to the vendor's own site: pricing page, developer docs, free-tier page. The pricing page IS the fastest demand+capability signal.
2. **Then community.** Search for "X free tier", "X quota", "X vs Y", recent threads (last 2 years). Real developers report the gotchas (rate limits that are effectively unusable, surprise overage billing, required business verification).
3. **Then open-source.** Search GitHub/OSS registries for self-hosted equivalents before any paid consideration.

Keep a running candidate list with three fields per option: cost model, quota/limits, prod-readiness verdict. Timebox step 1 to ~30 minutes; if nothing official exists, move on.

### Step 2 — Free tier / sandbox / dev mode viability

Judge a free tier on three axes before accepting it:

| Axis | Ask | Acceptable for |
|---|---|---|
| Rate limits | Requests/hour, concurrent calls, batch caps. Do they cover peak load, not average? | M3 sandbox testing; M5 pilot only if headroom is real |
| Quotas | Free unit caps (rows, labels, credits, users). What happens at cap — hard stop or overage billing? Overage billing on a free tier is a cost risk; treat as paid. | M2 prototype, M3 sandbox |
| Prod readiness | Terms allow production use, no watermarking/branding, no mandatory shared-tenant data exposure, SLA or acceptable support | M5+ pilot |

When the free tier is only good enough for testing, adopt it for the sandbox,
label it `sandbox` in the integration matrix, and keep the paid option (or OSS
alternative) in the decision log as the future path.

### Step 3 — Open-source self-hosted alternative

Apply the license verdict rules from `market-research` mode 5 (permissive vs
copyleft) to every OSS candidate. Accept only options with a passed verdict and
a maintained repo. Self-hosting swaps an API key for an ops cost: state the
deploy cost (compute, DB, backups) in the card, not just "free."

### Step 4 — Paid API (finance check first)

Never wire a paid API straight into a card. Send the request to `budgeting-finance`
with: vendor, plan, unit price, expected volume, one-time vs recurring, and the
integration's maturity target. Finance reviews the budget impact and runway
before you proceed. If finance denies, you do NOT stop — go to step 5.

### Step 5 — Ask the board

Send via Telegram:

```
INTEGRATION ESCALATION — <product> / <integration>
WHAT: <integration and why it is needed>
WHY CHEAPER FAILED: <free tier limits / OSS gap / sandbox-only>
OPTION A: <name + cost + effort + tradeoffs>
OPTION B: <name + cost + effort + tradeoffs>
RECOMMENDATION: <A or B + one-line why>
```

The board picks. A blocked card is never a valid state — either you resolved it
or you escalated it.

## Sandbox vs real labeling

The integration matrix (delivery standard, M3+) has one row per integration:

```
INTEGRATION: <name>
TYPE: REAL | SANDBOX        <- sandbox means test credentials / test env
CREDENTIALS: <source + scope>
TEST EVIDENCE: <what was verified, link to test run>
PATH TO REAL: <what unlocks real mode: paid plan, verification, approval>
```

- **REAL** — production credentials, real data, real behavior verified by tests.
- **SANDBOX** — test/development credentials or a dev mode. Never present a
  sandbox integration as real. The matrix and the board report state the
  difference explicitly. A product is M3 when REAL integrations are wired and
  sandbox-tested; sandbox-labeled rows do not count as real integrations.

## Worked example — label printing

Context: an order-shipping product needs to generate shipping labels from
order data.

1. **Open-search (step 1).** Shippo and EasyPost both offer developer APIs with
   free test keys and pay-per-label pricing. USPS's own Web Tools API is free
   for qualified web apps. Official docs confirm all three exist within 30 min.
2. **Free tier / sandbox (step 2).** Take Shippo's test API key immediately for
   the sandbox. Test labels work end-to-end in test mode. Rate limits are fine
   for the pilot's volume. Label it SANDBOX in the matrix.
3. **OSS (step 3).** If the product can render labels without a carrier account,
   an OSS label-generation library (PDF/ZPL) passes the license verdict and
   removes per-label cost entirely — but it does not hand off to the carrier.
4. **Paid (step 4).** Full Shippo production (real carrier labels) is pay-per-
   label recurring cost. Budget report required before wiring it.
5. **Escalate (step 5).** If per-label cost kills unit economics, escalate with
   options: (A) USPS Web Tools free API (carrier-branded, no Shippo fee), (B)
   Shippo production paid, (C) stay sandbox + manual label export for the pilot.
   Recommend A if USPS coverage suffices.

## Recording resolutions

Every resolution is written to `wiki/decision-log/` as
`<YYYY-MM-DD>-<product>-<integration>.md`:

```
DATE: <iso>
PRODUCT: <name>
INTEGRATION: <name>
PROTOCOL PATH: step 1 / 2 / 3 / 4 / 5
DECISION: <adopted option + maturity target>
REJECTED: <options tried and why rejected>
MATRIX LABEL: REAL | SANDBOX
COST: <none | one-time $X | recurring $X/mo>
ESCALATED TO BOARD: yes/no (+ board verdict)
```

The decision log is the audit trail for the finance and shipping gates. No
integration resolution counts as done until it is logged.

## Rules

- **No bare blockers.** Any "no API key" state is a failure of this protocol. Escalate with options.
- **Official first.** Vendor docs before community threads; community before OSS; OSS before paid.
- **Sandbox is sandbox.** Labeling a test-mode integration as real is a review failure.
- **Paid requires finance.** Step 4 never happens without a budget check.
- **Board decides the last dollar.** Only the board approves paid spend that finance flags.
