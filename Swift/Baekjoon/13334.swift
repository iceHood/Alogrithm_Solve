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
//struct Heap<T: Comparable> {
//    private var elements: [T] = []
//    private let sortFunction: (T, T) -> Bool
//
//    var isEmpty: Bool {
//        return self.elements.count == 1
//    }
//    var peek: T? {
//        if self.isEmpty { return nil }
//        return self.elements[1]
//    }
//    var count: Int {
//        return self.elements.count - 1
//    }
//
//    init(elements: [T] = [], sortFunction: @escaping (T, T) -> Bool) {
//        if !elements.isEmpty {
//            self.elements = [elements.first!] + elements
//        } else {
//            self.elements = elements
//        }
//        self.sortFunction = sortFunction
//        if elements.count > 1 {
//            self.buildHeap()
//        }
//    }
//
//    func leftChild(of index: Int) -> Int {
//        return index * 2
//    }
//    func rightChild(of index: Int) -> Int {
//        return index * 2 + 1
//    }
//    func parent(of index: Int) -> Int {
//        return (index) / 2
//    }
//    mutating func add(element: T) {
//        self.elements.append(element)
//    }
//    mutating func diveDown(from index: Int) {
//        var higherPriority = index
//        let leftIndex = self.leftChild(of: index)
//        let rightIndex = self.rightChild(of: index)
//
//        if leftIndex < self.elements.endIndex && self.sortFunction(self.elements[leftIndex], self.elements[higherPriority]) {
//            higherPriority = leftIndex
//        }
//        if rightIndex < self.elements.endIndex && self.sortFunction(self.elements[rightIndex], self.elements[higherPriority]) {
//            higherPriority = rightIndex
//        }
//        if higherPriority != index {
//            self.elements.swapAt(higherPriority, index)
//            self.diveDown(from: higherPriority)
//        }
//    }
//    mutating func swimUp(from index: Int) {
//        var index = index
//        while index != 1 && self.sortFunction(self.elements[index], self.elements[self.parent(of: index)]) {
//            self.elements.swapAt(index, self.parent(of: index))
//            index = self.parent(of: index)
//        }
//    }
//    mutating func buildHeap() {
//        for index in (1...(self.elements.count / 2)).reversed() {
//            self.diveDown(from: index)
//        }
//    }
//    mutating func insert(node: T) {
//        if self.elements.isEmpty {
//            self.elements.append(node)
//        }
//        self.elements.append(node)
//        self.swimUp(from: self.elements.endIndex - 1)
//    }
//    mutating func remove() -> T? {
//        if self.isEmpty { return nil }
//        self.elements.swapAt(1, elements.endIndex - 1)
//        let deleted = elements.removeLast()
//        self.diveDown(from: 1)
//
//        return deleted
//    }
//}
//
//struct PriorityQueue<T: Comparable> {
//    var heap: Heap<T>
//
//    init(_ elements: [T] = [], _ sort: @escaping (T, T) -> Bool) {
//        heap = Heap(elements: elements, sortFunction: sort)
//    }
//
//    var count : Int {
//        return heap.count
//    }
//    var isEmpty : Bool {
//        return heap.isEmpty
//    }
//
//    func top () -> T? {
//        return heap.peek
//    }
//    mutating func clear () {
//        while !heap.isEmpty {
//            _ = heap.remove()
//        }
//    }
//    mutating func pop() -> T? {
//        return heap.remove()
//    }
//    mutating func push(_ element: T) {
//        heap.insert(node: element)
//    }
//}
//
//let readHelper = FileIO()
//let n = readHelper.readInt()
//
//var positions = [(h: Int, o: Int)]()
//for _ in 0..<n {
//    let (h, o) = (readHelper.readInt(), readHelper.readInt())
//    if h < o {
//        positions.append((h, o))
//    } else {
//        positions.append((o, h))
//    }
//}
//
//positions.sort { p1, p2 in
//    if p1.o == p2.o {
//        return p1.h < p2.h
//    } else {
//        return p1.o < p2.o
//    }
//}
//
//let length = readHelper.readInt()
//var priorityQueue = PriorityQueue<Int> {$0 < $1}
//
//var answer = 0
//
//for (h, o) in positions {
//    if o - h <= length {
//        priorityQueue.push(h)
//    } else {
//        continue
//    }
//
//    while !priorityQueue.isEmpty {
//        let temp = priorityQueue.top()!
//        if o - temp <= length { break }
//        else { _ = priorityQueue.pop() }
//    }
//    answer = max(answer, priorityQueue.count)
//}
//
//print(answer)
