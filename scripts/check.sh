#!/bin/sh
# Fixture lint + mirror sync check (POSIX shell / CI).
#
# Dev hygiene only — lives at repo root so it NEVER ships with `npx skills`
# installs (only skills/humanize-skills/ installs). Run from github-repo/:
#   sh scripts/check.sh
# Exit code 0 = clean, 1 = problems found.
# Verified under WSL (dash). Pipe-to-while loops report via $tmpfail because
# FAIL assignments inside pipelines would die in a subshell.

fail=0
say_fail() { echo "FAIL: $1"; fail=1; }
tmpfail=$(mktemp)
trap 'rm -f "$tmpfail"' EXIT INT TERM
pipe_fail() { echo "FAIL: $1"; echo x >> "$tmpfail"; }

ROOT=$(cd "$(dirname "$0")/.." && pwd)
SRC="$ROOT/skills/humanize-skills"

# --- 1. Fixture lint ---
count=0
for f in "$SRC"/references/examples/*.md; do
  name=$(basename "$f")
  case "$name" in README.md|CHANGELOG.md|BLIND-RESULTS.md) continue;; esac
  count=$((count + 1))
  grep -q 'model-authored, unreviewed' "$f" || say_fail "$name: missing unreviewed status banner"
  for section in '\*\*Setup:\*\*' '\*\*Input:\*\*' '\*\*Expected decisions:\*\*' \
                 '\*\*Reference "after":\*\*' '\*\*Blind forced-choice answer key:\*\*' \
                 '\*\*A regression here looks like:\*\*'; do
    grep -q "$section" "$f" || say_fail "$name: missing section $section"
  done
  if grep -q 'No-edit gate:.*triggered' "$f"; then
    grep -q 'over-edited version' "$f" || say_fail "$name: no-edit case without over-edited foil"
  fi
  if grep -q 'TODO\|FIXME' "$f"; then
    echo "NOTE: $name contains a TODO marker (check if intentional)"
  fi
done
echo "linted $count fixture files."

# --- 2. Mirror sync (only when the full project layout is present) ---
PROJECT=$(cd "$ROOT/.." && pwd)
for label in "github-repo:$PROJECT/github-repo/skills/humanize-skills" \
             "claude-upload:$PROJECT/claude-upload/humanize-skills"; do
  name=${label%%:*}; dst=${label#*:}
  [ -d "$dst" ] || continue
  (cd "$SRC" && find . -type f) | while read -r rel; do
    if [ ! -f "$dst/$rel" ]; then
      pipe_fail "[$name] missing file: $rel"
    elif ! cmp -s "$SRC/$rel" "$dst/$rel"; then
      pipe_fail "[$name] content differs: $rel"
    fi
  done
done
echo 'mirror check done.'

# --- 3. Agent Skills spec validation (mirrors skills-ref validate) ---
skill="$SRC/SKILL.md"
front=$(awk '/^---$/{n++; if (n==1) next; if (n==2) exit} n==1' "$skill")
echo "$front" | grep -q '^name: humanize-skills\s*$' || say_fail 'frontmatter name must be humanize-skills (match directory)'
if echo "$front" | grep -Eq '^name: [a-z0-9]+(-[a-z0-9]+)*\s*$'; then :; else
  say_fail 'name must be 1-64 chars of lowercase alnum/hyphens'
fi
desc=$(awk '/^description: *>- *$/{fold=1; next} fold==1 && /^  /{sub(/^  /, ""); printf "%s ", $0; next} fold==1{fold=0} END{}' "$skill" | tr -s ' ' | sed 's/ $//')
dlen=$(printf '%s' "$desc" | wc -c | tr -d ' ')
[ "$dlen" -ge 1 ] && [ "$dlen" -le 1024 ] || say_fail "description length $dlen, must be 1-1024"
case "$desc" in *'<'*'>'*) say_fail 'description must not contain XML tags';; esac
bad=$(echo "$front" | grep -E '^[A-Za-z-]+:' | cut -d: -f1 | grep -Ev '^(name|description|license|compatibility|metadata|allowed-tools)$' || true)
[ -z "$bad" ] || say_fail "unrecognized frontmatter field(s): $bad"
body=$(($(wc -l < "$skill" | tr -d ' ') - $(printf '%s' "$front" | wc -l | tr -d ' ') - 2))
[ "$body" -lt 500 ] || say_fail "SKILL.md body $body lines, keep under 500"
echo "spec check done (description $dlen/1024, body $body lines)."

# --- 4. Reference + flag integrity ---
# Same scoping as check.ps1: _legacy-calibration.md frozen; similar-github-projects
# paragraphs document external layouts; voice-profile.md is a documented future path.
find "$SRC" -name '*.md' ! -name '_legacy-calibration.md' | while read -r f; do
  # Paragraph-scope exemption: drop blank-line blocks mentioning
  # similar-github-projects (they document external repo layouts).
  awk 'BEGIN{RS=""; ORS="\n"} !/similar-github-projects/' "$f" | grep -o -E '(references/[A-Za-z0-9_./-]+\.md|(modes|tones|examples)/[A-Za-z0-9_.-]+\.md)' | sort -u | while read -r rel; do
    case "$rel" in references/voice-profile.md) continue;; esac
    case "$rel" in references/*) tgt="$SRC/$rel";; *) tgt="$SRC/references/$rel";; esac
    [ -f "$tgt" ] || pipe_fail "$(basename "$f"): broken link $rel"
  done
done
echo 'integrity check done.'
card="$SRC/references/language-rhythm.md"
[ -f "$card" ] || say_fail 'references/language-rhythm.md missing'
for l in "$SRC"/references/languages/*.md; do
  base=$(basename "$l")
  case "$base" in _template.md|_legacy-calibration.md) continue;; esac
  grep -qF "\`languages/$base\`" "$card" || say_fail "language-rhythm.md: no pointer row for $base"
done
echo 'card coverage check done.'
descflags=$(sed -n '/^description:/,/^---$/p' "$skill" | grep -o -E '\-\-[a-z]+' | sed 's/^--//' | sort -u)
bodyflags=$(awk 'BEGIN{c=0} /^---$/{c++; next} c>=2' "$skill" | grep -o -E '\-\-[a-z]+' | sed 's/^--//' | sort -u)
for fl in $descflags; do
  echo "$bodyflags" | grep -qx "$fl" || say_fail "flag --$fl in description but no --$fl* in SKILL body"
done

[ -s "$tmpfail" ] && fail=1
if [ "$fail" -eq 0 ]; then echo 'OK: all checks passed.'; else echo 'CHECKS FAILED — see FAIL lines above.'; fi
exit "$fail"
