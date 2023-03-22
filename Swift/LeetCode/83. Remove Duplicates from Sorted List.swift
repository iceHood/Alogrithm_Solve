//public class ListNode {
//    public var val: Int
//    public var next: ListNode?
//    public init() { self.val = 0; self.next = nil; }
//    public init(_ val: Int) { self.val = val; self.next = nil; }
//    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
//}
//
//class Solution {
//    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
//        var arr = [Int]()
//        var head = head
//        while head != nil {
//            arr.append(head!.val)
//            head = head!.next
//        }
//        var temp = ListNode()
//        head = temp
//        for i in Array(Set(arr)).sorted() {
//            temp.next = ListNode(i)
//            temp = temp.next!
//        }
//        return head?.next
//    }
//}
