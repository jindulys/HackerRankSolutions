//
//  DynamicProgramming.swift
//  HRSwift
//
//  Created by yansong li on 2015-12-20.
//  Copyright © 2015 yansong li. All rights reserved.
//

import Foundation

class CoinChangeProblem {
    func solution() {
        // read in N, M
        let metrics = getLineToArray().map {Int($0)!}
        
        let N = metrics[0]
        let M = metrics[1]
        
        // read in coins
        let coins = getLineToArray().map {Int($0)!}
        
        solveChanges(coins, coinsCounts: M, total: N)
    }
    
    // Use a bottom-up method, since we could get the solution from two ways:
    //  1. dont use the mth coin
    //  2. use at least 1 mth coin
    // By constructing a table we could avoid overlapping subproblems
    func solveChanges(coins:[Int], coinsCounts:Int, total:Int) {
        // 1. construct matrix to save result
        //      - row represent total count from 0 to total
        //      - col represent mth coin to use
        var resultTable = Array(count: coinsCounts, repeatedValue: Array(count: total+1, repeatedValue: 0))
        
        // 2. set the 1st col to 1, which stand for 0, we have 1 solution(dont need to give out any coins)
        for r in SRange(end: coinsCounts) {
            resultTable[r][0] = 1
        }
        
        // 3. update the table by work through every cell
        for r in SRange(end: coinsCounts) {
            for c in SRange(start:1, end: total+1) {
                let useCurrentCoin = c >= coins[r] ? resultTable[r][c - coins[r]]: 0
                let withoutUsingCurrentCoin = r > 0 ? resultTable[r-1][c] : 0
                resultTable[r][c] = useCurrentCoin + withoutUsingCurrentCoin
            }
        }
        print(resultTable[coinsCounts-1][total])
    }
}

class MaximumSubArray {
    func solution() {
        let T = Int(getLine())!
        for _ in 0..<T {
            let _ = getLine()
            let inputs = getLineToArray().map {Int($0)!}
            solve(inputs)
        }
    }
    
    func solve(inputs:[Int]) {
        let maxElement = inputs.maxElement()
        if let maxE = maxElement where maxE < 0 {
            print("\(maxE) \(maxE)")
            return
        }
        // non-contiguous subarray
        let nonContiguous = inputs.filter {$0 > 0}.reduce(0) {total, num in total + num}
        
        // contiguous subarray
        var currentMax = 0
        var currentSum = 0
        for i in 0..<inputs.count {
            currentSum += inputs[i]
            if currentSum < 0 {
                currentSum = 0
            }
            if currentSum > currentMax { currentMax = currentSum }
        }
        
        print("\(currentMax) \(nonContiguous)")
    }
}

// Implement KnapSackPair because our memoize function only take one type which is hashable for input
struct KnapSackPair {
    var itemIndex: Int
    var capacity: Int
}

extension KnapSackPair : Hashable {
    var hashValue : Int {
        get {
            return itemIndex.hashValue + capacity.hashValue
        }
    }
}

func ==(lhs: KnapSackPair, rhs: KnapSackPair) -> Bool {
    return lhs.itemIndex == rhs.itemIndex && lhs.capacity == rhs.capacity
}

class Knapsack {
    func solution() {
        let T = getInt()
        for _ in 0..<T {
            let metrics = getLineToArray().map { Int($0)! }
            let array = getLineToArray().map { Int($0)! }
            solveWithMemo(metrics[0], K: metrics[1], array: array)
        }
    }
    
    /**
     * This solution used memoization approach, which is a fantistic feature from Swift
     */
    func solveWithMemo(N: Int, K: Int, array:[Int]) {
        if K == 0 {
            print("0")
            return
        }
        
        let knapsack: (KnapSackPair)->Int = memoize{ knapsack, knapSackPair in
            let i = knapSackPair.itemIndex
            let k = knapSackPair.capacity
            
            if i < 1 { return 0 }
            // not choose current item
            let upperValue = knapsack(KnapSackPair(itemIndex: i - 1, capacity: k))
            
            // choose current item more than 1 time
            let leftValue = k < array[i-1] ? 0 : knapsack(KnapSackPair(itemIndex: i, capacity: k - array[i-1])) + array[i - 1]
            
            // choose current item for the first time
            let leftUpperValue = k < array[i-1] ? 0 : knapsack(KnapSackPair(itemIndex: i-1, capacity: k - array[i-1])) + array[i - 1]
            
            let bigger = max(upperValue, leftValue)
            
            return max(bigger, leftUpperValue)
        }
        
        print(knapsack(KnapSackPair(itemIndex: N, capacity: K)))
    }
}

class LongestIncreasingSubsequence {
    func solution() {
        let N = getInt()
        let array = getLinesToArray(N).map { Int($0)! }
        betterSolve(array)
    }
    
    /**
     *  Construct LIS(longestIncreasingSubsequence) for each i, which ends at ith element of the array.
     *  LIS[i] = max(LIS) 
     *  time efficiency O(n^2)
     */
    func solve(array:[Int]) {
        let N = array.count
        var LIS = Array(count: N, repeatedValue: 0)
        LIS[0] = 1
        for i in 1..<N {
            var atLeastFindOne = false
            for j in 0..<i {
                if array[j] < array[i] && LIS[j] + 1 > LIS[i] {
                    LIS[i] = LIS[j] + 1
                    atLeastFindOne = true
                }
            }
            if !atLeastFindOne { LIS[i] = 1}
        }
        
        let maximum = LIS.reduce(0) {result, current in
            return current > result ? current : result
        }
        print("\(maximum)")
    }
    
