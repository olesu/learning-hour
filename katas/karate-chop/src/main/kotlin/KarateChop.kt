// TODO: Refaktorer lineært søk til binært søk
//
// [ ] 1. Innfør low = 0 og high = list.size - 1 som variabler
// [ ] 2. Gi i nytt navn: mid (rename overalt, inkl. mid++)
// [ ] 3. Utnytt at lista er sortert: hvis target < list[mid],
//        sett high = mid - 1
// [ ] 4. Ellers (target > list[mid]): sett low = mid + 1
// [ ] 5. Erstatt mid++ med mid = (low + high) / 2 øverst i løkken,
//        og erstatt while-betingelsen med low <= high

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
