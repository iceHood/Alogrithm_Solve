//class Solution {
//    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
//        var left = 0
//        var right = nums.count-1
//        var middle = (left + right) / 2
//        var answer = 0
//        
//        if target > nums.last! {
//            return nums.count
//        } else if target < nums.first! {
//            return 0
//        }
//        
//        while left <= right {
//            middle = (left + right) / 2
//            if nums[middle] < target {
//                left = middle + 1
//                answer = middle + 1
//            } else if nums[middle] > target {
//                right = middle - 1
//            } else {
//                return middle
//            }
//        }
//        return answer
//    }
//}
//
////var nums = [1,3,5,6], target = 5
////var nums = [1,3,5,6], target = 2
////var nums = [1,3,5,6], target = 7
//var nums = [1,3], target = 2
//print(Solution().searchInsert(nums, target))
