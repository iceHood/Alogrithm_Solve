//class Solution {
//    func isPalindrome(_ s: String) -> Bool {
//        let s = Array(s.lowercased().filter { ch in
//            if "a"..."z" ~= ch || "0"..."9" ~= ch {
//                return true
//            } else {
//                return false
//            }
//        })
//        for i in 0..<s.count/2 {
//            if s[i] != s[s.count-1-i] {
//                return false
//            }
//        }
//        return true
//    }
//}
//
//var s = "A man, a plan, a canal: Panama"
//print(Solution().isPalindrome(s))
//s = "race a car"
//print(Solution().isPalindrome(s))
//s = " "
//print(Solution().isPalindrome(s))
