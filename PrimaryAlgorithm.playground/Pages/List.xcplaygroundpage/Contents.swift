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
//:
//: ---
//: ### [删除链表的倒数第N个节点](https://leetcode-cn.com/explore/interview/card/top-interview-questions-easy/6/linked-list/42/)
func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    let dummy = ListNode(0)
    dummy.next = head
    var prev: ListNode? = dummy
    var post: ListNode? = dummy
    for _ in 0..<n {
        post = post!.next
    }
    while post!.next != nil {
        prev = prev!.next
        post = post!.next
    }
    prev!.next = prev!.next!.next
    return dummy.next
}

let startTime = CFAbsoluteTimeGetCurrent()

let endTime = CFAbsoluteTimeGetCurrent()
print("代码执行时长：\((endTime - startTime)*1000) 毫秒")

//: [Next](@next)
