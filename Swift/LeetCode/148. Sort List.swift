public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func sortList(_ head: ListNode?) -> ListNode? {
        var arr = [ListNode]()
        var temp = head
        while temp != nil {
            let prev = temp
            arr.append(temp!)
            temp = temp!.next
            prev!.next = nil
        }
        temp = ListNode()
        var temp2 = temp!
        _=arr.sorted(by: {$0.val < $1.val}).reduce(into: temp2) { partialResult, node in
            partialResult.next = node
            partialResult = partialResult.next!
        }
        return temp!.next
    }
}

