//
//  101_SymmetricTree.swift
//  HRSwift
//
//  Created by yansong li on 2016-08-06.
//  Copyright © 2016 yansong li. All rights reserved.
//

import Foundation

/**
	Title:101 Symmetric Tree
	URL: https://leetcode.com/problems/symmetric-tree/
	Space: O(n)
	Time: O(n)
 */

class SymmetricTree_Solution {
  /// Bonus points: Iterative
  func isSymmetric(root: TreeNode?) -> Bool {
    guard let root = root else {
      return true
    }
    let original = self.treeToArray(root)
    let switchedRoot = self.switchSubTree(root)
    let switched = self.treeToArray(switchedRoot)
    let comparison = zip(original, switched).map {
      return $0 == $1
    }.reduce(true) {
      $0 && $1
    }
    return comparison
  }
  
  private func switchSubTree(root: TreeNode) -> TreeNode {
    var switchedLeft: TreeNode?
    var switchedRight: TreeNode?
    if let left = root.left {
      switchedLeft = switchSubTree(left)
    }
    if let right = root.right {
      switchedRight = switchSubTree(right)
    }
    root.left = switchedRight
    root.right = switchedLeft
    return root
  }

  /// Use a queue to convert a tree to an array.
  private func treeToArray(root: TreeNode?) -> [TreeValue] {
    guard let root = root else {
      return [TreeValue.Empty]
    }
    var traversalQueue = Queue<TreeNode>()
    var retVal: [TreeValue] = [.Valid(root.val)]
    traversalQueue.enqueue(root)
    while !traversalQueue.isEmpty() {
      let currentNode = traversalQueue.dequeue()!
      if let left = currentNode.left {
        retVal.append(.Valid(left.val))
        traversalQueue.enqueue(left)
      } else {
        retVal.append(.Empty)
      }
      if let right = currentNode.right {
        retVal.append(.Valid(right.val))
        traversalQueue.enqueue(right)
      } else {
        retVal.append(.Empty)
      }
    }
    return retVal
  }
  
  /// A simpler solution, recursive
  func solutionTwo(root: TreeNode?) -> Bool {
    guard let root = root else {
      return true
    }
    return symmetricHelper(root.left, q: root.right)
  }
  
  private func symmetricHelper(p: TreeNode?, q: TreeNode?) -> Bool {
    if p == nil && q == nil {
      return true
    }
    if p == nil || q == nil || p?.val != q?.val {
      return false
    }
    return symmetricHelper(p?.left, q: q?.right) && symmetricHelper(p?.right, q: q?.left)
  }
}

enum TreeValue {
  case Valid(Int)
  case Empty
}

extension TreeValue: Equatable { }

func ==(lhs: TreeValue, rhs: TreeValue) -> Bool {
  switch (lhs, rhs) {
  case (.Valid(let lval), .Valid(let rval)):
    return lval == rval
  case (.Empty, .Empty):
    return true
  default:
    return false
  }
}