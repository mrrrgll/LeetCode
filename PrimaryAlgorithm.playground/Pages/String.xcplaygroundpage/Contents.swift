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
//:
//: ---
//: ### [整数反转](https://leetcode-cn.com/explore/interview/card/top-interview-questions-easy/5/strings/33/)
func reverse(_ x: Int) -> Int {
    var y = x < 0 ? -x : x
    var arr = [String]()
    while y != 0 {
        let i = y % 10
        arr.append("\(i)")
        y /= 10
    }
    print(arr)
    if let res = Int32(arr.joined()) {
        var r = Int(res)
        return x < 0 ? -r : r
    }
    return 0
}
//: [Next](@next)
