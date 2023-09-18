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
        var level = [root!]
        while !level.isEmpty {
            var nextLevel: [Node] = []
            var nowNode = level.first!
            for i in 1..<level.count {
                if nowNode.left != nil {
                    nextLevel.append(nowNode.left!)
                    nextLevel.append(nowNode.right!)
                }
                nowNode.next = level[i]
                nowNode = level[i]
            }
            if nowNode.left != nil {
                nextLevel.append(nowNode.left!)
                nextLevel.append(nowNode.right!)
            }
            level = nextLevel
        }
        return root
    }
}
