// TODO: Refaktorer lineært søk til binært søk
//
// [ ] 1. Innfør low = 0 og high = list.size - 1,
//        og erstatt while-betingelsen med low <= high
// [ ] 2. Innfør mid = (low + high) / 2,
//        og sjekk list[mid] i stedet for list[i]
// [ ] 3. Returner mid med en gang når funnet,
//        og fjern result-variabelen
// [ ] 4. Utnytt at lista er sortert: hvis target < list[mid],
//        sett high = mid - 1
// [ ] 5. Ellers (target > list[mid]): sett low = mid + 1
// [ ] 6. Fjern i++ — løkken er nå et binært søk

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
