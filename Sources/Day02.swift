//
//  Day02.swift
//  AdventOfCode
//
//  Created by Aaron Kosovich on 2/12/2024.
//

import Algorithms

@available(iOS 16.0, *)
struct Day02: AdventDay {
    var data: String
    
    // Split the input data into its component parts and convert to [[Int]].
    var reports: [[Int]] {
        let lines = data.split(separator: "\n")
        let numbers = lines.map { line in
            line.split(separator: " ").compactMap { Int($0) }
        }
        return numbers
    }
    
    func part1() -> Int {
        reports.filter { isValidSequence($0) }.count
    }
    
    func part2() -> Int {
        reports.filter { isValidAfterRemoval($0) }.count
    }
    
    private func isValidSequence(_ numbers: [Int]) -> Bool {
        let differences = zip(numbers, numbers.dropFirst())
            .map { $1 - $0 }
            
        guard differences.allSatisfy({ (1...3).contains(abs($0)) }) else {
            return false
        }
        
        return differences.allSatisfy { $0 > 0 } ||
               differences.allSatisfy { $0 < 0 }
    }

    private func isValidAfterRemoval(_ numbers: [Int]) -> Bool {
        // Try removing each index and check if any resulting sequence is valid
        return (0..<numbers.count).contains { indexToRemove in
            let modifiedNumbers = numbers.enumerated()
                .compactMap { index, value in
                    index != indexToRemove ? value : nil
                }
                
            let differences = zip(modifiedNumbers, modifiedNumbers.dropFirst())
                .map { $1 - $0 }
                
            guard differences.allSatisfy({ (1...3).contains(abs($0)) }) else {
                return false
            }
            
            return differences.allSatisfy { $0 > 0 } ||
                   differences.allSatisfy { $0 < 0 }
        }
    }
}
