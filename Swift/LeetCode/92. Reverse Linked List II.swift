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
//    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
//        var arr: [ListNode] = []
//        var head = head
//        let left = left - 1, right = right - 1
//        while head != nil {
//            arr.append(head!)
//            head = head?.next
//        }
//        arr.replaceSubrange(left...right, with: arr[left...right].reversed())
//        for idx in 0..<arr.count-1 {
//            arr[idx].next = arr[idx+1]
//        }
//        arr.last?.next = nil
//        return arr[0]
//    }
//}
//
//var head = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5))))), left = 2, right = 4
//var temp = Solution().reverseBetween(head, left, right)
//while temp != nil {
//    print(temp?.val, terminator: "")
//    temp = temp?.next
//}
