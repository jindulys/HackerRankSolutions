//
//  AppDelegate.swift
//  HRSwift
//
//  Created by yansong li on 2015-11-20.
//  Copyright © 2015 yansong li. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        let myTestA = "a"
        let myC = myTestA.characters[myTestA.characters.startIndex]
        print(myC.unicodeScalarCodePoint())
        
        let my2 = EncryptionModule(p: "abcdf", ep: "zabya")
        my2.calculateShifting()
    
        // Question 3
        let myTestJar = jarjarBinks()
        myTestJar.test()
        
        
        // Question 4
        let myTestPrimes = PrimeTargets()
        myTestPrimes.test()
        
        print("Binary search result: \(binarySearchLessOrEqualIndex([], target: 6))")
        
        let todayDescription = "Hi, today is Sunday"
        for i in todayDescription.characters {
            print(i)
        }
        
        let todayCount = todayDescription.characters.count
        
        print(todayDescription[todayDescription.startIndex.advancedBy(todayCount-1, limit: todayDescription.endIndex)])
        
        for i in 1..<1 {
            print(i)
        }
        
        let funnyStringTest = FunnyString()
        
        funnyStringTest.solve("acxz")
        
        let zC: Character = "z"
        print(zC.unicodeScalarCodePoint())
        
        let myFirstNode = ListNode(10)
        myFirstNode.next = ListNode(100)
        print(myFirstNode)
        
        let mySecondNode = ListNode.reverse(myFirstNode)
        print(mySecondNode)
        print(myFirstNode)
        
        let myLinkedListNode = LinkedListQueue<Int>()
        myLinkedListNode.enqueue(10)
        myLinkedListNode.enqueue(100)
        myLinkedListNode.enqueue(1000)
        myLinkedListNode.description()
        print(myLinkedListNode.isEmpty())
        
        print(myLinkedListNode.dequeue())
        print(myLinkedListNode.dequeue())
        print(myLinkedListNode.dequeue())
        print(myLinkedListNode.dequeue())
        print(myLinkedListNode.isEmpty())
        
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func binarySearchLessOrEqualIndex(inputs:[Int], target:Int) -> Int {
        var lowerIndex = 0
        var higherIndex = inputs.count - 1
        
        var indexToCheck = (higherIndex + lowerIndex) / 2
        while lowerIndex <= higherIndex {
            if inputs[indexToCheck] == target {
                return indexToCheck + 1
            } else if (inputs[indexToCheck] < target) {
                lowerIndex = indexToCheck + 1
                indexToCheck = (higherIndex + lowerIndex) / 2
            } else {
                higherIndex = indexToCheck - 1
                indexToCheck = (higherIndex + lowerIndex) / 2
            }
        }
        
        // At this point our lower exceed higher
        return higherIndex + 1
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

