class Solution {
    
    func jump(_ nums: [Int]) -> Int {
        
        var graph: [[Int]] = nums.enumerated().map { (idx, num) in
            var temp: [Int] = []
            if idx == nums.count - 1 || num == 0 {
                return temp
            }
            for i in 1...num {
                if idx + i < nums.count {
                    temp.append(idx + i)
                }
            }
            return temp
        }
        var visited = [Int](repeating: Int.max, count: nums.count)
        var queue = [Int]()
        queue.append(0)
        visited[0] = 0
        while !queue.isEmpty {
            let now = queue.first!
            queue.removeFirst()
            let nowDist = visited[now]
            guard now < graph.count else {continue}
            for next in graph[now] {
                if visited[next] == Int.max {
                    queue.append(next)
                    visited[next] = nowDist + 1
                }
            }
        }
        return visited.last!
    }
}

//var nums = [2,3,1,1,4]
//var nums = [2,3,0,1,4]
//var nums = [2,1]
//var nums = [2,0,2,4,6,0,0,3]
print(Solution().jump(nums))
