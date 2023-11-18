class Solution {
    func maxFrequency(_ nums: [Int], _ k: Int) -> Int {
        let nums = nums.sorted()
        var j = 0, sum = 0, result = 0
        for i in 0..<nums.count {
            sum += nums[i]
            while (i - j + 1) * nums[i] - sum > k {
                sum -= nums[j]
                j += 1
            }
            result = max(result, i - j + 1)
        }
        return result
    }
}
