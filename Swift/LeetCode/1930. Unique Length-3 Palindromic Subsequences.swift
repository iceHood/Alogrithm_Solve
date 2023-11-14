final class Solution {
    func countPalindromicSubsequence(_ s: String) -> Int {
        let s = Array(s)
        var result = 0
        for ch in "abcdefghijklmnopqrstuvwxyz" {
            let i = s.firstIndex(of: ch)
            let j = s.lastIndex(of: ch)
            if let i = i, let j = j, j - i > 1 {
                result += Set(s[i+1..<j]).count
            }
        }
        return result
    }
}
