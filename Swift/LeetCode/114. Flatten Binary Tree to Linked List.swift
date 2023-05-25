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
//    func flatten(_ root: TreeNode?) {
//        var temp: [Int] = []
//        func preorderTraversal(_ node: TreeNode?) {
//            guard let node = node else { return }
//            temp.append(node.val)
//            preorderTraversal(node.left)
//            preorderTraversal(node.right)
//        }
//        guard var node = root else { return }
//        preorderTraversal(root)
//        node.val = temp[0]
//        node.left = nil
//        for i in 1..<temp.count {
//            node.right = TreeNode(temp[i])
//            node = node.right!
//        }
//    }
//}
