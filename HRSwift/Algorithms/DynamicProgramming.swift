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


