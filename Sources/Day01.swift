//
//  Day01.swift
//  AdventOfCode
//
//  Created by Aaron Kosovich on 01/12/2024.
//

import Algorithms

@available(iOS 16.0, *)
struct Day01: AdventDay {
    var data: String
    
    // Split the input data into its component parts and convert to [[Int]].
    var locationIdLists: [[Int]] {
        let lines = data.split(separator: "\n")
        let numbers = lines.map { line in
            line.split(separator: " ").compactMap { Int($0) }
        }
        return numbers
    }
    
    func part1() -> Int {
        // Create sorted arrays for listA and listB
        let listA = locationIdLists.map { $0[0] }.sorted()
        let listB = locationIdLists.map { $0[1] }.sorted()
    
        // Measure the absolute distance between each number
        let totalDistance = zip(listA, listB).reduce(0) { total, pairs in
            total + abs(pairs.1 - pairs.0)
        }
        
        return totalDistance
    }
    
    func part2() -> Int {
        // Create sorted arrays for listA and listB
        let listA = locationIdLists.map { $0[0] }.sorted()
        let listB = locationIdLists.map { $0[1] }.sorted()
        
        // Create a frequency map for each value in listB.
        let frequencyMap = listB.reduce(into: [:]) { counts, element in
            counts[element, default: 0] += 1
        }
        
        // Total distance equals the sum of each value times it's frequency.
        let totalDistance = listA.reduce(0) { total, element in
            total + (element * (frequencyMap[element] ?? 0))
        }
        
        return totalDistance
    }
}
