class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var atIdx = 0
        var numIdx = 0
        var number = -1
        var count = 0

        while numIdx < nums.count {
            if number == nums[numIdx] {
                count += 1
            } else {
                number = nums[numIdx]
                count = 0
            }

            if count <= 1 {
                nums[atIdx] = number
                atIdx += 1
            }

            numIdx += 1
        }

        return atIdx
    }
}

//var nums = [1,1,1,2,2,3]
//var nums = [0,0,1,1,1,1,2,3,3]
var nums = [0,0,0,0,0,0,0,0,0]
let k = Solution().removeDuplicates(&nums)
print(nums[0..<k], k)
