#!/bin/sh
# Static check of the baseline: skill and agent structure, version
# consistency, alignment with the French original, and no reference to any
# particular installation. File inspection only: no test run, no network.
set -u
cd "$(dirname "$0")/.." || exit 2
failures=0
ko() { echo "KO   $1"; failures=$((failures + 1)); }
ok() { echo "ok   $1"; }

field() { # field <file> <name>: value of a front-matter field
  awk -v k="$2" 'NR==1 && $0!="---"{exit} NR>1 && $0=="---"{exit} NR>1 && index($0,k": ")==1{sub(k": ",""); print; exit}' "$1"
}

# 1. Skills: front matter with name == folder, and a description.
for f in plugins/*/skills/*/SKILL.md; do
  d=$(basename "$(dirname "$f")")
  [ "$(field "$f" name)" = "$d" ] || ko "$f: name differs from the folder ($d)"
  [ -n "$(field "$f" description)" ] || ko "$f: missing description"
done
ok "skills: $(ls plugins/*/skills/*/SKILL.md | wc -l | tr -d ' ') checked"

# 2. Agents: name == file name, a description, and cited skills that exist.
for f in plugins/*/agents/*.md; do
  n=$(basename "$f" .md)
  [ "$(field "$f" name)" = "$n" ] || ko "$f: name differs from the file"
  [ -n "$(field "$f" description)" ] || ko "$f: missing description"
  plugin=$(echo "$f" | cut -d/ -f2)
  for s in $(field "$f" skills | tr ',' ' '); do
    [ -f "plugins/$plugin/skills/$s/SKILL.md" ] || ko "$f: unknown skill \"$s\""
  done
done
ok "agents: $(ls plugins/*/agents/*.md | wc -l | tr -d ' ') checked"

# 2b. Read-only agents: no Edit; a shell is allowed only with the
#     "Read-only shell" rule of working-principles cited in the body.
for f in plugins/*/agents/*.md; do
  d=$(field "$f" description); t=$(field "$f" tools)
  case "$d" in *"ead-only"*|*"Fixes nothing"*|*"Never triggers it"*|*"Carries out nothing"*)
    case ", $t," in *", Edit,"*) ko "$f: read-only agent with Edit" ;; esac
    case ", $t," in *", Bash,"*) grep -q "Read-only shell" "$f" || ko "$f: shell without the read-only rule" ;; esac ;;
  esac
done
ok "read-only agents"

# 2c. Maintainer check: alignment with the French original (repository
#     "Socle Agents", next to this one, or $SOCLE_FR_PATH): same number of
#     skills, templates and agents. A released version X.Y.Z must translate the
#     French tag vX.Y.Z. Skipped when the original is absent: using or adapting
#     this baseline never needs it.
version=$(cat VERSION)
base=${version%%-*}
fr=${SOCLE_FR_PATH:-../Socle Agents}
counts() { # counts <list of paths>: "skills/templates/agents"
  printf '%s\n' "$1" | awk '
    /^plugins\/socle\/skills\/[^\/]+\/SKILL\.md$/ { s++ }
    /^plugins\/socle\/skills\/.*\.md$/ && !/SKILL\.md$/ { m++ }
    /^plugins\/socle\/agents\/[^\/]+\.md$/ { a++ }
    END { printf "%d/%d/%d", s, m, a }'
}
en_counts="$(ls -d plugins/socle-en/skills/*/ | wc -l | tr -d ' ')/$(find plugins/socle-en/skills -name '*.md' ! -name SKILL.md | wc -l | tr -d ' ')/$(ls plugins/socle-en/agents/*.md | wc -l | tr -d ' ')"
if [ ! -d "$fr/.git" ] && [ ! -f "$fr/.git" ]; then
  echo "--   translation alignment: maintainer check, skipped (no French original at $fr)"
elif [ "$base" = "$version" ]; then
  if git -C "$fr" rev-parse --verify --quiet "v$version^{commit}" >/dev/null; then
    fr_counts=$(counts "$(git -C "$fr" ls-tree -r --name-only "v$version" plugins/socle)")
    [ "$en_counts" = "$fr_counts" ] || ko "translation $en_counts (skills/templates/agents) ≠ French v$version $fr_counts"
    ok "aligned with the French v$version ($en_counts)"
  else
    ko "release $version: the French original has no tag v$version"
  fi
else
  fr_counts=$(cd "$fr" && counts "$(find plugins/socle -name '*.md')")
  [ "$en_counts" = "$fr_counts" ] || ko "translation $en_counts (skills/templates/agents) ≠ French working copy $fr_counts"
  ok "aligned with the French working copy ($en_counts), development $version"
fi

# 3. Relative links of the baseline's Markdown files.
for f in $(find plugins -name '*.md'); do
  for target in $(grep -oE '\]\([^)#:]+\)' "$f" | sed 's/^](//; s/)$//'); do
    [ -e "$(dirname "$f")/$target" ] || ko "$f: broken link to $target"
  done
done
ok "relative links"

# 4. Valid JSON and versions equal to VERSION (single source).
for j in .claude-plugin/marketplace.json plugins/*/.claude-plugin/plugin.json; do
  python3 -I -c 'import json,sys; json.load(open(sys.argv[1]))' "$j" 2>/dev/null || { ko "$j: invalid JSON"; continue; }
  for v in $(grep -oE '"version": *"[^"]+"' "$j" | sed 's/.*"\([^"]*\)"$/\1/'); do
    [ "$v" = "$version" ] || ko "$j: version $v ≠ VERSION $version"
  done
done
ok "manifests and version $version"

# 5. Instructions: CLAUDE.md is only the import of AGENTS.md.
[ "$(tr -d '[:space:]' < CLAUDE.md)" = "@AGENTS.md" ] || ko "CLAUDE.md is not the single @AGENTS.md import"

# 6. Genericity. The baseline names no installation: no personal path, no
#    private IP address, no real domain. Terms specific to a given
#    installation are listed OUTSIDE the repository (otherwise the list would
#    publish them): $SOCLE_FORBIDDEN_TERMS (or $SOCLE_TERMES_INTERDITS), or
#    ~/.config/socle-agents/termes-interdits.txt (one pattern per line).
# The author is named, with their address, only in the author files:
# manifests, LICENSE and README. Single source: plugins/socle-en/.claude-plugin/plugin.json.
author=$(python3 -I -c 'import json,sys; print(json.load(open(sys.argv[1]))["author"]["name"])' plugins/socle-en/.claude-plugin/plugin.json 2>/dev/null)
email=$(python3 -I -c 'import json,sys; print(json.load(open(sys.argv[1]))["author"].get("email",""))' plugins/socle-en/.claude-plugin/plugin.json 2>/dev/null)
[ -n "$author" ] || ko "plugins/socle-en/.claude-plugin/plugin.json: missing author"
for j in .claude-plugin/marketplace.json plugins/*/.claude-plugin/plugin.json; do
  grep -qF "\"name\": \"$author\"" "$j" || ko "$j: author differs from \"$author\""
done
grep -qF "Copyright (c) 2026 $author" LICENSE || ko "LICENSE: holder differs from \"$author\""
ok "author: $author"
except_author() { # drops lines of author files that only carry the author
  awk -v a="$author" -v c="$email" 'BEGIN { FS = ":" }
    { f = $1; sub(/^\.\//, "", f) }
    (f == "LICENSE" || f == "README.md" || f ~ /(^|\/)\.claude-plugin\/(plugin|marketplace)\.json$/) && ((a != "" && index($0, a)) || (c != "" && index($0, c))) { next }
    { print }'
}
search() { grep -rnIE "$1" --exclude-dir=.git --exclude=.git . | except_author || true; }
report() { if [ -n "$2" ]; then ko "$1:"; echo "$2" | sed 's/^/       /'; else ok "no $1"; fi; }
report "personal path" "$(search '(/Users/|/home/)[A-Za-z0-9._-]+')"
report "private IP address" "$(search '\b(10\.[0-9]+|192\.168|172\.(1[6-9]|2[0-9]|3[01]))\.[0-9]+\.[0-9]+\b')"
# Exceptions apply to the line's CONTENT, never to its path: otherwise every
# line of a SKILL.md or an AGENTS.md would escape the check.
report "real domain" "$(search '\b[a-z0-9-]+\.(be|fr|com|net|org|io|dev|test|local)\b' | awk '{ c = $0; sub(/^[^:]*:[0-9]+:/, "", c) } c !~ /(example\.(com|org|net)|(AGENTS|CLAUDE|GEMINI|SKILL)\.md|json\.load)/ { print }')"
terms=${SOCLE_FORBIDDEN_TERMS:-${SOCLE_TERMES_INTERDITS:-$HOME/.config/socle-agents/termes-interdits.txt}}
if [ -f "$terms" ]; then
  pattern=$(grep -vE '^(#|$)' "$terms" | paste -sd'|' -)
  [ -n "$pattern" ] && report "installation-specific term" "$(grep -rniIE "$pattern" --exclude-dir=.git --exclude=.git . | except_author || true)"
else
  echo "--   local list of forbidden terms missing ($terms): partial check"
fi

[ "$failures" -eq 0 ] && echo "GREEN" || { echo "RED ($failures)"; exit 1; }
