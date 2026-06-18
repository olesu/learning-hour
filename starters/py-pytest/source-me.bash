#
# Usage: source source-me.bash
#
# Velger nyeste tilgjengelige Python (helst Homebrew 3.14/3.13), unngår
# Apples system-Python (/usr/bin/python3), og setter opp et venv i editable
# mode klart for kata-arbeid.

_py=""
for _candidate in python3.14 python3.13 python3.12 python3.11 python3.10 python3; do
    if command -v "$_candidate" >/dev/null 2>&1; then
        _py="$_candidate"
        break
    fi
done

if [ -z "$_py" ]; then
    echo "Fant ingen Python-tolk." >&2
    return 1 2>/dev/null || exit 1
fi

echo "Bruker $($_py --version) ($(command -v "$_py"))"

"$_py" -m venv .venv

mkdir -p src tests

source .venv/bin/activate
pip install -U pip
pip install -e ".[dev]"

unset _py _candidate
