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
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        return helper(0, 0, inorder.count - 1, preorder, inorder)
    }

    func helper(_ preStart: Int, _ inStart: Int, _ inEnd: Int, _ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        if preStart > preorder.count - 1 || inStart > inEnd {
            return nil
        }
        let root = TreeNode(preorder[preStart])
        var inIndex = 0
        for i in inStart...inEnd {
            if inorder[i] == root.val {
                inIndex = i
            }
        }
        root.left = helper(preStart + 1, inStart, inIndex - 1, preorder, inorder)
        root.right = helper(preStart + inIndex - inStart + 1, inIndex + 1, inEnd, preorder, inorder)
        return root
    }
}
var head = Solution().buildTree([3,9,20,15,7], [9,3,15,20,7])

func preorder(_ node: TreeNode?) {
    guard let node = node else { return }
    print(node.val)
    preorder(node.left)
    preorder(node.right)
}

preorder(head)
