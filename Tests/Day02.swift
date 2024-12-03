import XCTest

@testable import AdventOfCode

final class Day02Tests: XCTestCase {
    // Smoke test data provided in the challenge question
    let testData = """
    7 6 4 2 1
    1 2 7 8 9
    9 7 6 2 1
    1 3 2 4 5
    8 6 4 4 1
    1 3 6 7 9
    """
    
    // Smoke tests
    
    func testPart1() throws {
        let challenge = Day02(data: testData)
        XCTAssertEqual(challenge.part1(), 2)
    }
    
    func testPart2() throws {
        let challenge = Day02(data: testData)
        XCTAssertEqual(challenge.part2(), 4)
    }
    
    // Unit tests
    
    func testEmptyInput() {
        let day = Day02(data: "")
        XCTAssertEqual(day.part1(), 0)
        XCTAssertEqual(day.part2(), 0)
    }
    
    func testAscending() {
        let day = Day02(data: "1 2 3 4 5")
        XCTAssertEqual(day.part1(), 1)
        XCTAssertEqual(day.part2(), 1)
    }
    
    func testDescending() {
        let day = Day02(data: "5 4 3 2 1")
        XCTAssertEqual(day.part1(), 1)
        XCTAssertEqual(day.part2(), 1)
    }
    
    func testUnsafeDistance() {
        let day = Day02(data: "1 2 6 7 8")
        XCTAssertEqual(day.part1(), 0)
        XCTAssertEqual(day.part2(), 0)
    }
    
    func testLongReport() {
        let day = Day02(data: "1 2 3 4 5 6 7 8 9")
        XCTAssertEqual(day.part1(), 1)
        XCTAssertEqual(day.part2(), 1)
    }
    
    func testDoubleDigitsLongAscending() {
        let day = Day02(data: "11 12 13 14 15 16 17 18 19")
        XCTAssertEqual(day.part1(), 1)
        XCTAssertEqual(day.part2(), 1)
    }
    
    func testDoubleDigitsLongDescending() {
        let day = Day02(data: "19 18 17 16 15 14 13 12 11")
        XCTAssertEqual(day.part1(), 1)
        XCTAssertEqual(day.part2(), 1)
    }
    
    func testEqualValues() {
        let day = Day02(data: "1 2 4 4 6")
        XCTAssertEqual(day.part1(), 0)
        XCTAssertEqual(day.part2(), 1)
    }
    
    func testBadFirstValue() {
        let day = Day02(data: "3 2 4 5 6")
        XCTAssertEqual(day.part1(), 0)
        XCTAssertEqual(day.part2(), 1)
    }

    func testRepeatingFinalValue() {
        let day = Day02(data: "1 2 3 4 5 5")
        XCTAssertEqual(day.part1(), 0)
        XCTAssertEqual(day.part2(), 1)
    }
    
    func testInvertFirst() {
        let day = Day02(data: "5 1 2 3 4 5")
        XCTAssertEqual(day.part1(), 0)
        XCTAssertEqual(day.part2(), 1)
    }
    
    func testInvertLast() {
        let day = Day02(data: "1 2 3 4 5 4")
        XCTAssertEqual(day.part1(), 0)
        XCTAssertEqual(day.part2(), 1)
    }
    
    func testQuickJump() {
        let day = Day02(data: "1 6 7 8 9")
        XCTAssertEqual(day.part1(), 0)
        XCTAssertEqual(day.part2(), 1)
    }
    
    func testAscendingTriangleWave() {
        let day = Day02(data: "1 2 3 4 3")
        XCTAssertEqual(day.part1(), 0)
        XCTAssertEqual(day.part2(), 1)
    }
    
    func testDescendingTriangleWave() {
        let day = Day02(data: "9 8 7 6 7")
        XCTAssertEqual(day.part1(), 0)
        XCTAssertEqual(day.part2(), 1)
    }
    
    func testRemoveThenRepeat() {
        let day = Day02(data: "7 10 8 10 11")
        XCTAssertEqual(day.part1(), 0)
        XCTAssertEqual(day.part2(), 1)
    }
    
    func testRemoveThenRepeatLong() {
        let day = Day02(data: "29 28 27 25 26 25 22 20")
        XCTAssertEqual(day.part1(), 0)
        XCTAssertEqual(day.part2(), 1)
    }
    
    func testRedditOne() {
        let day = Day02(data: "7 10 8 10 11")
        XCTAssertEqual(day.part1(), 0)
        XCTAssertEqual(day.part2(), 1)
    }
    
    func testRedditTwo() {
        let day = Day02(data: "29 28 27 25 26 25 22 20")
        XCTAssertEqual(day.part1(), 0)
        XCTAssertEqual(day.part2(), 1)
    }
    
    func testRedditThree() {
        let day = Day02(data: "8 9 10 11")
        XCTAssertEqual(day.part1(), 1)
        XCTAssertEqual(day.part2(), 1)
    }
    
    func testRedditFour() {
        let day = Day02(data: "75 77 72 70 69")
        XCTAssertEqual(day.part1(), 0)
        XCTAssertEqual(day.part2(), 1)
    }
    
}
