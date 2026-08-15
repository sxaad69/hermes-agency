---
name: github-standard
description: "Hermes Agency GitHub repository standard. Per-product public repos named sxaad69/<product>, branch protection on main, required PRs with reviews and CI, CODEOWNERS, secret scanning and rulesets, .env.example with no secrets, CHANGELOG.md convention, semantic version tags and release notes, Conventional Commits style, the agency-ops repo layout, and backup responsibility with a restore runbook."
version: 1.0.0
author: hermesagency
license: MIT
metadata:
  hermes:
    tags: [github, repository, git, release, changelog, security]
    related_skills: [peer-review, product-standard, shipping-gate]
---

# GitHub Standard

The mechanical standard for how Hermes Agency code, evidence, and releases
live on GitHub. Public by default: code, evidence, and releases are public
unless the board says otherwise.

## 1. Per-product repository creation

- One public repo per product: `sxaad69/<product>`.
- `<product>` is the product's slug (lowercase, hyphens). On renaming a
  product, rename the repo and update every reference.
- Repository settings:
  - Description: one line - what the product does and its current maturity
    level (e.g. "Invoice tooling for freelancers. M3: real integrations,
    sandbox-tested.").
  - Topics: `hermes-agency`, `<product>`, plus the primary domain
    (e.g. `payments`, `billing`).
  - Public visibility unless the board explicitly grants private.
  - A `README.md` with: what it is, maturity level, link to the integration
    matrix, preview URL, known limitations, link to the changelog.

## 2. Branch protection

`main` is protected. Branch protection requires, for every push to `main`:

- Pull request required (no direct pushes)
- At least one approving review from a CODEOWNER or designated reviewer (see
  `peer-review` - no self-approval)
- CI checks passing (required status checks)
- Stale branches dismissed on update
- No force pushes; no deletions

Nothing merges without a PR, CI, and an independent review verdict.

## 3. CODEOWNERS

- Every repo has a `CODEOWNERS` file (default owners = the agency) and a
  `.github/` directory holding it.
- Ownership granularity: top-level default, plus per-area owners for
  `docs/`, `infra/`, and anything security-sensitive.
- At least one owner review is required for every PR via the branch protection
  rule above.

## 4. Secret scanning and rulesets

- **Secret scanning** is enabled on every repo (push protection enabled) at
  the organization level. Pushed secrets are treated as P0 (see `peer-review`).
- **Rulesets**: a `main` ruleset enforces the branch protection requirements
  (required PR, required reviews, required checks) server-side so settings
  cannot silently drift.
- Keys, tokens, and passwords never live in the repo, not even in history.
  Real credentials go in the secret vault and are injected at deploy time.
- On any detected secret: rotate it, scrub history or note the exposure in the
  changelog, and raise a security review.

## 5. .env.example convention

- Every repo ships `.env.example` with ALL variable names that the product
  needs and placeholder values only.
- **No secrets in `.env.example`.** No real keys, tokens, or passwords -
  placeholders like `your-stripe-secret-key` are placeholders, not values.
- The real `.env` is never committed. `.gitignore` includes `.env` and all
  dotenv variants (`.env.*` except `.env.example`).
- Each variable is documented with one line: what it is, which environment
  (dev/sandbox/prod) it belongs to, and whether it is a REAL credential.

## 6. CHANGELOG.md convention

- Every repo has `CHANGELOG.md` in Keep a Changelog format: `Unreleased`
  section on top, then dated version sections.
- Every user-visible change, fix, and integration change gets an entry under
  `Unreleased` at merge time; the entry moves into the version section when
  that version is tagged.
- Every release entry references the peer-review verdict(s) for the release
  (reviewer context id + verdict).
- Entries are factual, dated, and cite artifacts (PR numbers, URLs). No
  marketing language.

## 7. Version tagging and release notes

- Versions use **semantic versioning**: `MAJOR.MINOR.PATCH`. Breaking change
  = MAJOR bump; feature = MINOR; bugfix = PATCH. Pre-1.0 is allowed with
  `0.x.y`.
- A release is: tag + changelog entry + release notes on GitHub.
  - Tag: `v<semver>` (e.g. `v0.3.0`) on the release commit.
  - Release notes: generated from the changelog entry for that version, plus
    the release record summary (`shipping-gate` section 6).
- A preview URL for the release is attached to the release notes when one
  exists.

## 8. Commit message style

Concise Conventional Commits:

- Format: `<type>(<scope>): <short summary>`
- Types: `feat`, `fix`, `docs`, `chore`, `refactor`, `test`, `perf`,
  `security`, `ci`.
- Scope is optional and is the component (e.g. `feat(billing): add prorating`).
- Summary is imperative, lowercase, under ~72 characters.
- The PR body carries the detail, the DoD checklist, and the review verdict
  reference. No secrets, no credentials, no unrelated changes in a commit.

## 9. Agency-ops repo (this repository)

- This repo (`hermesagency`) is the operations home, not a product repo.
- Layout: `skills/` holds the skill playbooks; `charter/` holds the charter;
  `wiki/` holds operational documentation.
- The wiki holds the runbooks, including the backup/restore runbook (section
  10). New skills and charter updates are merged here under the same PR +
  review rules as product repos.

## 10. Backup responsibility

- The kanban database and all repositories are backed up. Backup is a standing
  operational duty, not an afterthought.
- Backups are verified periodically (restore from backup is actually tested),
  and verification is recorded.
- The restore runbook lives in the wiki under `wiki/runbooks/` and names the
  backup locations, cadence, verification steps, and the restore procedure for
  both the kanban DB and each repo.
- On a restore, the event is recorded in the changelog of the affected repo
  and reported in the next board report.

## 11. Related skills

- `peer-review` - the review verdicts a merge and a release must carry
- `product-standard` - the artifact set that lives in these repos
- `shipping-gate` - the release record these tags and changelog entries feed
