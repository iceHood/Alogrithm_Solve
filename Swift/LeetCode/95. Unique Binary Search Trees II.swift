
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
    func generateTrees(_ n: Int) -> [TreeNode?] {
        struct Rng: Hashable {
            var start: Int
            var end: Int
        }

        var memo = [Rng: [TreeNode?]]()

        func divideConquer(rng: Rng) -> [TreeNode?] {

            if rng.start > rng.end {
                return [nil]
            }

            if memo[rng] != nil {
               return memo[rng]!
            }

            var result = [TreeNode?]()

            for i in rng.start...rng.end {
                let leftTree = divideConquer(rng: Rng(start: rng.start, end: i-1))
                let rightTree = divideConquer(rng: Rng(start: i+1, end: rng.end))
                for left in leftTree {
                    for right in rightTree {
                        let root = TreeNode(i)
                        root.left = left
                        root.right = right
                        result.append(root)
                    }
                }
            }
            memo[rng] = result
            return result
        }
        return divideConquer(rng: Rng(start: 1, end: n))
    }
}

func preorder(_ node: TreeNode?) {
    if node == nil {
        print("nil", terminator: ", ")
        return
    }

    print(node!.val, terminator: ", ")
    preorder(node?.left)
    preorder(node?.right)
}
var result = Solution().generateTrees(3)
for node in result {
    preorder(node)
    print()
}
