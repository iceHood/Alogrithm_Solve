//import Foundation
//
//let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
//let (N, M) = (NM[0], NM[1])
//var graph = [[Int]](repeating: [Int](), count: N+1)
//var degree = [Int](repeating: 0, count: N+1)
//var queue = [Int]()
//var nextQueue = [Int]()
//var answer = [Int]()
//
//for _ in 0..<M {
//    let read = readLine()!.split(separator: " ").map { Int(String($0))! }
//    guard read[0] >= 2 else { continue }
//OUT: for i in 1..<read.count-1 {
//        let a = read[i]
//        let b = read[i+1]
//        for num in graph[a] where num == b {
//            continue OUT
//        }
//        graph[a].append(b)
//        degree[b] += 1
//    }
//}
//
//for i in 1...N {
//    if degree[i] == 0 {
//        queue.append(i)
//    }
//}
//
//queue.reverse()
//
//while !queue.isEmpty {
//    let temp = queue.popLast()!
//    answer.append(temp)
//    for i in graph[temp] {
//        degree[i] -= 1
//        if degree[i] == 0 {
//            nextQueue.append(i)
//        }
//    }
//    if queue.isEmpty {
//        queue = [Int](nextQueue.reversed())
//        nextQueue = []
//    }
//}
//
//if answer.count != N {
//    print(0)
//    exit(0)
//}
//
//answer.forEach({ print($0) })
