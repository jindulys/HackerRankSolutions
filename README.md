# HackerRankSolutions 
![Language](https://img.shields.io/badge/language-Swift-orange.svg) [![Build Status](https://travis-ci.org/jindulys/HackerRankSolutions.svg)](https://travis-ci.org/jindulys/HackerRankSolutions)

This is a repo for [HackerRank](https://www.hackerrank.com/domains) Solutions in Swift

Different folders are named after corresponding domain names or contest names.

## [Algorithms](HRSwift/Algorithms)
 Problem         |    Time           | Space           | Difficulty    | Tag          | Note       | Score    | Max Score
---------------- |  ---------------- | --------------- | ------------- |--------------| -----------| ---------| --------
[Angry Professor](https://www.hackerrank.com/challenges/angry-professor) |  _O(n)_   |    | Easy | Implementation | | 20.0 | 20.0
[SherlockAndTheBeast](https://www.hackerrank.com/challenges/sherlock-and-the-beast) |  _O(n)_   |    | Easy | Implementation| | 30.0 | 30.0
[Utopian Tree](https://www.hackerrank.com/challenges/utopian-tree) |  _O(n)_   |    | Easy | Implementation | | 20.0 | 20.0
[Find Digits](https://www.hackerrank.com/challenges/find-digits) |  _O(n)_   |    | Easy | Implementation | | 25.0 | 25.0
[Funny String](https://www.hackerrank.com/challenges/funny-string) |  _O(n)_   |    | Easy | String | | 25.0 | 25.0
[Pangrams](https://www.hackerrank.com/challenges/pangrams) |  _O(n)_   |  _O(1)_  | Easy | String | | 20.0 | 20.0
[Alternating Characters](https://www.hackerrank.com/challenges/alternating-characters) |  _O(n)_   |  _O(1)_  | Easy | String | | 20.0 | 20.0
[Game of Thrones](https://www.hackerrank.com/challenges/game-of-thrones) |  _O(n)_   |  _O(1)_  | Easy | String | | 30.0 | 30.0
[Make it anagram](https://www.hackerrank.com/challenges/make-it-anagram) |  _O(n)_   |  _O(1)_  | Easy | String | | 30.0 | 30.0
[Anagram](https://www.hackerrank.com/challenges/anagram) |  _O(n)_   |  _O(1)_  | Easy | String | | 14.29 | 25
[Two Strings](https://www.hackerrank.com/challenges/two-strings) |  _O(n)_   |  _O(1)_  | Moderate | String | Set | 20.0 | 25.0
[SherlockAndAnagrams](https://www.hackerrank.com/challenges/sherlock-and-anagrams) |  _O(n^3lgn)_   |  _O(n^2)_  | Moderate | String | Sort, Dictionary, Permutation | 4.55 | 50.0
[Palindrome Index](https://www.hackerrank.com/challenges/palindrome-index) |  _O(n)_   |  _O(1)_  | Easy | String | | 25.0 | 25.0 
[Sherlock And Valid String](https://www.hackerrank.com/challenges/sherlock-and-valid-string) |  _O(n)_   |  _O(1)_  | Difficult | String | Dictionary | 100.0 | 100.0
[Common Child](https://www.hackerrank.com/challenges/common-child) |  _O(n^2)_   |  _O(n^2)_  | Difficult | String | Dynamic Programming | 50.0 | 60.0
[The Maximum Subarray](https://www.hackerrank.com/challenges/maxsubarray) |  _O(n)_   | _O(n)_  | Easy | Dynamic Programming | | 16.67 | 50.0
[The Coin Change Problem](https://www.hackerrank.com/challenges/coin-change) |  _O(MN)_   | _O(MN)_  | Medium | Dynamic Programming | bottom-up table construction | 60.0 | 60.0
[Red John is Back](https://www.hackerrank.com/challenges/red-john-is-back) |  _O(N)_ + _O(nlgn)_   | _O(N)_  | Moderate | Dynamic Programming | memoization | 54.17 | 65
[Knapsack](https://www.hackerrank.com/challenges/unbounded-knapsack) |  _O(MN)_   | _O(MN)_  | Moderate | Dynamic Programming | memoization in swift | 54.06 | 60.0
[Sam and SubStrings](https://www.hackerrank.com/challenges/sam-and-substrings) |  _O(N)_   | _O(N)_  | Moderate | Dynamic Programming | | 40.0 | 40.0
[The Longest Increasing Subsequence](https://www.hackerrank.com/challenges/longest-increasing-subsequent) |  _O(N^2)_   | _O(N)_  | Advanced | Dynamic Programming | time out | 26.67 | 60.0
[Hexagonal Gird](https://www.hackerrank.com/challenges/hexagonal-grid) |  _O(N^2)_   | _O(N)_  | Moderate | Dynamic Programming | recursive solution | 70.0 | 70.0
[Sherlock and Cost](https://www.hackerrank.com/challenges/sherlock-and-cost) |  _O(N)_   | _O(N)_  | Moderate | Dynamic Programming | | 28.13 | 50.0
[Dorsey Thief](https://www.hackerrank.com/challenges/dorsey-thief) |  _O(NM)_   | _O(NM)_  | Advanced | Dynamic Programming | | 52.76| 85.0
[Travel Around the World](https://www.hackerrank.com/challenges/travel-around-the-world) |  _O(N)_   | _O(N)_  | Moderate | Dynamic Programming | validation pass and candidates finding pass | 120.0 | 120.0

## Contests
* [IndeedPrimeCodeSprint](https://www.hackerrank.com/contests/indeed-prime-codesprint/challenges)
* [ZenefitsCodeSprint](https://www.hackerrank.com/contests/zenhacks/challenges)

## Data Structures in [HackerRankHelper](HRSwift/HackerRankHelper/HackerRankHelper.swift)
* FIFO Queue with Two Arraies
* FIFO Queue with Listnode
* ListNode
* AVLNode
* AVLTree
* BinaryIndexedTree

# Usage

I created class for each problem. If you want to test those solution on HackerRank, please follow this guideline.

1. create a constant with class name.

        let mySolution = MyClass()
2. call *solution* method on that constant

        mySolution.solution()
3. copy and paste related helper methods from *HackerRankHelper* folder, eg. *getLine()*, *getInt()*

# Note

All those solution I wrote used Swift1.2, since HackerRank only supports Swift1.* for now. But it is not a big deal since those solutions usually don't need too much new language features.
