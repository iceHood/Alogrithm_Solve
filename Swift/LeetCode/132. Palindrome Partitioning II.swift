//class Solution {
//    func minCut(_ s: String) -> Int {
//        var str = Array(s)
//        var isPal = [[Bool?]](repeating: [Bool?](repeating: nil, count: s.count+1), count: s.count+1)
//        func isPalindrome(_ l: Int, _ r: Int) -> Bool {
//            if isPal[l][r] != nil { return isPal[l][r]! }
//            var left = l, right = r
//            while left < right {
//                if str[left] != str[right] {
//                    isPal[l][r] = false
//                    return false
//                }
//                left += 1
//                right -= 1
//            }
//            isPal[l][r] = true
//            return true
//        }
//
//        let n = s.count
//        var dp = [Int](repeating: 0, count: n+1)
//        for i in stride(from: n-1, through: 0, by: -1) {
//            var tempCut = Int.max
//            for k in i..<n {
//                if isPalindrome(i, k) {
//                    let temp = 1 + dp[k+1]
//                    tempCut = min(tempCut, temp)
//                }
//            }
//            dp[i] = tempCut
//        }
//        return dp[0] - 1
//    }
//}
//
