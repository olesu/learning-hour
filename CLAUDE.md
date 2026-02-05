# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

This is a learning-hour repository for Samman coaching, containing coding katas and language starters for practice sessions.

## Project Structure

- `starters/` - Language starter templates for new exercises
- `katas/` - Coding exercises organized by category (e.g., `katas/refactoring/gilded_rose/`)

## Build and Test Commands

### Gilded Rose Kata

Each language has its own subdirectory under `katas/refactoring/gilded_rose/`.

**Kotlin (Gradle):**
```bash
cd katas/refactoring/gilded_rose/kotlin
./gradlew test              # Run all tests
./gradlew test --tests "com.gildedrose.GildedRoseTest"  # Run single test class
```

### Starters

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

## Gilded Rose Kata

The original Samman Coaching repository is cloned at `../gilded_rose` (outside this repo). Use it as a reference when creating new language implementations.

The Gilded Rose kata uses golden master testing for safe refactoring. Each language implementation has its own golden master file (e.g., `katas/refactoring/gilded_rose/kotlin/src/test/resources/golden-master-30-days.txt` for Kotlin). See `katas/refactoring/gilded_rose/GildedRoseRequirements.md` for the full specification.
