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
//    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
//        if p?.val == q?.val {
//            if p == nil {
//                return true
//            } else {
//                return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
//            }
//        } else {
//            return false
//        }
//    }
//}
