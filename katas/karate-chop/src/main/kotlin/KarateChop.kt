// TODO: Refaktorer lineært søk til rekursivt binært søk
//
// [ ] 1. Innfør privat hjelpefunksjon chop(target, list, low, high),
//        og deleger til den fra chop() med low=0, high=list.size-1
// [ ] 2. Flytt while-løkken inn i hjelpefunksjonen
// [ ] 3. Innfør mid = (low + high) / 2,
//        og sjekk list[mid] i stedet for list[i]
// [ ] 4. Returner mid med en gang når funnet,
//        og fjern result-variabelen
// [ ] 5. Utnytt sortering: hvis target < list[mid], sett high = mid - 1;
//        ellers sett low = mid + 1 — fjern i++
// [ ] 6. Legg til basiscase øverst: if (low > high) return -1
// [ ] 7. Erstatt while-løkken med to rekursive kall

object KarateChop {
  fun chop(target: Int, list: List<Int>): Int {
    var result = -1
    var i = 0

    while (i < list.size) {
      if (list[i] == target) {
        result = i
      } 
      i++
    }

    return result
  }
}
