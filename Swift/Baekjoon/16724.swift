//import Foundation
//// MARK: - 보조 클래스
//final class FileIO {
//    private var buffer:[UInt8]
//    private var index: Int
//
//    init(fileHandle: FileHandle = FileHandle.standardInput) {
//        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
//        index = 0
//    }
//
//    @inline(__always) private func read() -> UInt8 {
//        defer { index += 1 }
//
//        return buffer.withUnsafeBufferPointer { $0[index] }
//    }
//
//    @inline(__always) func readInt() -> Int {
//        var sum = 0
//        var now = read()
//        var isPositive = true
//
//        while now == 10
//                || now == 32 { now = read() } // 공백과 줄바꿈 무시
//        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
//        while now >= 48, now <= 57 {
//            sum = sum * 10 + Int(now-48)
//            now = read()
//        }
//
//        return sum * (isPositive ? 1:-1)
//    }
//
//    @inline(__always) func readString() -> String {
//        var str = ""
//        var now = read()
//
//        while now == 10
//                || now == 32 { now = read() } // 공백과 줄바꿈 무시
//
//        while now != 10
//                && now != 32 && now != 0 {
//            str += String(bytes: [now], encoding: .ascii)!
//            now = read()
//        }
//
//        return str
//    }
//}
//
//let readHelper = FileIO()
//let N = readHelper.readInt()
//let M = readHelper.readInt()
//
//var parent = [Int](repeating: 0, count: N*M+1)
//var height = [Int](repeating: 0, count: N*M+1)
//var graph = [Int](repeating: 0, count: N*M+1)
//
//func findParent(start: Int) -> Int {
//    if parent[start] == start {
//        return start
//    } else {
//        parent[start] = findParent(start: parent[start])
//        return parent[start]
//    }
//}
//
//func uniteParent(a: Int, b: Int) -> Bool {
//    var a = findParent(start: a), b = findParent(start: b)
//    if a == b { return true }
//    if height[a] < height[b] { swap(&a, &b) }
//    parent[b] = a
//    if height[a] == height[b] { height[a] += 1 }
//    return false
//}
//
//for i in 1...N*M {
//    parent[i] = i
//    height[i] = 1
//}
//for i in 0..<N {
//    let arr = Array(readHelper.readString())
//    for j in 1...M {
//        let myPos = i*M+j
//        if arr[j-1] == "L" {
//            graph[myPos] = myPos-1
//        } else if arr[j-1] == "R" {
//            graph[myPos] = myPos+1
//        } else if arr[j-1] == "U" {
//            graph[myPos] = myPos - M
//        } else {
//            graph[myPos] = myPos + M
//        }
//    }
//}
//
//var answer = 0
//var isElse = true
//while isElse {
//    isElse = false
//    for i in 1...N*M {
//        if uniteParent(a: i, b: graph[i]) { continue }
//        isElse = true
//    }
//}
//for i in 1...N*M {
//    if i == findParent(start: i) { answer += 1 }
//}
//print(answer)
