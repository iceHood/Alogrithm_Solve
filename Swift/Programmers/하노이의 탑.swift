import Foundation

func solution(_ n:Int) -> [[Int]] {
    var result: [[Int]] = []
    func hanoi(n: Int, from a: Int, to b: Int, by c: Int) {
        if n == 1 {
            result.append([a, b])
        } else {
            hanoi(n: n-1, from: a, to: c, by: b)
            result.append([a, b])
            hanoi(n: n-1, from: c, to: b, by: a)
        }
    }
    hanoi(n: n, from: 1, to: 3, by: 2)
    return result
}
