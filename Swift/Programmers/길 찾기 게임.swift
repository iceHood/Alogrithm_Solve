import Foundation

func solution(_ nodeinfo:[[Int]]) -> [[Int]] {
    let nodeinfo = nodeinfo
                    .enumerated()
                    .map { $0.element + [$0.offset+1] }
                    .sorted { $0[0] < $1[0] }
    
    var result: [[Int]] = [[], []]
    
    func makeTree(_ nodes: [[Int]]) {
        if !nodes.isEmpty {
            var high = [0, -1, 0]
            for (idx, node) in nodes.enumerated() {
                if high[1] < node[1] {
                    high = [idx, node[1], node[2]]
                }
            }
            result[0].append(high[2])
            let (left, right) = (nodes[..<high[0]], nodes[(high[0]+1)...])
            makeTree(Array(left))
            makeTree(Array(right))
            result[1].append(high[2])
        }
    }
    makeTree(nodeinfo)
    return result
}
