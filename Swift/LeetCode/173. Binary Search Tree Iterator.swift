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


final class BSTIterator {
    var now = -1
    var nums = [Int]()
    init(_ root: TreeNode?) {
        func inorder(_ head: TreeNode?) {
            if head?.left != nil {
                inorder(head?.left)
            }
            nums.append(head!.val)
            if head?.right != nil {
                inorder(head?.right)
            }
        }
        inorder(root)
    }

    func next() -> Int {
        now += 1
        return nums[now]
    }

    func hasNext() -> Bool {
        now + 1 < nums.count
    }
}

/**
 * Your BSTIterator object will be instantiated and called as such:
 * let obj = BSTIterator(root)
 * let ret_1: Int = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */
