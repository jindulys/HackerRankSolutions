//
//  106_ConstructBinaryTreeFromInorderAndPostorderTraversal.swift
//  HRSwift
//
//  Created by yansong li on 2016-08-06.
//  Copyright © 2016 yansong li. All rights reserved.
//

import Foundation

/**
	Title:106 Construct Binary Tree From Inorder and Postorder Traversal
	URL: https://leetcode.com/problems/construct-binary-tree-from-inorder-and-postorder-traversal/
	Space: O(n)
	Time: O(n)
 */

class BuildTreeInorderPostOrder_Solution {
  func buildTree(inorder: [Int], _ postorder: [Int]) -> TreeNode? {
    guard inorder.count > 0 && postorder.count > 0 && inorder.count == postorder.count else {
      return nil
    }
    return treeBuildHelper(inorder,
                           inorderStart: 0,
                           inorderEnd: inorder.count - 1,
                           postorder: postorder,
                           postStart: 0,
                           postEnd: postorder.count - 1)
  }
  
  private func treeBuildHelper(inorder: [Int],
                               inorderStart: Int,
                               inorderEnd: Int,
                               postorder: [Int],
                               postStart: Int,
                               postEnd: Int) -> TreeNode? {
    guard inorderStart <= inorderEnd && postStart <= postEnd else {
      return nil
    }
    var mid: Int = 0
    let rootVal = postorder[postEnd]
    let rootNode = TreeNode(rootVal)
    for i in inorderStart...inorderEnd {
      if inorder[i] == rootVal {
        mid = i
        break
      }
    }
    // Note: when calculate postEnd we use the following formula:
    // X - postStart : is how many elements between those two index
    // mid - inorderStart = left tree element counts
    // X - postStart + 1(the first element) == mid - inorderStart
    rootNode.left = treeBuildHelper(inorder,
                                    inorderStart: inorderStart,
                                    inorderEnd: mid - 1,
                                    postorder: postorder,
                                    postStart: postStart,
                                    postEnd: postStart + mid - inorderStart - 1)
    rootNode.right = treeBuildHelper(inorder,
                                    inorderStart: mid + 1,
                                    inorderEnd: inorderEnd,
                                    postorder: postorder,
                                    postStart: postStart + mid - inorderStart,
                                    postEnd: postEnd - 1)
    return rootNode
  }
}