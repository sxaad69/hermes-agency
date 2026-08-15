#!/bin/bash
# Hermes Agency skill-completeness audit.
# Checks that every global skill is resolvable from every profile and that
# each resolves to a real skill dir with SKILL.md. Auto-fixes drift by
# re-pointing symlinks into the global skills dir.
# Exit 0 = healthy. Exit 1 = drift detected and/or SKILL.md missing.
# Run via hermes cron daily (no-agent, stdout delivered to Telegram).

set -u

HERMES_ROOT="${HERMES_ROOT:-$HOME/.hermes}"
SKILLS_GLOBAL="$HERMES_ROOT/skills"
PROFILES_DIR="$HERMES_ROOT/profiles"
PROFILES="${SKILL_AUDIT_PROFILES:-ceo design engineering marketing qa research strategy}"

fixed=0
errors=0

if [ ! -d "$SKILLS_GLOBAL" ]; then
  echo "SKILL-AUDIT-FAIL: global skills dir missing: $SKILLS_GLOBAL"
  exit 1
fi

global_skills=$(ls -1 "$SKILLS_GLOBAL" 2>/dev/null)
if [ -z "$global_skills" ]; then
  echo "SKILL-AUDIT-FAIL: no skills found in $SKILLS_GLOBAL"
  exit 1
fi
global_count=$(printf '%s\n' "$global_skills" | wc -l | tr -d ' ')

# Verify every global skill is a real skill dir: a standalone skill (SKILL.md),
# a bundle (DESCRIPTION.md), or a dir containing nested skills (nested SKILL.md).
for s in $global_skills; do
  if [ -f "$SKILLS_GLOBAL/$s/SKILL.md" ] || [ -f "$SKILLS_GLOBAL/$s/DESCRIPTION.md" ]; then
    :
  elif find "$SKILLS_GLOBAL/$s" -maxdepth 2 -name 'SKILL.md' | grep -q .; then
    :
  else
    echo "DRIFT: global skill '$s' has no SKILL.md, DESCRIPTION.md, or nested skills"
    errors=$((errors + 1))
  fi
done

for p in $PROFILES; do
  pdir="$PROFILES_DIR/$p/skills"
  if [ ! -d "$pdir" ]; then
    echo "DRIFT: profile '$p' skills dir missing ($pdir)"
    errors=$((errors + 1))
    continue
  fi

  for s in $global_skills; do
    entry="$pdir/$s"
    if [ ! -e "$entry" ]; then
      ln -sfn "$SKILLS_GLOBAL/$s" "$entry"
      echo "FIXED: '$p' missing skill '$s' -> linked"
      fixed=$((fixed + 1))
      continue
    fi

    if [ -L "$entry" ]; then
      target=$(readlink "$entry")
      if [ ! -d "$target" ]; then
        if [ -d "$SKILLS_GLOBAL/$s" ]; then
          ln -sfn "$SKILLS_GLOBAL/$s" "$entry"
          echo "FIXED: '$p' broken symlink '$s' ($target) -> re-linked to global"
          fixed=$((fixed + 1))
        else
          echo "DRIFT: '$p' skill '$s' broken symlink -> $target (no global fallback)"
          errors=$((errors + 1))
        fi
      fi
    fi
  done

  # Report any stray profile skills that are broken and have no global counterpart.
  for s in $(ls -1 "$pdir" 2>/dev/null); do
    entry="$pdir/$s"
    if [ -L "$entry" ] && [ ! -d "$(readlink "$entry")" ] && ! printf '%s\n' "$global_skills" | grep -qx "$s"; then
      echo "DRIFT: '$p' skill '$s' broken symlink, no global fallback -> $(readlink "$entry")"
      errors=$((errors + 1))
    fi
  done
done

if [ "$errors" -gt 0 ]; then
  echo "SKILL-AUDIT-FAIL: ${errors} drift item(s), ${fixed} auto-fixed. profiles=${PROFILES// /,} x ${global_count} skills"
  exit 1
fi

if [ "$fixed" -gt 0 ]; then
  echo "SKILL-AUDIT-OK (auto-fixed ${fixed}): ${PROFILES// /,} x ${global_count} skills complete"
else
  echo "SKILL-AUDIT-OK: ${PROFILES// /,} x ${global_count} skills complete"
fi
exit 0
