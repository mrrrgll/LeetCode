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
//:
//: ---
//: ### [反转链表](https://leetcode-cn.com/explore/interview/card/top-interview-questions-easy/6/linked-list/43/)
func reverseList(_ head: ListNode?) -> ListNode? {
    // 迭代解法
    var pre: ListNode?
    var cur = head
    while cur != nil {
        let tmp = cur?.next
        cur?.next = pre
        pre = cur
        cur = tmp
    }
    return pre
    /* 递归解法
     if head == nil || head?.next == nil {
         return head
     }
     let cur = reverseList(head!.next)
     head!.next?.next = head
     head!.next = nil
     return cur
     */
}

let t1 = ListNode(1)
let t2 = ListNode(2)
let t3 = ListNode(3)
let t4 = ListNode(4)
let t5 = ListNode(5)

t1.next = t2
t2.next = t3
t3.next = t4
t4.next = t5

let startTime = CFAbsoluteTimeGetCurrent()
reverseList(t1)
let endTime = CFAbsoluteTimeGetCurrent()
print((endTime - startTime)*1000)

//: [Next](@next)
