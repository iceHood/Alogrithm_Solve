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
    func isValidBST(_ root: TreeNode?) -> Bool {
        var num = Int.min
        func inorder(_ node: TreeNode?) -> Bool {
            if node != nil {
                if inorder(node?.left) && num < node!.val {
                    num = node!.val
                    return inorder(node?.right)
                } else {
                    return false
                }
            } else { return true }
        }
        return inorder(root)
    }
}

