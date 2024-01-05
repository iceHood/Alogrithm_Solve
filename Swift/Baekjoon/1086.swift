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

func modStr(_ str: [Character], _ div: Int) -> Int {
    let bojung = Character("0").asciiValue!
    var result = 0
    for ch in str {
        result *= 10
        result += Int(ch.asciiValue! - bojung)
        result %= div
    }
    return result
}

func gcd(_ lhs: Int, _ rhs: Int) -> Int {
    var big = 0, small = 0
    big = max(lhs, rhs)
    small = min(lhs, rhs)
    
    while small != 0 {
        let remain = big % small
        big = small
        small = remain
    }
    
    return big
}

func solve() {
    let readHelper = FileIO()
    let n = readHelper.readInt()
    var nums = [[Character]](repeating: [], count: n)
    for i in 0..<n {
        nums[i] = Array(readHelper.readString())
    }
    let k = readHelper.readInt()
    var dp = [[Int]](repeating: [Int](repeating: 0, count: 100), count: 32768)
    var cache = [Int](repeating: 0, count: 51)
    var cacheStr = [Int](repeating: 0, count: 15)
    
    dp[0][0] = 1
    
    cache[0] = 1 % k
    for i in 1..<51 {
        cache[i] = (cache[i-1] * 10) % k
    }
    for i in 0..<n {
        cacheStr[i] = modStr(nums[i], k)
    }
    
    for now in 0..<(1<<n) {
        for i in 0..<n {
            if (now & (1<<i)) == 0 {
                let next = now | (1<<i)
                for j in 0..<k {
                    let nextK = ((j*cache[nums[i].count]) % k + cacheStr[i]) % k
                    dp[next][nextK] += dp[now][j]
                }
            }
        }
    }
    
    var bunmo = 1, bunza = 0
    for i in 1...n {
        bunmo *= i
    }
    bunza = dp[1<<n-1][0]
    let gcd = gcd(bunza, bunmo)
    print(bunza/gcd, "/", bunmo/gcd, separator: "")
}

solve()
