public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        var arr: [Int] = []
        var temp = head
        while temp != nil {
            arr.append(temp!.val)
            temp = temp?.next
        }
        if arr.isEmpty { return nil }
        return arr.reduce(into: [Int]()) { partialResult, next in
            partialResult.append(next)
            if partialResult.count % 2 == 0 {
                partialResult.swapAt(partialResult.count - 1, partialResult.count - 2)
            }
        }.reversed().reduce(ListNode?.none) { .init($1, $0) }
    }
}


var l4 = ListNode(4, nil)
var l3 = ListNode(3, l4)
var l2 = ListNode(2, l3)
var l1 = ListNode(1, l2)

var hi = Solution().swapPairs(l1)

while hi != nil {
    print(hi?.val)
    hi = hi?.next
}
