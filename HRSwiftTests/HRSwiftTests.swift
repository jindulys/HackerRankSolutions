//
//  HRSwiftTests.swift
//  HRSwiftTests
//
//  Created by yansong li on 2015-11-20.
//  Copyright © 2015 yansong li. All rights reserved.
//

import XCTest
@testable import HRSwift

class HRSwiftTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testContainsAllEnglishCharacters() {
        let test1 = "abc"
        let test2 = "AbcdefghijklmnopqRstUVWxyZ"
        let test3 = "Abcdefghijkl  mnopqRstUVWxyZ"
        let test4 = "The quick brown fox jumps over the lazy dog"
        XCTAssert(!test1.containsAllEnglishCharacters(), "Pass")
        XCTAssert(test2.containsAllEnglishCharacters(), "Pass")
        XCTAssert(test3.containsAllEnglishCharacters(), "Pass")
        XCTAssert(test4.containsAllEnglishCharacters(), "Pass")
    }
    
    func testContainsAllEnglishCharactersWithArray() {
        let test1 = "abc"
        let test2 = "AbcdefghijklmnopqRstUVWxyZ"
        let test3 = "Abcdefghijkl  mnopqRstUVWxyZ"
        let test4 = "The quick brown fox jumps over the lazy dog"
        let mySolution = Pangrams()
        XCTAssert(!mySolution.checkPangramsWithArray(test1), "Pass")
        XCTAssert(mySolution.checkPangramsWithArray(test2), "Pass")
        XCTAssert(mySolution.checkPangramsWithArray(test3), "Pass")
        XCTAssert(mySolution.checkPangramsWithArray(test4), "Pass")
    }
    
    func testStringPalindrome() {
        let test1 = "aaa"
        let test2 = "abcd"
        let test3 = "afggfa"
        XCTAssert(test1.isPalindrome(), "Pass")
        XCTAssert(!test2.isPalindrome(), "Pass")
        XCTAssert(test3.isPalindrome(), "Pass")
    }
    
}
