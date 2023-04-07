//class Solution {
//    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
//        guard s1.count + s2.count == s3.count else { return false }
//        let s1 = Array(s1), s2 = Array(s2), s3 = Array(s3)
//        var dp = [[Bool]](repeating: [Bool](repeating: false, count: s2.count+1), count: s1.count + 1)
//
//        for i in 0...s1.count {
//            for j in 0...s2.count {
//                if i == 0 && j == 0 {
//                    dp[i][j] = true;
//                } else if i == 0 {
//                    dp[i][j] = dp[i][j-1] && s2[j-1] == s3[i+j-1]
//                } else if j == 0 {
//                    dp[i][j] = dp[i-1][j] && s1[i-1] == s3[i+j-1]
//                } else {
//                    dp[i][j] = (dp[i-1][j] && s1[i-1] == s3[i+j-1]) || (dp[i][j-1] && s2[j-1] == s3[i+j-1])
//                }
//            }
//        }
//
//        return dp[s1.count][s2.count]
//    }
//}
//
////let s1 = "aabcc", s2 = "dbbca", s3 = "aadbbcbcac"
////let s1 = "aabcc", s2 = "dbbca", s3 = "aadbbbaccc"
////let s1 = "", s2 = "", s3 = ""
////let s1 = "a", s2 = "", s3 = "a"
//let s1 = "db", s2 = "b", s3 = "cbb"
//print(Solution().isInterleave(s1, s2, s3))
//
//func hi(_ name: String, _ age: Int) {
//    print(name, age)
//}
//
//
/*
 -> s2
 |   0 1 2 3 4 5
 V  0
 s1 1
    2
    3
    4
    5
 요런거 만들어서 맨 오른쪽 아래까지 쭉 이어져서 길이 만들어져야함
 */
