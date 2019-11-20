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
func maxProfit(_ prices: [Int]) -> Int {
    if prices.count < 2 { return 0 }
    var sum = 0
    var i = 0
    var j = 1
    while j < prices.count {
        if prices[j] > prices[i] {
            sum += prices[j] - prices[i]
        }
        j += 1
        i += 1
    }
    return sum
}
//:
//: ---
//: ### [旋转数组](https://leetcode-cn.com/explore/interview/card/top-interview-questions-easy/1/array/23/)
func rotate(_ nums: inout [Int], _ k: Int) {
    if k < 1 || nums.count < 2 || nums.count == k {
        return
    }
    // 空间复杂度O(1),时间复杂度O(n)
    let s = k % nums.count
    nums.reverse()
    nums[0..<s].reverse()
    nums[s...].reverse()
    
    /* 空间复杂度O(n),时间复杂度O(1)
     let s = nums.count - (k % nums.count)
     let head = nums[..<s]
     let tail = nums[s...]
     nums = Array(tail + head)
     */
}
//:
//: ---
//: ### [存在重复](https://leetcode-cn.com/explore/interview/card/top-interview-questions-easy/1/array/24/)
func containsDuplicate(_ nums: [Int]) -> Bool {
    return nums.count != Set(nums).count
}
//:
//: ---
//: ### [只出现一次的数字](https://leetcode-cn.com/explore/interview/card/top-interview-questions-easy/1/array/25/)
func singleNumber(_ nums: [Int]) -> Int {
    var res = 0
    for item in nums {
        res = res ^ item
    }
    return res
}
//:
//: ---
//: ###[两个数组的交集 II](https://leetcode-cn.com/explore/interview/card/top-interview-questions-easy/1/array/26/)
func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var frequency = Dictionary(nums1.map{ ($0, 1) }, uniquingKeysWith: +)
    var results = [Int]()
    for num in nums2 {
        if let value = frequency[num], value > 0 {
            frequency[num] = value - 1
            results.append(num)
        }
    }
    return results
    /* 先排序,再找
    var res = [Int]()
    let n1 = nums1.sorted()
    let n2 = nums2.sorted()
    var i = 0
    var j = 0
    while i < n1.count && j < n2.count {
        if n1[i] == n2[j] {
            res.append(n1[i])
            i += 1
            j += 1
        } else if n1[i] < n2[j] {
            i += 1
        } else {
            j += 1
        }
    }
    return res
     */
}

let nums1 = [4,9,5], nums2 = [9,4,9,8,4]
intersect(nums1, nums2)

//: [Next](@next)
