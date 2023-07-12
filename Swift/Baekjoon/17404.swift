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
//var RGB = [[Int]](repeating: [Int](), count: N+1)
//var dp = [[Int]](repeating: [Int](repeating: 123456789, count: 3), count: N+1)
//
//for i in 1...N {
//    RGB[i] = [readHelper.readInt(), readHelper.readInt(), readHelper.readInt()]
//}
//
//var answer = 123456789
//
//for color in 0..<3 {
//    for i in 0..<3 {
//        if color == i {
//            dp[1][color] = RGB[1][color] // 이 색만 선택하게끔 조절
//        } else {
//            dp[1][i] = 123456789
//        }
//    }
//    
//    for home in 2...N { // 차례대로 내 전의 것과 비교하여 최솟값 선택
//        dp[home][0] = min(dp[home-1][1], dp[home-1][2]) + RGB[home][0]
//        dp[home][1] = min(dp[home-1][0], dp[home-1][2]) + RGB[home][1]
//        dp[home][2] = min(dp[home-1][0], dp[home-1][1]) + RGB[home][2]
//    }
//    
//    for i in 0..<3 where i != color { // 마지막에 처음 선택한 것 이외의 색 중에서 최솟값 선택
//        answer = min(answer, dp[N][i])
//    }
//}
//
//print(answer)
