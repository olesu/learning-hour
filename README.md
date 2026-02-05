<!-- vim: set spelllang=nb: -->
# learning-hour

Et repository med kodeøvelser for læretimer og Samman coaching.

## Kom i gang med Gilded Rose

Gilded Rose er en klassisk refaktoreringskata. Målet er å forbedre
kodestrukturen uten å endre funksjonaliteten.

### Gilded Rose (Kotlin)

#### Forutsetninger

- JDK 17 eller nyere
- Gradle (wrapper inkludert)

#### Kjør testene

```bash
cd katas/refactoring/gilded_rose/kotlin
./gradlew test
```

### Gilded Rose (Python)

#### Forutsetninger

- Python 3.9 eller nyere

#### Oppsett

```bash
cd katas/refactoring/gilded_rose/python
source source-me.bash
```

#### Kjør testene

```bash
pytest
```

#### Kjør ApprovalTests-fixturen

For å generere eller oppdatere golden master-fila:

```bash
python texttest_fixture.py 30
```

### Neste steg

1. Les kravspesifikasjonen i
   [GildedRoseRequirements.md](katas/refactoring/gilded_rose/GildedRoseRequirements.md)
2. Kjør testene for å verifisere at du ikke bryter
   eksisterende oppførsel
3. Begynn å refaktorere i små steg, og kjør testene etter
   hver endring
