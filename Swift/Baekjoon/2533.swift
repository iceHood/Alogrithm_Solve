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

enum Status {
    case notReady, readyToAdopt, adopted
}

//extension Status: CustomDebugStringConvertible {
//    var debugDescription: String {
//        switch self {
//        case .notReady:
//            return "notReady"
//        case .readyToAdopt:
//            return "readyToAdopt"
//        case .adopted:
//            return "adopted"
//        }
//    }
//}

let readHelper = FileIO()
let N = readHelper.readInt()
var graph = [[Int]](repeating: [], count: N+1)
var readyStatus = [Status](repeating: .notReady, count: N+1)
var answer = 0

for _ in 1..<N {
    let (a, b) = (readHelper.readInt(), readHelper.readInt())
    graph[a].append(b)
    graph[b].append(a)
}

func dfs(idx: Int) {
    var haveToAdopt = false
    for next in graph[idx] {
        guard readyStatus[next] == .notReady else { continue }
        if graph[next].isEmpty {
            readyStatus[next] = .readyToAdopt
        } else {
            readyStatus[next] = .readyToAdopt
            dfs(idx: next)
        }
        haveToAdopt = haveToAdopt || readyStatus[next] != .adopted
    }
    readyStatus[idx] = haveToAdopt ? .adopted : .readyToAdopt
    answer += haveToAdopt ? 1 : 0
}

readyStatus[1] = .readyToAdopt
dfs(idx: 1)
//readyStatus[1...].enumerated().forEach({
//    print("\($0.offset+1): \($0.element)")
//})
print(answer)
