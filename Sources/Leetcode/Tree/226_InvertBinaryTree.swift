//
//  226_InvertBinaryTree.swift
//  HRSwift
//
//  Created by yansong li on 2016-08-03.
//  Copyright © 2016 yansong li. All rights reserved.
//

import Foundation

/**
 *
 * Invert a binary tree.
 *
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

/**
  Swift Knowledge:
 
  Class
 
 Algorithem Knowledge:
 
  Top to bottom
 */

/**
 226 Invert Binary Tree
 https://leetcode.com/problems/invert-binary-tree/
 */

class Solution_invertTree {
  func invertTree(root: TreeNode?) -> TreeNode? {
    guard let root = root else {
      return nil
    }
    invertTree(root.left)
    invertTree(root.right)
    let tmp = root.left
    root.left = root.right
    root.right = tmp
    return root
  }
}