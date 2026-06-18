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
3. Hvis kataen er en kjent øvelse, så frø en `README.md` med reglene
   (se under).
4. Bekreft hvor kataen ble lagt, og at brukeren kan begynne å jobbe.

Ikke commit kataen automatisk med mindre brukeren ber om det.

## Frø en README med reglene

Foretrekk kata-beskrivelsene fra Samman Coaching:
<https://sammancoaching.org/kata_descriptions/>. De er kjente
standardøvelser, og det å hente reglene derfra slipper gruppa å lete
selv — og hindrer at du gjetter på detaljer.

Hver kata har en egen side med mønsteret
`https://sammancoaching.org/kata_descriptions/<slug>.html`. Eksempler på
slugs: `bank_account`, `leap_years`, `fizzbuzz`, `mars_rover`, `tennis`,
`gilded_rose`, `diamond`, `word_wrap`, `yatzy`, `string_calculator`,
`tire_pressure`, `trip_service`. Hele lista (alfabetisk) ligger på
oversiktssiden over.

Etter at scriptet har kjørt:

1. **Finn riktig kata-side.** Slå opp kataen på oversiktssiden og hent
   den individuelle siden med `WebFetch`. Hvis du er usikker på slug-en,
   så hent oversiktssiden først og finn lenka der.
2. **Skriv `katas/<navn>-<dato>/README.md`** på norsk, basert på den
   hentede beskrivelsen:
   - En kort beskrivelse av hva kataen går ut på.
   - Konkrete krav/regler, gjerne som punktliste eller eksempler.
   - Forslag til en første liten testcase (det enkleste steget) for å
     komme i gang med Red-Green-Refactor.
   - Lenke til kilden nederst (URL-en til kata-siden).
3. Følg repoets markdown-regler: norsk tekst, maks 80 tegn per linje,
   ingen dupliserte overskrifter. Behold opphavsperson/attribusjon på
   engelsk hvis du nevner den.
4. Ikke overskriv en README som allerede finnes — spør først.

Hvis kataen ikke finnes på Samman Coaching og du ikke kjenner reglene
sikkert, så lag ikke en README med gjettede regler. Spør heller
brukeren om en kort beskrivelse, eller la mappa være uten README.
