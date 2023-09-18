class Solution {

    func generateParenthesis(_ n: Int) -> [String] {
        var arr: [String] = []

        if n == 0 {
            arr.append("")
        } else {
            for i in 0..<n {
                for l in generateParenthesis(i) {
                    for r in generateParenthesis(n - 1 - i) {
                        arr.append("(" + l + ")" + r)
                    }
                }
            }
        }
        return arr
    }
}

print(Solution().generateParenthesis(3))

