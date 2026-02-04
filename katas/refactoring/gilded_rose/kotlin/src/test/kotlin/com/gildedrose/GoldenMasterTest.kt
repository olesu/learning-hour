package com.gildedrose

import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Test
import java.io.ByteArrayOutputStream
import java.io.PrintStream

internal class GoldenMasterTest {

    @Test
    fun `output matches golden master for 30 days`() {
        val actualOutput = captureOutput {
            main(arrayOf("30"))
        }

        val expectedOutput = this::class.java.classLoader
            .getResource("golden-master-30-days.txt")!!
            .readText()

        assertEquals(expectedOutput, actualOutput)
    }

    private fun captureOutput(block: () -> Unit): String {
        val originalOut = System.out
        val outputStream = ByteArrayOutputStream()
        System.setOut(PrintStream(outputStream))
        try {
            block()
        } finally {
            System.setOut(originalOut)
        }
        return outputStream.toString()
    }
}
