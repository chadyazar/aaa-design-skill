#!/usr/bin/env bash
# weekly-refresh.sh — runs every Monday 05:00 UTC via scheduled remote agent.
# Refreshes brand specs, audits coverage, ingests slop issues, opens PR.
#
# Requirements (provided by the scheduled-agent runtime): bash, git, gh CLI
# authenticated for chadyazar/aaa-design-skill, npx (node), curl.
#
# Exit codes: 0 = nothing to do (no PR), 1 = PR opened, 2 = hard error.

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BRAND_DIR="$REPO_ROOT/references/brand-specs"
PENDING_DIR="$REPO_ROOT/_pending"
TODAY="$(date -u +%Y-%m-%d)"
BRANCH="weekly/refresh-$TODAY"
PR_BODY_FILE="$(mktemp)"
trap 'rm -f "$PR_BODY_FILE"' EXIT

cd "$REPO_ROOT"

# Pull a single brand spec into an isolated tmpdir, return path or empty.
pull_spec() {
  local slug="$1"
  local out
  out="$(mktemp -d)"
  ( cd "$out" && npx -y getdesign@latest add "$slug" >/dev/null 2>&1 ) || true
  if [[ -f "$out/DESIGN.md" ]]; then
    echo "$out/DESIGN.md"
  else
    rm -rf "$out"
    echo ""
  fi
}

# 1) Refresh installed brand specs — capture upstream diffs.
echo ">> [1/5] Refreshing installed brand specs"
REFRESHED=()
for brand_safe_dir in "$BRAND_DIR"/*/; do
  [[ -d "$brand_safe_dir" ]] || continue
  brand_safe="$(basename "$brand_safe_dir")"
  # Reverse safe-name -> upstream slug (replace `-` back to `.` for known dotted slugs).
  case "$brand_safe" in
    linear-app)    slug="linear.app" ;;
    opencode-ai)   slug="opencode.ai" ;;
    mistral-ai)    slug="mistral.ai" ;;
    together-ai)   slug="together.ai" ;;
    x-ai)          slug="x.ai" ;;
    *)             slug="$brand_safe" ;;
  esac
  fresh="$(pull_spec "$slug")"
  if [[ -n "$fresh" ]] && ! cmp -s "$fresh" "$brand_safe_dir/DESIGN.md"; then
    cp "$fresh" "$brand_safe_dir/DESIGN.md"
    REFRESHED+=("$brand_safe")
  fi
  [[ -n "$fresh" ]] && rm -rf "$(dirname "$fresh")"
done

# 2) Discover new brands upstream not yet in brand-specs/.
echo ">> [2/5] Scanning awesome-design-md for new brands"
mkdir -p "$PENDING_DIR"
UPSTREAM_TMP="$(mktemp -d)"
git clone --depth 1 --quiet https://github.com/VoltAgent/awesome-design-md "$UPSTREAM_TMP/repo" 2>/dev/null || true
NEW_BRANDS=()
if [[ -d "$UPSTREAM_TMP/repo/design-md" ]]; then
  for upstream_slug in "$UPSTREAM_TMP/repo/design-md"/*/; do
    slug="$(basename "$upstream_slug")"
    safe="$(echo "$slug" | tr '.' '-')"
    if [[ ! -d "$BRAND_DIR/$safe" ]]; then
      fresh="$(pull_spec "$slug")"
      if [[ -n "$fresh" ]]; then
        mkdir -p "$PENDING_DIR/$safe"
        mv "$fresh" "$PENDING_DIR/$safe/DESIGN.md"
        NEW_BRANDS+=("$safe")
        rm -rf "$(dirname "$fresh")"
      fi
    fi
  done
fi
rm -rf "$UPSTREAM_TMP"

# 3) Ingest slop-labeled GitHub issues opened since last Monday.
echo ">> [3/5] Ingesting slop issues from last 7 days"
SINCE="$(date -u -d '7 days ago' +%Y-%m-%dT%H:%M:%SZ 2>/dev/null || date -u -v-7d +%Y-%m-%dT%H:%M:%SZ)"
SLOP_ISSUES="$(gh issue list --label slop --state all --search "created:>=$SINCE" --json number,title,body 2>/dev/null || echo '[]')"
SLOP_COUNT="$(echo "$SLOP_ISSUES" | python3 -c 'import sys,json; print(len(json.load(sys.stdin)))' 2>/dev/null || echo 0)"

# 4) Reference-hygiene check — flag references/*.md > 400 lines.
echo ">> [4/5] Reference-hygiene check"
OVERSIZE=()
while IFS= read -r f; do
  lines="$(wc -l < "$f")"
  if (( lines > 400 )); then
    OVERSIZE+=("$(basename "$f"):$lines")
  fi
done < <(find "$REPO_ROOT/references" -maxdepth 1 -name '*.md' -type f)

# 5) If anything changed, write CHANGELOG entry, branch, commit, push, open PR.
echo ">> [5/5] Composing PR"
git diff --quiet && git diff --cached --quiet && [[ ${#NEW_BRANDS[@]} -eq 0 ]] && [[ "$SLOP_COUNT" -eq 0 ]] && [[ ${#OVERSIZE[@]} -eq 0 ]] && {
  echo "Nothing to do."
  exit 0
}

git config user.email "scheduled-agent@anthropic.com"
git config user.name  "aaa-design weekly refresh"
git checkout -b "$BRANCH"

# Compose changelog entry.
{
  echo ""
  echo "## $TODAY"
  echo ""
  echo "Weekly refresh."
  echo ""
  if (( ${#REFRESHED[@]} > 0 )); then
    echo "### Brand specs refreshed (upstream diff)"
    for b in "${REFRESHED[@]}"; do echo "- $b"; done
    echo ""
  fi
  if (( ${#NEW_BRANDS[@]} > 0 )); then
    echo "### New brands queued for review (in \`_pending/\`)"
    for b in "${NEW_BRANDS[@]}"; do echo "- $b"; done
    echo ""
  fi
  if [[ "$SLOP_COUNT" -gt 0 ]]; then
    echo "### Slop issues ingested ($SLOP_COUNT)"
    echo "$SLOP_ISSUES" | python3 -c 'import sys,json
for i in json.load(sys.stdin):
    print(f"- #{i[\"number\"]}: {i[\"title\"]}")'
    echo ""
  fi
  if (( ${#OVERSIZE[@]} > 0 )); then
    echo "### Reference files over 400 lines (consider splitting)"
    for o in "${OVERSIZE[@]}"; do echo "- $o"; done
    echo ""
  fi
} >> CHANGELOG.md

# Compose PR body.
{
  echo "## Summary"
  echo ""
  echo "Weekly aaa-design refresh for $TODAY."
  echo ""
  echo "- Brand specs refreshed: ${#REFRESHED[@]}"
  echo "- New brands in \`_pending/\`: ${#NEW_BRANDS[@]}"
  echo "- Slop issues ingested: $SLOP_COUNT"
  echo "- Oversized references: ${#OVERSIZE[@]}"
  echo ""
  echo "## Review checklist"
  echo ""
  echo "- [ ] Diffs in \`references/brand-specs/\` are intentional upstream changes"
  echo "- [ ] \`_pending/\` brands worth promoting into the library"
  echo "- [ ] Slop issues need anti-patterns.md entries"
  echo "- [ ] Oversized references should be split"
} > "$PR_BODY_FILE"

git add -A
git commit -m "weekly: aaa-design refresh $TODAY"
git push -u origin "$BRANCH"
gh pr create --title "weekly: aaa-design refresh $TODAY" --body-file "$PR_BODY_FILE" --base main

exit 1
