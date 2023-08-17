//class Solution {
//    func singleNumber(_ nums: [Int]) -> Int {
//        var dict: [Int: Int] = [:]
//        for num in nums {
//            if dict[num] == nil {
//                dict[num] = 1
//            } else {
//                dict[num] = 3
//            }
//        }
//        for (key, value) in dict {
//            if value == 1 {
//                return key
//            }
//        }
//        return -1
//    }
//}
