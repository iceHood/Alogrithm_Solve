class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        var answer = ""
        var idx = 0
        
        while true {
            let temp = strs[0].prefix(idx)
            for item in strs {
                if !item.hasPrefix(temp) {
                    return answer
                }
            }
            answer = String(temp)
            if idx == strs[0].count {
                return answer
            }
            idx += 1
        }
    }
}

let strs = ["dog3","dog333","dog33"]
print(Solution().longestCommonPrefix(strs))
