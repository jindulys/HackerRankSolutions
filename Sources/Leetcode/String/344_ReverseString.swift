//
//  344_ReverseString.swift
//  HRSwift
//
//  Created by yansong li on 2016-08-06.
//  Copyright © 2016 yansong li. All rights reserved.
//

import Foundation

/**
	Title:344 Reverse String
	URL: https://leetcode.com/problems/reverse-string/
	Space: O(n)
	Time: O(n)
 */

class ReverseString_Solution {
  func reverseString(s: String) -> String {
    var characters = Array(s.characters)
    guard characters.count > 0 else {
      return ""
    }
    var startIndex = 0
    var endIndex = characters.count - 1
    while startIndex < endIndex {
      let tmp = characters[startIndex]
      characters[startIndex] = characters[endIndex]
      characters[endIndex] = tmp
      startIndex += 1
      endIndex -= 1
    }
    return String(characters)
  }
}