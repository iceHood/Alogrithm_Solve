//class Solution {
//    func majorityElement(_ nums: [Int]) -> Int {
//        nums.sorted()[nums.count/2]
//    }
//    func majorityElement2(_ nums: [Int]) -> Int {
//        var count = 0
//        var result = 0
//        for n in nums {
//            if count == 0 {
//                result = n
//            }
//            count += n == result ? 1 : -1
//        }
//        return result
//    }
//
//}
