//
//  Day03.swift
//  AdventOfCode
//
//  Created by Aaron Kosovich on 3/12/2024.
//

import XCTest

@testable import AdventOfCode

final class Day03Tests: XCTestCase {
    // Smoke test data provided in the challenge question
    let testData = """
    xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))
    """
    
    let testData2 = """
    xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))
    """
    
    // Smoke tests
    
    func testPart1() throws {
        let challenge = Day03(data: testData)
        XCTAssertEqual(challenge.part1(), 161)
    }
    
    func testPart2() throws {
        let challenge = Day03(data: testData2)
        XCTAssertEqual(challenge.part2(), 48)
    }
    
    func testFirst() throws {
        let challenge = Day03(data: testData)
        XCTAssertTrue(challenge.extractMulValues(from: "xmul(2,4)%&").first! == (2,4))
    }
    
    func testSecond() throws {
        let challenge = Day03(data: testData)
        XCTAssertTrue(challenge.extractMulValues(from: "t_mul(5,5)+mul(32,64]t").first! == (5,5))
    }
    
    func testThird() throws {
        let challenge = Day03(data: testData)
        XCTAssertTrue(challenge.extractMulValues(from: "en(mul(11,8)mul(8,5))").first! == (11,8))
    }
    
    func testFourth() throws {
        let challenge = Day03(data: testData)
        XCTAssertTrue(challenge.extractMulValues(from: "(11,8)mul(8,5))").first! == (8,5))
    }
}
