//class Solution {
//    func partition(_ s: String) -> [[String]] {
//        func isPalindrome(_ s: ArraySlice<Character>) -> Bool {
//            var left = 0
//            var right = s.count-1
//            while left < right {
//                if s[left] != s[right] { return false }
//                left += 1
//                right -= 1
//            }
//            return true
//        }
//        var answer: [[String]] = []
//        let s = Array(s)
//        for i in 0..<s.count {
//            let temp = s[...i]
//            if isPalindrome(temp) {
//                if i+1 >= s.count {
//                    answer.append([String(temp)])
//                } else {
//                    partition(String(s[(i+1)...])).map { [String(temp)] + $0 }
//                        .forEach {answer.append($0)}
//                }
//            }
//        }
//        return answer
//    }
//}
//print(Solution().partition("aab"))
//print(Solution().partition("a"))
//print(Solution().partition("ababababbb"))
