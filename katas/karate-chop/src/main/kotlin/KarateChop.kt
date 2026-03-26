// TODO: Refaktorer lineært søk til rekursivt binært søk
//
// [ ] 1. Innfør val low = 0 og val high = list.size - 1 i chop().
//        Bytt var i = 0 med var i = low, og i < list.size med i <= high.
// [ ] 2. Ekstraher while-løkken til privat chop(target, list, low, high),
//        og deleger til den fra chop().
// [ ] 3. Bytt while-løkken med if (low <= high).
//        Bytt list[i] med list[low] og result = i med result = low.
//        Bytt i++ med result = chop(target, list, low + 1, high).
//        Fjern var i.
// [ ] 4. Legg til val mid = (low + high) / 2.
//        Bytt list[low] med list[mid] og result = low med result = mid.
//        Bytt chop(target, list, low + 1, high) med:
//        hvis target < list[mid]: result = chop(target, list, low, mid - 1)
//        ellers: result = chop(target, list, mid + 1, high).

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
