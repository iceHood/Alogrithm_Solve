class Solution {
    func countAndSay(_ n: Int) -> String {
        if n == 1 {
            return "1"
        }
        var result = ""
        var temp = ""
        for i in countAndSay(n - 1) {
            if temp.isEmpty || temp.last! == i {
                temp += "\(i)"
            } else {
                result += "\(temp.count)\(temp.last!)"
                temp = "\(i)"
            }
        }
        result += "\(temp.count)\(temp.last!)"
        return result
    }
}

print(Solution().countAndSay(6))

