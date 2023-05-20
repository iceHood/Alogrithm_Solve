//public class ListNode {
//    public var val: Int
//    public var next: ListNode?
//    public init() { self.val = 0; self.next = nil; }
//    public init(_ val: Int) { self.val = val; self.next = nil; }
//    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
//}
//
//public class TreeNode {
//    public var val: Int
//    public var left: TreeNode?
//    public var right: TreeNode?
//    public init() { self.val = 0; self.left = nil; self.right = nil; }
//    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
//    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
//        self.val = val
//        self.left = left
//        self.right = right
//    }
//}
//
//class Solution {
//    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
//        var arr: [Int] = []
//        var node = head
//        while node != nil {
//            arr.append(node!.val)
//            node = node?.next
//        }
//        return arr.count == 0 ? nil : sortedArrayToBST(arr)
//    }
//    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
//        let mid = nums.count/2
//        let node = TreeNode(nums[mid])
//        node.left = mid == 0 ? nil : sortedArrayToBST([Int](nums[0...(mid-1)]))
//        node.right = mid == nums.count - 1 ? nil : sortedArrayToBST([Int](nums[(mid+1)...(nums.count-1)]))
//        return node
//    }
//}
