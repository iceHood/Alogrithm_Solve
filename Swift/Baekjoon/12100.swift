enum Way: CaseIterable, CustomDebugStringConvertible {
    var debugDescription: String {
        switch self {
        case .down: return "down"
        case .up: return "up"
        case .left: return "left"
        case .right: return "right"
        }
    }

    
    case up, down, left, right

}

let N = Int(readLine()!)!
var graph = [[Int]](repeating: [Int](), count: N)
var maxNum = Int.min
for i in 0..<N {
    graph[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
}

func guess() {
    for arr in graph {
        maxNum = max(maxNum, arr.max()!)
    }
}

func merge(to way: Way) {
    switch way {
    case .up:
        for j in 0..<N {
            for i in 0..<N-1 {
                if graph[i][j] == 0 {
                    for t in i+1..<N {
                        if graph[t][j] != 0 {
                            graph[i][j] = graph[t][j]
                            graph[t][j] = 0
                            break
                        }
                    }
                }
            }
            for i in stride(from: 0, through: N-2, by: 1) {
                if graph[i][j] == graph[i+1][j] {
                    graph[i][j] += graph[i+1][j]
                    graph[i+1][j] = 0
                }
            }
            for i in 0..<N-1 {
                if graph[i][j] == 0 {
                    for t in i+1..<N {
                        if graph[t][j] != 0 {
                            graph[i][j] = graph[t][j]
                            graph[t][j] = 0
                            break
                        }
                    }
                }
            }
        }
    case .down:
        for j in 0..<N {
            for i in stride(from: N-1, through: 1, by: -1) {
                if graph[i][j] == 0 {
                    for t in stride(from: i-1, through: 0, by: -1) {
                        if graph[t][j] != 0 {
                            graph[i][j] = graph[t][j]
                            graph[t][j] = 0
                            break
                        }
                    }
                }
            }
            for i in stride(from: N-1, through: 1, by: -1) {
                if graph[i-1][j] == graph[i][j] {
                    graph[i][j] += graph[i-1][j]
                    graph[i-1][j] = 0
                }
            }
            for i in stride(from: N-1, through: 1, by: -1) {
                if graph[i][j] == 0 {
                    for t in stride(from: i-1, through: 0, by: -1) {
                        if graph[t][j] != 0 {
                            graph[i][j] = graph[t][j]
                            graph[t][j] = 0
                            break
                        }
                    }
                }
            }
        }
    case .left:
        for i in 0..<N {
            for j in 0..<N-1 {
                if graph[i][j] == 0 {
                    for t in j+1..<N {
                        if graph[i][t] != 0 {
                            graph[i][j] = graph[i][t]
                            graph[i][t] = 0
                            break
                        }
                    }
                }
            }
            for j in stride(from: 0, through: N-2, by: 1) {
                if graph[i][j] == graph[i][j+1] {
                    graph[i][j] += graph[i][j+1]
                    graph[i][j+1] = 0
                }
            }
            for j in 0..<N-1 {
                if graph[i][j] == 0 {
                    for t in j+1..<N {
                        if graph[i][t] != 0 {
                            graph[i][j] = graph[i][t]
                            graph[i][t] = 0
                            break
                        }
                    }
                }
            }
        }
    case .right:
        for i in 0..<N {
            for j in stride(from: N-1, through: 1, by: -1) {
                if graph[i][j] == 0 {
                    for t in stride(from: j-1, through: 0, by: -1) {
                        if graph[i][t] != 0 {
                            graph[i][j] = graph[i][t]
                            graph[i][t] = 0
                            break
                        }
                    }
                }
            }
            for j in stride(from: N-1, through: 1, by: -1) {
                if graph[i][j-1] == graph[i][j] {
                    graph[i][j] += graph[i][j-1]
                    graph[i][j-1] = 0
                }
            }
            for j in stride(from: N-1, through: 1, by: -1) {
                if graph[i][j] == 0 {
                    for t in stride(from: j-1, through: 0, by: -1) {
                        if graph[i][t] != 0 {
                            graph[i][j] = graph[i][t]
                            graph[i][t] = 0
                            break
                        }
                    }
                }
            }
        }
    }
}

//var arr = [Way]()
func backTrack(cnt: Int) {
    if cnt >= 5 {
        guess()
//        print(arr)
//        graph.forEach({print($0)})
        return
    } else {
//        print(arr)
//        graph.forEach({print($0)})
    }
    let savedGraph = graph
    for way in Way.allCases {
//        arr.append(way)
        merge(to: way)
        backTrack(cnt: cnt+1)
        graph = savedGraph
//        arr.popLast()
    }
}

backTrack(cnt: 0)
print(maxNum)

