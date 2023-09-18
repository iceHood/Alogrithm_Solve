public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func insertionSortList(_ head: ListNode?) -> ListNode? {
        var answer = head
        var head = head?.next
        answer?.next = nil
        while head != nil {
            let now = head!
            var temp = answer
            var prev: ListNode? = nil
            while temp != nil {
                if temp!.val < now.val {
                    prev = temp
                    temp = temp?.next
                } else {
                    if prev == nil {
                        head = head?.next
                        now.next = temp
                        answer = now
                    } else {
                        prev?.next = now
                        head = head?.next
                        now.next = temp
                    }
                    break
                }
            }
            if temp == nil {
                prev?.next = now
                head = head?.next
                now.next = nil
            }
        }
        return answer
    }
}

let list = ListNode(4, ListNode(2, ListNode(1, ListNode(3))))
Solution().insertionSortList(list)
