# Gilded Rose - TypeScript

TypeScript-implementasjon av Gilded Rose refactoring kata.

## Kom i gang

Installer avhengigheter:

```bash
npm install
```

## Kjøre tester

```bash
npm test                    # Kjør alle tester
npm test -- --watch         # Kjør tester i watch-modus
npm test -- --testPathPattern="gilded-rose"  # Kjør spesifikke tester
```

## Teststruktur

- `test/gilded-rose.spec.ts` - Enkel enhetstest (feiler med "fixme" - din
  oppgave er å fikse den)
- `test/golden-master.spec.ts` - Approval-test som sammenligner output med
  golden master-filen

## Golden master-testing

Golden master-testen sikrer at du ikke endrer eksisterende oppførsel under
refaktorering. Kjør `npm run fixture -- 30` for å se output for 30 dager.

## Bygge prosjektet

```bash
npm run build               # Kompilerer TypeScript til dist/
```

## Neste steg

Se [GildedRoseRequirements.md](../GildedRoseRequirements.md) for kravene.
Start med å skrive tester som dokumenterer nåværende oppførsel, deretter
refaktorer koden gradvis mens du holder testene grønne.
