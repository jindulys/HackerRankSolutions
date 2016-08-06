//
//  113_PathSumII.swift
//  HRSwift
//
//  Created by yansong li on 2016-08-06.
//  Copyright © 2016 yansong li. All rights reserved.
//

import Foundation

/**
	Title:113 Path Sum II
	URL: https://leetcode.com/problems/path-sum-ii/
	Space: O(n)
	Time: O(n)
 */

/**
 Swift Knowledge:
 
 Inout Parameter
 
 Algorithem Knowledge:
 
 Stack, DFS
 */

class PathSumII_Solution {
  var satisfiedRouts: [[Int]] = []
  var target: Int = 0
  func pathSum(root: TreeNode?, _ sum: Int) -> [[Int]] {
    self.target = sum
    var routeStack:[Int] = []
    DFSSum(root, prevSum: 0, routeStack: &routeStack)
    return satisfiedRouts
  }
  
  private func DFSSum(root: TreeNode?, prevSum: Int, inout routeStack: [Int]) {
    guard let root = root else {
      return
    }
    let currentSum = root.val + prevSum
    routeStack.append(root.val)
    if root.left == nil && root.right == nil {
      if currentSum == self.target {
        self.satisfiedRouts.append(routeStack)
      }
      routeStack.removeLast()
      print(routeStack)
      return
    }
    DFSSum(root.left, prevSum: currentSum, routeStack: &routeStack)
    DFSSum(root.right, prevSum: currentSum, routeStack: &routeStack)
    // Note: remove here since we have finished this node's check.
    routeStack.removeLast()
  }
}