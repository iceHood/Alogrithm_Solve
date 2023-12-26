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

func solve() {
    let readHelper = FileIO()
    let C: Int, N: Int
    var colors = Set<String>()
    var nickNames = Set<String>()
    let Q: Int
    var result: String = ""
    
    (C, N) = (readHelper.readInt(), readHelper.readInt())
    for _ in 0..<C {
        colors.insert(readHelper.readString())
    }
    for _ in 0..<N {
        nickNames.insert(readHelper.readString())
    }
    
    Q = readHelper.readInt()
    for _ in 0..<Q {
        let teamName = Array(readHelper.readString())
        
        var startIdx = 0
        var isColor = true
        for j in 1...teamName.count {
            let prefix = String(teamName[startIdx..<j])
            
            let itsColor = colors.contains(prefix)
            let itsName = nickNames.contains(prefix)
            
            if !isColor && itsColor { break }
            if isColor && itsName { break }
            
            if !isColor && itsName {
                startIdx = j
                isColor.toggle()
            }
            if isColor && itsColor {
                startIdx = j
                isColor.toggle()
            }
            
        }
        result.append(startIdx == teamName.count ? "Yes\n" : "No\n")
    }
    
    print(result)
}

final class Trie {
    
    private final class Node {
        let value: Character
        var children = [Node?](repeating: nil, count: 26)
        var isWord = false
        var length = 0
        init(_ value: Character) {
            self.value = value
        }
    }
    
    private let root = Node("*")
    
    init() {}
    
    func insert(_ word: String) {
        var node = root
        for ch in word {
            let idx = Int(ch.asciiValue!) - 97
            if let nextNode = node.children[idx] {
                node = nextNode
            } else {
                let nextNode = Node(ch)
                node.children[idx] = nextNode
                nextNode.length = node.length + 1
                node = nextNode
            }
        }
        node.isWord = true
    }
    
    private func findLast(_ word: String) -> Node? {
        var node = root
        for ch in word {
            let idx = Int(ch.asciiValue!) - 97
            if let nextNode = node.children[idx] {
                node = nextNode
            } else {
                return node
            }
        }
        return node
    }
    
    func search(_ word: String) -> Int {
        let last = findLast(word)
        return last?.isWord == true ? last!.length : -1
    }
    
    func startsWith(_ prefix: String) -> Bool {
        findLast(prefix) != nil
    }
}

func solve2() {
    let cTrie = Trie()
    var nickNames = Set<String>()
    
    let readHelper = FileIO()
    let C: Int, N: Int
    let Q: Int
    var result: String = ""
    
    (C, N) = (readHelper.readInt(), readHelper.readInt())
    for _ in 0..<C {
        cTrie.insert(readHelper.readString())
    }
    for _ in 0..<N {
        nickNames.insert(readHelper.readString())
    }
    
    Q = readHelper.readInt()
    for _ in 0..<Q {
        let teamName = readHelper.readString()
        
        let itsColor = cTrie.search(teamName)
        if itsColor != -1 {
            result += nickNames.contains(String(teamName.suffix(teamName.count - itsColor))) ? "Yes\n" : "No\n"
        } else {
            result += "No\n"
        }
    }
    
    print(result)
}

solve2()
