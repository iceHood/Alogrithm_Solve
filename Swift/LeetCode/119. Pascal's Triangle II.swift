class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        var answer: [[Int]] = [[1]]
        if rowIndex == 0 {
            return [1]
        }
        for i in 1..<rowIndex+1 {
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
        return answer[rowIndex]
    }
}

print(Solution().getRow(0))
print(Solution().getRow(1))
print(Solution().getRow(3))
print(Solution().getRow(33))
