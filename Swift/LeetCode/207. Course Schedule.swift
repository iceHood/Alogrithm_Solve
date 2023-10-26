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
        var visited = [Bool](repeating: false, count: numCourses)
        for pre in prerequisites {
            graph[pre[0]].children.append(graph[pre[1]])
        }
        func travel(node: TreeNode, parent: Set<Int>) -> Bool {
            if visited[node.num] { return true }
            if node.children.isEmpty {
                visited[node.num] = true
                return true
            }
            if parent.contains(node.num) {
                return false
            } else {
                var isOk = true
                for course in node.children {
                    isOk = isOk && travel(node: course, parent: parent.union([node.num]))
                }
                visited[node.num] = true
                return isOk
            }
        }
        for i in 0..<numCourses {
            if visited[i] { continue }
            if !travel(node: graph[i], parent: []) {
                return false
            }
        }
        return true
    }
}
