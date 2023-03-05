//class Solution {
//    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
//        var answer = [-1, -1]
//        var left = 0, right = nums.count - 1, middle = (left + right) / 2
//        while left <= right {
//            middle = (left + right) / 2
//            if nums[middle] < target {
//                left = middle + 1
//            } else if nums[middle] > target {
//                right = middle - 1
//            } else {
//                answer[0] = middle
//                //find left target as far as possible
//                right = middle - 1
//            }
//        }
//        left = 0
//        right = nums.count - 1
//        while left <= right {
//            middle = (left + right) / 2
//            if nums[middle] < target {
//                left = middle + 1
//            } else if nums[middle] > target {
//                right = middle - 1
//            } else {
//                answer[1] = middle
//                //find right target as far as possible
//                left = middle + 1
//            }
//        }
//        return answer
//    }
//}
//
//var nums = [2,2,2,2,2], target = 2
//print(Solution().searchRange(nums, target))
