#!/usr/bin/env bash

# Script for setting up and activating the Python virtual environment
# Usage: source source-me.bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VENV_DIR="$SCRIPT_DIR/.venv"

if [ ! -d "$VENV_DIR" ]; then
    echo "Creating virtual environment..."
    python3 -m venv "$VENV_DIR"
fi

echo "Activating virtual environment..."
source "$VENV_DIR/bin/activate"

if [ ! -f "$VENV_DIR/.deps_installed" ]; then
    echo "Installing dependencies..."
    pip install --upgrade pip
    pip install -e "$SCRIPT_DIR"
    touch "$VENV_DIR/.deps_installed"
fi

echo "Virtual environment activated. Run 'pytest' to run tests."
