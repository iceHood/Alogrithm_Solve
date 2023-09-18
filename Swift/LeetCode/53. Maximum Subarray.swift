class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var maxNum = nums[0]
        nums.reduce(0) { partialResult, num in
            maxNum = max(maxNum, partialResult + num, num)
            return max(partialResult + num, num)
        }
        return maxNum
    }
}

//var nums = [-2,1,-3,4,-1,2,1,-5,4]
//var nums = [1]
//var nums = [5,4,-1,7,8]
var nums = [-2,1,-3,4,-1,2,1,-5,432]

print(Solution().maxSubArray(nums))
