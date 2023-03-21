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
//    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
//        var dic = [Int: Int]()
//        var head = head
//        while head != nil {
//            let val = head!.val
//            if dic[val] == nil {
//                dic[val] = 1
//            } else {
//                dic[val] = 2
//            }
//            head = head?.next
//        }
//        var answer: ListNode? = ListNode()
//        var temp = answer
//        for (key, val) in dic.sorted(by: {$0.key < $1.key}) {
//            if val > 1 {
//                continue
//            } else {
//                temp?.next = ListNode(key)
//                temp = temp?.next
//            }
//        }
//        return answer?.next
//    }
//}
