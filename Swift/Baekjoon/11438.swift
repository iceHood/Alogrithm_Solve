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
    let N = readHelper.readInt()
    let TREE_HEIGHT = 20
    var parent = [[Int]](repeating: [Int](repeating: 0, count: TREE_HEIGHT), count: N+1)
    var depth = [Int](repeating: 0, count: N+1)
    var adj = [[Int]](repeating: [Int](), count: N+1)
    for i in 0..<N-1 {
        let a = readHelper.readInt()
        let b = readHelper.readInt()
        adj[a].append(b)
        adj[b].append(a)
    }
    
    func makeParent(par: Int, now: Int, dep:Int) {
        parent[now][0] = par
        depth[now] = dep
        for i in 0..<adj[now].count {
            if adj[now][i] != par {
                makeParent(par: now, now: adj[now][i], dep: dep+1)
            }
        }
    }
    
    makeParent(par: 0, now: 1, dep: 0)
    
    for k in 1..<TREE_HEIGHT {
        for i in 2...N {
            if parent[i][k-1] != 0 {
                parent[i][k] = parent[parent[i][k-1]][k-1]
            }
        }
    }
    
    func findParent(_ a: Int, _ b: Int) -> Int {
        var a = a, b = b
        if depth[a] < depth[b] { swap(&a, &b) }
        var diff = depth[a] - depth[b]
        var idx = 0
        while diff > 0 {
            if diff % 2 == 1 {
                a = parent[a][idx]
            }
            diff >>= 1
            idx += 1
        }
        
        if a != b {
            for k in stride(from: TREE_HEIGHT-1, through: 0, by: -1) {
                if parent[a][k] != 0 && parent[a][k] != parent[b][k] {
                    a = parent[a][k]
                    b = parent[b][k]
                }
            }
            a = parent[a][0]
            b = parent[b][0]
        }
        
        return a
    }
    
    let M = readHelper.readInt()
    var result = ""
    for _ in 0..<M {
        let a = readHelper.readInt()
        let b = readHelper.readInt()
        result += "\(findParent(a, b))\n"
    }
    print(result)
}

solve()
