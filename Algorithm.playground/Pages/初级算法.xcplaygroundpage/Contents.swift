//: > [LeetCode初级算法](https://leetcode-cn.com/leetbook/detail/top-interview-questions-easy/)
import Foundation
import XCTest

class ArrayTests: XCTestCase {
    
    func testRemoveDuplicates() {
        var input = [1, 1, 2]
        var result = removeDuplicates(&input)
        XCTAssert(input[0..<result] == [1, 2])
        XCTAssert(result == 2)
        
        input = [0,0,1,1,1,2,2,3,3,4]
        result = removeDuplicates(&input)
        XCTAssert(input[0..<result] == [0, 1, 2, 3, 4])
        XCTAssert(result == 5)
    }
    
    func testMaxProfit() {
        var input = [7,1,5,3,6,4]
        var result = maxProfit(input)
        XCTAssert(result == 7)
        
        input = [1,2,3,4,5]
        result = maxProfit(input)
        XCTAssert(result == 4)
        
        input = [7,6,4,3,1]
        result = maxProfit(input)
        XCTAssert(result == 0)
    }
}

ArrayTests.defaultTestSuite.run()


//: [Next](@next)

