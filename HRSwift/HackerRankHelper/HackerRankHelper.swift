//
//  HackerRankHelper.swift
//  HRSwift
//
//  Created by yansong li on 2015-11-20.
//  Copyright © 2015 yansong li. All rights reserved.
//

import Foundation

/**
    This document may contain code that use swift1.2 since HackerRank only support swift1.2
 
    But if possible I could write some swift2.* code and I will annotate them.
 
*/
 
// MARK: Basic Operations

/**
    HackerRank GetLine
    
    - Returns: String from stdin
*/

public func getLine() -> String {
    var buf = String()
    var c = getchar()
    // 10 is the ascii code for new line
    while c != EOF && c != 10 {
        buf.append(UnicodeScalar(UInt32(c)))
        c = getchar()
    }
    return buf
}

public func getInt() -> Int {
    return Int(getLine())!
}

public func getLineToArray() -> [String] {
    let currentLine = getLine()
    return currentLine.componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
}

/**
    this get primes is better and finally score 100.0
*/
public func getBetterPrimes(length:Int) -> [Int] {
    // Here the length means how many elements we have
    // This prime finder is a specific one because we want to find gap that is prime
    // so we start from 3
    var primes = [Int]()
    if length < 3 {
        return primes
    }
    
    // here since we want to find gap, length should not be included, start from 2 since 2 is the smallest prime
    for i in 2..<length {
        var currentIsPrime = true
        // check prime is general, we should use count from 2 to sqrt(i) to see whether or not it
        // could be divided.
        let higherBounder = sqrt(Double(i))
        let intHigher = Int(higherBounder)
        if intHigher >= 2 {
            for j in 2...intHigher {
                if i % j == 0 {
                    currentIsPrime = false
                    break
                }
            }
        }
        
        if currentIsPrime {
            primes.append(i)
        }
    }
    return primes
}

/**
 
    This method return the num of elements that less than or equal to target
 
    e.g. [2, 3, 5] input 5, will return 3 means there are 3 elements less than or equal to 5
 */

