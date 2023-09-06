//class Solution {
//    func findPeakElement(_ nums: [Int]) -> Int {
//        if nums.count == 1 { return 0 }
//        if nums[0] > nums[1] { return 0 }
//        if nums[nums.count-1] > nums[nums.count-2] { return nums.count - 1 }
//        
//        var left = 1
//        var right = nums.count-2
//        while left <= right {
//            let mid = (left + right)/2
//            if nums[mid] > nums[mid-1] && nums[mid] > nums[mid+1] { return mid }
//            else if nums[mid] < nums[mid-1] { right = mid-1 }
//            else if nums[mid] < nums[mid+1] { left = mid+1 }
//        }
//        return -1
//    }
//}
