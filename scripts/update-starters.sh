#!/usr/bin/env bash
#
# update-starters.sh — hold starter-malene under starters/ oppdatert.
#
# Rapporterer tilgjengelige oppdateringer for hver starter, og kan bumpe
# de trygge avhengighetene automatisk.
#
# Bruk:
#   scripts/update-starters.sh            # bare rapport (ingen endringer)
#   scripts/update-starters.sh --apply    # bump trygge deps + kjør testene
#
# Hva som regnes som "trygt" å bumpe automatisk:
#   - npm (js-jest):   alle devDependencies via npm-check-updates
#   - Python (pytest): nedre grense i pyproject.toml til siste PyPI-release
#   - Maven (kotlin):  test-bibliotekene junit-jupiter og kotest
#
# Hva som flagges for manuell vurdering (rapporteres, men endres ikke):
#   - Maven-plugins (ingen ren pom-redigerende goal finnes)
#   - Kotlin-versjonen (kotlin-stdlib + kotlin-maven-plugin må følges ad,
#     og er pinnet to steder)

set -uo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
STARTERS_DIR="$REPO_ROOT/starters"

APPLY=false
case "${1:-}" in
    --apply) APPLY=true ;;
    -h|--help)
        grep '^#' "$0" | sed 's/^# \{0,1\}//' | sed '1d'
        exit 0 ;;
    "") ;;
    *) echo "Ukjent argument: $1 (se --help)" >&2; exit 2 ;;
esac

# --- Utskrift ---------------------------------------------------------------
hdr()  { printf '\n\033[1m=== %s ===\033[0m\n' "$1"; }
note() { printf '  %s\n' "$1"; }
warn() { printf '  \033[33m! %s\033[0m\n' "$1"; }

MANUAL_NOTES=()
TEST_FAILURES=()

# Velg nyeste tilgjengelige Python — unngå Apples system-Python (3.9).
pick_python() {
    local c
    for c in python3.14 python3.13 python3.12 python3.11 python3.10 python3; do
        if command -v "$c" >/dev/null 2>&1; then
            echo "$c"
            return 0
        fi
    done
    return 1
}

# ===========================================================================
# Kotlin / Maven
# ===========================================================================
update_kotlin() {
    hdr "Kotlin (Maven) — starters/kotlin"
    local dir="$STARTERS_DIR/kotlin"
    if ! command -v mvn >/dev/null; then
        warn "mvn ikke funnet — hopper over."
        return
    fi
    cd "$dir"

    note "Tilgjengelige dependency-oppdateringer:"
    mvn -q versions:display-dependency-updates 2>/dev/null \
        | grep -E '\->' | sed 's/^\[INFO\] */    /' || note "(ingen)"

    note "Tilgjengelige plugin-oppdateringer (manuell):"
    mvn -q versions:display-plugin-updates 2>/dev/null \
        | grep -E '\->' | sed 's/^\[INFO\] */    /' || note "(ingen)"

    MANUAL_NOTES+=("Maven: sjekk plugin-versjoner og Kotlin-versjonen (kotlin-stdlib + kotlin-maven-plugin må bumpes sammen) i starters/kotlin/pom.xml")

    if $APPLY; then
        note "Bumper test-bibliotekene (junit-jupiter, kotest) ..."
        mvn -q versions:use-latest-releases \
            -Dincludes=org.junit.jupiter:junit-jupiter,io.kotest:kotest-assertions-core \
            -DgenerateBackupPoms=false 2>/dev/null \
            && note "OK" || warn "Maven-bump feilet."
    fi
}

# ===========================================================================
# JavaScript / npm
# ===========================================================================
update_js() {
    hdr "JavaScript (npm) — starters/js-jest"
    local dir="$STARTERS_DIR/js-jest"
    if ! command -v npx >/dev/null; then
        warn "npx ikke funnet — hopper over."
        return
    fi
    cd "$dir"

    note "Tilgjengelige oppdateringer:"
    npx --yes npm-check-updates 2>/dev/null | sed 's/^/    /' || warn "ncu feilet."

    if $APPLY; then
        note "Oppdaterer package.json og lockfile ..."
        npx --yes npm-check-updates -u >/dev/null 2>&1 \
            && npm install >/dev/null 2>&1 \
            && note "OK" || warn "npm-oppdatering feilet."
    fi
}

# ===========================================================================
# Python / pytest
# ===========================================================================
update_python() {
    hdr "Python (pytest) — starters/py-pytest"
    local file="$STARTERS_DIR/py-pytest/pyproject.toml"
    local current latest
    current="$(grep -oE 'pytest>=[0-9.]+' "$file" | head -1)"
    note "Nåværende nedre grense: ${current:-ukjent}"

    latest="$(curl -fsSL https://pypi.org/pypi/pytest/json 2>/dev/null | jq -r '.info.version' 2>/dev/null)"
    if [[ -z "$latest" || "$latest" == "null" ]]; then
        warn "Fikk ikke hentet siste pytest-versjon fra PyPI (nettverk?)."
        return
    fi
    note "Siste pytest på PyPI: $latest"

    if $APPLY; then
        if [[ "$current" == "pytest>=$latest" ]]; then
            note "Allerede på siste — ingen endring."
        else
            sed -i '' -E "s/pytest>=[0-9.]+/pytest>=$latest/" "$file"
            note "Bumpet nedre grense til pytest>=$latest"
        fi
    fi
}

# ===========================================================================
# Verifisering — kjør testene etter bump
# ===========================================================================
verify() {
    hdr "Verifiserer (kjører tester)"

    note "Kotlin: mvn test ..."
    ( cd "$STARTERS_DIR/kotlin" && mvn -q test >/dev/null 2>&1 ) \
        && note "Kotlin OK" || { warn "Kotlin-tester FEILET"; TEST_FAILURES+=("kotlin"); }

    note "JavaScript: npm test ..."
    ( cd "$STARTERS_DIR/js-jest" && npm test >/dev/null 2>&1 ) \
        && note "JavaScript OK" || { warn "JavaScript-tester FEILET"; TEST_FAILURES+=("js-jest"); }

    note "Python: pytest ..."
    local py
    if py="$(pick_python)"; then
        ( cd "$STARTERS_DIR/py-pytest" \
            && rm -rf .venv \
            && "$py" -m venv .venv >/dev/null 2>&1 \
            && .venv/bin/pip install -q -U pip >/dev/null 2>&1 \
            && .venv/bin/pip install -q -e '.[dev]' >/dev/null 2>&1 \
            && .venv/bin/pytest -q >/dev/null 2>&1 ) \
            && note "Python OK ($("$py" --version 2>&1))" \
            || { warn "Python-tester FEILET"; TEST_FAILURES+=("py-pytest"); }
    else
        warn "Fant ingen Python-tolk — hopper over."
        TEST_FAILURES+=("py-pytest")
    fi
}

# ===========================================================================
update_kotlin
update_js
update_python

if $APPLY; then
    verify
fi

# --- Oppsummering -----------------------------------------------------------
hdr "Oppsummering"
if ((${#MANUAL_NOTES[@]})); then
    note "Manuell vurdering anbefales:"
    for n in "${MANUAL_NOTES[@]}"; do warn "$n"; done
fi
if $APPLY; then
    if ((${#TEST_FAILURES[@]})); then
        warn "Tester feilet for: ${TEST_FAILURES[*]}"
        note "Se på endringene før du committer (git diff)."
        exit 1
    else
        note "Trygge bumper utført og alle tester grønne."
        note "Gå gjennom git diff, så commit."
    fi
else
    note "Dette var bare en rapport. Kjør med --apply for å bumpe trygge deps."
fi
