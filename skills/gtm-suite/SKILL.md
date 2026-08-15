---
name: gtm-suite
description: "The Hermes Agency go-to-market doctrine. Covers the seven GTM sub-areas (product marketing, content studio, SEO/AEO, paid media, lifecycle/CRM, social/community/PR, sales/partnerships), the pre-ship readiness checklist (landing page with real copy, positioning + pricing, core assets, budget + CAC forecast, launch plan), and the post-ship acquisition experiment framework. GTM assets are real, never placeholder, and GTM readiness gates the shipping gate."
version: 1.0.0
author: hermesagency
license: MIT
metadata:
  hermes:
    tags: [marketing, gtm, launch, landing-page, acquisition, pricing]
    related_skills: [budgeting-finance, shipping-gate, ceo, market-research]
---

# Go-To-Market Suite Doctrine

GTM is a delivery discipline, not a finishing touch. A product is not launch-
ready because the code works; it is launch-ready when the market-facing assets
are real and the acquisition plan is funded. GTM readiness is one of the two
readiness gates on shipping (the other is product readiness at M4).

**The rule: every GTM asset is real. No placeholder copy, no lorem ipsum, no
"coming soon" pricing.** If an asset is not real, it is not ready.

## The seven GTM sub-areas

| Sub-area | Mandate (one line) |
|---|---|
| Product marketing | Own positioning and pricing: who this is for, why it, at what price |
| Content studio | Produce the real copy and assets: landing page, docs, explainer, screenshots |
| SEO/AEO | Make the product findable: keyword/answer-engine targeting, structured data, technical SEO |
| Paid media | Run acquisition channels under budget caps with proven unit economics only |
| Lifecycle/CRM | Turn acquired users into retained users: onboarding, emails, product tours, churn triggers |
| Social/community/PR | Build owned audience and credibility: where the target users already gather |
| Sales/partnerships | Direct conversations and channel deals for higher-ticket segments |

Product marketing and content studio are required for every ship. The others
are activated per product based on channel evidence — not assumed.

## Pre-ship readiness checklist

Before the shipping gate opens, ALL of these must be REAL (a "landing page
draft" is not a landing page):

```
[ ] LANDING PAGE with real copy: headline, problem statement, feature list,
    screenshot(s), price, CTA. No placeholders.
[ ] POSITIONING + PRICING documented (product marketing): audience, one-liner,
    differentiation, price points + rationale.
[ ] CORE ASSETS: product screenshots, explainer or demo walkthrough, docs/help
    link, social handles reserved.
[ ] BUDGET + CAC FORECAST (see budgeting-finance): expected CAC per channel,
    LTV, payback, LTV/CAC, spend caps.
[ ] LAUNCH PLAN: channels to use at ship, first-week actions, owners, success
    metric, post-ship experiment backlog.
[ ] REAL-vs-SANDBOX label for any integration the landing page implies
    (a sandbox integration must not be marketed as real).
```

A checklist item with a placeholder is a blocking gap. The CEO blocks the card
and sends it back to the marketing/content chapter — the shipping gate does not
open until the checklist is green.

## Post-ship acquisition experiments

After ship, acquisition continues as experiments, not guesses. Every experiment
runs the same loop:

```
HYPOTHESIS: <channel -> who -> what message -> expected CAC/LTV>
CHANNEL: <one channel per experiment>
BUDGET CAP: <hard dollar cap, from the budget report>
EXPERIMENT: <what you actually run: ad set, post, email, listing>
MEASURE: <CAC, conversions, engagement, quality of signup>
DECIDE: <scale | iterate | kill> + reason
```

Rules:

- **One channel per experiment.** Mixing channels muddles attribution.
- **Hard budget caps.** An experiment never exceeds its cap; overrun flags the
  finance chapter.
- **Kill without guilt.** A killed experiment is data, not a failure. Record the
  result in the wiki retro/decision log.
- **Only winning channels scale**, and only after their CAC model passes
  (LTV/CAC >= 3, payback within 6-12 months). No scale spend on unproven
  channels, ever.
- Every experiment result feeds back into the CAC model and the next pre-ship
  checklist.

## GTM readiness gates the shipping gate

The shipping gate (`shipping-gate`) requires the CEO to confirm:

1. Product readiness: M4 (critical flows, security, rollback, reviews done).
2. GTM readiness: this skill's checklist is fully green.

If either is missing, the gate does not open and the board brief says which one
is missing. The board brief includes the launch plan and the first-week
acquisition experiments so the board can see the money side of the launch.

## Rules

- **Real over placeholder.** Every asset ships as the final copy.
- **Price is a product decision.** Pricing is decided with the board at pitch or
  design review, not improvised at ship time.
- **No scale without proof.** Paid media only on passing CAC models (finance).
- **GTM continues after ship.** Acquisition experiments are a permanent product
  activity, not a launch event.
- **Integration claims are honest.** Sandbox integrations are not marketed as
  real capabilities.
