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
//    func sumNumbers(_ root: TreeNode?) -> Int {
//        var answer = 0
//        func dfs(node: TreeNode?, prev: Int) {
//            guard let node = node else {
//                return
//            }
//            let nextVal = prev*10+node.val
//            if node.left == nil && node.right == nil {
//                answer += nextVal
//            } else if node.left == nil {
//                dfs(node: node.right, prev: nextVal)
//            } else if node.right == nil {
//                dfs(node: node.left, prev: nextVal)
//            } else {
//                dfs(node: node.left, prev: nextVal)
//                dfs(node: node.right, prev: nextVal)
//            }
//        }
//        dfs(node: root, prev: 0)
//        return answer
//    }
//}
