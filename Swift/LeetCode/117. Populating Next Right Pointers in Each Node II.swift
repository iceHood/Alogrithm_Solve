public class Node {
    public var val: Int
    public var left: Node?
    public var right: Node?
    public var next: Node?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.next = nil
    }
}


class Solution {
    func connect(_ root: Node?) -> Node? {
        guard root != nil else { return nil }
        var queue = [root]
        while !queue.isEmpty {
            var nextQueue: [Node?] = []
            var prevNode: Node? = nil
            for node in queue {
                prevNode?.next = node
                prevNode = node
                if node?.left != nil { nextQueue.append(node?.left) }
                if node?.right != nil { nextQueue.append(node?.right) }
            }
            queue = nextQueue
        }
        return root
    }
}
