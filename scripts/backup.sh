#!/bin/bash
# Hermes Agency offsite backup: critical state -> private repo.
# Self-contained: creates a hermes snapshot, tars it, pushes to the private
# backup repo. Run via hermes cron daily (no-agent, stdout delivered).
# Restore steps in wiki/runbooks/restore.md

set -e
HERMES="${HERMES_BIN:-hermes}"
OUTDIR="${BACKUP_OUTDIR:-$HOME/hermes-backups}"
mkdir -p "$OUTDIR"

# 1. Create a snapshot of critical hermes state (config, state.db, .env, cron).
"$HERMES" backup -q -l daily >/dev/null 2>&1 || echo "snapshot step failed (non-fatal: using existing snapshot)"

# 2. Take the most recent snapshot dir.
SNAPDIR=$(ls -dt ~/.hermes/state-snapshots/*/ 2>/dev/null | head -1 | sed 's:/$::')
if [ -z "$SNAPDIR" ]; then
  echo "no snapshots found"
  exit 1
fi
SNAPNAME=$(basename "$SNAPDIR")
TARBALL="$OUTDIR/backup-${SNAPNAME}.tar.gz"

# 3. Tar it (skip if the same snapshot was already pushed).
if [ -f "$TARBALL" ]; then
  echo "backup ok: $TARBALL (already present)"
  exit 0
fi

tar -C "$(dirname "$SNAPDIR")" -czf "$TARBALL" "$SNAPNAME"

# 4. Commit and push to the private backup repo.
cd "$OUTDIR"
if [ ! -d .git ]; then
  echo "backup dir not a git repo: $OUTDIR"
  exit 1
fi
git add -A
git -c user.name=sxaad69 -c user.email=xsaad69@gmail.com \
  commit -q -m "backup ${SNAPNAME}" --allow-empty
git push -q origin main

# 5. Keep the last 30 tarballs.
ls -1t backup-*.tar.gz 2>/dev/null | tail -n +31 | xargs -r rm -f
echo "backup ok: $TARBALL"
