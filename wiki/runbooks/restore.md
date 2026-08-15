# Restore Runbook

Disaster recovery for the Hermes Agency operating system.

## What is backed up

| Data | Where | Frequency |
|---|---|---|
| Hermes config, state, sessions, kanban DB, cron, profiles | `sxaad69/hermes-backups` (private), snapshot tarballs | Daily 03:00 (job `backup-daily`) |
| Agency-ops repo (charter, skills, wiki, templates) | `sxaad69/hermes-agency` (public) | On every commit |
| Product repos (code) | `sxaad69/{agentscope,crossstate,nomarkup}` (public) | On every merge |

## Restore a Hermes snapshot

1. `git clone https://github.com/sxaad69/hermes-backups.git ~/hermes-backups`
2. Pick the newest `backup-*.tar.gz` (`ls -t ~/hermes-backups/backup-*.tar.gz | head -1`).
3. `tar xzf <tarball>` and copy the snapshot's contents into `~/.hermes/`
   (config.yaml, state.db, kanban.db, kanban/, profiles, cron/, auth.json,
   gateway_state.json), then restart the gateway.

## Rebuild a product repo after data loss

The product code lives on GitHub at `sxaad69/<product>`; a fresh clone + the
product README's `Run` section is the source of truth. Any local DB (e.g.
`nomarkup/data/nomarkup.db`) is regenerable via the seed scripts.

## After restore

- Verify `hermes mcp list` (github/context7/postgres/playwright) and `hermes status`.
- Verify `hermes cron list` — the backup job and rituals must be present.
- Push a new snapshot to confirm the pipeline works end to end.
