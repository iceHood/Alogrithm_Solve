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
    func maxPathSum(_ root: TreeNode?) -> Int {
        var maxValue = Int.min
        func getMax(_ node: TreeNode?) -> Int {
            guard let node = node else {
                return 0
            }
            let left = max(getMax(node.left), 0)
            let right = max(getMax(node.right), 0)

            let nowMax = node.val + left + right
            maxValue = max(maxValue, nowMax)
            return node.val + max(left, right)
        }
        getMax(root)
        return maxValue
    }
}
//
