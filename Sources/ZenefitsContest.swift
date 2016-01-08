//
//  ZenefitsContest.swift
//  HRSwift
//
//  Created by yansong li on 2015-11-20.
//  Copyright © 2015 yansong li. All rights reserved.
//

import Foundation

// This one scored 65.0, due to time out

// Need to optimize this solution

// Question 1

class bobCandyShop {
    let cashes = [1, 2, 5, 10, 20, 50, 100]
    var combinations = [[Int]]()
    
    func getNumOfCost(cost:Int, start:Int, valueList:[Int]) -> Void {
        // This way to get rid of redundant cost 
        let length = cashes.count
        if cost == 0 {
            combinations.append(valueList)
        }
        for i in start..<length {
            if cost < cashes[i] {
                return
            }
            self.getNumOfCost(cost - cashes[i], start: i, valueList: valueList+[cashes[i]])
        }
    }
    
    // Editorial Solution
    // https://www.hackerrank.com/contests/zenhacks/challenges/candy-shop/editorial
    func call(i:Int, n:Int) -> Int {
        if n < 0 {
            return 0
        }
        if n == 0 {
            return 1
        }
        if i == 7{
            return 0
        }
        
        var ans = 0
        ans += call(i, n: n-cashes[i]) + call(i+1, n: n)
        return ans
    }
    
    func solution() -> Void {
        let cost = Int(getLine())!
        //getNumOfCost(cost, start: 0, valueList: [])
        //print(combinations.count)
        print(call(0, n: cost))
    }
}


// Question 2

class EncryptionModule {
    let p: String
    let ePrime: String
    var shiftCounts: [Int:Int]
    
    init(p:String, ep:String) {
        self.p = p
        self.ePrime = ep
        shiftCounts = [Int: Int]()
    }
    
    // wrong one because I forgot to count recycle of shift
//    func calculateShifting() -> Void {
//        for (i, c) in p.characters.enumerate() {
//            let currentDetectIndex = ePrime.characters.startIndex.advancedBy(i)
//            let characterToCompare = ePrime.characters[currentDetectIndex]
//            let toCompare = characterToCompare.unicodeScalarCodePoint()
//            let compared = c.unicodeScalarCodePoint()
//            if let val = shiftCounts[toCompare - compared] {
//                shiftCounts[toCompare - compared] = val + 1
//            } else {
//                shiftCounts[toCompare - compared] = 1
//            }
//        }
//        var minimal = Int.min
//        for (_, counts) in shiftCounts {
//            if minimal < counts {
//                minimal = counts
//            }
//        }
//        print(shiftCounts)
//        print(p.characters.count - minimal)
//    }
    
    func calculateShifting() -> Void {
        for (i, c) in p.characters.enumerate() {
            let currentDetectIndex = ePrime.characters.startIndex.advancedBy(i)
            let characterToCompare = ePrime.characters[currentDetectIndex]
            let toCompare = characterToCompare.unicodeScalarCodePoint()
            let compared = c.unicodeScalarCodePoint()
            if let val = shiftCounts[toCompare - compared] {
                shiftCounts[toCompare - compared] = val + 1
            } else {
                shiftCounts[toCompare - compared] = 1
            }
        }
        var final = [Int: Int]()
        for (k, v) in shiftCounts {
        
            print("key:\(k), value:\(v)")
            let reverseKey = k > 0 ? k-26 : 26+k
            
            if let _ = final[k] {
                continue
            }
            
            if let _ = final[reverseKey] {
                continue
            }
            
            var countTotal = v
            if let val = shiftCounts[reverseKey] {
                countTotal += val
            }
            
            final[k] = countTotal
        }
        var minimal = Int.min
        for (_, counts) in final {
            if minimal < counts {
                minimal = counts
            }
        }
        print(final)
        print(p.characters.count - minimal)
    }
}

// Question 3

class jarjarBinks {
    // This question want me to find pair of shoes that matches
    
