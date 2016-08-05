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
      
      let root = TreeNode(3)
      let rootleft = TreeNode(2)
      let rootright = TreeNode(3)
      let rootleftRight = TreeNode(3)
      let rootRightRight = TreeNode(1)
      root.left = rootleft
      root.right = rootright
      root.left?.right = rootleftRight
      root.right?.right = rootRightRight

      let houseRobber = HouseRobberIII_Solution()
      let ans = houseRobber.rob(root)
      print(ans)
      
      let levelTraversal = BinaryTreeLevelOrderTraversal_Solution()
      let ansl = levelTraversal.levelOrder(root)
      print(ansl)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

