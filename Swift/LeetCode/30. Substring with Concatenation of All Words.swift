class Solution {
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        let wordLength = words[0].count
        let words = words.sorted()
        var answer: [Int] = []
        if s.count < wordLength { return answer }
        for startIdx in 0..<wordLength {
            var strs = s[s.index(s.startIndex, offsetBy: startIdx)...].reduce(into: [String]()) { partialResult, ch in
                if partialResult.isEmpty || partialResult.last!.count == wordLength {
                    partialResult.append("\(ch)")
                } else {
                    partialResult[partialResult.count-1] += "\(ch)"
                }
            }
            if strs.last!.count < wordLength {
                strs.popLast()
            }
            var idx = 0
            while idx <= strs.count - words.count {
                if strs[idx..<idx+words.count].sorted() == words {
                    answer.append(startIdx + idx * wordLength)
                }
                idx += 1
            }
        }
        return answer
    }
}

//var s = "barfoothefoobarman", words = ["foo","bar"]
//var s = "wordgoodgoodgoodbestword", words = ["word","good","best","word"]
//var s = "barfoofoobarthefoobarman", words = ["bar","foo","the"]
//var s = "lingmindraboofooowingdingbarrwingmonkeypoundcake", words = ["fooo","barr","wing","ding","wing"]
//var s = "aaaaaaaaaaaaaa", words = ["aa","aa"]
var s = "mississippi", words = ["mississippis"]
print(Solution().findSubstring(s, words))
