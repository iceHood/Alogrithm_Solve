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

class TreeNode: Comparable {
    static func < (lhs: TreeNode, rhs: TreeNode) -> Bool {
        lhs.fruit < rhs.fruit
    }

    static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        lhs.fruit == rhs.fruit
    }

    let fruit: String
    var children: [String: TreeNode] = [:]

    init(fruit: String = "") {
        self.fruit = fruit
    }
}

let readHelper = FileIO()
let N = readHelper.readInt()
let head = TreeNode()

for _ in 0..<N {
    let M = readHelper.readInt()
    var temp = head
    for _ in 0..<M {
        let key = readHelper.readString()
        if let next = temp.children[key] {
            temp = next
        } else {
            let next = TreeNode(fruit: key)
            temp.children[key] = next
            temp = next
        }
    }
}

var answer = ""

func dfs(node: TreeNode, count: Int) {
    for (_, next) in node.children.sorted(by: {$0.value < $1.value}) {
        for _ in 0..<count {
            answer += "--"
        }
        answer += next.fruit + "\n"
        dfs(node: next, count: count+1)
    }
}

dfs(node: head, count: 0)
print(answer)
