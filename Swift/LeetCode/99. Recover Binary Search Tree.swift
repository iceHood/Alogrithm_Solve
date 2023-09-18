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
    func recoverTree(_ root: TreeNode?) {
        var isChanged = true
        func inorder(_ node: TreeNode?, _ maxNode: TreeNode?, _ minNode: TreeNode?) {
            guard let node = node else { return }
            let maxV = maxNode == nil ? Int.max : maxNode!.val
            let minV = minNode == nil ? Int.min : minNode!.val

            if node.val < minV {
                minNode?.val = node.val
                node.val = minV
                isChanged = true
            } else if node.val > maxV {
                maxNode?.val = node.val
                node.val = maxV
                isChanged = true
            } else {
                inorder(node.left, node, minNode)
                inorder(node.right, maxNode, node)
            }
        }
        while isChanged {
            isChanged = false
            inorder(root, nil, nil)
        }
    }
}
