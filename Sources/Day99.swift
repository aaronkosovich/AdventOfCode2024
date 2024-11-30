//
//  File.swift
//  AdventOfCode
//
//  Created by Aaron Kosovich on 30/11/2024.
//

import Algorithms

@available(iOS 16.0, *)
struct Day99: AdventDay {
    var data: String
    
    // Splits input data into its component parts and convert from string.
    var measurements: [Int] {
        data.split(separator: "\n").compactMap({Int($0)})
    }
    
    func part1() -> Any {
        var totalDepthIncreases = 0
        var previousDepth = measurements.first ?? 0
        
        for measurement in measurements {
            if measurement > previousDepth {
                totalDepthIncreases += 1
            }
            previousDepth = measurement
        }
        
        return totalDepthIncreases
    }
    
    func part2() -> Any {
        var totalDepthIncreases = 0
        var prevMeasurementWindow: [Int] = []
        
        for window in measurements.windows(ofCount: 3) {
            var windowSum = 0

            for measurement in window {
                windowSum += measurement
            }
            
            let previousWindowSum = prevMeasurementWindow.reduce(0, +)
            
            if windowSum > previousWindowSum && previousWindowSum != 0 {
                totalDepthIncreases += 1
            }
            
            prevMeasurementWindow.removeAll()
            prevMeasurementWindow.append(contentsOf: window)
        }
        
        return totalDepthIncreases
    }
}
