public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var pnt1 = list1
        var pnt2 = list2
        var temp: ListNode?
        
        if list1 == nil && list2 == nil {
            return nil
        } else if list1 == nil {
            return list2
        } else if list2 == nil {
            return list1
        }
        
        if pnt1!.val <= pnt2!.val {
            temp = pnt1
            pnt1 = pnt1?.next
        } else {
            temp = pnt2
            pnt2 = pnt2?.next
        }
        let answer = temp
        while pnt1 != nil && pnt2 != nil {
            if pnt1!.val <= pnt2!.val {
                temp?.next = pnt1
                pnt1 = pnt1?.next
            } else {
                temp?.next = pnt2
                pnt2 = pnt2?.next
            }
            temp = temp?.next
        }
        while pnt1 != nil {
            temp?.next = pnt1
            pnt1 = pnt1?.next
            temp = temp?.next
        }
        while pnt2 != nil {
            temp?.next = pnt2
            pnt2 = pnt2?.next
            temp = temp?.next
        }
        return answer
    }
}

//var l3 = ListNode(4, nil)
//var l2 = ListNode(2, l3)
//var l1 = ListNode(1, l2)
//
//var r3 = ListNode(4, nil)
//var r2 = ListNode(3, r3)
//var r1 = ListNode(1, r2)
//
//var arr = Solution().mergeTwoLists(l1, r1)
//
//while arr != nil {
//    print(arr?.val)
//    arr = arr?.next
//}

//var arr = Solution().mergeTwoLists(nil, nil)
//
//print(arr)

var r1 = ListNode(0, nil)

var arr = Solution().mergeTwoLists(nil, r1)

while arr != nil {
    print(arr?.val)
    arr = arr?.next
}
