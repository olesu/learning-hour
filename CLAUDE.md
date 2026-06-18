# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

This is a learning-hour repository for Samman coaching, containing coding katas and language starters for practice sessions.

## Git Workflow

Push direkte til main — ingen PRs.

## Creating a New Kata

Run `scripts/new-kata.sh <kata-navn> [starter] [dato]` to scaffold a new kata
by copying a starter from `starters/` into `katas/<navn>-<dato>`. Defaults to
the `kotlin` starter and today's date (`YYYY-MM-DD`). See the `new-kata` skill.

## Documentation

All documentation (markdown files) should be written in Norwegian. Exception: references to original kata authors and attributions should be in English.

Markdown files should have a maximum line length of 80 characters.

Do not use duplicate headings in markdown files.

## Python

Always use virtual environments when working with Python. Create them with:
```bash
python3 -m venv .venv
```

## Project Structure

- `starters/` - Language starter templates for new exercises
- `katas/` - Coding exercises (git-ignored; throw-away practice work)

## Build and Test Commands

### Kotlin Starter (Maven)
```bash
cd starters/kotlin
mvn test                    # Run all tests
mvn test -Dtest=ExampleTest # Run single test class
```

### JavaScript Starter (Jest)
```bash
cd starters/js-jest
npm test                    # Run all tests
npm test -- --testPathPattern="example"  # Run tests matching pattern
```

### Python Starter (pytest)
```bash
cd starters/py-pytest
source source-me.bash       # First-time setup (creates venv, installs deps)
source .venv/bin/activate   # Activate venv
pytest                      # Run all tests
pytest tests/test_example.py::test_name  # Run single test
```
