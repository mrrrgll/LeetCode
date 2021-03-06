import Foundation

// MARK: - 从排序数组中删除重复项
public func removeDuplicates(_ nums: inout [Int]) -> Int {
    if nums.isEmpty { return 0 }
    var i = 0
    for item in nums where item != nums[i] {
        i += 1
        nums[i] = item
    }
    return i + 1
}
// MARK: - 买卖股票的最佳时机 II
public func maxProfit(_ prices: [Int]) -> Int {
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

// MARK: - 旋转数组
public func rotate(_ nums: inout [Int], _ k: Int) {
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
// MARK: - 存在重复元素
public func containsDuplicate(_ nums: [Int]) -> Bool {
    return nums.count != Set(nums).count
}
// MARK: - 只出现一次的数字
public func singleNumber(_ nums: [Int]) -> Int {
    var res = 0
    for item in nums {
        res = res ^ item
    }
    return res
}
// MARK: - 两个数组的交集 II
public func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var frequency = Dictionary(nums1.map{ ($0, 1) }, uniquingKeysWith: +)
    var results = [Int]()
    for num in nums2 {
        if let value = frequency[num], value > 0 {
            frequency[num] = value - 1
            results.append(num)
        }
    }
    return results
    /* 先排序,再求解
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
// MARK: - 加一
public func plusOne(_ digits: [Int]) -> [Int] {
    var res = digits
    for i in 0..<res.count {
        let j = res.count - i - 1
        res[j] += 1
        res[j] %= 10
        if res[j] != 0 {
            return res
        }
    }
    res = [Int](repeating: 0, count: res.count + 1)
    res[0] = 1
    return res
    /* 错误解法(会溢出)
     var num = 0
     for value in digits {
         num = num * 10 + value
     }
     num += 1
     var res = [Int]()
     while num > 0 {
         let i = num % 10
         num = num / 10
         res.append(i)
     }
     return res.reversed()
     */
}
// MARK: - 移动零
public func moveZeroes(_ nums: inout [Int]) {
    var i = 0
    var j = 1
    while j < nums.count {
        let iIs0 = nums[i] == 0
        let jIs0 = nums[j] == 0
        switch (iIs0, jIs0) {
        case (true, true):
            j += 1
        case (true, false):
            (nums[i], nums[j]) = (nums[j], nums[i])
        case (false, true):
            i += 1
        case (false, false):
            i += 1
            j += 1
        }
    }
    /* 优化
     var i = 0
     for j in 1..<nums.count {
         if nums[i] != 0 {
             i += 1
             continue
         }
         if nums[j] != 0 {
             (nums[i], nums[j]) = (nums[j], nums[i])
             i += 1
         }
     }
     */
}
// MARK: - 两数之和
public func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var map = [Int: Int]()
    for i in 0..<nums.count {
        let complete = target - nums[i]
        if let j = map[complete] {
            return [i, j]
        }
        map[nums[i]] = i
    }
    return []
}
// MARK: - 有效的数独
public func isValidSudoku(_ board: [[Character]]) -> Bool {
    for i in 0..<9 {
        var line = Set<Character>()
        var column = Set<Character>()
        var cube = Set<Character>()
        for j in 0..<9 {
            if board[i][j] != ".", !line.insert(board[i][j]).inserted {
                return false
            }
            if board[j][i] != ".", !column.insert(board[j][i]).inserted {
                return false
            }
            let m = i/3*3 + j/3
            let n = i%3*3 + j%3
            if board[m][n] != ".", !cube.insert(board[m][n]).inserted {
                return false
            }
        }
    }
    return true
}
// MARK: - 旋转图像
public func rotate(_ matrix: inout [[Int]]) {
    for i in 0..<matrix.count {
        for j in (i+1)..<matrix[i].count {
            (matrix[i][j], matrix[j][i]) = (matrix[j][i], matrix[i][j])
        }
        matrix[i].reverse()
    }
}
