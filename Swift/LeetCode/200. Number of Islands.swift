class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        let dy = [0, 0, 1, -1]
        let dx = [1, -1, 0, 0]
        let m = grid.count
        let n = grid[0].count
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)
        func findIsland(y: Int, x: Int) {
            for i in 0..<4 {
                let nextY = y + dy[i]
                let nextX = x + dx[i]
                if nextY < 0 || nextY >= m || nextX < 0 || nextX >= n { continue }
                if visited[nextY][nextX] { continue }
                visited[nextY][nextX] = true
                if grid[nextY][nextX] == "1" {
                    findIsland(y: nextY, x: nextX)
                }
            }
        }
        
        var answer = 0
        for j in 0..<m {
            for i in 0..<n {
                if !visited[j][i] && grid[j][i] == "1" {
                    answer += 1
                    visited[j][i] = true
                    findIsland(y: j, x: i)
                }
            }
        }
        return answer
    }
}
