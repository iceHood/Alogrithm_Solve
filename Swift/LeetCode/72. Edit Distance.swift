//class Solution {
//    func minDistance(_ word1: String, _ word2: String) -> Int {
//        let word1 = Array(word1)
//        let word2 = Array(word2)
//        
//        var lengthOfWord1 = word1.count
//        var lengthOfWord2 = word2.count
//        var dp = [[Int]](repeating: [Int](repeating: 0, count: lengthOfWord2 + 1), count: lengthOfWord1 + 1)
//        
//        //탈출 둘중 하나라도 ""이면 그 길이 자체가 변경횟수가 됨.
//        if lengthOfWord1 == 0 || lengthOfWord2 == 0 {
//            return max(lengthOfWord1, lengthOfWord2)
//        }
//        
//        // 기본사항
//        for i in 0...lengthOfWord1 {
//            dp[i][0] = i
//        }
//        for t in 0...lengthOfWord2 {
//            dp[0][t] = t
//        }
//        
//        for i in 1...lengthOfWord1 {
//            for t in 1...lengthOfWord2 {
//                // 둘이 같은 경우 -> 이전 횟수를 그대로 사용
//                if word1[i-1] == word2[t-1] {
//                    dp[i][t] = dp[i-1][t-1]
//                }
//                // 둘이 다른 경우 -> 바꾸기(1) + 이전에 가장 작은 경우들의 횟수
//                else {
//                    dp[i][t] = 1 + min(dp[i-1][t],dp[i][t-1],dp[i-1][t-1])
//                }
//            }
//        }
//        return dp[lengthOfWord1][lengthOfWord2]
//    }
//}
//
////var word1 = "horse", word2 = "ros"
////var word1 = "", word2 = ""
//var word1 = "a", word2 = "b"
//
//print(Solution().minDistance(word1, word2))