    func getPairOfShoes(pairs:[(String, String)]) -> Void {
        var matches = [String:[String:Int]]()
        for (des, type) in pairs {
            if var savedType = matches[des] {
                if let typeCount = savedType[type] {
                    savedType[type] = typeCount + 1
                } else {
                    savedType[type] = 1
                }
                matches[des] = savedType
            } else {
                matches[des] = [type: 1]
            }
        }
        
        var totalMatches = 0
        for (_, savedType) in matches {
            if savedType.keys.count == 2 {
                var lessCount = Int.max
                for (_, count) in savedType {
                    if count < lessCount {
                        lessCount = count
                    }
                }
                totalMatches += lessCount
            }
        }
        print(totalMatches)
    }
    
    
    func solution() -> Void {
        let N = Int(getLine())!
        var inputs = [(String, String)]()
        for _ in 0..<N {
            let currentInput = getLine()
            let splitted = currentInput.componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
            let des = splitted[0] + splitted[1] + splitted[2]
            let type = splitted[3]
            inputs.append((des, type))
        }
        
        getPairOfShoes(inputs)
    }
    
    func test() -> Void {
        let myPairs = [("nike4blue","L"),("adidas4green","L"),("nike4blue","R")]
        getPairOfShoes(myPairs)
    }
}

// Question 4

class PrimeTargets {
    
    var currentPrimes = [Int]()
    func solution() -> Void {
        let N = Int(getLine())!
        let inputs = getLine().componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).map{Int($0)!}
        getPrimesSumBetter(inputs,count: N)
    }
    
    // This solution has time out
    
    func getPrimesSum(inputs:[Int], count:Int) -> Void {
        let primes = getPrimes(count)
        var total = 0
        for i in 0..<count {
            for j in primes {
                if i + j < count {
                    // valid index
                    total += inputs[i+j] - inputs[i]
                }
            }
        }
        print(total)
    }
    
    // Find another solution that could improve time efficiency
    /*
        The idea behind this is to count the position in the prime, so we could directly get the num of this value be minused times and minus others time
    
        To find the position of some index we could use binary search
    
        Already improve score from 33.3 to 66.6 the limitation now is how to fast generate prime
    */
    
    func getPrimesSumBetter(inputs:[Int], count:Int) -> Void {
        let primes = getPrimes(count)
        currentPrimes = primes
        var total = 0
        for i in 0..<count {
            let minusPartCount = (count-1) - i
            let plusPartCount = i
            let minusCount = binarySearchLessOrEqualIndex(minusPartCount)
            let plusCount = binarySearchLessOrEqualIndex(plusPartCount)
            total = total + inputs[i] * plusCount - inputs[i] * minusCount
        }
        print(total)
    }
    
    func getPrimes(length:Int) -> [Int] {
        // Here the length means how many elements we have
        // This prime finder is a specific one because we want to find gap that is prime
        // so we start from 3
        var primes = [Int]()
        if length < 3 {
            return primes
        }
        
        // here since we want to find gap, length should not be included, start from 2 since 2 is the smallest prime
        for i in 2..<length {
            var currentIsPrime = true
            // check prime is general, we should use count from 2 to sqrt(i) to see whether or not it
            // could be divided.
            let higherBounder = sqrt(Double(i))
            let intHigher = Int(higherBounder)
            if intHigher >= 2 {
                for j in 2...intHigher {
                    if i % j == 0 {
                        currentIsPrime = false
                        break
                    }
                }
            }
            
            if currentIsPrime {
                primes.append(i)
            }
        }
        return primes
    }
    
    func binarySearchLessOrEqualIndex(target:Int) -> Int {
        var lowerIndex = 0
        var higherIndex = currentPrimes.count - 1
        
        var indexToCheck = (higherIndex + lowerIndex) / 2
        while lowerIndex <= higherIndex {
            if currentPrimes[indexToCheck] == target {
                return indexToCheck + 1
            } else if (currentPrimes[indexToCheck] < target) {
                lowerIndex = indexToCheck + 1
                indexToCheck = (higherIndex + lowerIndex) / 2
            } else {
                higherIndex = indexToCheck - 1
                indexToCheck = (higherIndex + lowerIndex) / 2
            }
        }
        
        // At this point our lower exceed higher
        return higherIndex + 1
    }
    
    func test() -> Void {
        getPrimesSumBetter([2, 4, 6, 8, 10, 12, 14], count: 7)
    }
}

// Question 9


// https://www.hackerrank.com/contests/zenhacks/challenges/zenland
class BattleOfRyloth {
    // required person at Node[i]
    var required = [Int](count: 100000, repeatedValue: 0)
    // available person at Node[i]
    var available = [Int](count: 100000, repeatedValue: 0)
    // degree of node i in given tree
    var degree = [Int](count: 100000, repeatedValue: 0)
    // Adjacency list of Node
    var graph = [[Int]](count: 100000, repeatedValue: [])
    // Queue to store all the leaves
    var leafNodes = Queue<Int>()
    
