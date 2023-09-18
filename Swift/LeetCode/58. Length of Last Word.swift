class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        s.split(separator: " ").last!.count
    }
}

// var s = "Hello World"
// var s = "   fly me   to   the moon  "
var s = "luffy is still joyboy"
print(Solution().lengthOfLastWord(s))
