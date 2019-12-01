//: [Previous](@previous)
class ListNode<T> {
    var val: T
    var next: ListNode? = nil
    init(_ val: T) {
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
extension ListNode where T: Equatable {
    @discardableResult
    static func deleteNode(_ head: ListNode?, _ val: T) -> ListNode? {
        let dumb = ListNode(val)
        dumb.next = head
        var node = dumb
        
        while node.next != nil {
            if node.next!.val == val {
                node.next = node.next!.next
            } else {
                node = node.next!
            }
        }
        
        return dumb.next
    }
}


//: [Next](@next)
