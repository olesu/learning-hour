---
name: update-starters
description: Sjekk og oppdater avhengighetene i starter-malene under starters/ (Maven, npm, pytest). Bruk når brukeren vil holde starterne oppdatert, bumpe dependencies, eller spør "er starterne up to date" (f.eks. "oppdater starterne", "bump dependencies", "update starters").
---

# Oppdater starters

Holder starter-malene under `starters/` oppdatert. Kjør
`scripts/update-starters.sh` fra repo-rot.

## Bruk

```bash
scripts/update-starters.sh            # bare rapport (ingen endringer)
scripts/update-starters.sh --apply    # bump trygge deps + kjør testene
```

## Hva scriptet gjør

Rapporterer tilgjengelige oppdateringer for alle tre starterne. Med
`--apply` bumpes det som er trygt, og testene kjøres for å verifisere grønt.

**Bumpes automatisk (trygt):**

- npm (`js-jest`): alle devDependencies via `npm-check-updates` + ny lockfile.
- Python (`py-pytest`): nedre grense for `pytest` i `pyproject.toml`.
- Maven (`kotlin`): test-bibliotekene `junit-jupiter` og `kotest`.

**Flagges for manuell vurdering (rapporteres, endres ikke):**

- Maven-plugins (ingen ren pom-redigerende goal finnes).
- Kotlin-versjonen — `kotlin-stdlib` og `kotlin-maven-plugin` er pinnet to
  steder og må bumpes sammen i `starters/kotlin/pom.xml`.

## Merknader

- Python-verifisering bruker nyeste tilgjengelige tolk (helst Homebrew
  3.14/3.13), ikke Apples system-Python.
- Maven-rapporten (`display-dependency-updates`) kan under-rapportere;
  `--apply` finner av og til nyere test-libs likevel. Testene fanger feil.

## Slik gjør du det

1. Kjør først uten `--apply` og vis brukeren rapporten.
2. Hvis brukeren vil oppdatere: kjør med `--apply`.
3. Gå gjennom `git diff`, nevn evt. manuelle punkter (plugins/Kotlin), og
   commit hvis brukeren vil. Ikke commit automatisk uten at brukeren ber om det.
