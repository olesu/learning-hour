plugins {
	kotlin("jvm") version "2.3.0"
	application
}

group = "com.gildedrose"
version = "1.0-SNAPSHOT"

repositories {
	mavenCentral()
}

dependencies {
	implementation(kotlin("stdlib"))
	testImplementation(kotlin("test"))
	testImplementation("org.junit.jupiter:junit-jupiter:5.12.2")
}

tasks.test {
	useJUnitPlatform()
}

application {
	mainClass.set("com.gildedrose.TexttestFixtureKt")
}
