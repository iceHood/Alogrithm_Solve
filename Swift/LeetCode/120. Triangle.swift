//class Solution {
//    func minimumTotal(_ triangle: [[Int]]) -> Int {
//        var graph = triangle
//        for i in 1..<graph.count {
//            for j in 0..<graph[i].count {
//                if j == 0 {
//                    graph[i][j] += graph[i-1][j]
//                } else if j == graph[i].count-1 {
//                    graph[i][j] += graph[i-1][j-1]
//                } else {
//                    graph[i][j] += min(graph[i-1][j], graph[i-1][j-1])
//                }
//            }
//        }
//        return graph[graph.count-1].min()!
//    }
//}
//
//let triangle = [[2],[3,4],[6,5,7],[4,1,8,3]]
//let triangle1 = [[-10]]
//print(Solution().minimumTotal(triangle))
//print(Solution().minimumTotal(triangle1))
