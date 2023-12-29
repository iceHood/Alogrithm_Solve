public final class TreeNode {
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

final class Solution {
    func countNodes(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        } else {
            return 1 + countNodes(root?.left) + countNodes(root?.right)
        }
    }
}
