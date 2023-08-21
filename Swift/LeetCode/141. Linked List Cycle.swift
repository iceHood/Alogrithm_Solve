//public class ListNode {
//    public var val: Int
//    public var next: ListNode?
//    public init(_ val: Int) {
//        self.val = val
//        self.next = nil
//    }
//}
//
//
//class Solution {
//    func hasCycle(_ head: ListNode?) -> Bool {
//        var temp = head
//        var isVisited: Set<UnsafeMutableRawPointer> = []
//        while temp != nil {
//            let address = Unmanaged.passUnretained(temp!).toOpaque()
//            if isVisited.contains(address) {
//                return true
//            }
//            isVisited.insert(address)
//            temp = temp?.next
//        }
//        return false
//    }
//}
//
//var list = [ListNode(3),ListNode(2),ListNode(0),ListNode(-4)]
//list[0].next = list[1]
//list[1].next = list[2]
//list[2].next = list[3]
//list[3].next = list[1]
//print(Solution().hasCycle(list[0]))
