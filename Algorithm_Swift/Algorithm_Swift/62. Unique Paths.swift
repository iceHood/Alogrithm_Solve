//class Solution {
//    func uniquePaths(_ m: Int, _ n: Int) -> Int {
//        if m == 1 || n == 1 {
//            return 1
//        }
//        var startNum = max(m-1, n-1)
//        var result = 1
//        for (division, multi) in ((startNum+1)...(m + n - 2)).enumerated() {
//            result *= multi
//            result /= division+1
//        }
//        return result
//    }
//}
//
////var m = 3, n = 2
////var m = 3, n = 7
//print(Solution().uniquePaths(m, n))
