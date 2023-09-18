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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard root != nil else { return [] }
        var result = [[Int]]()
        func makeLevel(_ queue: [TreeNode]) {
            var answer = [Int]()
            var nextQueue = [TreeNode]()
            for now in queue {
                answer.append(now.val)
                if now.left != nil { nextQueue.append(now.left!) }
                if now.right != nil { nextQueue.append(now.right!) }
            }
            result.append(answer)
            if !nextQueue.isEmpty { makeLevel(nextQueue) }
        }
        makeLevel([root!])
        return result
    }
}
