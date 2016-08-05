//
//  102_BinaryTreeLevelOrderTraversal.swift
//  HRSwift
//
//  Created by yansong li on 2016-08-04.
//  Copyright © 2016 yansong li. All rights reserved.
//

import Foundation

/**
  Swift Knowledge:
 
  Queue, Array
 
  Algorithem Knowledge:
 
  BFS
 */

/**
  102. Binary Tree Level Order Traversal
  https://leetcode.com/problems/binary-tree-level-order-traversal/
 */

class BinaryTreeLevelOrderTraversal_Solution {
  func levelOrder(root: TreeNode?) -> [[Int]] {
    guard let root = root else {
      return []
    }
    var queue = Queue<(TreeNode, Int)>()
    var ans: [[Int]] = [[]]
    queue.enqueue((root, 1))
    while !queue.isEmpty() {
      let (currentNode, currentlevel) = queue.dequeue()!
      if ans.count == currentlevel {
        var lastLevelNodes = ans.removeLast()
        lastLevelNodes.append(currentNode.val)
        ans.append(lastLevelNodes)
      } else if ans.count < currentlevel {
        let newLevelNodes = [currentNode.val];
        ans.append(newLevelNodes)
      }
      if let left = currentNode.left {
        queue.enqueue((left, currentlevel + 1))
      }
      if let right = currentNode.right {
        queue.enqueue((right, currentlevel + 1))
      }
    }
    return ans
  }
}