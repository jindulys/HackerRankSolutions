//
//  Search.swift
//  HRSwift
//
//  Created by yansong li on 2016-04-23.
//  Copyright © 2016 yansong li. All rights reserved.
//

import Foundation

/// https://www.hackerrank.com/challenges/icecream-parlor
class IceCreamParlor {
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