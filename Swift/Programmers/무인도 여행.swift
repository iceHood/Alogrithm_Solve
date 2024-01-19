import Foundation

typealias Pos = (x: Int, y: Int)
func solution(_ maps:[String]) -> [Int] {
    let dy = [1, -1, 0, 0]
    let dx = [0, 0, 1, -1]
    let limitX = maps[0].count
    let limitY = maps.count
    var map: [[Int]] = []
    for str in maps {
        let str = Array(str)
        var temp = [Int]()
        for ch in str {
            if ch == "X" { temp.append(-1) }
            else {
                temp.append(Int(ch.asciiValue!-48))
            }
        }
        map.append(temp)
    }
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: limitX), count: limitY)
    
    func bfs(_ x: Int, _ y: Int) -> Int {
        var queue = [Pos]()
        var result = map[y][x]
        queue.append((x, y))
        visited[y][x] = true
        var nextQueue = [Pos]()
        
        while !queue.isEmpty {
            let (nowX, nowY) = queue.popLast()!
            for i in 0..<4 {
                let nextX = nowX + dx[i]
                let nextY = nowY + dy[i]
                if nextX < 0 || nextX >= limitX || nextY < 0 || nextY >= limitY {
                    continue
                }
                if map[nextY][nextX] == -1 { continue }
                if !visited[nextY][nextX] {
                    result += map[nextY][nextX]
                    visited[nextY][nextX] = true
                    nextQueue.append((nextX, nextY))
                }
            }
            if queue.isEmpty {
                queue = nextQueue.reversed()
                nextQueue = []
            }
        }
        return result
    }
    
    var result = [Int]()
    for y in 0..<limitY {
        for x in 0..<limitX {
            if visited[y][x] || map[y][x] == -1 { continue }
            result.append(bfs(x, y))
        }
    }
    
    return result.isEmpty ? [-1] : result.sorted()
}
