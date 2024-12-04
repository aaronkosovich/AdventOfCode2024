//
//  Day03.swift
//  AdventOfCode
//
//  Created by Aaron Kosovich on 3/12/2024.
//

import Algorithms
import Foundation

@available(iOS 16.0, *)
struct Day03: AdventDay {
    var data: String
    
    func part1() -> Int {
        var total = 0
        let values = extractMulValues(from: data)
        for value in values {
            total += (value.0 * value.1)
        }
        return total
    }
    
    func part2() -> Int {
        var total = 0
        
        let dosAndDonts = extractDosAndDontsArray(from: data)
        let values = extractMulValuesWithDosAndDonts(from: data, with: dosAndDonts)
        
        for value in values {
            total += (value.0 * value.1)
        }
        return total
    }
    
    func extractMulValues(from input: String) -> [(Int, Int)] {
        var results: [(Int, Int)] = []
        var currentIndex = input.startIndex
        
        while currentIndex < input.endIndex {
            // Look for "mul("
            if let mulStart = input[currentIndex...].firstRange(of: "mul(") {
                let afterMul = mulStart.upperBound
                
                // Find closing bracket
                if let closeParen = input[afterMul...].firstIndex(of: ")") {
                    // Extract the content between parentheses
                    let content = input[afterMul..<closeParen]
                    
                    // Split the numbers into (i,j)
                    if content.count < 8 {
                        let values = content.split(separator: ",", maxSplits: 1)
                        
                        // Append the results
                        if values.count == 2 {
                            if values[0].allSatisfy({ $0.isNumber }) && values[1].allSatisfy({ $0.isNumber }) {
                                let value1 = values[0]
                                let value2 = values[1]
                                results.append((Int(value1)!, Int(value2)!))
                            }
                        }
                        currentIndex = closeParen
                    }
                }
            }
            currentIndex = input.index(after: currentIndex)
        }
        return results
    }
    
    func extractMulValuesWithDosAndDonts(from input: String, with dosAndDonts: [String]) -> [(Int, Int)] {
        var results: [(Int, Int)] = []
        var shouldProcess = true
        
        // Disclosure: Required LLM assistance with regex.
                
        // Create regex patterns. \\b ensures boundaries exclude "undo"
        let mulPattern = try! NSRegularExpression(pattern: "\\w*mul\\((\\d+),(\\d+)\\)", options: [])
        let dontPattern = try! NSRegularExpression(pattern: "don't", options: [])
        let doPattern = try! NSRegularExpression(pattern: "\\bdo\\b", options: [])
        
        let range = NSRange(location: 0, length: input.utf16.count)
        
        // Find all regex matches
        let mulMatches = mulPattern.matches(in: input, options: [], range: range)
        let dontMatches = dontPattern.matches(in: input, options: [], range: range)
        let doMatches = doPattern.matches(in: input, options: [], range: range)
        
        // Combine all matches with their positions and types
        var allMatches: [(position: Int, type: String, match: NSTextCheckingResult)] = []
        
        mulMatches.forEach { allMatches.append(($0.range.location, "mul", $0)) }
        dontMatches.forEach { allMatches.append(($0.range.location, "don't", $0)) }
        doMatches.forEach { allMatches.append(($0.range.location, "do", $0)) }
        
        allMatches.sort(by: { $0.position < $1.position })

        for (_, type, match) in allMatches {
            switch type {
            case "mul":
                if shouldProcess {
                    if match.numberOfRanges == 3,
                       let firstRange = Range(match.range(at: 1), in: input),
                       let secondRange = Range(match.range(at: 2), in: input) {
                        let value1 = Int(input[firstRange])!
                        let value2 = Int(input[secondRange])!
                        results.append((value1, value2))
                    }
                }
            case "don't":
                shouldProcess = false
            case "do":
                shouldProcess = true
            default:
                break
            }
        }
        return results
    }
    
    func extractDosAndDontsArray(from input: String) -> [String] {
        var results: [String] = []
        var currentIndex = input.startIndex
        var lastMulEnd: String.Index? = nil
        
        while currentIndex < input.endIndex {
            // Find the open bracket
            if let openParen = input[currentIndex...].firstIndex(of: "(") {
                // Look backwards for the term "mul"
                let searchStart = input.index(openParen, offsetBy: -3, limitedBy: input.startIndex) ?? input.startIndex
                let beforeParens = input[searchStart..<openParen]
                
                if String(beforeParens).hasSuffix("mul") {
                    // If the mul(...) pattern is found && if we have a previous mul, extract the string between
                    if let lastEnd = lastMulEnd {
                        let mulStart = input.index(openParen, offsetBy: -3)
                        let betweenContent = input[lastEnd..<mulStart].trimmingCharacters(in: .whitespaces)
                        if !betweenContent.isEmpty {
                            results.append(String(betweenContent))
                        }
                    }
                    
                    // Find closed bracket
                    if let closeParen = input[openParen...].firstIndex(of: ")") {
                        lastMulEnd = input.index(after: closeParen)
                        currentIndex = closeParen
                    }
                }
            }
            currentIndex = input.index(after: currentIndex)
        }
        
        // Handle any remaining text after the last mul()
        if let lastEnd = lastMulEnd, lastEnd < input.endIndex {
            let finalContent = input[lastEnd...].trimmingCharacters(in: .whitespaces)
            if !finalContent.isEmpty {
                results.append(String(finalContent))
            }
        }
        return results
    }
}
