public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func isBalanced(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        return abs(foundMaxHeight(root?.left) - foundMaxHeight(root?.right)) <= 1 && isBalanced(root?.left) && isBalanced(root?.right)
    }
    func foundMaxHeight(_ node: TreeNode?) -> Int {
        if node == nil {
            return 0
        } else {
            return max(foundMaxHeight(node?.left), foundMaxHeight(node?.right)) + 1
        }
    }
}
