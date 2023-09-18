class Solution {
    func numTrees(_ n: Int) -> Int {
        struct Rng: Hashable {
            let start: Int
            let end: Int
        }
        var memo = [Rng: Int]()
        func calCombination(_ start: Int, _ end: Int) -> Int {
            if start == end || end == 0 {
                return 1
            }
            let range = Rng(start: start, end: end)
            if let value = memo[range] {
                return value
            }
            let result = calCombination(start-1, end) + calCombination(start-1, end-1)
            memo[range] = result
            return result
        }
        return calCombination(2*n, n) / (n+1)
    }
}

var n = 19
print(Solution().numTrees(n))
