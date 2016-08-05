//
//  104_MaximumDepthOfBinaryTree.swift
//  HRSwift
//
//  Created by yansong li on 2016-08-03.
//  Copyright © 2016 yansong li. All rights reserved.
//

import Foundation

/**
  Given a binary tree, find its maximum depth.
  
  The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.
 */

/**
  Swift Knowledge:
 
  Generic, custom struct, tuple, optional
 
  Algorithem Knowledge:
 
  1) How to define meaningful helper object like nodeQueue maximumDepth means we need
    to treverse all elements according to the level.
  2) Breadth first treverse.
  3) Queue.
 */

/**
 104. Maximum Depth of Binary Tree
 https://leetcode.com/problems/maximum-depth-of-binary-tree/
 */

class MaximumDepthOfBinaryTree_Solution {
  func maxDepth(root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    var nodeQueue = Queue<(TreeNode, Int)>()
    nodeQueue.enqueue((root, 1))
    var maxLevel = 1
    while !nodeQueue.isEmpty() {
      let (currentNode, currentLevel) = nodeQueue.dequeue()!
      maxLevel = currentLevel
      let currentLeft = currentNode.left
      let currentRight = currentNode.right
      if let left = currentLeft {
        nodeQueue.enqueue((left, currentLevel + 1))
      }
      if let right = currentRight {
        nodeQueue.enqueue((right, currentLevel + 1))
      }
    }
    return maxLevel
  }
}