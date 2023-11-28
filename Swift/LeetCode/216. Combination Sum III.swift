final class Solution {
    func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        var answer = [[Int]]()
        func backTrack(_ arr: [Int], _ num: Int, _ cnt: Int) {
            if cnt == k {
                let sum = arr.reduce(0, {$0+$1})
                if sum == n {
                    answer.append(arr)
                }
                return
            }
            guard num <= 9 else { return }
            for i in num...9 {
                backTrack(arr + [i], i+1, cnt+1)
            }
        }
        backTrack([], 1, 0)
        return answer
    }
}

Solution().combinationSum3(3, 9)
