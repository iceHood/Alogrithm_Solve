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
//final class MinSegmentTree {
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
//        self.tree = [Int](repeating: Int.max, count: 2 * power)
//        for i in 0..<n {
//            self.tree[power + i] = arr[i]
//        }
//        for i in (1..<power).reversed() {
//            self.tree[i] = min(self.tree[2 * i], self.tree[2 * i + 1])
//        }
//    }
//
//    // 범위 내의 최소값을 찾는 함수
//    func minInRange(left: Int, right: Int) -> Int? {
//        guard left >= 0, right < self.size, left <= right else {
//            return nil
//        }
//        return minInRange(1, 0, size - 1, left, right)
//    }
//
//    private func minInRange(_ node: Int, _ nodeLeft: Int, _ nodeRight: Int, _ left: Int, _ right: Int) -> Int {
//        if nodeRight < left || right < nodeLeft {
//            return Int.max
//        }
//        if left <= nodeLeft && nodeRight <= right {
//            return self.tree[node]
//        }
//
//        let mid = (nodeLeft + nodeRight) / 2
//        return min(minInRange(2 * node, nodeLeft, mid, left, right),
//                   minInRange(2 * node + 1, mid + 1, nodeRight, left, right))
//    }
//
//}
//
//final class MaxSegmentTree {
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
//        self.tree = [Int](repeating: Int.min, count: 2 * power)
//        for i in 0..<n {
//            self.tree[power + i] = arr[i]
//        }
//        for i in (1..<power).reversed() {
//            self.tree[i] = max(self.tree[2 * i], self.tree[2 * i + 1])
//        }
//    }
//
//    // 범위 내의 최대값을 찾는 함수
//    func maxInRange(left: Int, right: Int) -> Int? {
//        guard left >= 0, right < self.size, left <= right else {
//            return nil
//        }
//        return maxInRange(1, 0, size-1, left, right)
//    }
//
//    private func maxInRange(_ node: Int, _ nodeLeft: Int, _ nodeRight: Int, _ left: Int, _ right: Int) -> Int {
//        if nodeRight < left || right < nodeLeft {
//            return Int.min
//        }
//        if left <= nodeLeft && nodeRight <= right {
//            return self.tree[node]
//        }
//        let mid = (nodeLeft + nodeRight) / 2
//        return max(maxInRange(2 * node, nodeLeft, mid, left, right),
//                   maxInRange(2 * node + 1, mid + 1, nodeRight, left, right))
//    }
//}
//
//let readHelper = FileIO()
//let N = readHelper.readInt()
//let M = readHelper.readInt()
//var arr = [Int](repeating: 0, count: N)
//var answer = ""
//for i in 0..<N {
//    arr[i] = readHelper.readInt()
//}
//
//let minSegTree = MinSegmentTree(arr)
//let maxSegTree = MaxSegmentTree(arr)
//
//for _ in 0..<M {
//    let (a, b) = (readHelper.readInt()-1, readHelper.readInt()-1)
//    answer += "\(minSegTree.minInRange(left: a, right: b)!) \(maxSegTree.maxInRange(left: a, right: b)!)\n"
//}
//
//print(answer)
