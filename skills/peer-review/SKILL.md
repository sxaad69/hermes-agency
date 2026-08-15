---
name: peer-review
description: "Hermes Agency independent review doctrine. No self-approval: the reviewer runs in a fresh independent context that did not author the work. Defines when a review is required (before any merge, before any gate claim, before 'ready to ship'), the review workflow, the P0-P3 severity scale with gating effects, the verdict record format, and the rule that review evidence attaches to the card and changelog."
version: 1.0.0
author: hermesagency
license: MIT
metadata:
  hermes:
    tags: [review, peer-review, quality, severity, independence]
    related_skills: [product-standard, shipping-gate, github-standard]
---

# Peer Review Doctrine

Independent review is a company principle: **no one approves their own work.**
Every review is run by a reviewer who is a fresh independent context and did
not author the work under review. Review evidence is recorded and attached to
the card and the changelog.

## 1. When a review is required

A review runs before all of the following. "Before" means the review verdict
exists and is attached before the step completes:

| Event | Review scope |
|---|---|
| Any merge to `main` | The diff: correctness, DoD compliance, integration matrix impact |
| Any gate claim (maturity relabel, readiness) | The artifact set and evidence behind the claim (see `product-standard`) |
| Any "ready to ship" claim | Full M4 audit: critical flows, security, rollback, artifact set |
| Any release at the shipping gate | The complete release record (see `shipping-gate`) |

Reviews are also run on high-risk approvals: if fallback models were used for
a high-risk decision, the decision is re-run on the primary model and
reviewed in a fresh context (see charter section 8).

## 2. Independence rules

- **No self-approval.** The author never reviews their own work. An author
  may not review a co-author's merge of shared work either.
- **Fresh independent context.** The reviewer starts from a clean context that
  has not participated in producing the work. They may read the same files,
  but they must not be the one who wrote them.
- **Independence comes from role and context separation**, not from model
  choice. Peer review on the primary model is standard; fallback models are
  for outages only and that usage is logged.
- **No rubber-stamping.** A reviewer who cannot verify a claim returns it as
  a finding, never as an approval. If the reviewer IS the original author in
  practice (same session, same context), the review is invalid.

## 3. Review workflow

1. **Load the artifact.** Open the PR, the release record, or the maturity
   claim. Read the requirements: card body, DoR/DoD (`product-standard`),
   integration matrix, changelog.
2. **Check against DoD/requirements.** Walk the artifact set. Is every
   required item present? Are the requirements satisfied, not just addressed?
3. **Verify claims against evidence.** Every claim must trace to a source:
   a test result, a config, a URL, a record. "It works" is not evidence;
   the passing test, the preview URL, the sandbox account config is. Pull the
   evidence yourself where possible instead of trusting its existence.
4. **Produce the verdict.** Write the verdict record (section 5), assign a
   severity to every finding, and attach the record to the card and changelog.

## 4. Severity scale and gating

| Severity | Meaning | Gating effect |
|---|---|---|
| P0 | Must-fix-before-ship. Critical flaw: broken critical flow, data loss, exposed secret, security hole, false claim that could mislead the board. | Blocks the release gate. Product cannot ship. |
| P1 | Fix-before-merge. Bug, missing requirement, or evidence gap that must be corrected before the change is accepted. | Blocks the merge. Card stays open. |
| P2 | Next-iteration. Improvement or nice-to-have that does not block merge or ship. | Tracked on the card for the next sprint. |
| P3 | Nit. Style, wording, cosmetic. | Optional; recorded and ignored unless cheap. |

Gating is additive: a release fails if any finding is P0 or if any DoD item is
unmet. A merge fails if any finding is P1 or higher.

## 5. Verdict record format

Every review produces this record and attaches it to the card and changelog
entry. The format is fixed so audits can be compared.

```
REVIEW: <short id, e.g. PR-42 review 1>
OBJECT: <PR url / release record / maturity claim>
REVIEWER CONTEXT: <fresh-context id, distinct from author's>
DATE: <date>
REQUIREMENTS CHECKED: <DoD items verified, artifact set items verified>
CLAIMS VERIFIED: <each claim -> evidence traced>
FINDINGS:
  - [P1] <description + location + required fix>
  - [P2] <description>
VERDICT: APPROVE / APPROVE-WITH-CONDITIONS / REJECT
SEVERITY: <highest finding severity>
REQUIRED FIXES: <list; empty when verdict is APPROVE>
```

- `APPROVE` - no open P0/P1, all required items present and verified.
- `APPROVE-WITH-CONDITIONS` - no P0/P1 blocking, but P2/P3 tracked; merge or
  ship may proceed with conditions recorded.
- `REJECT` - at least one P0/P1 finding or a missing required item. State the
  exact required fix.

## 6. Evidence attachment rule

- The verdict record is attached to the card (kanban comment) and referenced
  in the changelog entry for the change.
- The evidence trail (test output, config excerpts, URLs) is stored with the
  artifact it verifies. If evidence cannot be stored, record where it lives.
- A changelog entry for any merged change states the reviewer context id and
  the verdict. A release record states every review verdict that fed it.
- A review that was never recorded never happened.

## 7. Related skills

- `product-standard` - defines the DoR/DoD and artifact set a review checks
- `shipping-gate` - consumes review verdicts in the release record
- `github-standard` - defines the PR workflow reviews run against
