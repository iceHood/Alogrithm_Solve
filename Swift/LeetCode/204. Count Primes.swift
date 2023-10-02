final class Solution {
    func countPrimes(_ n: Int) -> Int {
        return Solution.count(n)
    }
    private static func count(_ n: Int) -> Int {
        if n == 0 || n == 1 {
            return 0
        }
        var visited = [Bool](repeating: false, count: n+1)
        var count = 0
        for i in 2..<n {
            if visited[i] {
                continue
            } else {
                count += 1
                for j in stride(from: i, to: n, by: i) {
                    visited[j] = true
                }
            }
        }
        return count
    }
}
