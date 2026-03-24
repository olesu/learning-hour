import io.kotest.matchers.shouldBe
import org.junit.jupiter.api.Test


class KarateChopTest {
    @Test
    fun `chop tests`() {
        KarateChop.chop(3, emptyList()) shouldBe -1
        KarateChop.chop(3, listOf(1))   shouldBe -1
        KarateChop.chop(1, listOf(1))   shouldBe  0

        KarateChop.chop(1, listOf(1, 3, 5)) shouldBe  0
        KarateChop.chop(3, listOf(1, 3, 5)) shouldBe  1
        KarateChop.chop(5, listOf(1, 3, 5)) shouldBe  2
        KarateChop.chop(0, listOf(1, 3, 5)) shouldBe -1
        KarateChop.chop(2, listOf(1, 3, 5)) shouldBe -1
        KarateChop.chop(4, listOf(1, 3, 5)) shouldBe -1
        KarateChop.chop(6, listOf(1, 3, 5)) shouldBe -1

        KarateChop.chop(1, listOf(1, 3, 5, 7)) shouldBe  0
        KarateChop.chop(3, listOf(1, 3, 5, 7)) shouldBe  1
        KarateChop.chop(5, listOf(1, 3, 5, 7)) shouldBe  2
        KarateChop.chop(7, listOf(1, 3, 5, 7)) shouldBe  3
        KarateChop.chop(0, listOf(1, 3, 5, 7)) shouldBe -1
        KarateChop.chop(2, listOf(1, 3, 5, 7)) shouldBe -1
        KarateChop.chop(4, listOf(1, 3, 5, 7)) shouldBe -1
        KarateChop.chop(6, listOf(1, 3, 5, 7)) shouldBe -1
        KarateChop.chop(8, listOf(1, 3, 5, 7)) shouldBe -1
    }
}
