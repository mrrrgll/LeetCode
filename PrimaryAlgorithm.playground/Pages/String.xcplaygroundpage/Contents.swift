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
     s.reverse()
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
    if let res = Int32(arr.joined()) {
        let r = Int(res)
        return x < 0 ? -r : r
    }
    return 0
    /* 优化
     var num = x
     var result = 0
     while num != 0 {
         let temp = num % 10
         result = temp + result * 10
         num /= 10
     }
     if result >= Int32.min, result <= Int32.max {
         return result
     }
     return 0
     */
    
}
//:
//: ---
//: ### [字符串中的第一个唯一字符](https://leetcode-cn.com/explore/interview/card/top-interview-questions-easy/5/strings/34/)
func firstUniqChar(_ s: String) -> Int {
    let frequency = Dictionary(s.map{ ($0, 1) }, uniquingKeysWith: +)
    for (index, value) in s.enumerated() {
        if let count = frequency[value], count == 1 {
            return index
        }
    }
    return -1
    /* 大佬的解法
     var arr = [Int](repeating: 0, count: 26)
     for c in s.unicodeScalars {
         arr[Int(c.value) - 97] += 1
     }
     for (index, value) in s.unicodeScalars.enumerated() {
         if arr[Int(value.value) - 97] == 1 {
             return index
         }
     }
     return -1
     */
}
//:
//: ---
//: ### [有效的字母异位词](https://leetcode-cn.com/explore/interview/card/top-interview-questions-easy/5/strings/35/)
func isAnagram(_ s: String, _ t: String) -> Bool {
    let dictS = Dictionary(s.unicodeScalars.map{ ($0.value, 1) }, uniquingKeysWith: +)
    let dictT = Dictionary(t.unicodeScalars.map{ ($0.value, 1) }, uniquingKeysWith: +)
    return dictS == dictT
    /* 另一种解法(速度快,占用空间小,但包含unicode字符无法处理)
     let offset = Int("a".unicodeScalars.first?.value ?? 0)
     var counter: [Int] = Array(repeating: 0, count: 26)
     for c in s.unicodeScalars {
         counter[Int(c.value) - offset] += 1
     }
     for c in t.unicodeScalars {
         counter[Int(c.value) - offset] -= 1
     }
     return counter == Array(repeating: 0, count: 26)
     */
}
//:
//: ---
//: ### [验证回文字符串](https://leetcode-cn.com/explore/interview/card/top-interview-questions-easy/5/strings/36/)
func isPalindrome(_ s: String) -> Bool {
    var arr = [UInt32]()
    for i in s.unicodeScalars {
        if i.value > 47, i.value < 58 {// 0...9
            arr.append(i.value)
            continue
        }
        if i.value > 64, i.value < 91 {// A...Z
            arr.append(i.value + 32)
            continue
        }
        if i.value > 96, i.value < 123 {// a...z
            arr.append(i.value)
        }
    }
    var i = 0, j = arr.count - 1
    while i < j {
        if arr[i] == arr[j] {
            i += 1
            j -= 1
            continue
        }
        return false
    }
    return true
    /* 不使用额外空间的解法,使用String.Index
     guard s.count > 0 else { return true }
     func isNumOrLetter(_ c: Character) -> Bool {
         if c >= "A", c <= "Z" {
             return true
         }
         if c >= "a", c <= "z" {
             return true
         }
         if c >= "0", c <= "9" {
             return true
         }
         return false
     }
     
     var i = s.startIndex
     var j = s.index(before: s.endIndex)
     while i < j {
         if !isNumOrLetter(s[i]) {
             i = s.index(after: i)
             continue
         }
         if !isNumOrLetter(s[j]) {
             j = s.index(before: j)
             continue
         }
         
         if s[i].lowercased() != s[j].lowercased() {
             return false
         }
         i = s.index(after: i)
         j = s.index(before: j)
     }
     return true
     */
}


let startTime = CFAbsoluteTimeGetCurrent()
// 测试代码写这里:

let endTime = CFAbsoluteTimeGetCurrent()
print("代码执行时长：\((endTime - startTime)*1000) 毫秒")

//: [Next](@next)
