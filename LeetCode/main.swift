//
//  main.swift
//  LeetCode
//
//  Created by Hiếu đang cáu on 12/10/2023.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


//9.Palindrome Number

func isPalindrome(_ x: Int) -> Bool {
    let str = String(x)
    let reversedStr = String(str.reversed())
    return str == reversedStr
}


 
//10.Roman to Integer
func romanToInt(_ s: String) -> Int {
        var numbers: [Character: Int] = [
        "I": 1,
        "V": 5,
        "X": 10,
        "L": 50,
        "C": 100,
        "D": 500,
        "M": 1000
    ]
    var res = 0
    var temp = numbers[s.first!]!
    for char in s {
        let val = numbers[char] ?? 0
        res += temp < val ? val - (temp + temp) : val
        temp = numbers[char]!
    }
    return res
}

print(romanToInt("LII"))



//11.Merge Two Sorted Lists
class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil || l2 == nil { return l1 == nil ? l2 : l1 }
        if l1!.val <= l2!.val {
            l1?.next = mergeTwoLists(l1?.next, l2)
            return l1
        } else {
            l2?.next = mergeTwoLists(l1, l2?.next)
            return l2
        }
    }
}

