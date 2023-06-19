//import Foundation
//
//struct BinaryHeap {
//    private var items: [Int] = []
//
//    private func getLeftChildIndex(parentIndex: Int) -> Int { return 2*parentIndex + 1 }
//    private func getRightChildIndex(parentIndex: Int) -> Int { return 2*parentIndex + 2 }
//    private func getParentIndex(childIndex: Int) -> Int { return (childIndex - 1) / 2 }
//
//    private func hasLeftChild(index: Int) -> Bool { return getLeftChildIndex(parentIndex: index) < items.count }
//    private func hasRightChild(index: Int) -> Bool { return getRightChildIndex(parentIndex: index) < items.count }
//    private func hasParent(index: Int) -> Bool { return getParentIndex(childIndex: index) >= 0 }
//
//    private func leftChild(index: Int) -> Int { return items[getLeftChildIndex(parentIndex: index)] }
//    private func rightChild(index: Int) -> Int { return items[getRightChildIndex(parentIndex: index)] }
//    private func parent(index: Int) -> Int { return items[getParentIndex(childIndex: index)] }
//
//    public var isEmpty: Bool { return items.isEmpty }
//
//    public func peek() -> Int? { return items.isEmpty ? nil : items[0] }
//
//    public mutating func poll() -> Int? {
//        if items.isEmpty { return nil }
//        let item = items[0]
//        items[0] = items[items.count - 1]
//        items.removeLast()
//        heapifyDown()
//        return item
//    }
//
//    public mutating func add(_ item: Int) {
//        items.append(item)
//        heapifyUp()
//    }
//
//    private mutating func heapifyDown() {
//        var index = 0
//        while hasLeftChild(index: index) {
//            var smallerChildIndex = getLeftChildIndex(parentIndex: index)
//            if hasRightChild(index: index) && rightChild(index: index) < leftChild(index: index) {
//                smallerChildIndex = getRightChildIndex(parentIndex: index)
//            }
//            if items[index] < items[smallerChildIndex] { break }
//            else { items.swapAt(index, smallerChildIndex) }
//            index = smallerChildIndex
//        }
//    }
//
//    private mutating func heapifyUp() {
//        var index = items.count - 1
//        while hasParent(index: index) && parent(index: index) > items[index] {
//            items.swapAt(getParentIndex(childIndex: index), index)
//            index = getParentIndex(childIndex: index)
//        }
//    }
//}
//
//let nm = readLine()!.split(separator: " ").map { Int($0)! }
//let (n, m) = (nm[0], nm[1])
//
//var graph = [[Int]](repeating: [], count: n + 1)
//var inDegree = [Int](repeating: 0, count: n + 1)
//var queue: BinaryHeap = BinaryHeap()
//
//for _ in 0..<m {
//    let fs = readLine()!.split(separator: " ").map { Int($0)! }
//    let (first, second) = (fs[0], fs[1])
//    graph[first].append(second)
//    inDegree[second] += 1
//}
//
//for i in 1...n {
//    if inDegree[i] == 0 {
//        queue.add(i)
//    }
//}
//
//var answer: [Int] = []
//while !queue.isEmpty {
//    guard let tmp = queue.poll() else { break }
//    answer.append(tmp)
//    for i in graph[tmp] {
//        inDegree[i] -= 1
//        if inDegree[i] == 0 {
//            queue.add(i)
//        }
//    }
//}
//
//print(answer.map { String($0) }.joined(separator: " "))
