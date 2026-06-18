---
name: zip-kata
description: Pakk en kata som zip og legg den på Desktop for deling. Bruk når brukeren vil distribuere, dele eller "zippe" en kata til deltakerne (f.eks. "zip kataen", "pakk fizzbuzz", "legg kataen på Desktop").
---

# Zip kata

Pakker en kata-mappe under `katas/` til en zip på `~/Desktop`, uten
build- og IDE-rot (`target/`, `build/`, `node_modules/`, `.venv/` osv.).
Praktisk for å dele en kata med deltakerne på en learning hour.

Kjør scriptet `scripts/zip-kata.sh` fra repo-rot.

## Bruk

```bash
scripts/zip-kata.sh [kata-mappe]
```

- `[kata-mappe]` — mappenavn under `katas/`, f.eks.
  `fizzbuzz-2026-06-18`. Utelates det, brukes den sist endrede kataen.

Zip-fila havner i `~/Desktop/<kata-mappe>.zip`.

## Hva scriptet gjør

1. Velger kata fra argumentet, eller den sist endrede mappa i `katas/`
   hvis ingenting er oppgitt.
2. Pakker mappa som zip på toppnivå i arkivet, og hopper over build- og
   IDE-rot (`target/`, `build/`, `.gradle/`, `.idea/`, `node_modules/`,
   `.venv/`, `.pytest_cache/`, `__pycache__/`, `*.egg-info/`,
   `.DS_Store`).
3. Erstatter en eventuell eksisterende zip med samme navn.

## Slik gjør du det

1. Hvis brukeren har oppgitt en kata, send den som argument. Ellers kan
   du la scriptet velge den sist endrede.
2. Kjør scriptet, f.eks.:
   ```bash
   scripts/zip-kata.sh fizzbuzz-2026-06-18
   ```
3. Bekreft hvor zip-fila ble lagt.
