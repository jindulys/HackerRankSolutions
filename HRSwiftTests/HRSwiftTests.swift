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
    
    func testQueueImplementation() {
        var queue = Queue<String>()
        queue.enqueue("Yansong")
        queue.enqueue("Li")
        queue.enqueue("Great")
        XCTAssert(queue.dequeue() == .Some("Yansong"), "Pass")
        XCTAssert(queue.dequeue() == "Li", "Pass")
        XCTAssert(queue.dequeue() == "Great", "Pass")
    }
    
    func testHexagonalGrid() {
        let test = HexagonalGrid()
        var testGrid1 = [[0,0], [0,0]]
        var testGrid2 = [[0,0], [1,0]]
        var testGrid3 = [[0,0], [0,1]]
        var testGrid4 = [[0,0], [1,1]]
        var testGrid5 = [[1,0], [0,0]]
        var testGrid6 = [[1,0], [1,0]]
        var testGrid7 = [[1,0], [0,1]]
        XCTAssert(test.rec(&testGrid1),"Pass")
        XCTAssert(!test.rec(&testGrid2),"Pass")
        XCTAssert(!test.rec(&testGrid3),"Pass")
        XCTAssert(test.rec(&testGrid4),"Pass")
        XCTAssert(!test.rec(&testGrid5),"Pass")
        XCTAssert(test.rec(&testGrid6),"Pass")
        XCTAssert(test.rec(&testGrid7),"Pass")
    }
    
    func testSamAndSubStrings() {
        let test = SamAndSubString()
        XCTAssert(test.solve("16") == 23, "Pass")
    }
    
    func testTravelAroundTheWorld() {
        let test = TravelAroundTheWorld()
        XCTAssert(test.solve(3, a: [3,1,2], b: [2,2,2]) == 2, "Pass")
    }
    
    func testRedJohnisBack() {
        let test = RedJohnisBack()
        XCTAssert(test.solve(7) == 3, "Pass")
        XCTAssert(test.solve(38) == 10794, "Pass")
    }
    
    func testDorsyThief() {
        let test = DorseyThief()
        let passenger1 = Passenger(offer: 460, weight: 4)
        let passenger2 = Passenger(offer: 590, weight: 6)
        let passenger3 = Passenger(offer: 590, weight: 5)
        let passenger4 = Passenger(offer: 550, weight: 5)
        XCTAssertTrue(test.solve([passenger1, passenger2, passenger3, passenger4], c: 10) == 1140)
    }
    
    func testAlternatingCharacters() {
        let test = AlternatingCharcters()
        XCTAssertTrue(test.solve("ABAA") == 1)
    }
    
    func testMakeItAnagram() {
        let test = MakeItAnagram()
        XCTAssertTrue(test.solve("cde", line2: "abc")==4)
    }
    
    func testAnagram() {
        let test = Anagram()
        XCTAssert(test.solve("aaabbb") == 3, "Pass")
        XCTAssert(test.solve("ab") == 1, "Pass")
        XCTAssert(test.solve("abc") == -1, "Pass")
    }
    
    func testSherlockAndAnagrams() {
        let test = SherlockAndAnagrams()
        XCTAssert(test.solve("abba") == 4, "Pass")
    }
    
    func testCommonChile() {
        let test = CommonChild()
        XCTAssert(test.solve("ABCD", second: "ABDC") == 3, "Pass")
    }
    
    func testFibonacci() {
        let fib: (Int)->Int = memoize { (fib, x) in
            if x < 2 {
                return x
            }
            return fib(x-1) + fib(x-2)
        }
        XCTAssert(fib(8) == 21, "Pass")
    }
    
    func testHeap() {
        var testHeap = MaxHeap(array: [1, 2, 3, 5, 7, 10])
        XCTAssert(testHeap.peak()! == 10, "Pass")
        testHeap.insert(61)
        XCTAssert(testHeap.peak()! == 61, "Pass")
        
        let emptyHeap = MaxHeap<Int>()
        XCTAssert(emptyHeap.peak() == nil, "Pass")
    }
    
    func testHeapInsertRemove() {
        /**   9
         *  7    5
         * 1 2  3
         * Should be represented in memory as [9, 5, 7, 1, 3, 2] though we are just testing the effects.
         */
        var heap = MaxHeap<Int>(array: [1, 3, 2, 7, 5, 9])
        
        //Should be removed in order
        XCTAssertEqual(9, heap.remove())
        XCTAssertEqual(7, heap.remove())
        XCTAssertEqual(5, heap.remove())
        XCTAssertEqual(3, heap.remove())
        XCTAssertEqual(2, heap.remove())
        XCTAssertEqual(1, heap.remove())
        XCTAssertNil(heap.remove())
    }
    
    func testHeapCount() {
        var heap = MaxHeap<Int>()
        XCTAssertEqual(0, heap.count)
        heap.insert(1)
        XCTAssertEqual(1, heap.count)
    }
    
    func testHeapRemoveEmpty() {
        var heap = MaxHeap<Int>()
        let removed = heap.remove()
        XCTAssertNil(removed)
    }
    
    func testBinarySearch() {
        let a = [1, 2, 10, 18, 19, 66, 88]
        XCTAssertEqual(0, binarySearch(a, key: 1, range: 0..<a.count))
        XCTAssertEqual(1, binarySearch(a, key: 2, range: 0..<a.count))
        XCTAssertEqual(2, binarySearch(a, key: 10, range: 0..<a.count))
        XCTAssertEqual(3, binarySearch(a, key: 18, range: 0..<a.count))
        XCTAssertEqual(4, binarySearch(a, key: 19, range: 0..<a.count))
        XCTAssertEqual(5, binarySearch(a, key: 66, range: 0..<a.count))
        XCTAssertEqual(6, binarySearch(a, key: 88, range: 0..<a.count))
        XCTAssertEqual(nil, binarySearch(a, key: 100, range: 0..<a.count))
        XCTAssertEqual(nil, binarySearch(a, key: 0, range: 0..<a.count))
    }
    
    func testIterativeBinarySearch() {
        let a = [1, 2, 10, 18, 19, 66, 88]
        XCTAssertEqual(0, iterativeBinarySearch(a, key: 1))
        XCTAssertEqual(1, iterativeBinarySearch(a, key: 2))
        XCTAssertEqual(2, iterativeBinarySearch(a, key: 10))
        XCTAssertEqual(3, iterativeBinarySearch(a, key: 18))
        XCTAssertEqual(4, iterativeBinarySearch(a, key: 19))
        XCTAssertEqual(5, iterativeBinarySearch(a, key: 66))
        XCTAssertEqual(6, iterativeBinarySearch(a, key: 88))
        XCTAssertEqual(nil, iterativeBinarySearch(a, key: 100))
        XCTAssertEqual(nil, iterativeBinarySearch(a, key: 0))
        
        let b = [1]
        XCTAssertEqual(0, iterativeBinarySearch(b, key: 1))
        XCTAssertEqual(nil, iterativeBinarySearch(b, key: 3))
    }
    
    func testArrayAdjacentConditon() {
        let increasing = [1, 16, 18, 100, 200, 1001]
        let disordered = [1, 17, 19, 29, 8, 100]
        
        XCTAssertEqual(increasing.adjacentTest { $0 < $1 }, true)
        XCTAssertEqual(disordered.adjacentTest { $0 < $1 }, false)
        
        let equalDiff = [1, 3, 5, 7, 9, 11]
        XCTAssertEqual(equalDiff.adjacentTest { $1 - $0 == 2 }, true)
        
        let singleElement = [1]
        XCTAssertEqual(singleElement.adjacentTest { $1 - $0 == 2 }, true)
        
        XCTAssertEqual(singleElement.adjacentTest(false) { $1 - $0 == 2 }, false)
    }
    
    func testMergeSort() {
        let unordered = [100, 1, 3, 19, 2016, 99]
        XCTAssertEqual([1, 3, 19, 99, 100, 2016], mergeSort(unordered))
    }
    
    func testArray2D() {
        var myTestArray = Array2D(rows: 3, columns: 5, initialValue: 0)
        myTestArray[0, 1] = 10
        XCTAssertEqual(10, myTestArray[0, 1])
        XCTAssertEqual(0, myTestArray[1, 4])
    }
    
    func testArrayAccumulate() {
        let testArray = [1, 2, 3, 4, 10, 19]
        let accumulated = testArray.accumulate(0) { $0 + $1 }
        XCTAssertEqual(accumulated, [1, 3, 6, 10, 20, 39])
    }
    
    func testSequenceAllMatch() {
        let testArray = [2, 4, 6, 8, 10]
        XCTAssertEqual(testArray.allMatch{element in element%2==0}, true)
    }
    
    func testFindLargestSmallerOrEqual() {
        let testArray = [1, 10, 16, 18, 20]
        let test = FindLargestSmallerOrEqual()
        XCTAssertEqual(test.ysBinarySearch(testArray, target:19), 3)
        XCTAssertEqual(test.ysBinarySearch(testArray, target:60), 4)
        XCTAssertEqual(test.ysBinarySearch(testArray, target:18), 3)
        XCTAssertEqual(test.ysBinarySearch(testArray, target:0), -1)
        XCTAssertEqual(test.ysBinarySearch(testArray, target:1), 0)
        XCTAssertEqual(test.ysBinarySearch(testArray, target:2), 0)
        XCTAssertEqual(test.ysBinarySearch(testArray, target:20), 4)
        
        let testOne = [100]
        XCTAssertEqual(test.ysBinarySearch(testOne, target:19), -1)
        XCTAssertEqual(test.ysBinarySearch(testOne, target:101), 0)
        
        let testZero:[Int] = []
        XCTAssertEqual(test.ysBinarySearch(testZero, target:19), -1)
        XCTAssertEqual(test.ysBinarySearch(testZero, target:101), -1)
    }
    
    func testMaximiseSum() {
        let testArray = [3, 3, 9, 9, 5]
        let mod = 7
        let test = MaximiseSum()
        XCTAssertEqual(test.solve(mod, elements: testArray), 6)
    }
}
