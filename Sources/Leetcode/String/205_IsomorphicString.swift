//
//  205_IsomorphicString.swift
//  HRSwift
//
//  Created by yansong li on 2016-08-07.
//  Copyright © 2016 yansong li. All rights reserved.
//

import Foundation

/**
	Title:205 Isomorphic Strings
	URL: https://leetcode.com/problems/isomorphic-strings/
	Space: O(n)
	Time: O(n)
 */

class IsomorphicString_Solution {
  func isIsomorphic(s: String, _ t: String) -> Bool {
    guard s.characters.count > 0 else {
      return true
    }
    var sTotMap: [Character : Character] = [:]
    var tTosMap: [Character : Character] = [:]
    let sCharacters = Array(s.characters)
    let tCharacters = Array(t.characters)
    for i in 0..<s.characters.count {
      if sTotMap[sCharacters[i]] == nil && tTosMap[tCharacters[i]] == nil {
        sTotMap[sCharacters[i]] = tCharacters[i]
        tTosMap[tCharacters[i]] = sCharacters[i]
      } else if sTotMap[sCharacters[i]] != tCharacters[i] {
        return false
      }
    }
    return true
  }
}