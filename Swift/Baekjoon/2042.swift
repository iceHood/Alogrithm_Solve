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
//    @inline(__always) func readOneInt() -> Int {
//        var now = read()
//        var isPositive = true
//        while now == 10
//                || now == 32 { now = read() } // 공백과 줄바꿈 무시
//        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
//        return Int(now-48) * (isPositive ? 1:-1)
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
//class SegmentTree {
//    var size: Int
//    var tree: [Int]
//
//    init(_ arr: [Int]) {
//        let n = arr.count
//        var power = 1
//        while power < n {
//            power *= 2
//        }
//        self.size = power
//        self.tree = [Int](repeating: 0, count: 2 * power)
//        for i in 0..<n {
//            self.tree[power + i] = arr[i]
//        }
//        for i in (1..<power).reversed() {
//            self.tree[i] = self.tree[2 * i] + self.tree[2 * i + 1]
//        }
//    }
//
//    func update(index: Int, value: Int) {
//        var idx = index + self.size
//        self.tree[idx] = value
//        while idx > 1 {
//            idx /= 2
//            self.tree[idx] = self.tree[2 * idx] + self.tree[2 * idx + 1]
//        }
//    }
//
//    func sum(left: Int, right: Int) -> Int {
//        return self.query(1, 0, size - 1, left, right)
//    }
//
//    private func query(_ node: Int, _ nodeLeft: Int, _ nodeRight: Int, _ left: Int, _ right: Int) -> Int {
//        if right < nodeLeft || nodeRight < left {
//            return 0
//        }
//        if left <= nodeLeft && nodeRight <= right {
//            return self.tree[node]
//        }
//        let mid = (nodeLeft + nodeRight) / 2
//        return self.query(node * 2, nodeLeft, mid, left, right) + self.query(node * 2 + 1, mid + 1, nodeRight, left, right)
//    }
//}
//
//let readHelper = FileIO()
//let N = readHelper.readInt(), M = readHelper.readInt(), K = readHelper.readInt()
//var base: [Int] = []
//for _ in 0..<N {
//    base.append(readHelper.readInt())
//}
//let segTree = SegmentTree(base)
//
//for _ in 0..<(M+K) {
//    let (a, b, c) = (readHelper.readInt(), readHelper.readInt(), readHelper.readInt())
//    if a == 1 {
//        segTree.update(index: b-1, value: c)
//    } else {
//        print(segTree.sum(left: b-1, right: c-1))
//    }
//}
