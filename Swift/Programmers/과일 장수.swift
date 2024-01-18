import Foundation

func solution(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
    guard score.count >= m else { return 0 }
    let score = score.sorted()
    var result = 0
    for i in stride(from: score.count-m, through: 0, by: -m) {
        result += score[i] * m
    }
    return result
}
