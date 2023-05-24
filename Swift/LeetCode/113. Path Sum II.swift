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
//    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
//        if root == nil {
//            return []
//        }
//        var answers: [[Int]] = []
//        func helper(_ node: TreeNode, _ nodeValues: [Int]) {
//            if node.left == nil && node.right == nil {
//                // leaf node일 경우
//                if nodeValues.reduce(0, +) == targetSum {
//                    answers.append(nodeValues)
//                }
//                return
//            }
//            if let left = node.left {
//                helper(left, nodeValues + [left.val])
//            }
//            if let right = node.right {
//                helper(right, nodeValues + [right.val])
//            }
//        }
//        helper(root!, [root!.val])
//        return answers
//    }
//}
