//
//  Day05.swift
//  AdventOfCode
//
//  Created by Aaron Kosovich on 5/12/2024.
//

import Algorithms
import Foundation

@available(iOS 16.0, *)
struct Day05: AdventDay {
    var data: String

    var rules: [[Int]] {
        data.split(separator: "\n\n")
            .first?
            .split(separator: "\n")
            .map { line in
                line.split(separator: "|")
                    .compactMap { Int($0) }
            } ?? []
    }

    var updates: [[Int]] {
        data.split(separator: "\n\n")
            .dropFirst()
            .first?
            .split(separator: "\n")
            .map { line in
                line.trimmingCharacters(in: .whitespaces)
                    .split(separator: ",")
                    .compactMap { Int($0) }
            } ?? []
    }
    
    func part1() -> Int {
        let validUpdates = updates.filter { update in
            rules.allSatisfy { rule in
                check(rule, in: update)
            }
        }

        let total = validUpdates.reduce(0) { sum, update in
            sum + update[update.count / 2]
        }
        return total
    }
    
    func part2() -> Int {
        // Collect all the incorrect updates
        let incorrectUpdates = updates.filter { update in
            !rules.allSatisfy { rule in
                check(rule, in: update)
            }
        }
        
        // Swap the values as necessary
        var correctedUpdates = incorrectUpdates
        for updateIndex in 0..<correctedUpdates.count {
            var update = correctedUpdates[updateIndex]
            while !rules.allSatisfy({ check($0, in: update) }) {
                for rule in rules {
                    if !check(rule, in: update) {
                        update = correctUpdate(for: rule, in: update)
                    }
                }
            }
            correctedUpdates[updateIndex] = update
        }

        // Return the sum of the middle numbers
        return correctedUpdates.reduce(0) { sum, update in
            sum + update[update.count / 2]
        }
    }
    
    func check(_ rule: [Int], in update: [Int]) -> Bool {
        // Return true if the rule isn't relevant.
        guard update.contains(rule[0]) && update.contains(rule[1]) else {
            return true
        }
        
        // Find indices of both numbers
        let firstIndex = update.firstIndex(of: rule[0])!
        let secondIndex = update.firstIndex(of: rule[1])!
        
        // Return true if first number comes before second number
        return firstIndex < secondIndex
    }
    
    func correctUpdate(for rule: [Int], in update: [Int]) -> [Int] {
        // Find indices of both numbers
        let firstIndex = update.firstIndex(of: rule[0])!
        let secondIndex = update.firstIndex(of: rule[1])!
        
        var correctedUpdate: [Int] = update
        correctedUpdate.swapAt(firstIndex, secondIndex)
        
        // Return true if first number comes before second number
        return correctedUpdate
    }
}

