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
//    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
//        // make nodes to array
//        guard head != nil else { return head }
//        var node = head
//        var arr: [Int] = []
//        while node != nil {
//            arr.append(node!.val)
//            node = node!.next
//        }
//        // caculate how much to rotate 0 ~ n - 1
//        let rotateNum = k % arr.count
//        // start with idx
//        var idx = (arr.count - rotateNum) % arr.count
//        node = head // recycle our nodes
//        while node != nil {
//            node!.val = arr[idx]
//            node = node!.next
//            idx = (idx + 1) % arr.count
//        }
//        return head
//    }
//}
//
//
//print(Solution().rotateRight(<#T##head: ListNode?##ListNode?#>, <#T##k: Int##Int#>))
