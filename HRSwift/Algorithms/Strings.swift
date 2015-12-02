//
//  Strings.swift
//  HRSwift
//
//  Created by yansong li on 2015-11-29.
//  Copyright © 2015 yansong li. All rights reserved.
//

import Foundation

// https://www.hackerrank.com/challenges/funny-string

class FunnyString {

    func solution() -> Void {
        let T = getInt()
        for _ in 0..<T {
            let input = getLine()
            //solve(input)
            
            // Use the better one
            solveAlternative(input)
        }
    }
    
    /**
    This method time out, I think it is because advancedBy take O(n) time and the for loop itself also takes O(n), so the total time is O(n^2)
    
    - parameter s: the string to be resolved
    */
    
    
    func solve(s: String) -> Void {
        var values = [Int]()
        var reversed = [Int]()
        
        let count = s.characters.count
        for (i, c) in s.characters.enumerate() {
            values.append(c.unicodeScalarCodePoint())
            let reversedIndex = s.characters.startIndex.advancedBy(count - i.successor(), limit: s.characters.endIndex)
            reversed.append(s.characters[reversedIndex].unicodeScalarCodePoint())
        }
        
        var isFunny = true
        for i in 1..<count {
            if abs(values[i] - values[i-1]) != abs(reversed[i] - reversed[i-1]) {
                isFunny = false
                break
            }
        }
        
        if isFunny {
            print("Funny")
        } else {
            print("Not Funny")
        }
    }
    
    /**
     This one is better, has O(n) running time
     
     - parameter s: the string to be resolved
     */
    func solveAlternative(s: String) -> Void {
        var values = [Int]()
        var reversed = [Int]()
        
        let count = s.characters.count
        
        for (_, c) in s.characters.enumerate() {
            values.append(c.unicodeScalarCodePoint())
        }
        
        for (_, c) in s.characters.reverse().enumerate() {
            reversed.append(c.unicodeScalarCodePoint())
        }
        
        var isFunny = true
        for i in 1..<count {
            if abs(values[i] - values[i-1]) != abs(reversed[i] - reversed[i-1]) {
                isFunny = false
                break
            }
        }
        
        if isFunny {
            print("Funny")
        } else {
            print("Not Funny")
        }
    }
}

// https://www.hackerrank.com/challenges/pangrams
class Pangrams {
    func solution() {
        checkPangramsWithSet(getLine())
    }
    
    /**
     CheckPangramsWithSet
     
     - parameter s: string to check
     */
    func checkPangramsWithSet(s: String) {
        if s.containsAllEnglishCharacters() {
            print("pangram")
        } else {
            print("not pangram")
        }
    }
    
    func checkPangramsWithArray(s: String) -> Bool {
        var indexArray = [Bool](count: 26, repeatedValue: false)
        let a: Character = "a"
        
        for c in s.characters {
            let lowerCs = String(c).lowercaseString.characters
            let lowerC = lowerCs[lowerCs.startIndex]
            let index = lowerC.unicodeScalarCodePoint() - a.unicodeScalarCodePoint()
            switch index {
                case 0..<26:
                    indexArray[index] = true
                default:
                    continue
            }
        }
        
        let result = indexArray.reduce(true){result,current in result && current}
        if result {
            print("pangram")
        } else {
            print("not pangram")
        }
        
        // Return result for unit testing
        return result
    }
}


// https://www.hackerrank.com/challenges/two-strings
class TwoStrings {
    func solution() {
        let T = getInt()
        for _ in 0..<T {
            let s1 = getLine()
            let s2 = getLine()
            checkSubStringsExists(s1, t: s2)
        }
    }
    
    func checkSubStringsExists(s: String, t: String) -> Bool {
        let sSet = s.convertToCharacterSet()
        let tSet = t.convertToCharacterSet()
        
        let intersections = sSet.intersect(tSet)
        let results = intersections.count > 0
        if results {
            print("YES")
        } else {
            print("NO")
        }
        return results
    }
}

// https://www.hackerrank.com/challenges/palindrome-index
class PalindromeIndex {
    func solution() {
        let T = getInt()
        for _ in 0..<T {
            solve(getLine())
        }
    }
    
    func solve(s: String) {
        var start = s.startIndex
        var end = s.endIndex.predecessor()
        
        var i = 0
        
        while start < end && s.characters[start] == s.characters[end] {
            start = start.successor()
            end = end.predecessor()
            i += 1
        }
        
        var removeStart: String = s
        removeStart.removeAtIndex(start)
        if removeStart.isPalindrome() {
            print(i)
            return
        }
        
        var removeEnd: String = s
        removeEnd.removeAtIndex(end)
        if removeEnd.isPalindrome() {
            print(s.characters.count - 1 - i)
            return
        }
        
        print("-1")
    }
}

// https://www.hackerrank.com/challenges/sherlock-and-valid-string
class SherlockAndValidString {
    var characterCounts = [Character: Int]()
    func solution() {
        let s = getLine()
        for c in s.characters {
            if let count = characterCounts[c] {
                characterCounts[c] = count + 1
            } else {
                characterCounts[c] = 1
            }
        }
        
        var countsOccurrence = [Int: Int]()
        for i in characterCounts.values {
            if let occurrence = countsOccurrence[i] {
                countsOccurrence[i] = occurrence + 1
            } else {
                countsOccurrence[i] = 1
            }
        }
        
        if countsOccurrence.keys.count > 2 {
            print("NO")
        } else if countsOccurrence.keys.count == 2 {
            let keys = [Int](countsOccurrence.keys)
            let bigKey = max(keys[0], keys[1])
            let smallKey = min(keys[0], keys[1])
            
            // case 1 we could always remove smallkey that only occur 1 and count is 1
            // case 2 the difference of occurence is 1 and bigkey is only 1 element
            if (smallKey*countsOccurrence[smallKey]! == 1 ||
                (abs(keys[0] - keys[1]) == 1 && countsOccurrence[bigKey]! == 1)) {
                print("YES")
            } else {
                print("NO")
            }
        } else {
            print("YES")
        }
    }
}


