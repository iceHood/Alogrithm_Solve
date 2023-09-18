class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if haystack.count < needle.count {
            return -1
        }
        for i in 0...haystack.count-needle.count {
            var isFind = true
            var t = 0
            while t < needle.count {
                if haystack[haystack.index(haystack.startIndex, offsetBy: i+t)] != needle[needle.index(needle.startIndex, offsetBy: t)] {
                    isFind = false
                    break
                }
                t += 1
            }
            if isFind {
                return i
            }
        }
        return -1
    }
}

print(Solution().strStr("frefbutsad", "frefbutsad"))
