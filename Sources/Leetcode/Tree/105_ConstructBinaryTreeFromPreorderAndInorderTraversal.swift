//
//  105_ConstructBinaryTreeFromPreorderAndInorderTraversal.swift
//  HRSwift
//
//  Created by yansong li on 2016-08-06.
//  Copyright © 2016 yansong li. All rights reserved.
//

import Foundation

/**
	Title:105 Construct Binary Tree From Preorder and Ignorer Traversal
	URL: https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/
	Space: O(n)
	Time: O(n)
 */

class TreeBuildPreorderInorder_Solution {
  func buildTree(preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    guard preorder.count > 0 &&
      inorder.count > 0 &&
      preorder.count == inorder.count else {
      return nil
    }
    return treeBuildHelper(preorder,
                           preStartIndex: 0,
                           preEndIndex: preorder.count - 1,
                           inorder: inorder,
                           inorderStartIndex: 0,
                           inorderEndIndex: inorder.count - 1)
  }
  func treeBuildHelper(preorder: [Int],
                       preStartIndex: Int,
                       preEndIndex: Int,
                       inorder: [Int],
                       inorderStartIndex: Int,
                       inorderEndIndex: Int) -> TreeNode? {
    guard preStartIndex <= preEndIndex &&
      inorderStartIndex <= inorderEndIndex else {
        return nil
    }
    let rootVal = preorder[preStartIndex]
    let currentRoot = TreeNode(rootVal)
    var mid: Int = 0
    for i in inorderStartIndex...inorderEndIndex {
      if inorder[i] == rootVal {
        mid = i
        break
      }
    }
    currentRoot.left = treeBuildHelper(preorder,
                                       preStartIndex: preStartIndex + 1,
                                       preEndIndex: preStartIndex + mid - inorderStartIndex,
                                       inorder: inorder,
                                       inorderStartIndex: inorderStartIndex,
                                       inorderEndIndex: mid - 1)
    currentRoot.right = treeBuildHelper(preorder,
                                        preStartIndex: preStartIndex + mid - inorderStartIndex + 1,
                                        preEndIndex: preEndIndex,
                                        inorder: inorder,
                                        inorderStartIndex: mid + 1,
                                        inorderEndIndex: inorderEndIndex)
    return currentRoot
  }
}