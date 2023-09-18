public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}


class Solution {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var set: Set<UnsafeMutableRawPointer> = []
        var headA = headA, headB = headB
        while headA != nil {
            set.insert(Unmanaged.passUnretained(headA!).toOpaque())
            headA = headA?.next
        }
        while headB != nil {
            if set.contains(Unmanaged.passUnretained(headB!).toOpaque()) {
                return headB
            }
            headB = headB?.next
        }
        return nil
    }
}
