//public class TreeNode {
//    public var val: Int
//    public var left: TreeNode?
//    public var right: TreeNode?
//    public init() { self.val = 0; self.left = nil; self.right = nil; }
//    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
//    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
//        self.val = val
//        self.left = left
//        self.right = right
//    }
//}
//
//class Solution {
//    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
//        var queue = [root]
//        var answer: [[Int]] = []
//        while !queue.isEmpty {
//            var nextQueue: [TreeNode?] = []
//            var tempAnswer: [Int] = []
//            for case let node? in queue {
//                tempAnswer.append(node.val)
//                nextQueue.append(node.left)
//                nextQueue.append(node.right)
//            }
//            queue = nextQueue
//            answer.append(tempAnswer)
//        }
//        answer.popLast()
//        return answer.reversed()
//    }
//}
