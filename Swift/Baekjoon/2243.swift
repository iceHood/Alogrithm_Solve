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


final class SegTree {
    var arr: [Int]
    var size: Int
    
    init() {
        let height = 20
        self.size = 1 << height
        self.arr = [Int](repeating: 0, count: size*2)
    }
    
    func update(at: Int, weight: Int) {
        var idx = size + at - 1
        arr[idx] += weight
        while idx >= 1 {
            let next = idx >> 1
            if idx % 2 == 0 { // 왼쪽일경우
                arr[next] += weight
            }
            idx >>= 1
        }
    }
    
    func getCandy(_ n: Int) -> Int {
        var idx = 1
        var n = n
        while idx < size {
            if arr[idx] >= n {
                idx <<= 1
            } else {
                n -= arr[idx]
                idx = (idx<<1)+1
            }
        }
        let result = idx - size + 1
        update(at: result, weight: -1)
        return result
    }
}

func solve() {
    let readHelper = FileIO()
    let seg = SegTree()
    
    let n = readHelper.readInt()
    var result = ""
    for _ in 0..<n {
        let A = readHelper.readInt()
        if A == 1 {
            let B = readHelper.readInt()
            result += "\(seg.getCandy(B))\n"
        } else {
            let B = readHelper.readInt()
            let C = readHelper.readInt()
            seg.update(at: B, weight: C)
        }
    }
    print(result)
}

solve()
