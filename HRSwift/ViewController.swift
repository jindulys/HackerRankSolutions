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
      
      let root = TreeNode(1)
      
      let rootleft = TreeNode(2)
      let rootright = TreeNode(2)
      
      let leftRight = TreeNode(3)
      
      let rightRight = TreeNode(3)
      
      root.left = rootleft
      root.right = rootright
      root.left?.right = leftRight
      root.right?.right = rightRight
      
      let pathSum = PathSumII_Solution()
      print(pathSum.pathSum(root, 6))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

