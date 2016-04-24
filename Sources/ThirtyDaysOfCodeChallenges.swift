//
//  ThirtyDaysOfCodeChallenges.swift
//  HRSwift
//
//  Created by yansong li on 2016-04-23.
//  Copyright © 2016 yansong li. All rights reserved.
//

import Foundation

/// Day0 Challenge
public class DayO {
    func solution() {
        var input = "Hello, World.\n"
        input += getLine()
        print(input)
    }
}

/// Day1 Data Types
public class DayOne {
    func solution() {
        let i = 4
        let d = 4.0
        let s = "HackerRank"
        print(i + getInt())
        print(d + Double(getInt()))
        print(s + getLine())
    }
}