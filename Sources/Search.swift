//
//  Search.swift
//  HRSwift
//
//  Created by yansong li on 2016-04-23.
//  Copyright © 2016 yansong li. All rights reserved.
//

import Foundation

/// https://www.hackerrank.com/challenges/icecream-parlor
public class IceCreamParlor {
    func solution() {
        let T = getInt()
        for _ in 0..<T {
            let M = getInt()
            let N = getInt()
            let arrString = getLine()
            let arr = arrString.componentsSeparatedByString(" ").map {Int($0)!}
            let result = solve(M, N: N, prices:arr)
            if result.0 != -1 && result.1 != -1 {
                print("\(result.0) \(result.1)")
            }
        }
    }
    
    func solve(M: Int, N: Int, prices:[Int])->(Int, Int) {
        if M <= 1 {
            return (-1, -1)
        }
        var pair: [Int: Int] = [:]
        for (iIndex, i) in prices.enumerate() {
            if let pIndex = pair[M - i]{
                return (pIndex+1, iIndex+1)
            }
            if pair[i] == nil {
                pair[i] = iIndex
            }
        }
        return (-1, -1)
    }
}

/// https://www.hackerrank.com/challenges/maximise-sum
public class MaximiseSum {
    func solution() {
        let T = getInt()
        for _ in 0..<T {
            let metrics = getLineToInts()
            let elements = getLineToInts()
            let result = solve(metrics[1], elements: elements)
            print(result)
        }
    }
    
    /// Math behind the scene of modular
    /// (a + b) % M = (a % M + b % M) % M
    /// (a - b) % M = (a % M - b % M) % M
    /// Another important point to note is that to solve array related question, it is common to
    /// construct a prefix table.
    /// O(NlgN)
    func solve(modulo: Int, elements: [Int]) -> Int {
        // use elements and modulo generate prefix table
        var prefix: [(Int, Int)] = Array(count: elements.count, repeatedValue: (0, 0))
        var current = 0
        var maxRet = 0
        for i in 0..<elements.count {
            current = (elements[i]%modulo + current) % modulo
            prefix[i] = (current, i+1)
        }
        // ran through prefix table to find the largest one
        prefix.sortInPlace { $0.0 == $1.0 ? $0.1 < $1.1 : $0.0 < $1.0 }
        var min = Int.max
        maxRet = prefix[elements.count - 1].0
        if (maxRet == modulo - 1) { return maxRet}
        for i in 0..<elements.count-1 {
            // has a higher index
            if prefix[i].1 > prefix[i+1].1 {
                if prefix[i+1].0 - prefix[i].0 < min {
                    min = prefix[i+1].0 - prefix[i].0
                    if min == 1 {
                        break
                    }
                }
            }
        }
        return max(maxRet, modulo - min)
    }
}