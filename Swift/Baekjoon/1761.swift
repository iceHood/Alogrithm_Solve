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

func solve() {
    let readHelper = FileIO()
    
    let height = 20
    let N = readHelper.readInt()
    var adj = [[(Int, Int)]](repeating: .init(), count: N+1)
    var depth = [Int](repeating: 0, count: 40001)
    var parent = [[Int]](repeating: [Int](repeating: 0, count: height), count: N+1)
    var dist = [[Int]](repeating: [Int](repeating: 0, count: height), count: N+1)
    
    for i in 0..<N-1 {
        let a = readHelper.readInt()
        let b = readHelper.readInt()
        let cost = readHelper.readInt()
        adj[a].append((b, cost))
        adj[b].append((a, cost))
    }
    
    ///---
    func findParent(par: Int, now: Int, dep: Int, cost: Int) {
        depth[now] = dep
        parent[now][0] = par
        dist[now][0] = cost
        for i in 0..<adj[now].count {
            if adj[now][i].0 != par {
                findParent(par: now, now: adj[now][i].0, dep: dep+1, cost: adj[now][i].1)
            }
        }
    }
    
    findParent(par: 0, now: 1, dep: 0, cost: 0)
    
    for k in 1..<height {
        for i in 2...N {
            if parent[i][k-1] != 0 {
                parent[i][k] = parent[parent[i][k-1]][k-1]
                dist[i][k] = dist[i][k-1] + dist[parent[i][k-1]][k-1]
            }
        }
    }
    
    func distPair(a: Int, b: Int) -> Int {
        var sum = 0
        var a = a, b = b
        if depth[a] != depth[b] {
            if depth[a] < depth[b] { swap(&a, &b) }
            
            var dif = depth[a] - depth[b]
            var idx = 0
            while dif > 0 {
                if dif % 2 == 1 {
                    sum += dist[a][idx]
                    a = parent[a][idx]
                }
                dif >>= 1
                idx += 1
            }
        }
        
        if a != b {
            for k in stride(from: height-1, through: 0, by: -1) {
                if parent[a][k] != 0 && parent[a][k] != parent[b][k] {
                    sum += dist[a][k] + dist[b][k]
                    a = parent[a][k]
                    b = parent[b][k]
                }
            }
            sum += dist[a][0] + dist[b][0]
        }
        
        return sum
    }
    
    
    let M = readHelper.readInt()
    var result = ""
    
    for _ in 0..<M {
        let a = readHelper.readInt()
        let b = readHelper.readInt()
        result += "\(distPair(a: a, b: b))\n"
    }
    
    print(result)
}

solve()
