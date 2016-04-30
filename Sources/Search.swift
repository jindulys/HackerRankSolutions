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
    
    func localTest() {
        if let testStreamReader = StreamReader(name: "input10", type: "txt"),
            testOutStreamReader = StreamReader(name: "output10", type: "txt") {
                let T = testStreamReader.getInt()
                for _ in 0..<T {
                    let metrics = testStreamReader.getLineToInts()
                    let elements = testStreamReader.getLineToInts()
                    logRunTime {
                        //let result = self.slowSolve(metrics[1], elements: elements)
                        let result = self.solve(metrics[1], elements: elements)
                        let expect = testOutStreamReader.getInt()
                        if result == expect {
                            print("Pass")
                        } else {
                            print("Failed")
                        }
                    }
                }
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
    
    /// Math behind the scene of modular
    /// (a + b) % M = (a % M + b % M) % M
    /// (a - b) % M = (a % M - b % M) % M
    /// Another important point to note is that to solve array related question, it is common to
    /// construct a prefix table.
    /// O(N^2)
    func slowSolve(modulo: Int, elements: [Int]) -> Int {
        // use elements and modulo generate prefix table
        var prefix: [Int] = Array(count: elements.count, repeatedValue: 0)
        var current = 0
        for i in 0..<elements.count {
            current = (elements[i]%modulo + current) % modulo
            prefix[i] = current
        }
        // ran through prefix table to find the largest one
        var retVal = 0
        for i in 0..<elements.count {
            for j in SRange(start: i-1, end: -1, step: -1) {
                // prefix[i] - prefix[j] means subparts from j+1 to i
                if prefix[j] > prefix[i] {
                    retVal = max(retVal, (prefix[i] - prefix[j] + modulo) % modulo)
                }
            }
            // prefix[i] means from beginning to i
            retVal = max(retVal, prefix[i])
        }
        return retVal
    }
}

/// https://www.hackerrank.com/challenges/sherlock-and-array
public class SherlockAndArray {
    func solution() {
        let T = getInt()
        for _ in 0..<T {
            let _ = getInt()
            let elements = getLineToInts()
            let result = solve(elements)
            if result {
                print("YES")
            } else {
                print("NO")
            }
        }
    }
    
    func solve(arr: [Int]) -> Bool {
        let arrCount = arr.count
        var leftSum = Array(count: arrCount + 1, repeatedValue: 0)
        for i in 1..<arrCount+1 {
            leftSum[i] = leftSum[i-1] + arr[i-1]
        }
        for i in SRange(start: arrCount - 1, end: -1, step: -1) {
            if leftSum[i] == leftSum[arrCount] - leftSum[i+1] {
                return true
            }
        }
        return false
    }
}

/// https://www.hackerrank.com/challenges/missing-numbers
public class missingNumbers {
    func solution() {
        let n = getInt()
        let listA = getLineToInts()
        let m = getInt()
        let listB = getLineToInts()
        let retVal = solve(listA, arrB: listB)
        print(retVal.joinWithSeparator(" "))
    }
    
    func solve(arrA: [Int], arrB: [Int]) -> [String] {
        // According to the requirement, the difference's maximum is 
        // 100. So if we take in an arbitrary number including itself
        // maximum count of this array is 201, expanding that number 
        // to left and right by 100.
        var missArray = Array(count: 201, repeatedValue: 0)
        var baseArray = Array(count: 201, repeatedValue: 0)
        // Find the base, to index that array.
        let base = arrA[0] - 100
        arrA.forEach { i in
            let index = i - base
            missArray[index] += missArray[index]
        }
        arrB.forEach { i in
            let index = i - base
            baseArray[index] += baseArray[index]
        }
        return []
    }
}