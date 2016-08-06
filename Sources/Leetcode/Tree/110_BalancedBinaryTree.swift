//
//  110_BalancedBinaryTree.swift
//  HRSwift
//
//  Created by yansong li on 2016-08-05.
//  Copyright © 2016 yansong li. All rights reserved.
//

import Foundation

/**
	Title:110 Balanced Binary Tree
	URL: https://leetcode.com/problems/balanced-binary-tree/
	Space: O(n)
	Time: O(n)
 */

class BalancedBinaryTree_Solution {
  func isBalanced(root: TreeNode?) -> Bool {
    let(ans, _) = balancedAt(root)
    return ans
  }
  
  /// Detect whether a treenode is balanced, return the detection result and
  /// Depth of the treenode
  /// - parameter root: the root treenode.
  private func balancedAt(root: TreeNode?) -> (Bool, Int) {
    guard let root = root else {
      return (true, 0)
    }
    let (leftBalanced, leftDepth) = balancedAt(root.left)
    let (rightBalanced, rightDepth) = balancedAt(root.right)
    let subTreeBalanced = leftBalanced && rightBalanced
    let noMoreThanOne = abs(leftDepth - rightDepth) <= 1
    let depth = max(leftDepth, rightDepth)
    return (subTreeBalanced && noMoreThanOne, depth + 1)
  }
}