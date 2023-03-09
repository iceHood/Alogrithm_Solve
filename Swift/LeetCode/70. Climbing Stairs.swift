//class Solution {
//    func climbStairs(_ n: Int) -> Int {
//        var count = 0
//        var numOf2 = n / 2
//        var numOf1 = n - numOf2 * 2
//
//        while numOf1 <= n {
//            var stand = max(numOf2, numOf1)
//            var result = 1
//            if numOf2 != 0 && numOf1 != 0 {
//                for (division, multi) in (stand+1...numOf1 + numOf2).enumerated() {
//                    result *= multi
//                    result /= division + 1
//                }
//            }
//            count += result
//            numOf2 -= 1
//            numOf1 += 2
//        }
//        return count
//    }
//}
//
////var n = 1
////var n = 2
////var n = 3
////var n = 31
//var n = 45
//print(Solution().climbStairs(n))
