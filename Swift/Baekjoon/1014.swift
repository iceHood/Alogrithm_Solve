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

let readHelper = FileIO()
let C = readHelper.readInt()
var seats = [[Character]](repeating: [Character](repeating: ".", count: 10), count: 11)
var result = ""

func checkSeat(seat: [Character], bit: Int) -> Bool {
    for i in 0..<seat.count {
        if seat[i] == "x" && ((bit & (1 << i)) != 0) { return false }
    }
    return true
}

func checkAdjSeat(seat: Int, width: Int) -> Bool {
    for i in 0..<width-1 {
        let val = 3 << i
        if (seat & val) == val { return false }
    }
    return true
}

func checkBits(bit: Int, fbit: Int, width: Int) -> Bool {
    for i in 0..<width {
        if fbit & (1 << i) != 0 {
            if i > 0 && (1 << (i - 1)) & bit != 0 { return false }
            if 1 << (i + 1) & bit != 0 { return false }
        }
    }
    return true
}

func solve() {
    var answer = 0
    let (N, M) = (readHelper.readInt(), readHelper.readInt())
    var dp = [[Int]](repeating: [Int](repeating: 0, count: 1024), count: 11)
    for i in 1...N {
        seats[i] = Array(readHelper.readString())
    }
    
    var setOfBits = [(Int, Int)]()
    for bit in 0..<(1 << M) {
        if checkAdjSeat(seat: bit, width: M) {
            var count = 0
            for i in 0..<M {
                if ((1 << i) & bit) != 0 { count += 1 }
            }
            setOfBits.append((bit, count))
        }
    }
    
    for i in 1...N {
        for bit in setOfBits {
            if !checkSeat(seat: seats[i], bit: bit.0) { continue }
            for fbit in setOfBits {
                if checkBits(bit: bit.0, fbit: fbit.0, width: M) {
                    dp[i][bit.0] = max(dp[i][bit.0], dp[i-1][fbit.0] + bit.1)
                    answer = max(answer, dp[i][bit.0])
                }
            }
        }
    }
    
    result += "\(answer)\n"
}

for _ in 0..<C {
    solve()
}

print(result)
