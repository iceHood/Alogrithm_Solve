class Solution {
    func rob(_ nums: [Int]) -> Int {
        var left = 0, right = 0
        var nextL = 0, nextR = 0
        for i in 0..<nums.count {
            nextL = max(left, right)
            nextR = left + nums[i]
            left = nextL
            right = nextR
        }
        return max(left, right)
    }
    func rob2(_ nums: [Int]) -> Int {
        var dp = [[Int]](repeating: [0, 0], count: nums.count+1)
        for i in 1...nums.count {
            dp[i][0] = max(dp[i-1][0], dp[i-1][1])
            dp[i][1] = dp[i-1][0] + nums[i-1]
        }
        print(dp)
        return dp[nums.count].max()!
    }
}
print(Solution().rob([2,9138,9,3,31138]))

