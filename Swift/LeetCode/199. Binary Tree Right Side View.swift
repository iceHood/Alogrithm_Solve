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
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard root != nil else { return [] }
        var result: [[Int]] = []
        var current: [TreeNode] = [root!]
        var next: [TreeNode] = []
        while current.count != 0 {
            var temp: [Int] = []
            for node in current {
                temp.append(node.val)
                if node.left != nil { next.append(node.left!) }
                if node.right != nil { next.append(node.right!) }
            }
            result.append(temp)
            current = next
            next = []
        }
        return result.map { $0[$0.count-1] }
    }
}
