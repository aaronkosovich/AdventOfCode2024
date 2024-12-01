import XCTest

@testable import AdventOfCode

final class Day01Tests: XCTestCase {
    // Smoke test data provided in the challenge question
    let testData = """
    3   4
    4   3
    2   5
    1   3
    3   9
    3   3
    """
    
    func testPart1() throws {
        let challenge = Day01(data: testData)
        XCTAssertEqual(String(describing: challenge.part1()), "11")
    }
    
    func testPart2() throws {
        let challenge = Day01(data: testData)
        XCTAssertEqual(String(describing: challenge.part2()), "31")
    }
    
    func testEmptyInput() {
        let day = Day01(data: "")
        XCTAssertEqual(day.part1(), 0)
        XCTAssertEqual(day.part2(), 0)
    }
    
    func testSingleLocationIdRow() {
        let day = Day01(data: "3   4")
        XCTAssertEqual(day.part1(), 1)
        XCTAssertEqual(day.part2(), 0)
    }
    
    func testVeryLargeNumbers() {
        let day = Day01(data: "123456789123456789   987654321987654321")
        XCTAssertEqual(day.part1(), abs(987654321987654321 - 123456789123456789))
        XCTAssertEqual(day.part2(), 0)
    }
    
    func testNegativeNumbers() {
        let day = Day01(data: "-190   -200")
        XCTAssertEqual(day.part1(), 10)
        XCTAssertEqual(day.part2(), 0)
    }
    
    func testVeryLargeNegativeNumbers() {
        let day = Day01(data: "-123456789123456789   -987654321987654321")
        XCTAssertEqual(day.part1(), abs(-987654321987654321 - -123456789123456789))
        XCTAssertEqual(day.part2(), 0)
    }
    
    func testMixOfNegativeAndPositiveMeasurements() {
        let day = Day01(data: "199   -208")
        XCTAssertEqual(day.part1(), 407)
        XCTAssertEqual(day.part2(), 0)
    }
    
    func testRepeatingNumbers() {
        let day = Day01(data: "199   199")
        XCTAssertEqual(day.part1(), 0)
        XCTAssertEqual(day.part2(), 199)
    }
}
