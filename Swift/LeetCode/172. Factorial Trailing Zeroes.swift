//class Solution {
//    func trailingZeroes(_ n: Int) -> Int {
//        if n == 0 { return 0 }
//        var temp:UInt64 = 1
//        var answer = 0
//        for value in 1...n {
//            temp *= UInt64(value)
//            while temp % 10 == 0 {
//                temp /= 10
//                answer += 1
//            }
//            temp %= 100000
//        }
//        return answer
//    }
//    func trailingZeroes2(_ n: Int) -> Int {
//        if n < 5 {
//            return 0
//        }
//        return  n/5 + trailingZeroes(n/5)
//    }
//}
//
//print(Solution().trailingZeroes(10000))
//print(Solution().trailingZeroes(39))
//print(Solution().trailingZeroes(0))
//print(Solution().trailingZeroes(3125))
