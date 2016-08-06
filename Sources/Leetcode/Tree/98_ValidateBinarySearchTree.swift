//
//  98_ValidateBinarySearchTree.swift
//  HRSwift
//
//  Created by yansong li on 2016-08-06.
//  Copyright © 2016 yansong li. All rights reserved.
//

import Foundation

/**
	Title:98 Validate Binary Search Tree
	URL: https://leetcode.com/problems/validate-binary-search-tree/
	Space: O(n)
	Time: O(n)
 */

/// Inorder traversal.
class ValidateBinaryTree_Solution {
  func isValidBST(root: TreeNode?) -> Bool {
    var inorderList: [Int] = []
    inorderTraversal(root, nodeList: &inorderList)
    return inorderList.isStrictlyIncreasing
  }
  
  func inorderTraversal(root: TreeNode?, inout nodeList: [Int]) {
    guard let root = root else {
      return
    }
    inorderTraversal(root.left, nodeList: &nodeList)
    nodeList.append(root.val)
    inorderTraversal(root.right, nodeList: &nodeList)
  }
}