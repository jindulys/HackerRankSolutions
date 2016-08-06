//
//  112_PathSum.swift
//  HRSwift
//
//  Created by yansong li on 2016-08-06.
//  Copyright © 2016 yansong li. All rights reserved.
//

import Foundation

/**
	Title:112 Path Sum
	URL: https://leetcode.com/problems/path-sum/
	Space: O(n)
	Time: O(n)
 */

class PathSum_Solution {
  
  var target: Int = Int.max
  
  func hasPathSum(root: TreeNode?, _ sum: Int) -> Bool {
    self.target = sum
    return dfsSum(root, prevSum: 0)
  }
  
  private func dfsSum(root: TreeNode?, prevSum: Int) -> Bool {
    guard let root = root else {
      return false
    }
    
    let currentSum = prevSum + root.val
    
    if (root.left == nil) && (root.right == nil) && currentSum == target {
      return true
    }

    return dfsSum(root.left, prevSum: currentSum) || dfsSum(root.right, prevSum: currentSum)
  }
}