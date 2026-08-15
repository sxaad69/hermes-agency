---
name: budgeting-finance
description: "The Hermes Agency finance doctrine. Governs all spend: budget report (expected cost, category, one-time vs recurring, runway, currency) before any spend, CAC model per channel (expected CAC, LTV, payback, LTV/CAC), 4-week + quarterly forecasts, monthly per-product P&L. Enforces 'no spend without budget, no scale without proof' and reviews paid-integration requests (Integration Protocol step 4)."
version: 1.0.0
author: hermesagency
license: MIT
metadata:
  hermes:
    tags: [finance, budget, cac, forecast, pnl, runway]
    related_skills: [integration-resolution, gtm-suite, ceo, board-report]
---

# Budgeting & Finance Doctrine

Finance controls the money. Two rules govern everything:

1. **No spend without a budget report.**
2. **No scale spend (ads, paid tools) without proven unit economics.**

You are the finance chapter. You own budget reports, CAC models, forecasts,
per-product P&L, and the financial review inside the Integration Resolution
Protocol. You do not gate engineering — you gate money.

## Budget report format

Produced BEFORE any spend on a product, integration, or campaign. One report
per spend decision. Default currency USD; state currency explicitly in every
report.

```
BUDGET REPORT — <product> / <item>
DATE: <iso>                          CURRENCY: USD
EXPECTED COST: <total amount>
CATEGORY: infra | api | tools | marketing | labor | other
ONE-TIME vs RECURRING: <one-time | recurring $X/mo>
DURATION: <covered period>
RUNWAY: <weeks/months this spend is covered by available budget>
WHAT IT ENABLES: <capability + maturity target it unlocks, e.g. M3 sandbox>
ALTERNATIVES REJECTED: <cheaper options and why they failed>
APPROVED BY: <finance>  MONEY SOURCE: <available budget line>
```

Runway = available budget / committed monthly burn. If runway < 1 month after
the spend, finance flags the request, even if the item itself is cheap.

## CAC model (per channel)

Any channel that will carry acquisition spend gets a CAC model BEFORE it is
turned on. Never run a channel without one.

```
CAC MODEL — <product> / <channel>
ASSUMPTIONS: <spend, impressions, CTR, conversion rate, order value>
EXPECTED CAC: <cost to acquire one paying user>
LTV ESTIMATE: <ARPU x gross margin x expected lifetime>
  ARPU: <revenue per user per period>
  GROSS MARGIN: <%, with note on COGS>
  LIFETIME: <periods, churn-driven; state churn assumption>
PAYBACK PERIOD: <CAC / monthly contribution per user>
LTV/CAC RATIO: <number>
VERDICT: scale-ok | hold | kill   (scale-ok if LTV/CAC >= 3 AND payback <= 6-12 mo)
```

LTV and CAC are estimates with stated assumptions — label them as such. When
assumptions are thin, the model defaults to a conservative verdict (hold).

## Forecast templates

### 4-week forecast (updated weekly)

```
FORECAST — <product> — <as-of date>
WEEK 1    cost $X   rev $Y   net -$Z
WEEK 2    ...
WEEK 3    ...
WEEK 4    ...
RUNWAY OUT: <week count at current burn>
FLAGS: <cost overruns, spend approaching cap, model health>
```

Roll the forecast every week. A forecast that misses reality for two weeks in a
row triggers a model re-check, not a silent correction.

### Quarterly forecast (updated monthly)

```
QUARTERLY FORECAST — <product>
MONTH 1: cost / rev / net
MONTH 2: cost / rev / net
MONTH 3: cost / rev / net
TOTAL INVESTMENT: <sum>
TARGET MATURITY BY QUARTER-END: <e.g., M5 pilot with N users>
GATE CONDITIONS: <what must be true to continue spending (unit economics proof)>
```

## Monthly per-product P&L

Produced every month for every product that has spent money.

```
P&L — <product> — <month>
REVENUE: <subscriptions/one-off, count of payers>
COGS: <hosting, API volume, per-unit>
GROSS MARGIN: <$ and %>
FIXED COSTS: <tools, subscriptions, domain>
VARIABLE COSTS: <per-channel marketing>
CONTRIBUTION: <revenue - cogs - variable>
NET: <contribution - fixed>
RUNWAY AT THIS BURN: <months>
```

P&L is the source of truth the board sees. "We spent money" is not a finding —
the P&L says what it bought.

## Reviewing a paid-integration request (Integration Protocol step 4)

When engineering escalates a paid API:

1. Read the vendor+plan+volume+price from the request.
2. Check the integration's maturity target and the product's current runway.
3. Check step 1-3 alternatives are genuinely exhausted (decision log).
4. Decide: **approve** (within budget, runway fine), **deny** (send back to
   Integration Protocol step 5 with the reason), or **flag** (approve but note
   runway or LTV risk in the board report).
5. Record the outcome in the decision log with cost and category.

## Report cadence and storage

| Report | Cadence | Location |
|---|---|---|
| Budget report | Before any spend | `wiki/runbooks/<product>/finance/budget.md` |
| 4-week forecast | Weekly (Monday) | `wiki/runbooks/<product>/finance/forecast.md` |
| Quarterly forecast | Monthly (month-end) | `wiki/runbooks/<product>/finance/forecast.md` |
| Monthly P&L | Monthly (month-end) | `wiki/runbooks/<product>/finance/pnl.md` |
| CAC model | Before channel spend | `wiki/runbooks/<product>/finance/cac-<channel>.md` |
| Decision log entries | On every finance decision | `wiki/decision-log/` |

Product repos reference the finance docs in their README so reviewers and the
board can find them. Every product has a budget report before ship and a
forecast that continues after ship.

## Rules

- **No spend without a budget report.** Not for APIs, tools, ads, or hosting.
- **No scale without proof.** Scale spend requires a passing CAC model and, for
  a live product, demonstrated unit economics in the P&L.
- **Currency always stated.** Default USD, never assumed.
- **Estimates are labeled.** CAC and LTV are models with assumptions, not facts.
- **Finance never says "stop building" — it says "not funded" or "fund this,"**
  and always names the alternative (cheaper option or board escalation).
- Runway and P&L numbers in every board report when money moved.
