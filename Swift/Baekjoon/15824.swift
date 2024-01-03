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

    var arr = [Int](repeating: 0, count: N)
    var mul = [Int](repeating: 0, count: N)

    let mod = 1_000_000_007

    for i in 0..<N {
        arr[i] = readHelper.readInt()
    }

    var temp = 1
    for i in 0..<N {
        mul[i] = temp - 1
        temp <<= 1
        temp %= mod
    }
    
    arr.sort()
    
    var plus = 0
    var minus = 0
    
    for i in stride(from: N-1, to: 0, by: -1) {
        plus += mul[i] * arr[i]
        minus += mul[i] * arr[N-i-1]
        plus %= mod
        minus %= mod
    }
    
    print((plus - minus + mod) % mod)
}

solve()
