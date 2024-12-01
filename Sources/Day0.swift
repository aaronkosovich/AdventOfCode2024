//
//  Day99.swift
//  AdventOfCode
//
//  Created by Aaron Kosovich on 30/11/2024.
//

import Algorithms

// Warm-up challenge from AoC22 day 1.

@available(iOS 16.0, *)
struct Day0: AdventDay {
    var data: String
    
    // Splits input data into its component parts and convert from string.
    var measurements: [Int] {
        data.split(separator: "\n").compactMap({Int($0)})
    }
    
    func part1() -> Int {
        return depthComparison(of: measurements)
    }
    
    func part2() -> Int {
        let windowSums = zip(zip(measurements, measurements.dropFirst()), measurements.dropFirst(2))
            .map { $0.0.0 + $0.0.1 + $0.1 }
        
        return depthComparison(of: windowSums)
    }
    
    func depthComparison(of measurements: [Int]) -> Int {
        zip(measurements, measurements.dropFirst())
            .filter({ $1 > $0 })
            .count
    }
}
