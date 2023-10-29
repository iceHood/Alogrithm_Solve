class Solution {
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        var right = 1
        var left = 0
        var sum = nums[0]
        var answer = Int.max
        while right < nums.count && left < right {
            if sum < target {
                sum += nums[right]
                right += 1
            } else {
                answer = min(answer, right - left)
                sum -= nums[left]
                left += 1
            }
        }
        while sum >= target && left < right {
            answer = min(answer, right - left)
            sum -= nums[left]
            left += 1
        }
        return answer == Int.max ? 0 : answer
    }
}

let target = 7, nums = [2,3,1,2,4,3]
print(Solution().minSubArrayLen(target, nums))
