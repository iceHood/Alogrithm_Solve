public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}


class Solution {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        var temp = head
        var isVisited: Set<UnsafeMutableRawPointer> = []
        while temp != nil {
            let address = Unmanaged.passUnretained(temp!).toOpaque()
            if isVisited.contains(address) {
                return temp
            }
            isVisited.insert(address)
            temp = temp?.next
        }
        return nil
    }
}
