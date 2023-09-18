class Solution {

    let digitToAlpha = ["2": "abc", "3": "def", "4": "ghi", "5": "jkl", "6": "mno", "7": "pqrs", "8": "tuv", "9": "wxyz"]

    func letterCombinations(_ digits: String) -> [String] {
        var answer: [String] = [""]

        digits.forEach { i in
            guard let alpha = digitToAlpha[String(i)] else { return }
            var temp = [String]()
            alpha.forEach { t in
                let ch = String(t)
                answer.forEach { str in
                    temp.append(str + ch)
                }
            }
            answer = temp
        }
        return answer.count != 1 ? answer : []
    }
}

print(Solution().letterCombinations(""))
