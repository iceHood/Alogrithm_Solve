import Foundation

func solution(_ edges:[[Int]]) -> [Int] {
    var outDegree = [Int: Int]()
    var inDegree = [Int: Int]()
    var vertexSet = Set<Int>()
    for edge in edges {
        if let outD = outDegree[edge[0]] {
            outDegree[edge[0]] = outD + 1
        } else {
            outDegree[edge[0]] = 1
            vertexSet.insert(edge[0])
        }
        if let inD = inDegree[edge[1]] {
            inDegree[edge[1]] = inD + 1
        } else {
            inDegree[edge[1]] = 1
            vertexSet.insert(edge[1])
        }
    }
    
    var newVertex = 0
    var totalGraphNum = 0
    var stickGraphNum = 0
    var donutGraphNum = 0
    var eightGraphNum = 0
    
    for num in vertexSet {
        if let outD = outDegree[num], outD >= 2 && inDegree[num] == nil {
            newVertex = num
            totalGraphNum = outD
            break
        }
    }
    
    for vertex in vertexSet where vertex != newVertex {
        let inD = inDegree[vertex] ?? Int.min
        let outD = outDegree[vertex] ?? Int.min
        if outD == 2 {
            eightGraphNum += 1
        } else if inD != Int.min && outD == Int.min {
            stickGraphNum += 1
        }
    }
    
    return [newVertex, totalGraphNum - eightGraphNum - stickGraphNum, stickGraphNum, eightGraphNum]
}
