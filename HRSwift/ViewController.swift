//
//  ViewController.swift
//  HRSwift
//
//  Created by yansong li on 2015-11-20.
//  Copyright © 2015 yansong li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
      let root = TreeNode(2)
      let rootleft = TreeNode(2)
      let rootright = TreeNode(3)
      let rootleftleft = TreeNode(2)
      root.left = rootleft
      root.right = rootright
      root.left?.left = rootleftleft
      let solution = MinimumDepthOfBinaryTree_Solution()
      let result = solution.minDepth(root)
      print(result)
      
      let hashableRoot = HashableTreeNode.buildHashableTreeWith(root)
      print(hashableRoot?.left)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

