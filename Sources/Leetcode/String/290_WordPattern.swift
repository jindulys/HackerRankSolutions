//
//  290_WordPattern.swift
//  HRSwift
//
//  Created by yansong li on 2016-08-06.
//  Copyright © 2016 yansong li. All rights reserved.
//

import Foundation

/**
	Title:290 Word Pattern
	URL: https://leetcode.com/problems/word-pattern/
	Space: O(n)
	Time: O(n)
 */

class WordPattern_Solution {
  /// This is correct but with ugly logic
  func wordPattern_initial(pattern: String, _ str: String) -> Bool {
    var dict: [Character : String] = [:]
    var wordIndexedDict: [String: Character] = [:]
    let keys:[Character] = Array(pattern.characters)
    let words = str.characters.split(" ").map { String($0) }
    guard words.count == keys.count else {
      return false
    }
    for i in 0..<words.count {
      let currentWord = words[i]
      let currentKey: Character = keys[i]
      if let existingWord = dict[currentKey] {
        if currentWord != existingWord {
          return false
        }
      } else {
        if wordIndexedDict[currentWord] != nil {
          return false
        }
        dict[currentKey] = currentWord
        wordIndexedDict[currentWord] = currentKey
      }
    }
    return true
  }
  
  func wordPattern(pattern: String, _ str: String) -> Bool {
    var characterIndexedDict: [Character : String] = [:]
    var wordIndexedDict: [String: Character] = [:]
    let keys:[Character] = Array(pattern.characters)
    let words = str.characters.split(" ").map { String($0) }
    guard words.count == keys.count else {
      return false
    }
    for i in 0..<words.count {
      let currentWord = words[i]
      let currentKey: Character = keys[i]
      if characterIndexedDict[currentKey] == nil && wordIndexedDict[currentWord] == nil {
        characterIndexedDict[currentKey] = currentWord
        wordIndexedDict[currentWord] = currentKey
      // Logic is interesting.
      } else if wordIndexedDict[currentWord] != currentKey {
        return false
      }
    }
    return true
  }

}