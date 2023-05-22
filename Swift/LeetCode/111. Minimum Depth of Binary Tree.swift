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
//    func minDepth(_ root: TreeNode?) -> Int {
//        guard root != nil else { return 0 }
//        let left = minDepth(root?.left)
//        let right = minDepth(root?.right)
//        if left == 0 {
//            return right + 1
//        } else if right == 0 {
//            return left + 1
//        } else {
//            return min(left, right) + 1
//        }
//    }
//}
