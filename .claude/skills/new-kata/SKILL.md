---
name: new-kata
description: Sett opp en ny kata ved å kopiere en starter-mal inn i katas/ med navn og dato. Bruk når brukeren vil starte en ny kata, øvelse eller "lage en kata" (f.eks. "ny kata", "start roman numerals", "lag en bowling-kata i kotlin").
---

# Ny kata

Setter opp en ny kata-mappe fra en starter-mal under `starters/`.
Kjør scriptet `scripts/new-kata.sh` fra repo-rot.

## Bruk

```bash
scripts/new-kata.sh <kata-navn> [starter] [dato]
```

- `<kata-navn>` — påkrevd, kebab-case anbefales (f.eks. `roman-numerals`).
- `[starter]` — mappenavn under `starters/`. Standard: `kotlin`.
  Tilgjengelige: `kotlin`, `js-jest`, `py-pytest`.
- `[dato]` — standard er dagens dato i `YYYY-MM-DD`.

Resultatet havner i `katas/<kata-navn>-<dato>`.

## Hva scriptet gjør

1. Kopierer valgt starter, men hopper over build- og IDE-rot
   (`.idea/`, `target/`, `build/`, `node_modules/`, `.venv/`,
   `.pytest_cache/`, `*.egg-info/`, `.claude/`, `.DS_Store`).
2. For Kotlin-starteren: gir testen navn etter kataen
   (f.eks. `TheTest` → `RomanNumeralsTest`).

## Slik gjør du det

1. Spør brukeren om navn og evt. starter/dato hvis det ikke er oppgitt.
2. Kjør scriptet, f.eks.:
   ```bash
   scripts/new-kata.sh roman-numerals
   ```
3. Bekreft hvor kataen ble lagt, og at brukeren kan begynne å jobbe.

Ikke commit kataen automatisk med mindre brukeren ber om det.
