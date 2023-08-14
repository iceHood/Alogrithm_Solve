//public class Node {
//    public var val: Int
//    public var neighbors: [Node?]
//    public init(_ val: Int) {
//        self.val = val
//        self.neighbors = []
//    }
//}
//
//
//class Solution {
//    func cloneGraph(_ node: Node?) -> Node? {
//        if node == nil { return node }
//        var visited: Set<Int> = [node!.val]
//        var nodes = (1...100).map { Node($0) }
//        let answer = nodes[0]
//        var stack = [Node]()
//        stack.append(node!)
//        while !stack.isEmpty {
//            let now = stack.removeLast()
//            for i in 0..<now.neighbors.count {
//                let next = now.neighbors[i]!
//                nodes[now.val-1].neighbors.append(nodes[next.val-1])
//                if !visited.contains(next.val) {
//                    stack.append(next)
//                    visited.insert(next.val)
//                }
//            }
//        }
//        return answer
//    }
//}
