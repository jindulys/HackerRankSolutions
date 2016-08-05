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