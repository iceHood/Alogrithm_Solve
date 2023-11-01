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
    func findMode(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var dict = [Int: Int]()
        func travel(_ node: TreeNode) {
            if node.left != nil {travel(node.left!)}
            if let val = dict[node.val] {
                dict[node.val] = val + 1
            } else { dict[node.val] = 1}
            if node.right != nil {travel(node.right!)}
        }
        travel(root)
        var max = dict.values.max()!
        return Array(dict.filter({$0.value == max}).keys)
    }
}
