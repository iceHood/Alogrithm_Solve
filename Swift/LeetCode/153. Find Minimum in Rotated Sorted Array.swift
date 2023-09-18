class Solution {
    func findMin(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return nums[0]
        } else if nums.count == 2 {
            return min(nums[0], nums[1])
        }

        var left = 0
        var right = nums.count-1
        var mid = (left + right) / 2
        var answer = Int.max
        
        while left <= right {
            mid = (left + right) / 2
            if nums[left] <= nums[right] {
                answer = min(nums[left], answer)
                break
            } else if nums[left] <= nums[mid] {
                answer = min(nums[left], answer)
                left = mid+1
            } else if nums[mid] <= nums[right] {
                answer = min(nums[mid], answer)
                right = mid-1
            }
        }

        return answer
    }
}

print(Solution().findMin([3,4,5,1,2]))
print(Solution().findMin([4,5,6,7,0,1,2]))
print(Solution().findMin([11,13,15,17]))
print(Solution().findMin([1]))
print(Solution().findMin([1,2,3]))
print(Solution().findMin([2,3,1]))
print(Solution().findMin([2,1]))
print(Solution().findMin([2,3,4,5,1]))
