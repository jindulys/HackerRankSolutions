//
//  100_SameTree.swift
//  HRSwift
//
//  Created by yansong li on 2016-08-02.
//  Copyright © 2016 yansong li. All rights reserved.
//

import Foundation

public class TreeNode {
  public var val: Int
  public var left: TreeNode?
  public var right: TreeNode?
  public init(_ val: Int) {
    self.val = val
      self.left = nil
      self.right = nil
  }
}

/**
  Given two binary trees, write a function to check if they are equal or not.
  
  Two binary trees are considered equal if they are structurally identical and the nodes have the same value.
 */

public class Solution {
  public func isSameTree(p: TreeNode?, _ q: TreeNode?) -> Bool {
    switch(p, q){
      case (let .Some(leftRoot), let .Some(rightRoot)):
        let valEqual = (leftRoot.val == rightRoot.val)
        let leftEqual = isSameTree(leftRoot.left, rightRoot.left)
        let rightEqual = isSameTree(leftRoot.right, rightRoot.right)
        return valEqual && leftEqual && rightEqual
      case (.None, .None):
        return true
      default:
        return false
    }
  }
}