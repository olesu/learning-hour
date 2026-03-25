// Mulige refaktoreringer (i tillegg til iterativt og rekursivt binært søk):
//
// A. tailrec — rekursjon uten stack overflow. Kotlin-nøkkelordet `tailrec`
//    lar kompilatoren optimalisere rekursjon til en løkke under panseret.
//    Krever at det rekursive kallet er siste operasjon i funksjonen.
//
// B. Funksjonell med listesnitt — send subList i stedet for indekser.
//    Enkelt å resonnere om, men krever at man justerer returverdien
//    med en offset for å kompensere for at lista krymper for hvert kall.
//
// C. Stdlib — bruk Kotlins innebygde list.binarySearch(target).
//    Viser at problemet allerede er løst i standardbiblioteket,
//    men gir en god diskusjon om hva vi egentlig øver på med kataen.

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
