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
//    func isSymmetric(_ root: TreeNode?) -> Bool {
//        var values = [Int]()
//        var isDiff = false
//        var leftNum = 0
//        var rightNum = 0
//        func preorder(_ node: TreeNode?) {
//            if node == nil {
//                leftNum += 1
//                values.append(101)
//                return
//            } else {
//                leftNum += 1
//                values.append(node!.val)
//                preorder(node?.left)
//                preorder(node?.right)
//            }
//        }
//        func postorder(_ node: TreeNode?) {
//            guard rightNum < leftNum else {
//                isDiff = true
//                return
//            }
//            if node == nil {
//                isDiff = isDiff || values[rightNum] != 101
//                rightNum += 1
//                return
//            } else {
//                isDiff = isDiff || values[rightNum] != node!.val
//                rightNum += 1
//                postorder(node?.right)
//                postorder(node?.left)
//            }
//        }
//        preorder(root?.left)
//        postorder(root?.right)
//        return !isDiff
//    }
//}
