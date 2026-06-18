#!/usr/bin/env bash
#
# zip-kata.sh — pakk en kata som zip og legg den på Desktop.
#
# Lager en zip av en kata-mappe under katas/, uten build- og IDE-rot
# (target/, build/, node_modules/, .venv/ osv.), og legger zip-fila i
# ~/Desktop. Praktisk for å dele en kata med deltakerne på en learning
# hour.
#
# Bruk:
#   scripts/zip-kata.sh [kata-mappe]
#
#   [kata-mappe]  Valgfri. Mappenavn under katas/, f.eks.
#                 "fizzbuzz-2026-06-18". Utelates den, brukes den sist
#                 endrede kataen.
#
# Eksempler:
#   scripts/zip-kata.sh
#   scripts/zip-kata.sh fizzbuzz-2026-06-18

set -euo pipefail

# --- Finn repo-rot (scriptet ligger i <repo>/scripts) -----------------------
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
KATAS_DIR="$REPO_ROOT/katas"
DEST_DIR="$HOME/Desktop"

usage() {
    grep '^#' "$0" | sed 's/^# \{0,1\}//' | sed '1d'
    exit "${1:-0}"
}

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
    usage 0
fi

if [[ ! -d "$KATAS_DIR" ]]; then
    echo "Feil: finner ingen katas/-mappe i $REPO_ROOT" >&2
    exit 1
fi

# --- Velg kata: argument, ellers sist endrede mappe i katas/ ----------------
KATA_NAME="${1:-}"
if [[ -z "$KATA_NAME" ]]; then
    KATA_NAME="$(ls -1t "$KATAS_DIR" 2>/dev/null | head -n1 || true)"
    if [[ -z "$KATA_NAME" ]]; then
        echo "Feil: katas/ er tom — ingenting å pakke." >&2
        exit 1
    fi
    echo "Ingen kata oppgitt — bruker sist endrede: $KATA_NAME"
fi

KATA_DIR="$KATAS_DIR/$KATA_NAME"
if [[ ! -d "$KATA_DIR" ]]; then
    echo "Feil: finner ikke kataen '$KATA_NAME' i $KATAS_DIR" >&2
    echo "Tilgjengelige kataer:" >&2
    ls -1 "$KATAS_DIR" | sed 's/^/  - /' >&2
    exit 1
fi

# --- Pakk zip, hopp over build- og IDE-rot ----------------------------------
ZIP_PATH="$DEST_DIR/${KATA_NAME}.zip"
if [[ -e "$ZIP_PATH" ]]; then
    echo "Erstatter eksisterende $ZIP_PATH"
    rm -f "$ZIP_PATH"
fi

# zip-stiene lagres relativt til katas/, så kataen havner på toppnivå i
# arkivet. Eksluderingsmønstrene matcher disse lagrede stiene.
(
    cd "$KATAS_DIR"
    zip -r -q "$ZIP_PATH" "$KATA_NAME" \
        -x '*/target/*' \
        -x '*/build/*' \
        -x '*/.gradle/*' \
        -x '*/.idea/*' \
        -x '*/node_modules/*' \
        -x '*/.venv/*' \
        -x '*/.pytest_cache/*' \
        -x '*/__pycache__/*' \
        -x '*.egg-info/*' \
        -x '*/.DS_Store'
)

echo "Ferdig. Zip ligger her: $ZIP_PATH"
