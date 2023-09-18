class Solution {
    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        func largestRectangleArea(_ heights: [Int]) -> Int {
            var answer = -1
            var stack = [Int]()
            var idx = 0
            
            while idx < heights.count {
                if stack.isEmpty || heights[idx] >= heights[stack.last!] {
                    stack.append(idx)
                    idx += 1
                } else {
                    let height = heights[stack.popLast()!]
                    let width = stack.isEmpty ? idx : idx - stack.last! - 1
                    answer = max(answer, height * width)
                }
            }
            while !stack.isEmpty {
                let height = heights[stack.popLast()!]
                let width = stack.isEmpty ? idx : idx - stack.last! - 1
                answer = max(answer, height * width)
            }
            
            return answer
        }
        
        var row = matrix.count
        var col = matrix[0].count
        var heights = [Int](repeating: 0, count: col)
        var answer = 0
        for i in 0..<row {
            for t in 0..<col {
                if matrix[i][t] == "1" {
                    heights[t] += 1
                } else {
                    heights[t] = 0
                }
            }
            answer = max(answer, largestRectangleArea(heights))
        }
        return answer
    }
}

//var matrix: [[Character]] = [["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]
//var matrix: [[Character]] = [["0"]]
var matrix: [[Character]] = [["1"]]
print(Solution().maximalRectangle(matrix))
