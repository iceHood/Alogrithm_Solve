class Solution {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        let count = nums.count
        var arr = Array(repeating: false, count: count + 1)
        arr[0] = true
        for i in nums {
            if i > 0 && i <= count {
                arr[i] = true
            }
        }
        return arr.firstIndex(of: false) ?? count + 1
    }
}

//var nums = [1,2,0]
//var nums = [3,4,-1,1]
//var nums = [7,8,9,11,12]
var nums = [1]
print(Solution().firstMissingPositive(nums))
