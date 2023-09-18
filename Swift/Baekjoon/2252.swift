let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M) = (NM[0], NM[1])
var graph = [[Int]](repeating: [Int](), count: N+1)
var degree = [Int](repeating: 0, count: N+1)
var queue = [Int]()
var answer = [Int]()
for _ in 0..<M {
    let read = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (a, b) = (read[0], read[1])
    graph[a].append(b)
    degree[b] += 1
}

for i in 1...N {
    if degree[i] == 0 {
        queue.append(i)
    }
}

queue.reverse()
var nextQueue = [Int]()

while !queue.isEmpty {
    let tmp = queue.popLast()!
    answer.append(tmp)
    for i in graph[tmp] {
        degree[i] -= 1
        if degree[i] == 0 {
            nextQueue.append(i)
        }
    }
    if queue.isEmpty {
        queue = [Int](nextQueue.reversed())
        nextQueue = []
    }
}
answer.forEach { print($0,terminator: " ") }
