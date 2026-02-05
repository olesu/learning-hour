<!-- vim: set spelllang=nb: -->
# learning-hour

Et repository med kodeøvelser for læretimer og Samman coaching.

## Kom i gang med Gilded Rose

Gilded Rose er en klassisk refaktoreringskata. Målet er å forbedre
kodestrukturen uten å endre funksjonaliteten.

### Kotlin

Forutsetninger: JDK 17 eller nyere, Gradle (wrapper inkludert)

```bash
cd katas/refactoring/gilded_rose/kotlin
./gradlew test
```

### Python

Forutsetninger: Python 3.9 eller nyere

```bash
cd katas/refactoring/gilded_rose/python
source source-me.bash   # Oppsett (første gang)
pytest                  # Kjør tester
python texttest_fixture.py 30  # Golden master-fixture
```

### TypeScript

Forutsetninger: Node.js 18 eller nyere

```bash
cd katas/refactoring/gilded_rose/typescript
npm install             # Oppsett (første gang)
npm test                # Kjør tester
npm run fixture -- 30   # Golden master-fixture
```

### Neste steg

1. Les kravspesifikasjonen i
   [GildedRoseRequirements.md](katas/refactoring/gilded_rose/GildedRoseRequirements.md)
2. Kjør testene for å verifisere at du ikke bryter
   eksisterende oppførsel
3. Begynn å refaktorere i små steg, og kjør testene etter
   hver endring
