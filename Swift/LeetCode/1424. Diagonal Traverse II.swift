final class Solution {
    func findDiagonalOrder(_ nums: [[Int]]) -> [Int] {
        var answer = [Int: Int]()
        var alpha = 1
        var rowPos = 1
        var colPos = 1
        for arr in nums {
            var beta = 1
            var pos = rowPos
            rowPos += alpha
            alpha += 1
            for num in arr {
                answer[pos] = num
                pos += colPos + beta
                beta += 1
            }
            colPos += 1
        }
        
        return answer.sorted(by: {$0.key < $1.key}).map({$0.value})
    }
}
