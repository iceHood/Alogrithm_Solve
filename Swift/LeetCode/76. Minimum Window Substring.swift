class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        let answerDic = t.reduce(into: [Character: Int]()) { partialResult, ch in
            if let value = partialResult[ch] {
                partialResult[ch] = value + 1
            } else {
                partialResult[ch] = 1
            }
        }
        let str = Array(s)
        var standardDic = str.reduce(into: [Character: Int]()) { partialResult, ch in
            if answerDic[ch] != nil {
                if let value = partialResult[ch] {
                    partialResult[ch] = value + 1
                } else {
                    partialResult[ch] = 1
                }
            }
        }
        var minLength = Int.max
        var minPos: (left: Int, right: Int) = (0, 0)
        var leftIdx = 0
        var rightIdx = str.count - 1
        while leftIdx <= rightIdx {
            let rightCh = str[rightIdx]
            guard let standValue = standardDic[rightCh], let answerValue = answerDic[rightCh] else {
                rightIdx -= 1
                continue
            }
            if standValue > answerValue {
                standardDic[rightCh] = standValue - 1
                rightIdx -= 1
            } else {
                break
            }
        }
        while rightIdx < str.count {
            while leftIdx <= rightIdx {
                let leftCh = str[leftIdx]
                guard let standValue = standardDic[leftCh], let answerValue = answerDic[leftCh] else {
                    leftIdx += 1
                    continue
                }
                if standValue > answerValue {
                    standardDic[leftCh] = standValue - 1
                    leftIdx += 1
                } else {
                    if minLength > rightIdx - leftIdx + 1 {
                        minLength = rightIdx - leftIdx + 1
                        minPos = (leftIdx, rightIdx)
                    } else {
                        break
                    }
                }
            }
            rightIdx += 1
            guard rightIdx < str.count else {break}
            let rightCh = str[rightIdx]
            if let standValue = standardDic[rightCh] {
                standardDic[rightCh] = standValue + 1
            }
        }

        for (key, value) in answerDic {
            if let standValue = standardDic[key] {
                if value > standValue {
                    return ""
                }
            } else {
                return ""
            }

        }
        return String(str[minPos.left...minPos.right])
    }
}

var s = "ADOBECODEBANC", t = "ABC"
//var s = "a", t = "a"
//var s = "a", t = "aa"
//var s = "asdfafa", t = "aafwe"
print(Solution().minWindow(s, t))
