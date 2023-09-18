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

typealias Point = (x: Int, y: Int)

var vector: [Point] = []
var stack: [Point] = []

@inline(__always)
func ccw(p1: Point, p2: Point, p3: Point) -> Int {
    p1.x * p2.y + p2.x * p3.y + p3.x * p1.y - p1.y * p2.x - p2.y * p3.x - p3.y * p1.x
}

func check(p1: Point, p2: Point) -> Bool {
    let temp = ccw(p1: base, p2: p1, p3: p2)
    if temp != 0 { return temp > 0 }
    else if p1.y != p2.y { return p1.y < p2.y }
    else { return p1.x < p2.x }
}

let readHelper = FileIO()

let N = readHelper.readInt()

for _ in 0..<N {
    vector.append((readHelper.readInt(), readHelper.readInt()))
}

for i in 1..<N {
    if vector[i].y < vector[0].y || vector[i].y == vector[0].y && vector[i].x < vector[0].x {
        vector.swapAt(0, i)
    }
}

let base = vector[0]
vector[1...].sort(by: check(p1:p2:))

stack.append(vector[0])
stack.append(vector[1])

for i in 2..<N {
    while stack.count >= 2 {
        let top2 = stack.popLast()!
        let top1 = stack.last!

        if ccw(p1: top1, p2: top2, p3: vector[i]) > 0 {
            stack.append(top2)
            break
        }
    }
    stack.append(vector[i])
}

print(stack.count)