public func binarySearchLessOrEqualIndex(inputs:[Int], target:Int) -> Int {
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


// MARK: extensions

/**
    Extension: Character
*/
public extension Character {
    /**
     Convert a Character to unicodeScalar value
     e.g turn 'a' to 97
     */
    
    func unicodeScalarCodePoint() -> Int {
        let characterString = String(self)
        let scalars = characterString.unicodeScalars
        
        return Int(scalars[scalars.startIndex].value)
    }
}

public extension Dictionary {
    
//    /**
//        Initialize Dictionary with SequenceTpye
//     */
//    init<S:SequenceType where S.Generator.Element == (Key, Value)>(_ sequence: S) {
//        self = [:]
//        self.merge(sequence)
//    }
//    
//    /**
//     Merge Dictionary
//     
//     Merge other to self, replace those values if key already exists.
//     */
//    mutating func merge<S: SequenceType where S.Generator.Element == (Key, Value)>(other: S) {
//        for (k, v) in other {
//            self[k] = v
//        }
//    }
}

public extension SequenceType where Generator.Element: Hashable {
    
    /**
        Given a sequence of array returns unique element
    */
    func unique() -> [Generator.Element] {
        var seen: Set<Generator.Element> = []
        return filter {
            if seen.contains($0) {
                return false
            } else {
                seen.insert($0)
                return true
            }
        }
    }
}

public extension String {
    /**
     Check whether this string contains all the English Characters, this method treat upper case and lower case the same
     
     - returns: whether or not contains all the english characters
     */
    func containsAllEnglishCharacters() -> Bool {
        guard self.characters.count >= 26 else { return false }
        var englishCharacters: Set<Int> = []
        let a : Character = "a"
        for c in self.characters {
            let lowerCs = String(c).lowercaseString.characters
            let lowerC = lowerCs[lowerCs.startIndex]
            let index = lowerC.unicodeScalarCodePoint() - a.unicodeScalarCodePoint()
            switch index {
                case 0..<26:
                    if !englishCharacters.contains(index) {
                        englishCharacters.insert(index)
                        if englishCharacters.count == 26 {
                            return true
                        }
                    }
                default:
                    continue
            }
        }
        return false
    }
    
    /**
     Convert a string to a Set
     
     - returns: a set of Characters
     */
    func convertToCharacterSet() -> Set<Character> {
        var uniqueCharacters: Set<Character> = []
        for c in self.characters {
            if !uniqueCharacters.contains(c) {
                uniqueCharacters.insert(c)
            }
        }
        return uniqueCharacters
    }
    
    /**
     Check whether or not a string is a palindrome
     
     - returns: boolean value indicate whether or not a string is a palindrome
     */
    func isPalindrome() -> Bool {
        let reversed = String(self.characters.reverse())
        return reversed == self
    }
}

public extension Double {
    func format(f: String) -> String {
        return NSString(format: "%\(f)f", self) as String
    }
}

// MARK: Functional Class

/**
*   Python range() like Structure
*
*   it will generate 
*/

struct SRange: SequenceType {
    var start: Int = 0
    var end: Int = 0
    var step: Int = 0
    
    init(start: Int = 0, end: Int, step: Int = 1) {
        self.start = start
        self.end = end
        self.step = step
    }
    
    func generate() -> RangeGenerator {
        return RangeGenerator(start: start, end: end, step: step)
    }
}

class RangeGenerator: GeneratorType {
    let start: Int
    let end: Int
    let step: Int
    let clockWise: Bool
    
    var stepNum = 0
    
    init(start: Int, end: Int, step: Int) {
        self.start = start
        self.end = end
        self.step = step
        clockWise = step > 0
    }
    
    func next() -> Int? {
        if clockWise {
            guard start + stepNum * step < end else { return nil }
            return start + step * stepNum++
        } else {
            guard start + stepNum * step > end else { return nil }
            return start + step * stepNum++
        }
    }
}



// MARK: Data Structures

/**
*  Queue FIFO, this implementation could achieve amortised O(1) enqueue and dequeue
*/

struct Queue<Element> {
    private var left: [Element]
    private var right: [Element]
    
    init() {
        left = []
        right = []
    }
    
    /**
     Enqueue an element into Queue
     
     - parameter element: the element that need to be enqueued
     */
    mutating func enqueue(element: Element) {
        right.append(element)
    }
    
    mutating func dequeue() -> Element? {
        guard !(left.isEmpty && right.isEmpty) else { return nil }
        if left.isEmpty {
            left = right.reverse()
            right.removeAll(keepCapacity: true)
        }
        return left.removeLast()
    }
    
    func isEmpty() -> Bool {
        return left.isEmpty && right.isEmpty
    }
}

extension Queue: CollectionType {
    var startIndex: Int { return 0 }
    var endIndex: Int { return left.count + right.count }
    
    subscript(idx: Int) -> Element {
        guard idx < endIndex else { fatalError("Index out of bounds") }
        if idx < left.endIndex {
            return left[left.count - idx.successor()]
        } else {
            return right[idx - left.count]
        }
    }
}


/**
    LinkedListQueue 
*/
class LinkedListQueue<Element: CustomStringConvertible> {
    private var head: ListNode<Element>
    private var end: ListNode<Element>
    
    init() {
        head = ListNode<Element>()
        end = head
    }
    
    func enqueue(element: Element) {
        let newNode = ListNode(element)
        end.next = newNode
        newNode.pre = end
        end = newNode
    }
    
    func dequeue() -> Element? {
        if isEmpty() {
            return nil
        }
        let retVal = head.next!.value!
        if let nextHead = head.next!.next {
            head.next = nextHead
            nextHead.pre = head
        } else {
            end = head
        }
        return retVal
    }
    
    func isEmpty() -> Bool {
        return head === end
    }
    
    func description() {
        print(head)
    }
}


/**
*   ListNode Class
*/
class ListNode<T: CustomStringConvertible>{
    var value: T?
    var next: ListNode?
    var pre: ListNode?
    
    init() {}
    
    convenience init(_ value: T) {
        self.init()
        self.value = value
    }
    
    /**
     Reverse a ListNode return a new ListNode with reversed order
     
     - parameter node: node to be reversed
     
     - returns: a brand new node with reversed elements
     */
    static func reverse(node: ListNode?) -> ListNode? {
        var prev: ListNode? = nil
        var head = node
        while head != nil {
            let newHead = ListNode(head!.value!)
            let tmp = head!.next
            newHead.next = prev
            prev = newHead
            head = tmp
        }
        return prev
    }
    
}

extension ListNode: CustomStringConvertible {
    var description:String {
        if let next = next {
            if let value = value {
                return "Node(v:\(value)) -> \(next)"
            } else {
                return "Node(v: NULL) -> \(next)"
            }
        } else {
            if let value = value {
                return "Node(v:\(value)) -> NULL"
            } else {
                return "Node(v: NULL) -> NULL"
            }
        }
    }
}

// TODO: AVL Tree


// TODO: Priority Queue



