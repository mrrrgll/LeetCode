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
        (cur!.next, pre, cur) = (pre, cur, cur?.next)
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
//:
//: ---
//: ### [合并两个有序链表](https://leetcode-cn.com/explore/interview/card/top-interview-questions-easy/6/linked-list/44/)
func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    // 迭代解法
    let dummy = ListNode(0)
    var node = dummy
    var l1 = l1
    var l2 = l2
    while l1 != nil, l2 != nil {
        if l1!.val < l2!.val {
            node.next = l1
            l1 = l1!.next
        } else {
            node.next = l2
            l2 = l2!.next
        }
        node = node.next!
    }
    node.next = l1 ?? l2
    return dummy.next
    /* 递归解法
     if l1 == nil {
         return l2
     }
     if l2 == nil {
         return l1
     }
     if l1!.val < l2!.val {
         l1!.next = mergeTwoLists(l1!.next, l2)
         return l1
     }
     l2!.next = mergeTwoLists(l1, l2!.next)
     return l2
     */
}
//:
//: ---
//: ### [环形链表](https://leetcode-cn.com/explore/interview/card/top-interview-questions-easy/6/linked-list/46/)
func hasCycle(_ head: ListNode?) -> Bool {
    // ⚠️暂时不知道Swift如何创建出循环链表, 故使用val作为判断条件
    // 哈希表
    var set: Set<Int> = []
    var node = head
    while node != nil {
        if set.contains(node!.val) {
            return true
        } else {
            set.insert(node!.val)
        }
        node = node!.next
    }
    return false
    /* 快慢指针
     if head == nil || head!.next == nil {
         return false
     }
     var fast = head!.next
     var slow = head
     while fast!.val != slow!.val {
         if fast!.next == nil || fast!.next!.next == nil {
             return false
         }
         fast = fast!.next!.next
         slow = slow!.next
     }
     return true
     */
}
//: [Next](@next)
