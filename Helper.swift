//
//  Array+HRSwift.swift
//  HRSwift
//
//  Created by yansong li on 2016-02-01.
//  Copyright © 2016 yansong li. All rights reserved.
//

import Foundation
let N = 300
let LargeInt = 1 << 12


public class Helper {
    public static func LargeIntArray() -> [Int] {
        var retVal = Array<Int>(count: N, repeatedValue: 0)
        for i in 0..<N {
            retVal[i] = Int.random(0..<LargeInt)
        }
        return retVal
    }
}
