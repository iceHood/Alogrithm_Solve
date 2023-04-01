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
//    func inorderTraversal(_ root: TreeNode?) -> [Int] {
//        var result = [Int]()
//        func inorder(_ node: TreeNode?) {
//            guard node != nil else { return }
//            inorder(node?.left)
//            result.append(node!.val)
//            inorder(node?.right)
//        }
//        inorder(root)
//        return result
//    }
//}
////var root: TreeNode? = TreeNode(1, nil, TreeNode(2, TreeNode(3), nil))
////var root: TreeNode? = nil
//var root: TreeNode? = TreeNode(1)
//print(Solution().inorderTraversal(root))
