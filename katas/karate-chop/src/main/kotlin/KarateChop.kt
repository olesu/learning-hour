// TODO: Refaktorer lineært søk til rekursivt binært søk
//
// [ ] 1. Refaktorer til iterativt binærsøk i chop():
//        Gjør low og high om til var. Legg til val mid = (low + high) / 2
//        inne i løkken. Bytt list[i] med list[mid], result = i med result = mid.
//        Legg til if/else: high = mid - 1 hvis target < list[mid], ellers low = mid + 1.
//        Fjern var i og i++. Endre løkkebetingelsen til low <= high.
// [ ] 2. Ekstraher kroppen av chop() til privat chop(target, list, low, high),
//        og deleger til den fra chop().
// [ ] 3. Bytt while-løkken med if (low <= high).
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
