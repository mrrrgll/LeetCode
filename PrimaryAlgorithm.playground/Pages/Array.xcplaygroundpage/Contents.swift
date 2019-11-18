import Foundation
//: [Previous](@previous)
//:
//: ---
//: ### [从排序数组中删除重复项](https://leetcode-cn.com/explore/interview/card/top-interview-questions-easy/1/array/21/)
func removeDuplicates(_ nums: inout [Int]) -> Int {
    if nums.isEmpty { return 0 }
    var i = 0
    for item in nums where item != nums[i] {
        i += 1
        nums[i] = item
    }
    return i + 1
}
//:
//: ---
//: ### [买卖股票的最佳时机 II](https://leetcode-cn.com/explore/interview/card/top-interview-questions-easy/1/array/22/)




//: [Next](@next)
