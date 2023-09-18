class Solution {
    typealias Point = (x: Int, y: Int)
    func solve(_ board: inout [[Character]]) {
        let dy = [0, 0, 1, -1]
        let dx = [1, -1, 0, 0]
        let m = board.count
        let n = board[0].count
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)

        func bfs(start: Point, isFlipping: Bool) {
            visited[start.y][start.x] = true
            var queue = [start]
            var nextQueue: [Point] = []
            while !queue.isEmpty {
                let now = queue.removeLast()
                for i in 0..<4 {
                    let next: Point = (now.x+dx[i], now.y+dy[i])
                    if next.y < 0 || next.y >= m || next.x < 0 || next.x >= n { continue }
                    if visited[next.y][next.x] { continue }
                    visited[next.y][next.x] = true
                    if board[next.y][next.x] == "O" {
                        if isFlipping { board[next.y][next.x] = "X" }
                        nextQueue.append(next)
                    }
                }
                if queue.isEmpty {
                    queue = nextQueue.reversed()
                    nextQueue = []
                }
            }
        }

        for y in 0..<m {
            if y == 0 || y == m - 1 {
                for x in 0..<n {
                    if board[y][x] == "O" { bfs(start: (x, y), isFlipping: false) }
                    visited[y][x] = true
                }
            } else {
                if board[y][0] == "O" {
                    bfs(start: (0, y), isFlipping: false)
                }
                visited[y][0] = true
                if board[y][n-1] == "O" {
                    bfs(start: (n-1, y), isFlipping: false)
                }
                visited[y][n-1] = true
            }

        }

        for y in 0..<m {
            for x in 0..<n {
                if visited[y][x] { continue }
                if board[y][x] == "O" {
                    board[y][x] = "X"
                    bfs(start: (x, y), isFlipping: true)
                }
            }
        }
    }
}

var board: [[Character]] = [["X","X","X","X"],["X","O","O","X"],["X","X","O","X"],["X","O","X","X"]]
Solution().solve(&board)
print(board)

board = [["X"]]
Solution().solve(&board)
print(board)

board = [["O"]]
Solution().solve(&board)
print(board)
