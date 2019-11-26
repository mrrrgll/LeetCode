import Foundation
//: [Previous](@previous)
//:
//: ---
//: ### [反转字符串](https://leetcode-cn.com/explore/interview/card/top-interview-questions-easy/5/strings/32/)
func reverseString(_ s: inout [Character]) {
    let c = s.count
    let mid = c / 2
    for i in 0..<mid {
        (s[i], s[c - 1 - i]) = (s[c - 1 - i], s[i])
    }
    /* 直接调用API更好😂
     s = s.reverse()
     */
}

//: [Next](@next)
