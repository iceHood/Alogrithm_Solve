//class Solution {
//    func nextPermutation(_ nums: inout [Int]) {
//        var idx = nums.count - 1
//        for i in stride(from: nums.count - 1, through: 0, by: -1) {
//            if nums[idx] <= nums[i] {
//                idx = i
//            } else {
//                break
//            }
//        }
//        if idx == 0 {
//            nums.sort()
//            return
//        }
//        idx -= 1
//
//        var toSwap = 0
//        for i in stride(from: nums.count - 1, to: idx, by: -1) {
//            if nums[i] > nums[idx] {
//                toSwap = i
//                break
//            }
//        }
//
//        nums.swapAt(idx, toSwap)
//        nums.replaceSubrange(idx+1..<nums.count, with: nums[idx+1..<nums.count].sorted())
//    }
//}
//
////var arr = [5,3,1,3,4,3,1] // 5, 3, 1, 4, 1, 3, 3
////var arr = [4,8,8,8,9,7,7,6,4,3] // 4,8,8,9,3,4,6,7,7,8
//var arr = [1,2,8,8,9,2,8,8,8,6,8,3,8,3] // 1,2,8,8,9,2,8,8,8,6,8,8,3,3
//Solution().nextPermutation(&arr)
//print(arr)
