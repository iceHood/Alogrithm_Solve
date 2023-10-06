public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    // By recursively
    func reverseList(_ head: ListNode?) -> ListNode? {
        var head = head
        var tail: ListNode? = nil
        func recursive(_ head: ListNode?) -> ListNode? {
            if head?.next == nil {
                tail = head
                return head
            }
            recursive(head?.next)?.next = head
            return head
        }
        _ = recursive(head)
        head?.next = nil
        return tail
    }
    // By iterating
    func reverseList1(_ head: ListNode?) -> ListNode? {
        var head = head
        var next: ListNode? = nil
        var prev: ListNode? = nil
        while head != nil {
            next = head?.next
            head?.next = prev
            prev = head
            head = next
        }
        return prev
    }
}
