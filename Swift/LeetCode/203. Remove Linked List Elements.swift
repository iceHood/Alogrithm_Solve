public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        var node = head
        var nums: [ListNode] = []
        while node != nil {
            let value = node!.val
            if value != val {
                nums.append(ListNode(value))
            }
            node = node?.next
        }
        if nums.count == 0 { return nil }
        for i in 0..<nums.count-1 {
            nums[i].next = nums[i+1]
        }
        return nums[0]
    }
}
