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
//let maxNum = 30001
//let readHelper = FileIO()
//let N = readHelper.readInt()
//let M = readHelper.readInt()
//let K = readHelper.readInt()
//
//var kids = [Int](repeating: 0, count: maxNum)
//var height = [Int](repeating: 0, count: maxNum)
//var candy = [Int](repeating: 0, count: maxNum)
//var numOfKids = [Int](repeating: 1, count: maxNum)
//var graph = [[Int]](repeating: [Int](), count: maxNum)
//
//let kidsP = UnsafeMutablePointer<Int>.allocate(capacity: maxNum)
//let heightP = UnsafeMutablePointer<Int>.allocate(capacity: maxNum)
//let candyP = UnsafeMutablePointer<Int>.allocate(capacity: maxNum)
//kidsP.initialize(from: &kids, count: maxNum)
//heightP.initialize(from: &height, count: maxNum)
//candyP.initialize(from: &candy, count: maxNum)
//
//func findKids(start: Int) -> Int {
//    if kidsP[start] == start {
//        return start
//    } else {
//        kidsP[start] = findKids(start: kidsP[start])
//        return kidsP[start]
//    }
//}
//
//func uniteKids(a: Int, b: Int) {
//    var a = findKids(start: a), b = findKids(start: b)
//    if a == b { return }
//    if heightP[a] < heightP[b] { swap(&a, &b) }
//    kidsP[b] = a
//    if heightP[a] == heightP[b] { heightP[a] += 1 }
//    return
//}
//
//for i in 1...N {
//    kidsP[i] = i
//    heightP[i] = 1
//    candyP[i] = readHelper.readInt()
//}
//
//for _ in 0..<M {
//    let a = readHelper.readInt()
//    let b = readHelper.readInt()
//    graph[a].append(b)
//}
//
//for i in 1...N {
//    for j in 0..<graph[i].count {
//        uniteKids(a: i, b: graph[i][j])
//    }
//}
//
//var unitedCnadies = [Int](repeating: 0, count: N+1)
//var unitedKids = [Int](repeating: 0, count: N+1)
//for i in 1...N {
//    let a = findKids(start: i)
//    unitedCnadies[a] += candyP[i]
//    unitedKids[a] += numOfKids[i]
//}
//
//unitedKids = unitedKids.filter({$0>0})
//unitedCnadies = unitedCnadies.filter({$0>0})
//let length = unitedKids.count
//let unitedKidsP = UnsafeMutablePointer<Int>.allocate(capacity: length)
//let unitedCnadiesP = UnsafeMutablePointer<Int>.allocate(capacity: length)
//unitedKidsP.initialize(from: &unitedKids, count: length)
//unitedCnadiesP.initialize(from: &unitedCnadies, count: length)
//
////print(unitedCnadies)
////print(unitedKids)
//
//var dp = [Int](repeating: 0, count: K)
//let dpP = UnsafeMutablePointer<Int>.allocate(capacity: K)
//dpP.initialize(from: &dp, count: K)
//for i in 0..<length {
//    if K-1 < unitedKids[i] { continue }
//    for j in stride(from: K-1, through: unitedKids[i], by: -1) {
//        dpP[j] = max(dpP[j], dpP[j-unitedKids[i]] + unitedCnadies[i])
//    }
//}
//print(dpP[K-1])
//
///*
// 1 3 (13)
// 2 5 6 10 (26)
// 4 9 (24)
// 7 8 (33)
// */
