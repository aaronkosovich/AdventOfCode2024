//
//  Day04.swift
//  AdventOfCode
//
//  Created by Aaron Kosovich on 4/12/2024.
//

import Algorithms
import Foundation

@available(iOS 16.0, *)
struct Day04: AdventDay {
    var data: String

    var lines: [String] {
        data.split(separator: "\n").map { String($0) }
    }
    
    func part1() -> Int {
        var total = 0
        
        // Horizontal
        total += countOccurences(of: "XMAS", in: lines)
        total += countOccurences(of: "SAMX", in: lines)

        // Vertical
        total += countOccurences(of: "XMAS", in: transpose(lines))
        total += countOccurences(of: "SAMX", in: transpose(lines))

        // Create flipped versions
        let horizontallyFlipped = lines.map { String($0.reversed()) }
        let verticallyFlipped = Array(lines.reversed())
        let bothFlipped = verticallyFlipped.map { String($0.reversed()) }

        // Diagonals
        total += countOccurences(of: "XMAS", in: getDiagonals(lines))  // top-left to bottom-right
        total += countOccurences(of: "XMAS", in: getDiagonals(horizontallyFlipped))  // top-right to bottom-left
        total += countOccurences(of: "XMAS", in: getDiagonals(verticallyFlipped))  // bottom-left to top-right
        total += countOccurences(of: "XMAS", in: getDiagonals(bothFlipped))  // bottom-right to top-left
        
        return total
    }
    
    func part2() -> Int {
        var total = 0
        let grid = lines
        let rows = grid.count
        let cols = grid[0].count
        
        func isValidPosition(row: Int, col: Int) -> Bool {
            return row >= 0 && row < rows && col >= 0 && col < cols
        }
        
        for row in 0..<rows {
            for col in 0..<cols {
                if grid[row][col] == "A" {
                    // Pattern 1: M   M
                    //              A
                    //            S   S
                    if isValidPosition(row: row-1, col: col-1) &&
                       isValidPosition(row: row-1, col: col+1) &&
                       isValidPosition(row: row+1, col: col-1) &&
                       isValidPosition(row: row+1, col: col+1) {
                        if grid[row-1][col-1] == "M" &&
                           grid[row-1][col+1] == "M" &&
                           grid[row+1][col-1] == "S" &&
                           grid[row+1][col+1] == "S" {
                            total += 1
                        }
                    }
                    // Pattern 2: S   S
                    //              A
                    //            M   M
                    if isValidPosition(row: row-1, col: col-1) &&
                       isValidPosition(row: row-1, col: col+1) &&
                       isValidPosition(row: row+1, col: col-1) &&
                       isValidPosition(row: row+1, col: col+1) {
                        if grid[row-1][col-1] == "S" &&
                           grid[row-1][col+1] == "S" &&
                           grid[row+1][col-1] == "M" &&
                           grid[row+1][col+1] == "M" {
                            total += 1
                        }
                    }
                    // Pattern 3: M   S
                    //              A
                    //            M   S
                    if isValidPosition(row: row-1, col: col-1) &&
                       isValidPosition(row: row-1, col: col+1) &&
                       isValidPosition(row: row+1, col: col-1) &&
                       isValidPosition(row: row+1, col: col+1) {
                        if grid[row-1][col-1] == "M" &&
                           grid[row-1][col+1] == "S" &&
                           grid[row+1][col-1] == "M" &&
                           grid[row+1][col+1] == "S" {
                            total += 1
                        }
                    }
                    // Pattern 4: S   M
                    //              A
                    //            S   M
                    if isValidPosition(row: row-1, col: col-1) &&
                       isValidPosition(row: row-1, col: col+1) &&
                       isValidPosition(row: row+1, col: col-1) &&
                       isValidPosition(row: row+1, col: col+1) {
                        if grid[row-1][col-1] == "S" &&
                           grid[row-1][col+1] == "M" &&
                           grid[row+1][col-1] == "S" &&
                           grid[row+1][col+1] == "M" {
                            total += 1
                        }
                    }
                }
            }
        }
        return total
    }
    
    func countOccurences(of target: String, in data: [String]) -> Int {
        var total = 0
        for line in data {
            let stringLine = String(line)
            guard stringLine.count >= 4 else { continue }
            
            for startIndex in 0...(stringLine.count - 4) {
                let start = stringLine.index(stringLine.startIndex, offsetBy: startIndex)
                let end = stringLine.index(stringLine.startIndex, offsetBy: startIndex + 3)
                let substring = stringLine[start...end]
                
                if substring == target {
                    total += 1
                }
            }
        }
        return total
    }
    
    func transpose(_ input: [String]) -> [String] {
        guard !input.isEmpty else { return [] }
        
        let cols = input[0].count
        var result = Array(repeating: "", count: cols)
        
        for line in input {
            for (col, char) in line.enumerated() {
                result[col].append(char)
            }
        }
        return result
    }
    
    func getDiagonals(_ input: [String]) -> [String] {
        var diagonals: [String] = []
        
        for startCol in 0..<input[0].count {
            var diagonal = ""
            var row = 0
            var col = startCol
            
            while row < input.count && col < input[0].count {
                let line = input[row]
                diagonal.append(line[line.index(line.startIndex, offsetBy: col)])
                row += 1
                col += 1
            }
            if diagonal.count > 1 { diagonals.append(diagonal) }
        }
        
        for startRow in 1..<input.count {
            var diagonal = ""
            var row = startRow
            var col = 0
            
            while row < input.count && col < input[0].count {
                let line = input[row]
                diagonal.append(line[line.index(line.startIndex, offsetBy: col)])
                row += 1
                col += 1
            }
            if diagonal.count > 1 { diagonals.append(diagonal) }
        }
        return diagonals
    }
}

extension String {

    var length: Int {
        return count
    }

    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}

