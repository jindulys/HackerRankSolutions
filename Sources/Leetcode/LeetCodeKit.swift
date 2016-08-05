//
//  LeetCodeKit.swift
//  HRSwift
//
//  Created by yansong li on 2016-08-04.
//  Copyright © 2016 yansong li. All rights reserved.
//

import Foundation

// MARK: TreeNode

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

/// HashableTreeNode is a wrapper around TreeNode, to facilitate Hash.
public class HashableTreeNode {
  public var val: Int
  public var left: HashableTreeNode?
  public var right: HashableTreeNode?
  public var id: Int
  
  public init(val: Int, id: Int) {
    self.val = val
    self.id = id
  }
  
  /// Helper function to build a HashableTreeNode with TreeNode.
  public class func buildHashableTreeWith(root: TreeNode?, id: Int = 0) -> HashableTreeNode? {
    guard let root = root else {
      return nil
    }
    let hashableRoot = HashableTreeNode(val: root.val, id: id)
    let leftHashableRoot = self.buildHashableTreeWith(root.left, id: id * 2 + 1)
    let rightHashableRoot = self.buildHashableTreeWith(root.right, id: id * 2 + 2)
    hashableRoot.left = leftHashableRoot
    hashableRoot.right = rightHashableRoot
    return hashableRoot
  }
}

extension HashableTreeNode: Hashable {
  public var hashValue: Int {
    return self.id
  }
}

public func ==(lhs: HashableTreeNode, rhs: HashableTreeNode) -> Bool {
  return lhs.hashValue == rhs.hashValue
}