    // Used LinkedListQueue to try to improve performance, failed
    var leafNodes2 = LinkedListQueue<Int>()
    
    
    func solution() {
        let numberOfNodes = Int(getLine())!
        for i in 0..<numberOfNodes {
            let infoArray = getLineToArray().map {Int($0)!}
            available[i] = infoArray[0]
            required[i] = infoArray[1]
        }
        
        for _ in 0..<numberOfNodes-1 {
            let edge = getLineToArray().map {Int($0)!}
            degree[edge[0]]++;
            degree[edge[1]]++;
            graph[edge[0]].append(edge[1])
            graph[edge[1]].append(edge[0])
        }
        
        // save leaf to leafQueue
        for i in 0..<numberOfNodes {
            if degree[i] == 1 {
                leafNodes.enqueue(i)
            }
        }
        
        var answer = 0
        while !leafNodes.isEmpty {
            let currentLeaf = leafNodes.dequeue()! as Int
            // Maybe negative
            let extraPersonCount = available[currentLeaf] - required[currentLeaf]
            
            // delete current leaf node from tree
            degree[currentLeaf] = 0
            
            for i in 0..<graph[currentLeaf].count {
                let adjacentNode = graph[currentLeaf][i]
                if degree[adjacentNode] == 0 {
                    continue
                }
                
                degree[adjacentNode]--
                if degree[adjacentNode] == 1 {
                    leafNodes.enqueue(adjacentNode)
                }
                available[adjacentNode] += extraPersonCount
                answer += abs(extraPersonCount)
            }
        }
        print(answer)
    }
    
    
    func solution2() {
        let numberOfNodes = Int(getLine())!
        for i in 0..<numberOfNodes {
            let infoArray = getLineToArray().map {Int($0)!}
            available[i] = infoArray[0]
            required[i] = infoArray[1]
        }
        
        for _ in 0..<numberOfNodes-1 {
            let edge = getLineToArray().map {Int($0)!}
            degree[edge[0]]++;
            degree[edge[1]]++;
            graph[edge[0]].append(edge[1])
            graph[edge[1]].append(edge[0])
        }
        
        // save leaf to leafQueue
        for i in 0..<numberOfNodes {
            if degree[i] == 1 {
                leafNodes2.enqueue(i)
            }
        }
        
        var answer = 0
        while !leafNodes2.isEmpty() {
            let currentLeaf = leafNodes2.dequeue()! as Int
            // Maybe negative
            let extraPersonCount = available[currentLeaf] - required[currentLeaf]
            
            // delete current leaf node from tree
            degree[currentLeaf] = 0
            
            for i in 0..<graph[currentLeaf].count {
                let adjacentNode = graph[currentLeaf][i]
                if degree[adjacentNode] == 0 {
                    continue
                }
                
                degree[adjacentNode]--
                if degree[adjacentNode] == 1 {
                    leafNodes2.enqueue(adjacentNode)
                }
                available[adjacentNode] += extraPersonCount
                answer += abs(extraPersonCount)
            }
        }
        print(answer)
    }
    
    func solution3() {
        let numberOfNodes = Int(getLine())!
        for i in 0..<numberOfNodes {
            let infoArray = getLineToArray().map {Int($0)!}
            available[i] = infoArray[0]
            required[i] = infoArray[1]
        }
        
        for _ in 0..<numberOfNodes-1 {
            let edge = getLineToArray().map {Int($0)!}
            graph[edge[0]].append(edge[1])
            graph[edge[1]].append(edge[0])
        }
        
        var seq: [Int] = [Int](count: numberOfNodes, repeatedValue: 0)
        var p: [Int] = [Int](count: numberOfNodes, repeatedValue: 0)
        
        seq[0] = 0
        p[0] = -1
        var top = 1
        
        for i in SRange(end: numberOfNodes - 1) {
            let now = seq[i]
            for j in graph[now] {
                if j != p[now] {
                    p[j] = now
                    seq[top] = j
                    top += 1
                }
            }
        }
        
        var answer = 0
        for i in SRange(start: numberOfNodes-1, end: 0, step: -1) {
            let x = seq[i]
            answer += abs(available[x] - required[x])
            available[p[x]] += available[x] - required[x]
        }
        print(answer)
    }
}

