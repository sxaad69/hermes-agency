---
name: product-standard
description: "Hermes Agency delivery standard. Defines the M0-M6 maturity model, how to determine and relabel a product's maturity, the REAL vs DEMO/STUBBED integration matrix, Definition of Ready and Definition of Done, the mandatory pre-launch artifact set, and the rule that 'ready to ship' is prohibited without proof. Run a maturity audit before any readiness claim."
version: 1.0.0
author: hermesagency
license: MIT
metadata:
  hermes:
    tags: [product, maturity, delivery, standard, definition-of-done, integration-matrix]
    related_skills: [peer-review, shipping-gate, github-standard]
---

# Product Delivery Standard

The delivery standard for the Hermes Agency. It defines what maturity means,
what a product must carry at every stage, and when a label such as "ready to
ship" is legally usable in this company.

Core promise: **Hermes never calls a prototype a product, never calls a demo
shipped, and never allows an unreviewed claim to become a company decision.**

## 1. Maturity model (M0-M6)

| Level | Meaning | Evidence that proves you are here |
|---|---|---|
| M0 | Raw idea | Idea card exists. No validation, no research, no code. |
| M1 | Evidence-backed opportunity | Research artifacts attached: market scan, interviews, demand signals, competitor analysis, opportunity thesis. |
| M2 | Prototype | Working artifact runs with seeded or mocked data. Every integration is STUBBED or DEMO. |
| M3 | Real integrations wired and sandbox-tested | Every external dependency is REAL and configured against a sandbox/test account; sandbox tests pass and are recorded. |
| M4 | Launch-ready | Critical flows verified, security status recorded, rollback plan written, independent peer reviews complete (no P0/P1 open). |
| M5 | Live pilot with real users and outcome telemetry | Deployed to a pilot environment, real users onboarded, telemetry events defined and firing. |
| M6 | Product | Repeatable usage, retention, revenue, or proven business value sustained over time. |

### Labeling rules

- **"Ready to ship"** may only be claimed at M4 or higher.
- **"Shipped"** may only be claimed at M5 or higher AND with a release the
  board approved at the shipping gate.
- **Demo-only products must be labeled honestly.** Any product whose
  integrations are not all REAL carries a REAL vs DEMO/STUBBED integration
  matrix and its maturity is capped accordingly (all-mocked data caps at M2).
- A product is never relabeled by vibes. Every label change requires an audit
  (section 6) and attached evidence.

## 2. REAL vs DEMO/STUBBED integration matrix

The canonical format. One row per external dependency. It lives in the repo
(`docs/integrations.md`) and is mirrored into every release record and
changelog entry.

| Integration | Type | Status | Where configured | Evidence |
|---|---|---|---|---|
| Stripe Checkout | REAL | sandbox-tested | env in preview, keys in vault | test payment id `pi_...` |
| Email delivery | STUBBED | not wired | `mailer.fake()` in code | n/a |
| LLM provider | DEMO | hardcoded reply | prototype branch | n/a |

Rules:

- Every external dependency must appear, including stubbed and demo ones. No
  hidden integrations.
- Type is `REAL`, `STUBBED`, or `DEMO`. Status is the verification state
  (`not-wired`, `sandbox-tested`, `live`).
- Any STUBBED or DEMO entry caps the product at M2.
- A REAL integration needs a configured account (even a test account), a
  written test, and recorded evidence. "The code calls the API" is not
  evidence; the passing test is.
- The matrix is updated on every merge that touches an integration.

## 3. Definition of Ready (DoR) - before any task starts

A task may only leave the backlog when every item is met:

- [ ] Success criteria written and testable ("email sends within 5s" not
  "make email work")
- [ ] Scope and out-of-scope stated
- [ ] Target maturity level of the resulting product recorded
- [ ] Budget line and forecast attached (finance principle)
- [ ] Environment where evidence will be produced named
- [ ] Dependencies identified; none is silently assumed

If any box is unchecked, return the task with the specific gap. Do not start.

## 4. Definition of Done (DoD) - before a card closes

A card closes only when all of these are true:

- [ ] Code merged to `main` via a pull request reviewed by an independent
  reviewer (see `peer-review`), no open P0/P1 findings
- [ ] CI green on the merged commit
- [ ] Tests written and executed; results attached to the card
- [ ] Integration matrix updated for any touched integration
- [ ] CHANGELOG.md updated with a dated entry
- [ ] Preview URL and environment label recorded (which env, what data)
- [ ] Known limitations listed explicitly
- [ ] Review verdict record attached (see `peer-review`)

No card closes with unchecked DoD boxes. Partial closure is not a thing.

## 5. Pre-launch artifact set (mandatory before M4 claim)

Every product before launch must provide all of the following. This is not a
wish list; a missing artifact blocks the gate.

1. Public GitHub repo (`github-standard`)
2. Release commit + semantic version tag
3. Preview URL + environment label
4. REAL vs DEMO/STUBBED integration matrix
5. QA evidence (tests run, results, who ran them)
6. Security status (secrets scanned, keys in vault, access list, known issues)
7. Landing page
8. Marketing assets (copy, visuals, channels)
9. Budget report + forecast (spend to date, forecast to launch, CAC forecast
   for paid growth)
10. Rollback plan (steps, owner, estimated time)
11. Known limitations

Gap in any artifact = the product is not M4, no matter how good the demo is.

## 6. Maturity audit on an existing product

Run this whenever a product claims a maturity level, gets relabeled, or comes
out of a long stall. Also run it as a fresh context before any "ready to
ship" claim (see `peer-review`).

Workflow:

1. **Inventory integrations.** Read the code and config. List every external
   dependency (APIs, payments, auth, email, storage, LLM, webhooks).
2. **Label each one.** Mark `REAL`, `STUBBED`, or `DEMO` with its
   configuration location and evidence. Produce or update the matrix.
3. **Score maturity.** Walk the table in section 1 bottom-up. The product
   sits at the highest level whose evidence is complete and whose integrations
   do not contradict it (any STUBBED/DEMO caps at M2).
4. **Relabel.** Update the product card, the changelog, the release record,
   and the matrix with the audited level and the audit date.
5. **Report.** State the old label, the new label, and the evidence gap that
   forced the change (or confirmed it).

An audit that finds no gap still produces a record. Silence is not evidence.

## 7. Ready-to-ship rule

- "Ready to ship" is **prohibited without proof.** Proof = the artifact set
  (section 5) + an independent review verdict (see `peer-review`).
- A claim without attached evidence is treated as a process violation and
  must be flagged, not copied.
- The shipping gate (`shipping-gate`) refuses to pass any product whose
  readiness claim lacks evidence.

## 8. Related skills

- `peer-review` - the independent review that validates DoD and readiness
- `shipping-gate` - the gate that turns readiness into a release
- `github-standard` - where the public repo, changelog, and tags live
