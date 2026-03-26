// TODO: Refaktorer lineært søk til rekursivt binært søk
//
// [ ] 1. Innfør privat hjelpefunksjon chop(target, list, low, high),
//        og deleger til den fra chop() med low=0, high=list.size-1
// [ ] 2. Flytt while-løkken inn i hjelpefunksjonen
// [ ] 3. Endre løkkebetingelsen til low <= high.
//        Legg til val mid = (low + high) / 2 øverst i løkkekroppen.
//        Bytt list[i] med list[mid], og result = i med result = mid.
//        Bytt i++ med: hvis target < list[mid], sett high = mid - 1;
//        ellers sett low = mid + 1. Bruk if/else så innsnevringen
//        bare skjer når target ikke er funnet.
// [ ] 4. Bytt while-løkken med if (low <= high).
//        Bytt high = mid - 1 med result = chop(target, list, low, mid - 1).
//        Bytt low = mid + 1 med result = chop(target, list, mid + 1, high).

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
