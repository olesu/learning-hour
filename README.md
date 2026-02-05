<!-- vim: set spelllang=nb: -->
# learning-hour

Et repository med kodeøvelser for læretimer og Samman coaching.

## Kom i gang med Gilded Rose (Kotlin)

Gilded Rose er en klassisk refaktoreringskata. Målet er å forbedre
kodestrukturen uten å endre funksjonaliteten.

### Forutsetninger

- JDK 17 eller nyere
- Gradle (wrapper inkludert)

### Kjør testene

```bash
cd katas/refactoring/gilded_rose/kotlin
./gradlew test
```

### Neste steg

1. Les kravspesifikasjonen i
   [GildedRoseRequirements.md](katas/refactoring/gilded_rose/GildedRoseRequirements.md)
2. Kjør `GoldenMasterTest` for å verifisere at du ikke bryter
   eksisterende oppførsel
3. Begynn å refaktorere `GildedRose.kt` i små steg, og kjør testene
   etter hver endring
