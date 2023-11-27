class Solution {
    func getSumAbsoluteDifferences(_ nums: [Int]) -> [Int] {
        var result = [Int](repeating: 0, count: nums.count)
        var leftSum = 0
        var rightSum = nums.reduce(0, {$0+$1})
        for i in 0..<nums.count {
            let left = i
            let right = nums.count - i
            
            result[i] = (left * nums[i] - leftSum) + (rightSum - right * nums[i])
            
            leftSum += nums[i]
            rightSum -= nums[i]
        }
        return result
    }
}
