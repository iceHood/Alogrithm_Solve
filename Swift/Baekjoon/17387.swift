
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

let readHelper = FileIO()
var a: Point = (readHelper.readInt(), readHelper.readInt())
var b: Point = (readHelper.readInt(), readHelper.readInt())
var c: Point = (readHelper.readInt(), readHelper.readInt())
var d: Point = (readHelper.readInt(), readHelper.readInt())

// 가장 왼쪽 점을 첫번째 점으로 하자.

func ccw(p1: Point, p2: Point, p3: Point) -> Int {
    var temp = p1.x * p2.y + p2.x * p3.y + p3.x * p1.y
    temp = temp - p1.y * p2.x - p2.y * p3.x - p3.y * p1.x
    if temp > 0 { return 1 }
    else if temp == 0 { return 0 }
    else { return -1 }
}

func check() -> Bool {
    let abc = ccw(p1: a, p2: b, p3: c)
    let abd = ccw(p1: a, p2: b, p3: d)
    let cda = ccw(p1: c, p2: d, p3: a)
    let cdb = ccw(p1: c, p2: d, p3: b)

    if abc * abd == 0 && cda * cdb == 0 {
        if a > b { swap(&a, &b) }
        if c > d { swap(&c, &d) }
        return a <= d && c <= b
    }

    return abc * abd <= 0 && cda * cdb <= 0
}

print(check() ? 1 : 0)
