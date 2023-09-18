class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let n = s.count
        var dp = [Bool](repeating: false, count: n + 1)
        dp[0] = true
        let maxWordLength = wordDict.map { $0.count }.max()!
        let wordDict = Set(wordDict)
        let s = Array(s)
        for i in 1..<n+1 {
            for j in stride(from: i - 1, to: max(i - maxWordLength - 1, -1), by: -1) {
                if dp[j] && wordDict.contains(String(s[j..<i])) {
                    dp[i] = true
                    break
                }
            }
        }
        return dp[n]
    }
}

var s = "leetcode", wordDict = ["leet","code"]
print(Solution().wordBreak(s, wordDict))
s = "applepenapple"; wordDict = ["apple","pen"]
print(Solution().wordBreak(s, wordDict))
s = "catsandog"; wordDict = ["cats","dog","sand","and","cat"]
print(Solution().wordBreak(s, wordDict))


