import Foundation

func solution(_ n:Int, _ s:Int, _ a:Int, _ b:Int, _ fares:[[Int]]) -> Int {
    
    var graph = [[Int]](repeating: [Int](repeating: 123456789, count: n+1), count: n+1)
    for fare in fares {
        let a = fare[0]
        let b = fare[1]
        let cost = fare[2]
        graph[a][b] = cost
        graph[b][a] = cost
    }
    for i in 1...n { graph[i][i] = 0 }
    for k in 1...n {
        for i in 1...n {
            for j in 1...n {
                graph[i][j] = min(graph[i][j], graph[i][k] + graph[k][j])
            }
        }
    }
    
    var result = Int.max
    for i in 1...n {
        result = min(result, graph[s][i] + graph[i][a] + graph[i][b])
    }
    
    return result
}
