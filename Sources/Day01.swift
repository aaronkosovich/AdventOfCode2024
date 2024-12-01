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
    
    // Splits input data into its component parts and convert from string.
    var measurements: [[Int]] {
        let lines = data.split(separator: "\n")
        let numbers = lines.map { line in
            line.split(separator: " ").compactMap { Int($0) }
        }
        return numbers
    }
    
    func part1() -> Int {
        var totalDistance = 0
        var arrayA: [Int] = []
        var arrayB: [Int] = []
        
        for measurement in measurements {
            arrayA.append(measurement[0])
            arrayB.append(measurement[1])
        }
        
        arrayA.sort(by: < )
        arrayB.sort(by: < )
        
        for i in arrayA.indices {
            totalDistance += abs(arrayB[i] - arrayA[i])
        }
        
        return totalDistance
    }
    
    func part2() -> Int {
        var totalDistance = 0
        var arrayA: [Int] = []
        var arrayB: [Int] = []
        
        for measurement in measurements {
            arrayA.append(measurement[0])
            arrayB.append(measurement[1])
        }
        
        for i in arrayA.indices {
            let count = arrayB.count(where: ({ $0 == arrayA[i] }))
            totalDistance += (count * arrayA[i])
        }
        
        return totalDistance
    }
}
