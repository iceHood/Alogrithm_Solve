class Solution {
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
}

//var heights = [2,4]
var heights = [1,1,1,1,1,1,1,1,4,1,1,1,1,1,1,3,1,1,1,1,1,1,5,1,1,1,1,1,1,1]
print(Solution().largestRectangleArea(heights))
