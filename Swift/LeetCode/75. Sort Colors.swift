class Solution {
    func sortColors(_ nums: inout [Int]) {
        var colors = [0, 0, 0]
        for i in 0..<nums.count {
            colors[nums[i]] += 1
        }
        var idx = 0
        while colors[0] > 0 {
            nums[idx] = 0
            colors[0] -= 1
            idx += 1
        }
        while colors[1] > 0 {
            nums[idx] = 1
            colors[1] -= 1
            idx += 1
        }
        while colors[2] > 0 {
            nums[idx] = 2
            colors[2] -= 1
            idx += 1
        }
    }
}

//var nums = [2,0,2,1,1,0]
//var nums = [2,0,1]
//var nums = [0]
//var nums = [1]
//var nums = [2]
Solution().sortColors(&nums)
print(nums)
