//: [Previous](@previous)
import Foundation
class ListNode {
    var val: Int
    var next: ListNode? = nil
    init(_ val: Int) {
        self.val = val
    }
}
extension ListNode: CustomDebugStringConvertible {
    var debugDescription: String {
        var text = "["
        text += "\(val)"
        var tempNode = next
        while tempNode != nil {
            text += ", \(tempNode!.val)"
            tempNode = tempNode!.next
        }
        return text + "]"
    }
}
//:
//: ---
//: ### [删除链表中的节点](https://leetcode-cn.com/explore/interview/card/top-interview-questions-easy/6/linked-list/41/)
extension ListNode {
    func deleteNode(_ node: ListNode) {
        if let next = node.next {
            // 把当前节点的值替换为下一个节点的值
            node.val = next.val
            // 删除下一个节点
            node.next = node.next?.next
        }
    }
}
let startTime = CFAbsoluteTimeGetCurrent()

let endTime = CFAbsoluteTimeGetCurrent()
print("代码执行时长：\((endTime - startTime)*1000) 毫秒")

//: [Next](@next)
