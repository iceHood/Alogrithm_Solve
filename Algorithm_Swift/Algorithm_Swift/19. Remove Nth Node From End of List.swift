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
//    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
//        var size = 0
//        var temp = head
//        while temp != nil {
//            temp = temp?.next
//            size += 1
//        }
//        let interval = size - n
//        temp = head
//        var prev: ListNode?
//        for _ in 0..<interval {
//            prev = temp
//            temp = temp?.next
//        }
//        
//        var newHead = head
//        if prev == nil {
//            newHead = temp?.next
//        } else if temp?.next == nil {
//            prev?.next = nil
//        } else {
//            prev?.next = temp?.next
//        }
//        return newHead
//    }
//}
//
////var five = ListNode(5, nil)
////var four = ListNode(4, five)
////var three = ListNode(3, four)
////var two = ListNode(2, three)
////var one = ListNode(1, two)
////
////var temp = Solution().removeNthFromEnd(one, 2)
////
////while temp != nil {
////    print(temp?.val)
////    temp = temp?.next
////}
//
////var one = ListNode(1, nil)
////
////var temp = Solution().removeNthFromEnd(one, 1)
////
////while temp != nil {
////    print(temp?.val)
////    temp = temp?.next
////}
//
//
////var two = ListNode(2, nil)
////var one = ListNode(1, two)
////
////var temp = Solution().removeNthFromEnd(one, 2)
////
////while temp != nil {
////    print(temp?.val)
////    temp = temp?.next
////}
//
////var five = ListNode(5, nil)
////var four = ListNode(4, five)
////var three = ListNode(3, four)
////var two = ListNode(2, three)
////var one = ListNode(1, two)
////
////var temp = Solution().removeNthFromEnd(one, 2)
////
////while temp != nil {
////    print(temp?.val)
////    temp = temp?.next
////}
