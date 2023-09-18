public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    
    static let maxNode = ListNode(10000)
    
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var answer: ListNode?
        var tempList: ListNode?
        var insideLists = lists
        
        var min = Self.maxNode
        var minIdx = 0
        var isAdjusted = false
        for idx in 0..<insideLists.count {
            guard let temp = insideLists[idx] else { continue }
            if temp.val <= min.val {
                min = temp
                minIdx = idx
                isAdjusted = true
            }
        }
        if !isAdjusted { return nil }
        answer = insideLists[minIdx]
        insideLists[minIdx] = insideLists[minIdx]?.next
        tempList = answer
        
        while isAdjusted {
            isAdjusted = false
            minIdx = 0
            min = Self.maxNode
            for idx in 0..<insideLists.count {
                guard let temp = insideLists[idx] else { continue }
                if temp.val <= min.val {
                    min = temp
                    minIdx = idx
                    isAdjusted = true
                }
            }
            if !isAdjusted { break }
            tempList?.next = insideLists[minIdx]
            tempList = tempList?.next
            insideLists[minIdx] = insideLists[minIdx]?.next
        }
        return answer
    }
}

let a1 = ListNode(5, nil)
let a2 = ListNode(4, a1)
let a3 = ListNode(1, a2)

let b1 = ListNode(4, nil)
let b2 = ListNode(3, b1)
let b3 = ListNode(1, b2)

let c1 = ListNode(6, nil)
let c2 = ListNode(2, c1)

let arr = [a3, b3, c2]
var arr2: [ListNode?] = [nil]
var temp = Solution().mergeKLists(arr2)
while temp != nil {
    print(temp?.val)
    temp = temp?.next
}
