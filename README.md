# HackerRankSolutions 
![Language](https://img.shields.io/badge/language-Swift-orange.svg) [![Build Status](https://travis-ci.org/jindulys/HackerRankSolutions.svg)](https://travis-ci.org/jindulys/HackerRankSolutions)

This is a repo for [HackerRank](https://www.hackerrank.com/domains) Solutions in Swift

Different folders are named after corresponding domain names or contest names.

## [Algorithms](HRSwift/Algorithms)
 Problem         |    Time           | Space           | Difficulty    | Tag          | Note
---------------- |  ---------------- | --------------- | ------------- |--------------| -----
[Angry Professor](https://www.hackerrank.com/challenges/angry-professor) |  _O(n)_   |    | Easy | Implementation
[SherlockAndTheBeast](https://www.hackerrank.com/challenges/sherlock-and-the-beast) |  _O(n)_   |    | Easy | Implementation
[Utopian Tree](https://www.hackerrank.com/challenges/utopian-tree) |  _O(n)_   |    | Easy | Implementation
[Find Digits](https://www.hackerrank.com/challenges/find-digits) |  _O(n)_   |    | Easy | Implementation
[Funny String](https://www.hackerrank.com/challenges/funny-string) |  _O(n)_   |    | Easy | String
[Pangrams](https://www.hackerrank.com/challenges/pangrams) |  _O(n)_   |  _O(1)_  | Easy | String
[Alternating Characters](https://www.hackerrank.com/challenges/alternating-characters) |  _O(n)_   |  _O(1)_  | Easy | String
[Two Strings](https://www.hackerrank.com/challenges/two-strings) |  _O(n)_   |  _O(1)_  | Moderate | String | Set
[Palindrome Index](https://www.hackerrank.com/challenges/palindrome-index) |  _O(n)_   |  _O(1)_  | Easy | String 
[Sherlock And Valid String](https://www.hackerrank.com/challenges/sherlock-and-valid-string) |  _O(n)_   |  _O(1)_  | Difficult | String | Dictionary
[The Maximum Subarray](https://www.hackerrank.com/challenges/maxsubarray) |  _O(n)_   | _O(n)_  | Easy | Dynamic Programming
[The Coin Change Problem](https://www.hackerrank.com/challenges/coin-change) |  _O(MN)_   | _O(MN)_  | Medium | Dynamic Programming | bottom-up table construction
[Knapsack](https://www.hackerrank.com/challenges/unbounded-knapsack) |  _O(MN)_   | _O(MN)_  | Moderate | Dynamic Programming | memoization in swift
[The Longest Increasing Subsequence](https://www.hackerrank.com/challenges/longest-increasing-subsequent) |  _O(N^2)_   | _O(N)_  | Advanced | Dynamic Programming | time out
[Sherlock and Cost](https://www.hackerrank.com/challenges/sherlock-and-cost) |  _O(N)_   | _O(N)_  | Moderate | Dynamic Programming | 
[Hexagonal Gird](https://www.hackerrank.com/challenges/hexagonal-grid) |  _O(N^2)_   | _O(N)_  | Moderate | Dynamic Programming | recursive solution
[Sam and SubStrings](https://www.hackerrank.com/challenges/sam-and-substrings) |  _O(N)_   | _O(N)_  | Moderate | Dynamic Programming | 
[Travel Around the World](https://www.hackerrank.com/challenges/travel-around-the-world) |  _O(N)_   | _O(N)_  | Moderate | Dynamic Programming | validation pass and candidates finding pass
[Red John is Back](https://www.hackerrank.com/challenges/red-john-is-back) |  _O(N)_ + _O(nlgn)_   | _O(N)_  | Moderate | Dynamic Programming | memoization
[Dorsey Thief](https://www.hackerrank.com/challenges/dorsey-thief) |  _O(NM)_   | _O(NM)_  | Advanced | Dynamic Programming | 

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
