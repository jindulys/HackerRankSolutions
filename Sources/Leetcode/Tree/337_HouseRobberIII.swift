//
//  337_HouseRobberIII.swift
//  HRSwift
//
//  Created by yansong li on 2016-08-04.
//  Copyright © 2016 yansong li. All rights reserved.
//

import Foundation

/**
 Swift Knowledge:
 
 Hashable, Equality, Memoization(awesome!), Functional Programming
 
 Algorithem Knowledge:
 
 DFS Traverse, DP Programming
 */


/**
  public func memoize<T: Hashable, U: Comparable>( body:((T)->U, T)->U ) -> (T)->U {
    var memo = Dictionary<T, U>()
    var result: ((T)->U)!
    result = { x in
      if let q = memo[x] { return q }
      let r = body(result, x)
      memo[x] = r
      return r
    }
    return result
  }
*/

class HouseRobberIII_Solution {
  func rob(root: TreeNode?) -> Int {
    guard let root = root else {
      return 0
    }
    let hashableRoot = HashableTreeNode.buildHashableTreeWith(root)
    let ans: (HashableTreeNode) -> Int = memoize { (ans, currentNode) -> Int in
      var robRoot = currentNode.val
      var robNonRoot = 0
      if let left = currentNode.left {
        if let leftLeft = left.left {
          robRoot += ans(leftLeft)
        }
        if let leftRight = left.right {
          robRoot += ans(leftRight)
        }
        robNonRoot += ans(left)
      }
      if let right = currentNode.right {
        if let rightLeft = right.left {
          robRoot += ans(rightLeft)
        }
        if let rightRight = right.right {
          robRoot += ans(rightRight)
        }
        robNonRoot += ans(right)
      }
      return max(robRoot, robNonRoot)
    }
    return ans(hashableRoot!)
  }
}