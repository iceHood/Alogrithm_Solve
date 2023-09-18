import Foundation
// MARK: - 보조 클래스
final class FileIO {
    private var buffer:[UInt8]
    private var index: Int

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer.withUnsafeBufferPointer { $0[index] }
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readOneInt() -> Int {
        var now = read()
        var isPositive = true
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
        return Int(now-48) * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()

        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시

        while now != 10
                && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }

        return str
    }
}

typealias Position = (x: Int, y: Int)

let readHelper = FileIO()
let N = readHelper.readInt(), M = readHelper.readInt()
var graph: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: M), count: N)
var answer: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: M), count: N)
var visited: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: M), count: N)
var dy = [1, -1, 0, 0], dx = [0, 0, 1, -1]

for i in 0..<N {
    for j in 0..<M {
        graph[i][j] = readHelper.readOneInt()
    }
}

for y in 0..<N {
    for x in 0..<M {
        if graph[y][x] == 0 && !visited[y][x] {
            bfs(start: (x, y))
        }
    }
}

for y in 0..<N {
    for x in 0..<M {
        if graph[y][x] == 1 {
            var temp = -1
            var tempVisitd: [Position] = []
            for i in 0..<4 {
                var next: Position = (x+dx[i], y+dy[i])
                if isValidPos(pos: next) {
                    if graph[next.y][next.x] > 0 {
                        let pos = graph[next.y][next.x] - 2
                        next = (pos % M, pos / M)
                    }
                    if !tempVisitd.contains(where: {$0 == next}) {
                        tempVisitd.append(next)
                        temp += graph[next.y][next.x]
                    }
                }
            }
            answer[y][x] = (-temp) % 10
        }
    }
}

var text = ""
answer.forEach { arr in
    arr.forEach({text += "\($0)"})
    text += "\n"
}
print(text)


@inline(__always) func isValidPos(pos: Position) -> Bool {
    if pos.y < 0 || pos.y >= N || pos.x < 0 || pos.x >= M { return false }
    if graph[pos.y][pos.x] == 1 { return false }
    return true
}

func bfs(start: Position) {
    var queue = [Position]()
    var nextQueue = [Position]()
    var marking = [Position]()
    var answer = 0
    queue.append(start)
    visited[start.y][start.x] = true
    marking.append(start)
    answer += 1
    while !queue.isEmpty {
        let now = queue.removeLast()
        for i in 0..<4 {
            let next: Position = (now.x + dx[i], now.y + dy[i])
            if isValidPos(pos: next) && !visited[next.y][next.x] {
                visited[next.y][next.x] = true
                answer = (answer + 1) % 10
                nextQueue.append(next)
                marking.append(next)
            }
        }
        if queue.isEmpty {
            queue = nextQueue.reversed()
            nextQueue = []
        }
    }

    let dest = marking.removeLast()
    graph[dest.y][dest.x] = -answer
    marking.forEach { (x: Int, y: Int) in
        graph[y][x] = dest.y * M + dest.x + 2
    }
}
