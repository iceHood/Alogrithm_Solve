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
//    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
//        if root == nil {
//            return false
//        }
//        var isFind = false
//        func helper(_ node: TreeNode) {
//            if node.left == nil && node.right == nil {
//                // leaf node일 경우
//                isFind = isFind || node.val == targetSum
//            }
//            if let left = node.left {
//                left.val += node.val
//                helper(left)
//            }
//            if let right = node.right {
//                right.val += node.val
//                helper(right)
//            }
//        }
//        helper(root!)
//        return isFind
//    }
//}
