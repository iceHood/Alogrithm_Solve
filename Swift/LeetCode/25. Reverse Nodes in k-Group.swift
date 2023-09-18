public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        var arr: [Int] = []
        var temp = head
        while temp != nil {
            arr.append(temp!.val)
            temp = temp?.next
        }
        if arr.isEmpty { return nil }
        return arr.reduce(into: [Int]()) { partialResult, next in
            partialResult.append(next)
            if partialResult.count % k == 0 {
                partialResult[partialResult.count-k...partialResult.count-1].reverse()
            }
        }.reversed().reduce(ListNode?.none) { .init($1, $0) }
    }
}

var l5 = ListNode(5, nil)
var l4 = ListNode(4, l5)
var l3 = ListNode(3, l4)
var l2 = ListNode(2, l3)
var l1 = ListNode(1, l2)

var hi = Solution().reverseKGroup(l1, 3)

while hi != nil {
    print(hi?.val)
    hi = hi?.next
}
