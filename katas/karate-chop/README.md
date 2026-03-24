# Karate Chop

Et binært søk (også kalt binary chop) finner posisjonen til en verdi
i en sortert liste. Det oppnår effektivitet ved å halvere antall
elementer som vurderes hver gang: i første runde avgjør det om
søkeverdien befinner seg i øvre eller nedre halvdel av listen. I andre
runde ser det kun på denne halvdelen, og deler igjen. Det stopper når
det finner verdien, eller når det ikke er flere elementer å søke i.

## Oppgaven

Implementer et binært søk (etter spesifikasjonen nedenfor) i valgfri
teknikk. Implementer det deretter på nytt med en helt annen teknikk.
Gjør det samme igjen, til du har fem unike implementasjoner.

For eksempel kan én løsning bruke en tradisjonell iterativ tilnærming,
en annen kan være rekursiv, en tredje kan bruke en funksjonell stil
der man sender array-snitt videre, og så videre.

## Mål

Øvelsen har tre separate mål:

1. Legg merke til hvilke typer feil du gjør mens du koder. Binært søk
   er et yndet arnested for «off by one»-feil og gjerdefeil. Ser du at
   feilfrekvensen synker etter hvert som du arbeider med flere
   teknikker?

2. Hva kan du si om de relative fordelene ved de ulike teknikkene du
   har valgt? Hvilken er mest sannsynlig å havne i produksjonskode?
   Hvilken var morsomst å skrive? Hvilken var vanskeligst å få til å
   fungere? Spør deg selv «hvorfor?» for hvert spørsmål.

3. Det er ganske krevende å komme opp med fem unike tilnærminger. Hvordan
   gikk du frem for å finne tilnærming fire og fem? Hvilke teknikker
   brukte du for å tenke utenfor boksen?

## Spesifikasjon

Skriv en metode for binært søk som tar et heltall som søkemål og en
sortert liste med heltall. Den skal returnere indeksen til målet i
listen, eller -1 hvis målet ikke finnes. Signaturen er:

```
chop(int, array_of_int) -> int
```

Du kan anta at listen har færre enn 100 000 elementer. Ytelse og
minnebruk er ikke et poeng i denne kataen.

## Testdata

Testene forutsetter at listeindekser starter på null.

```kotlin
@Test
fun `chop tests`() {
    chop(3, emptyList()) shouldBe -1
    chop(3, listOf(1))   shouldBe -1
    chop(1, listOf(1))   shouldBe  0

    chop(1, listOf(1, 3, 5)) shouldBe  0
    chop(3, listOf(1, 3, 5)) shouldBe  1
    chop(5, listOf(1, 3, 5)) shouldBe  2
    chop(0, listOf(1, 3, 5)) shouldBe -1
    chop(2, listOf(1, 3, 5)) shouldBe -1
    chop(4, listOf(1, 3, 5)) shouldBe -1
    chop(6, listOf(1, 3, 5)) shouldBe -1

    chop(1, listOf(1, 3, 5, 7)) shouldBe  0
    chop(3, listOf(1, 3, 5, 7)) shouldBe  1
    chop(5, listOf(1, 3, 5, 7)) shouldBe  2
    chop(7, listOf(1, 3, 5, 7)) shouldBe  3
    chop(0, listOf(1, 3, 5, 7)) shouldBe -1
    chop(2, listOf(1, 3, 5, 7)) shouldBe -1
    chop(4, listOf(1, 3, 5, 7)) shouldBe -1
    chop(6, listOf(1, 3, 5, 7)) shouldBe -1
    chop(8, listOf(1, 3, 5, 7)) shouldBe -1
}
```

## Kjøre tester

```bash
mvn test
```

---

_Original kata av Dave Thomas (@PragDave) — <http://codekata.com/kata/kata02-karate-chop/>_
