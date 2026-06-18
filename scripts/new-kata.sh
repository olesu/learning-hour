#!/usr/bin/env bash
#
# new-kata.sh — sett opp en ny kata fra en starter-mal.
#
# Kopierer en starter fra starters/ inn i katas/<navn>-<dato>, fjerner
# build- og IDE-rot, og gir Kotlin-testen navn etter kataen.
#
# Bruk:
#   scripts/new-kata.sh <kata-navn> [starter] [dato]
#
#   <kata-navn>  Påkrevd. F.eks. "roman-numerals" (kebab-case anbefales).
#   [starter]    Valgfri. Mappenavn under starters/. Standard: kotlin.
#   [dato]       Valgfri. Standard: dagens dato i YYYY-MM-DD.
#
# Eksempler:
#   scripts/new-kata.sh roman-numerals
#   scripts/new-kata.sh bowling kotlin
#   scripts/new-kata.sh leap-year py-pytest 2026-04-30

set -euo pipefail

# --- Finn repo-rot (scriptet ligger i <repo>/scripts) -----------------------
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
STARTERS_DIR="$REPO_ROOT/starters"
KATAS_DIR="$REPO_ROOT/katas"

usage() {
    grep '^#' "$0" | sed 's/^# \{0,1\}//' | sed '1d'
    exit "${1:-0}"
}

# --- Argumenter -------------------------------------------------------------
if [[ $# -lt 1 || "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
    usage 0
fi

KATA_NAME="$1"
STARTER="${2:-kotlin}"
DATE="${3:-$(date +%Y-%m-%d)}"

# --- Validering -------------------------------------------------------------
SOURCE_DIR="$STARTERS_DIR/$STARTER"
if [[ ! -d "$SOURCE_DIR" ]]; then
    echo "Feil: finner ikke starter '$STARTER' i $STARTERS_DIR" >&2
    echo "Tilgjengelige startere:" >&2
    ls -1 "$STARTERS_DIR" | sed 's/^/  - /' >&2
    exit 1
fi

TARGET_NAME="${KATA_NAME}-${DATE}"
TARGET_DIR="$KATAS_DIR/$TARGET_NAME"
if [[ -e "$TARGET_DIR" ]]; then
    echo "Feil: $TARGET_DIR finnes allerede." >&2
    exit 1
fi

# --- Kopier, og hopp over rot vi uansett ignorerer --------------------------
echo "Kopierer starter '$STARTER' → katas/$TARGET_NAME"
mkdir -p "$KATAS_DIR"
rsync -a \
    --exclude '.idea/' \
    --exclude 'target/' \
    --exclude 'build/' \
    --exclude '.gradle/' \
    --exclude 'node_modules/' \
    --exclude '.venv/' \
    --exclude '.pytest_cache/' \
    --exclude '*.egg-info/' \
    --exclude '.claude/' \
    --exclude '.DS_Store' \
    --exclude '__pycache__/' \
    "$SOURCE_DIR/" "$TARGET_DIR/"

# --- kebab-case → PascalCase (for klasse-/filnavn) --------------------------
to_pascal_case() {
    echo "$1" | awk -F'[-_ ]' '{
        out = ""
        for (i = 1; i <= NF; i++) {
            out = out toupper(substr($i, 1, 1)) substr($i, 2)
        }
        print out
    }'
}

# --- Gi Kotlin-testen navn etter kataen -------------------------------------
KOTLIN_TEST="$TARGET_DIR/src/test/kotlin/TheTest.kt"
if [[ -f "$KOTLIN_TEST" ]]; then
    CLASS_NAME="$(to_pascal_case "$KATA_NAME")Test"
    NEW_TEST="$TARGET_DIR/src/test/kotlin/${CLASS_NAME}.kt"
    sed "s/class TheTest/class ${CLASS_NAME}/" "$KOTLIN_TEST" > "$NEW_TEST"
    rm "$KOTLIN_TEST"
    echo "Testklasse: ${CLASS_NAME} (src/test/kotlin/${CLASS_NAME}.kt)"
fi

echo "Ferdig. Kataen ligger i: katas/$TARGET_NAME"