    /**
     * http://www.geeksforgeeks.org/longest-monotonically-increasing-subsequence-size-n-log-n/
     */
    func betterSolve(array:[Int]) {
        let N = array.count
        // Auxiliary array to store each appropriate end element
        var endElements = Array(count: N, repeatedValue: 0)
        endElements[0] = array[0]
        var len = 1
        
        for i in 1..<N {
            if array[i] < endElements[0] {
                // replace the first element
                endElements[0] = array[i]
            } else if array[i] > endElements[len - 1] {
                // extend endElements array
                len += 1
                endElements[len - 1] = array[i]
            } else {
                // replace the smallest element that is larger than array[i]
                endElements[ceilIndex(endElements, l: -1, r: len - 1, key: array[i])] = array[i]
            }
        }
        print("\(len)")
    }
}

class SherlockAndCost {
    
    func solution() {
        let T = getInt()
        for _ in 0..<T {
            let _ = getLine()
            let array = getLineToArray().map { Int($0)! }
            solve(array)
        }
    }
    
    /**
     *  To solve this problem, we need to find out the optimal structure of the problem.
     *  For current best Sum, we could derive it from two ways. 
     *      
     *  (1) [LOW]   current sum choose the lower boundary
     *  (2) [HIGH]  current sum choose the upper boundary
     *
     *  the case (1)  we could get from max (previous[LOW], previous[HIGH] + abs(previous element - 1))
     *  the case (2)  we could get from max (previous[HIGH] + abs(previous element - current element),
     *                                       previous[HIGH] + abs(previous element - 1))
     */
    func solve(input:[Int]) {
        let N = input.count
        var maxSumTable = Array(count: N, repeatedValue: [0, 0])
        
        let LOW = 0
        let HIGH = 1
        for i in SRange(start: 1, end: N) {
            maxSumTable[i][LOW] = max(maxSumTable[i-1][LOW], maxSumTable[i-1][HIGH] + abs(input[i-1] - 1))
            let preHIGH = maxSumTable[i-1][HIGH] + abs(input[i] - input[i-1])
            let preLOW = maxSumTable[i-1][LOW] + abs(input[i] - 1)
            maxSumTable[i][HIGH] = max(preHIGH, preLOW)
        }
        print("\(max(maxSumTable[N-1][LOW], maxSumTable[N-1][HIGH]))")
    }
}

class HexagonalGrid {
    static let nextPos = [(1, 0), (1, -1), (0, 1)]
    
    func solution() {
        let T = getInt()
        for _ in 0..<T {
            let _ = getInt()
            let firstLine = getLine()
            var firstArray:[Int] = []
            for i in firstLine.characters {
                firstArray.append(Int(String(i))!)
            }
            let secondLine = getLine()
            var secondArray:[Int] = []
            for i in secondLine.characters {
                secondArray.append(Int(String(i))!)
            }
            let grids = [firstArray, secondArray]
            solve(grids)
        }
    }
    
    func solve(grid:[[Int]]) {
        var currentGrid = grid
        if rec(&currentGrid) {
            print("YES")
        } else {
            print("NO")
        }
    }
    
    /**
     *  Recursive Solution
     */
    func rec(inout grid:[[Int]]) -> Bool {
        let m = grid.count
        let n = grid[0].count
        
        var changed = false
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == 0 {
                    if changed == false {
                        changed = true
                        grid[i][j] = 1
                        for candidate in HexagonalGrid.nextPos {
                            let nextI = i + candidate.0
                            let nextJ = j + candidate.1
                            if nextI >= 0 && nextI < m && nextJ >= 0 && nextJ < n && grid[nextI][nextJ] == 0 {
                                grid[nextI][nextJ] = 1
                                if rec(&grid) { return true }
                                grid[nextI][nextJ] = 0
                            }
                        }
                        grid[i][j] = 0
                    }
                }
            }
        }
        
        return !changed
    }
}

class SamAndSubString {
    static let MOD = Int(1e9 + 7)
    
    func solution() {
        let input = getLine()
        solve(input)
    }
    
    func solve(input:String) -> Int {
        let N = input.characters.count
        var preSum = Array(count: N, repeatedValue: 0)
        preSum[0] = Int(String(input.characters.first!))!
        var i = 1
        var currentIndex = input.characters.startIndex.successor()
        /**
         *  each time when we add a new element, there is a relationship between previous sum and current sum
         */
        while currentIndex != input.characters.endIndex {
            preSum[i] = (preSum[i-1]*10 + Int(String(input.characters[currentIndex]))!*(i+1))%SamAndSubString.MOD
            i += 1
            currentIndex = currentIndex.successor()
        }
        let retVal = preSum.reduce(0) { total, currentE in
            let newTotal = (total + currentE) % SamAndSubString.MOD
            return newTotal
        }
        print(retVal)
        return retVal
    }
}




