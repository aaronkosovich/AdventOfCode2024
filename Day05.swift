//
//  Day05.swift
//  AdventOfCode
//
//  Created by Aaron Kosovich on 5/12/2024.
//

import XCTest

@testable import AdventOfCode

final class Day05Tests: XCTestCase {
    // Smoke test data provided in the challenge question
    let testData = """
    47|53
    97|13
    97|61
    97|47
    75|29
    61|13
    75|53
    29|13
    97|29
    53|29
    61|53
    97|53
    61|29
    47|13
    75|47
    97|75
    47|61
    75|61
    47|29
    75|13
    53|13

    75,47,61,53,29
    97,61,53,29,13
    75,29,13
    75,97,47,61,53
    61,13,29
    97,13,75,29,47
    """
    
    // Smoke tests
    
    func testPart1() throws {
        let challenge = Day05(data: testData)
        XCTAssertEqual(challenge.part1(), 143)
    }
    
    func testPart2() throws {
        let challenge = Day05(data: testData)
        XCTAssertEqual(challenge.part2(), 123)
    }
    
    // Unit tests
    
    func testPart1() throws {
        let challenge = Day05(data: """
                                    75|47
                                    75|61
                                    75|53
                                    75|29
                                    
                                    75,47,61,53,29
                                    """)
        XCTAssertEqual(challenge.part1(), 61)
    }
}
