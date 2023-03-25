//
//public class ListNode {
//    public var val: Int
//    public var next: ListNode?
//    public init() { self.val = 0; self.next = nil; }
//    public init(_ val: Int) { self.val = val; self.next = nil; }
//    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
//}
//
//class Solution {
//    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
//        var head = head
//        var left: ListNode? = ListNode()
//        var right: ListNode? = ListNode()
//        var answer = left
//        var rightHead = right
//        while head != nil {
//            let value = head!.val
//            if value < x {
//                left?.next = ListNode(value)
//                left = left?.next
//            } else {
//                right?.next = ListNode(value)
//                right = right?.next
//            }
//            head = head?.next
//        }
//        left?.next = rightHead?.next
//        return answer?.next
//    }
//}
//
//var head = ListNode(1, ListNode(4, ListNode(3, ListNode(2, ListNode(5, ListNode(2))))))
//var x = 3
//Solution().partition(head, x)
