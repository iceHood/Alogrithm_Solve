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
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var queue: [TreeNode] = [root]
        var isLeft = true
        var answer: [[Int]] = []

        while !queue.isEmpty {
            var nextQueue: [TreeNode] = []
            var semiAnswer: [Int] = []
            for node in queue.reversed() {
                semiAnswer.append(node.val)
                if isLeft {
                    if node.left != nil { nextQueue.append(node.left!) }
                    if node.right != nil { nextQueue.append(node.right!) }
                } else {
                    if node.right != nil { nextQueue.append(node.right!) }
                    if node.left != nil { nextQueue.append(node.left!) }
                }
            }
            answer.append(semiAnswer)
            queue = nextQueue
            isLeft.toggle()
        }
        return answer
    }
}
