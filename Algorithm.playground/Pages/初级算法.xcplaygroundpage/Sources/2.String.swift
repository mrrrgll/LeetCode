import Foundation

// MARK: - 反转字符串
public func reverseString(_ s: inout [Character]) {
    let c = s.count
    for i in 0..<c / 2 {
        (s[i], s[c - 1 - i]) = (s[c - 1 - i], s[i])
    }
    /* 也直接调用API
     s.reverse()
     */
}
// MARK: - 整数反转
public func reverse(_ x: Int) -> Int {
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
// MARK: - 字符串中的第一个唯一字符
public func firstUniqChar(_ s: String) -> Int {
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
// MARK: - 有效的字母异位词
public func isAnagram(_ s: String, _ t: String) -> Bool {
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
// MARK: - 验证回文字符串
public func isPalindrome(_ s: String) -> Bool {
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
     public func isNumOrLetter(_ c: Character) -> Bool {
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
// MARK: - 字符串转换整数 (atoi)
public func myAtoi(_ str: String) -> Int {
    guard str.count > 0 else { return 0 }
    var temp = ""
    var sign = ""
    for c in str {
        if c == " " {
            if temp.count > 0 {
                break // 跳过尾部空格
            }
            if sign.count > 0 {
                break // 跳过符号尾部空格
            }
            continue // 跳过首部空格
        }
        if c == "-" || c == "+" {
            if temp.count > 0 || sign.count > 0 {
                break // 出现了多余的正负号 or 数字后出现正负号
            }
            sign = String(c)
            continue // 确定了正负号
        }
        if c >= "0" && c <= "9" {
            temp += String(c)
        } else {
            if temp.count == 0 {
                return 0 // 首个字符非数字
            }
            if temp.count > 0 {
                break // 数字尾部出现了非数字
            }
        }
    }
    guard temp.count > 0 else { return 0 }
    if let int32 = Int32(temp) {
        return sign == "-" ? Int(-int32) : Int(int32)
    } else {
        return sign == "-" ? Int(Int32.min) : Int(Int32.max)
    }
}
// MARK: - 实现strStr()
public func strStr(_ haystack: String, _ needle: String) -> Int {
    guard haystack.count >= needle.count else { return -1 }
    let n = needle.count
    for i in 0..<haystack.count - n + 1 {
        let start = haystack.index(haystack.startIndex, offsetBy: i)
        let end = haystack.index(start, offsetBy: n)
        let s = haystack[start..<end]
        if s == needle {
            return i
        }
    }
    return -1
    /* 拓展: Sunday KMP BM Horspool
     [Sunday算法实现
     /// 计算偏移表
     public func calShiftMat(_ st: String) -> [String: Int] {
         var dic = [String: Int]()
         for (index, value) in st.reversed().enumerated() {
             let str = String(value)
             if dic[str] == nil {
                 dic[str] = index + 1
             }
         }
         dic["ot"] = st.count + 1
         return dic
     }
     // 其它情况判断
     if needle == haystack {
         return 0
     }
     if needle.count > haystack.count {
         return -1
     }
     if needle.count == 0 {
         return 0
     }
     
     // 偏移表预处理
     let dic = calShiftMat(needle)
     var idx = 0
     
     while idx + needle.count <= haystack.count {
         // 待处理字符串
         let start = haystack.index(haystack.startIndex, offsetBy: idx)
         let end = haystack.index(start, offsetBy: needle.count)
         let subStr = haystack[start..<end]
         // 判断是否匹配
         if subStr == needle {
             return idx
         } else {
             // 边界处理
             if idx + needle.count >= haystack.count {
                 return -1
             }
             // 不匹配的情况下, 根据下一个字符的偏移, 移动idx
             let nextChar = String(haystack[end])
             if let index = dic[nextChar] {
                 idx += index
             } else {
                 idx += dic["ot"]!
             }
         }
     }
     
     if idx + needle.count >= haystack.count {
         return -1
     }
     return idx
     */
}
// MARK: - 报数
public func countAndSay(_ n: Int) -> String {
    if n < 1 {
        return ""
    }
    if n == 1 {
        return "1"
    } else {
        let preStr = countAndSay(n - 1)
        var flag = preStr[preStr.startIndex]
        var count = 0
        var temp = ""
        for c in preStr {
            if c == flag {
                count += 1
            } else {
                temp += "\(count)\(flag)"
                flag = c
                count = 1
            }
        }
        temp += "\(count)\(flag)"
        return temp
    }
}
// MARK: - 最长公共前缀
public func longestCommonPrefix(_ strs: [String]) -> String {
    guard let min = strs.min(),
        let max = strs.max() else {
            return ""
    }
    for (i, c) in min.enumerated() {
        let index = max.index(max.startIndex, offsetBy: i)
        if c != max[index] {
            let res = String(max[max.startIndex..<index])
            return res
        }
    }
    return min
}
