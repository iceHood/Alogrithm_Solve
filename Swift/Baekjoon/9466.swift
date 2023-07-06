//import Foundation
//
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
//var N = 0
//var arr = [Int]()
//var visited = [Bool]()
//var finished = [Bool]()
//var count = 0
//var answer = ""
//
//func dfs(idx: Int) {
//    visited[idx] = true
//    let next = arr[idx]
//    
//    if !visited[next] {
//        dfs(idx: next)
//    } else if !finished[next] {
//        var i = next
//        while i != idx {
//            i = arr[i]
//            count += 1
//        }
//        count += 1
//    }
//    finished[idx] = true
//}
//
//let fileIOHelper = FileIO()
//let T = fileIOHelper.readInt()
//for _ in 0..<T {
//    N = fileIOHelper.readInt()
//    arr = [Int](repeating: 0, count: N+1)
//    visited = [Bool](repeating: false, count: N+1)
//    finished = [Bool](repeating: false, count: N+1)
//    count = 0
//    
//    for i in 1...N {
//        arr[i] = fileIOHelper.readInt()
//    }
//    
//    for i in 1...N {
//        if !visited[i] {
//            dfs(idx: i)
//        }
//    }
//    
//    answer += "\(N-count)\n"
//    
//}
//print(answer)
