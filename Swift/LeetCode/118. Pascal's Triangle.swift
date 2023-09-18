class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        var answer = [[1]]
        for i in 1..<numRows {
            var temp = [Int]()
            for j in 0...i {
                if j == 0 || j == i {
                    temp.append(1)
                }
                else {
                    temp.append(answer[i-1][j-1] + answer[i-1][j])
                }
            }
            answer.append(temp)
        }
        return answer
    }
}
