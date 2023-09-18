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

let fileIOHelper = FileIO()
let N = fileIOHelper.readInt()
var numbers = [Int](repeating: 0, count: N+1)
for i in 1...N {
    numbers[i] = fileIOHelper.readInt()
}

var dp = [[UInt8]](repeating: [UInt8](repeating: 0, count: N+1), count: N+1)

for i in 1...N {
    dp[i][i] = 1
    if i < N && numbers[i] == numbers[i+1] {
        dp[i][i+1] = 1
    }
}

numbers.withUnsafeBufferPointer { p in
    guard let bp = p.baseAddress else { return }
    for i in stride(from: N-2, through: 1, by: -1) {
        for j in (i+2)...N {
            if bp[i] == bp[j] && dp[i+1][j-1] == 1 {
                dp[i][j] = 1
            }
        }
    }
}

var M = fileIOHelper.readInt()
var answer = ""
for _ in 0..<M {
    let left = fileIOHelper.readInt()
    let right = fileIOHelper.readInt()
    answer += "\(dp[left][right])\n"
}
print(answer)

