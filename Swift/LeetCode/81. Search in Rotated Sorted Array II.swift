class Solution {
    func search(_ nums: [Int], _ target: Int) -> Bool {
        nums.contains(target)
    }
}





class Solution {
    func search(_ nums: [Int], _ target: Int) -> Bool {
        var leftIdx = 0
        var rightIdx = nums.count - 1

        while leftIdx <= rightIdx {
            var middleIdx = leftIdx + (rightIdx - leftIdx) / 2
            if nums[middleIdx] == target {
                return true
            }
            if(nums[leftIdx] == nums[middleIdx]) && (nums[rightIdx] == nums[middleIdx]) {
                leftIdx += 1
                rightIdx -= 1
            } else if(nums[leftIdx] <= nums[middleIdx]) {
                // target is in first  half
                if(nums[leftIdx] <= target) && (nums[middleIdx] > target) {
                    rightIdx = middleIdx - 1
                } else {
                    leftIdx = middleIdx + 1
                }
            } else {
                if (nums[middleIdx] < target) && (nums[rightIdx] >= target) {
                    leftIdx = middleIdx + 1
                } else {
                    rightIdx = middleIdx - 1
                }
            }
        }
        return false;
    }
}
//var nums = [2,5,6,0,0,1,2], target = 0
var nums = [2,5,6,0,0,1,2], target = 3
print(Solution().search(nums, target))

// Conclusion: n algorithm is faster than logn(probably)
