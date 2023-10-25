final class Solution {
    
    final class TreeNode {
        var num: Int
        var children: [TreeNode] = []
        init(num: Int) {
            self.num = num
        }
    }
    
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var graph = (0..<numCourses).map { TreeNode(num: $0) }
        for pre in prerequisites {
            graph[pre[0]].children.append(graph[pre[1]])
        }
        var visited: Set<Int> = []
        func travel(node: TreeNode) -> Bool {
            if visited.contains(node.num) {
                return false
            } else {
                visited.insert(node.num)
                var isOk = true
                for course in node.children {
                    isOk = isOk && travel(node: course)
                }
                return isOk
            }
        }
        for i in 0..<numCourses {
            if !travel(node: graph[i]) {
                return false
            }
            visited = []
        }
        return true
    }
}
