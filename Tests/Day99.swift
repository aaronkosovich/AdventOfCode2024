
import XCTest

@testable import AdventOfCode

final class Day01Tests: XCTestCase {
    // Smoke test data provided in the challenge question
    let testData = """
    199
    200
    208
    210
    200
    207
    240
    269
    260
    263
    
    """
    
    func testPart1() throws {
        let challenge = Day99(data: testData)
        XCTAssertEqual(String(describing: challenge.part1()), "7")
    }
    
    func testPart2() throws {
        let challenge = Day99(data: testData)
        XCTAssertEqual(String(describing: challenge.part2()), "5")
    }
    
    func testEmptyInput() {
        let day = Day99(data: "")
        XCTAssertEqual(day.part1(), 0)
        XCTAssertEqual(day.part2(), 0)
    }
    
    func testSingleMeasurement() {
        let day = Day99(data: "199")
        XCTAssertEqual(day.part1(), 0)
        XCTAssertEqual(day.part2(), 0)
    }
    
    func testTwoMeasurements() {
        // Test increasing case
        let dayIncreasing = Day99(data: "199\n200")
        XCTAssertEqual(dayIncreasing.part1(), 1)
        XCTAssertEqual(dayIncreasing.part2(), 0)
        
        // Test decreasing case
        let dayDecreasing = Day99(data: "210\n200")
        XCTAssertEqual(dayDecreasing.part1(), 0)
        XCTAssertEqual(dayDecreasing.part2(), 0)
    }
    
    func testInvalidInput() {
        let day = Day99(data: "abc\n199\ndef")
        XCTAssertEqual(day.part1(), 0)
        XCTAssertEqual(day.part2(), 0)
    }
    
    func testDepthComparisonFunction() {
        let day = Day99(data: "")
        XCTAssertEqual(day.depthComparison(of: [1, 2, 3, 4]), 3)
        XCTAssertEqual(day.depthComparison(of: [0, 2, 1, 4]), 2)
        XCTAssertEqual(day.depthComparison(of: [1, 1, 1, 2]), 1)
        XCTAssertEqual(day.depthComparison(of: [4, 3, 2, 1]), 0)
    }
    
    func testVeryLargeNumbers() {
        let day = Day99(data: "123456789123456789\n987654321987654321")
        XCTAssertEqual(day.part1(), 1)
        XCTAssertEqual(day.part2(), 0)
    }
    
    func testNegativeNumbers() {
        let day = Day99(data: "-190\n-200")
        XCTAssertEqual(day.part1(), 0)
        XCTAssertEqual(day.part2(), 0)
    }
    
    func testVeryLargeNegativeNumbers() {
        let day = Day99(data: "-123456789123456789\n-987654321987654321")
        XCTAssertEqual(day.part1(), 0)
        XCTAssertEqual(day.part2(), 0)
    }
    
    func testExactlyThreeMeasurements() {
        let day = Day99(data: "199\n200\n208")
        XCTAssertEqual(day.part1(), 2)
        XCTAssertEqual(day.part2(), 0)
    }
    
    func testExactlyThreeNegativeMeasurements() {
        let day = Day99(data: "-199\n-200\n-208")
        XCTAssertEqual(day.part1(), 0)
        XCTAssertEqual(day.part2(), 0)
    }
    
    func testMixOfNegativeAndPositiveMeasurements() {
        let day = Day99(data: "199\n-200\n208")
        XCTAssertEqual(day.part1(), 1)
        XCTAssertEqual(day.part2(), 0)
    }
    
    func testRepeatingNumbers() {
        let day = Day99(data: "199\n199\n199")
        XCTAssertEqual(day.part1(), 0)
        XCTAssertEqual(day.part2(), 0)
    }
}
