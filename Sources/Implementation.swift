//
//  WarmUp.swift
//  HRSwift
//
//  Created by yansong li on 2015-11-24.
//  Copyright © 2015 yansong li. All rights reserved.
//

import Foundation

// https://www.hackerrank.com/challenges/angry-professor
public class AngryProfessor {
    
    public init() {}
    
    func solution() -> Void {
        let TN = Int(getLine())!
        for _ in 0..<TN {
            let infoArray = getLineToArray().map {Int($0)!}
            let K = infoArray[1]
            let arrives = getLineToArray().map {Int($0)!}
            
            // use filter to filter out unsatisfied elements
            let earlyBirds = arrives.filter {$0 <= 0}
            if earlyBirds.count >= K {
                print("YES")
            } else {
                print("NO")
            }
        }
    }
}

// https://www.hackerrank.com/challenges/sherlock-and-the-beast
public class SherlockAndTheBeast {
    
    public init() {}
    
    func solution() -> Void {
        let TN = Int(getLine())!
        for _ in 0..<TN {
            let N = Int(getLine())!
            print(cypherOutput(N))
        }
    }
    
    public func cypherOutput(cypher: Int) -> String {
        for i in SRange(start: cypher/3*3, end:-1, step:-3) {
            if (cypher - i) % 5 == 0 {
                let fives = String(count: i, repeatedValue: Character("5"))
                let threes = String(count: cypher-i, repeatedValue: Character("3"))
                return fives + threes
            }
        }
        return "-1"
    }
}

public class UtopianTree {
    var heights:[Int]
    
    static func generatesHeights() -> [Int] {
        var heights = [1]
        var h = 1
        for i in 0..<60 {
            // Normal remainder operator
            //if (i%2 == 0) {
            if (i & 1 == 0) {
                h = h*2
            } else {
                h = h+1
            }
            heights.append(h)
        }
        return heights
    }
    
    public init() {
        heights = UtopianTree.generatesHeights()
    }
    
    func solution() -> Void {
        let T = Int(getLine())!
        for _ in 0..<T {
            let N = Int(getLine())!
            print(heights[N])
        }
    }
}

public class FindDigits {
    
    public init() {}
    
    public func countN(n: String) {
        let N = Int(n)!
        var count = 0
        for c in n.characters {
            let digit = Int(String(c))!
            if digit == 0 {
                continue
            }
            if N%digit == 0 {
                count += 1
            }
        }
        print(count)
    }
    
    func solution() -> Void {
        let T = getInt()
        for _ in 0..<T {
            countN(getLine())
        }
    }
}


