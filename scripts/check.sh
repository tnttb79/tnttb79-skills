#!/usr/bin/env bash
set -uo pipefail

cd "$(dirname "$0")/.."
status=0
fail() { echo "FAIL $1: $2"; status=1; }

check_skill() {
  local dir=$1 name file front fname desc lines
  name="$(basename "$dir")"
  file="${dir}SKILL.md"
  if [ ! -f "$file" ]; then
    fail "$name" "no SKILL.md"
    return
  fi
  if [ "$(head -n 1 "$file")" != "---" ]; then
    fail "$name" "SKILL.md must start with --- frontmatter"
    return
  fi
  front="$(awk 'NR > 1 && /^---$/ { exit } NR > 1 { print }' "$file")"
  fname="$(printf '%s\n' "$front" | sed -n 's/^name:[[:space:]]*//p' | head -n 1)"
  desc="$(printf '%s\n' "$front" | sed -n 's/^description:[[:space:]]*//p' | head -n 1)"
  [ "$fname" = "$name" ] || fail "$name" "frontmatter name '$fname' does not match the folder"
  printf '%s' "$name" | grep -Eq '^[a-z0-9]+(-[a-z0-9]+)*$' || fail "$name" "name must be lower-case letters, digits and single hyphens"
  [ "${#name}" -le 64 ] || fail "$name" "name is over 64 characters"
  case "$desc" in
    "") fail "$name" "description is missing" ;;
    ">"* | "|"*) fail "$name" "keep the description on one line" ;;
    *": "*) fail "$name" "description contains ': ', which breaks YAML unless quoted" ;;
  esac
  [ "${#desc}" -le 1024 ] || fail "$name" "description is ${#desc} characters, over 1024"
  lines="$(wc -l < "$file" | tr -d ' ')"
  [ "$lines" -le 500 ] || fail "$name" "SKILL.md has $lines lines, over 500"
  grep -q "\`$name\`" README.md || fail "$name" "missing from the README table"
}

scan_markdown() {
  find skills evals README.md AGENTS.md -name '*.md' 2>/dev/null | while IFS= read -r md; do
    case "$md" in
      */SKILL.md) ;;
      *)
        lines="$(wc -l < "$md" | tr -d ' ')"
        [ "$lines" -le 300 ] || echo "FAIL $md: $lines lines, over 300"
        ;;
    esac
    dir="$(dirname "$md")"
    grep -o '\]([^)]*)' "$md" | sed 's/^](//; s/)$//; s/#.*//' | while IFS= read -r link; do
      case "$link" in
        "" | http://* | https://* | mailto:*) continue ;;
      esac
      [ -e "$dir/$link" ] || echo "FAIL $md: broken link $link"
    done
  done
}

for dir in skills/*/; do
  check_skill "$dir"
done

for script in skills/*/scripts/*; do
  [ -f "$script" ] || continue
  case "$(head -n 1 "$script")" in
    *bash* | */sh*) bash -n "$script" || fail "$script" "shell syntax error" ;;
  esac
done

problems="$(scan_markdown)"
if [ -n "$problems" ]; then
  echo "$problems"
  status=1
fi

personal="$(grep -rInE '/Users/[^/ ]+|/home/[^/ ]+' skills || true)"
if [ -n "$personal" ]; then
  echo "$personal"
  fail skills "personal paths above"
fi

dash="$(printf '\342\200\224')"
dashes="$(grep -rn "$dash" skills/*/assets 2>/dev/null || true)"
if [ -n "$dashes" ]; then
  echo "$dashes"
  fail assets "em dashes above; templates are copied into projects"
fi

if [ "$status" -eq 0 ]; then
  echo "check.sh: all checks passed"
else
  echo "check.sh: failures above"
fi
exit "$status"
