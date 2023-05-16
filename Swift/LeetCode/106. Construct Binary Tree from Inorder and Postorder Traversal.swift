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
//// inorder: left -> root -> right
//// postorder: left -> right -> root
//
//class Solution {
//    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
//        var inorderMap = inorder.enumerated().reduce(into: [Int:Int]()) { partialResult, arg in
//            partialResult[arg.element] = arg.offset
//        }
//        var postorderIdx = postorder.count - 1
//        func recur(_ start: Int, _ end: Int) -> TreeNode? {
//            if start > end { return nil }
//            let x = TreeNode(postorder[postorderIdx])
//            postorderIdx -= 1
//            let mid = inorderMap[x.val]!
//            x.right = recur(mid + 1, end)
//            x.left = recur(start, mid - 1)
//            return x
//        }
//        return recur(0, inorder.count - 1)
//    }
//}
//func inorder(_ node: TreeNode?) {
//    guard let node = node else { return }
//    inorder(node.left)
//    print(node.val)
//    inorder(node.right)
//}
//
//var inorder = [9,3,15,20,7], postorder = [9,15,7,20,3]
//let head = Solution().buildTree(inorder, postorder)
//inorder(head)
//
