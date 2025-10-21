#
# Usage: source source-me.bash
#
python3 -mvenv .venv

mkdir -p src tests

source .venv/bin/activate
pip install -U pip
pip install -e ".[dev]"
