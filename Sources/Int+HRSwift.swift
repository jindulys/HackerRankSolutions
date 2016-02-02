//
//  Int+HRSwift.swift
//  HRSwift
//
//  Created by yansong li on 2016-02-01.
//  Copyright © 2016 yansong li. All rights reserved.
//

import Foundation

public extension Int {
    public static func random(range: Range<Int>) -> Int {
        return range.startIndex + Int(arc4random_uniform(UInt32(range.endIndex.predecessor()-range.startIndex)))
    }
}