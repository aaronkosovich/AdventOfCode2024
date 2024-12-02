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
    var measurements: [[Int]] {
        let lines = data.split(separator: "\n")
        let numbers = lines.map { line in
            line.split(separator: " ").compactMap { Int($0) }
        }
        return numbers
    }
    
    func part1() -> Int {
        return 0
    }
    
    func part2() -> Int {
        return 0
    }
}

