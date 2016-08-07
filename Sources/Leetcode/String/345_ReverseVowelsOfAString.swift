//
//  345_ReverseVowelsOfAString.swift
//  HRSwift
//
//  Created by yansong li on 2016-08-06.
//  Copyright © 2016 yansong li. All rights reserved.
//

import Foundation

/**
	Title:345 Reverse Vowels of a String
	URL: https://leetcode.com/problems/reverse-vowels-of-a-string/
	Space: O(n)
	Time: O(n)
 */

class ReverseVowels_Solution {
  func reverseVowels(s: String) -> String {
    let vowels:[Character] = ["a","A", "e","E", "i","I", "o","O", "u", "U"]
    var characters = Array(s.characters)
    var start = 0
    var end = characters.count - 1
    while start < end {
      for i in start...end {
        start = i
        if vowels.contains(characters[i]) {
          break
        }
      }
      if start == end {
        break
      }
      for i in SRange(start: end, end: start-1, step: -1) {
        end = i
        if vowels.contains(characters[i]) {
          break
        }
      }
      if start == end {
        break
      }
      let tmp = characters[start]
      characters[start] = characters[end]
      characters[end] = tmp
      start += 1
      end -= 1
    }
    return String(characters)
  }
}