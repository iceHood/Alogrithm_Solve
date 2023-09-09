//class Solution {
//    func compareVersion(_ version1: String, _ version2: String) -> Int {
//        let version1 = version1.split(separator: ".").map { Int($0)! }
//        let version2 = version2.split(separator: ".").map { Int($0)! }
//
//        var idx1 = 0
//        var idx2 = 0
//
//        while idx1 < version1.count && idx2 < version2.count {
//            if version1[idx1] > version2[idx2] {
//                return 1
//            } else if version1[idx1] < version2[idx2] {
//                return -1
//            } else {
//                idx1 += 1
//                idx2 += 1
//            }
//        }
//        while idx1 < version1.count {
//            if version1[idx1] > 0 {
//                return 1
//            }
//            idx1 += 1
//        }
//        while idx2 < version2.count {
//            if version2[idx2] > 0 {
//                return -1
//            }
//            idx2 += 1
//        }
//        return 0
//    }
//}
