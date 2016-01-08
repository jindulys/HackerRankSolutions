//
//  IndeedPrime.swift
//  HRSwift
//
//  Created by yansong li on 2015-12-12.
//  Copyright © 2015 yansong li. All rights reserved.
//

import Foundation

public class TheUltimateQuestion {
    public init() {}
    
    func solution() {
        let inputs = getLineToArray().map {Int($0)!}
        let addSum = (inputs.reduce(0, combine: +), "\(inputs[0])+\(inputs[1])+\(inputs[2])")
        let multiSum = (inputs.reduce(1, combine: *),"\(inputs[0])*\(inputs[1])*\(inputs[2])")
        let addMulti = (inputs[0] + inputs[1] * inputs[2],"\(inputs[0])+\(inputs[1])*\(inputs[2])")
        let multiAdd = (inputs[0] * inputs[1] + inputs[2], "\(inputs[0])*\(inputs[1])+\(inputs[2])")
        
        let myResults = [addSum, multiSum, addMulti, multiAdd]
        let results = myResults.filter {$0.0 == 42}
        if results.count > 0 {
            print(results[0].1)
        } else {
            print("This is not the ultimate question")
        }
    }
}

public class RelatedSpecies {
    public init() {}
    func solution() {
        let T = Int(getLine())!
        for _ in 0..<T {
            let N = Int(getLine())!
            let seq1 = getLineToArray().map {Int($0)!}
            let seq2 = getLineToArray().map {Int($0)!}
            solve(seq1, b: seq2, N: N)
        }
    }
    
    // This solution timeout
    public func solve(a: [Int], b: [Int], N: Int) {
        var current = 0
        for i in 0..<N {
            let currentMax = max(a[i], b[i])
            if current > currentMax {
                print("NO")
                return
            }
            let currentMin = min(a[i], b[i])
            if currentMin >= current {
                current = currentMin
            } else {
                current = currentMax
            }
        }
        print("YES")
    }
    
    // Divide and conquer
}

public class Gretchen {
    
    public init() {}
    // Overtime
    func solution() {
        var parameters = getLineToArray().map {Int($0)!}
        let M = parameters[0]
        let N = parameters[1]
        let Q = parameters[2]
        
        var actors = getLineToArray().map {Int($0)!}
        var scenesTree = [AVLTree<Int>]()
        for _ in 0..<M {
            scenesTree.append(AVLTree<Int>())
        }
        for i in 0..<N {
            let currentTree = scenesTree[actors[i]]
            currentTree + i
        }
        
        var scenesActors = [UInt]()
        for i in 0..<M {
           scenesActors.append(scenesTree[i].count)
        }
        
        for _ in 0..<Q {
            let actions = getLineToArray().map {Int($0)!}
            if actions[0] == 1 {
                // move actor Ni to Mi
                let currentActor = actions[1]
                let newScene = actions[2]
                
                // remove actor from oldtree
                let oldTree = scenesTree[actors[currentActor]]
                oldTree - currentActor
                
                // update scenes actors count
                scenesActors[actors[currentActor]] -= 1
                
                // add actor to newtree
                let newTree = scenesTree[newScene]
                newTree + currentActor
                
                // update actors - scenes map
                actors[currentActor] = newScene
                
                // update scenes actors count
                scenesActors[actors[currentActor]] += 1
            } else {
                let countArray = scenesActors.filter {$0 < UInt(actions[1])}
                print(countArray.count)
            }
        }
    }
    
    // Overtime
    func BITSolution() {
        var parameters = getLineToArray().map {Int($0)!}
        let M = parameters[0]
        let N = parameters[1]
        let Q = parameters[2]
        
        var actors = getLineToArray().map {Int($0)!}
        var segCount = Array(count: M, repeatedValue: 0)
        
        for i in 0..<N {
            segCount[actors[i]]++
        }
        
        // create and update BIT
        let BIT = BinaryIndexedTree(size: N)
        for i in 0..<M {
            BIT.update(segCount[i], val: 1)
        }
        
        for _ in 0..<Q {
            let actions = getLineToArray().map {Int($0)!}
            if actions[0] == 1 {
                // move actor Ni to Mi
                let currentActor = actions[1]
                let newScene = actions[2]
                
                let oldScene = actors[currentActor]
                let oldCount1 = segCount[oldScene]
                let newCount1 = oldCount1 - 1
                BIT.update(oldCount1, val: -1)
                BIT.update(newCount1, val: 1)
                segCount[oldScene]--
                
                let oldCount2 = segCount[newScene]
                let newCount2 = oldCount2 + 1
                BIT.update(oldCount2, val: -1)
                BIT.update(newCount2, val: 1)
                segCount[newScene]++
                
                actors[currentActor] = newScene
            } else {
                let above = BIT.query(N) - BIT.query(actions[1] - 1)
                print("\(M - above)")
            }
        }
    }
}


