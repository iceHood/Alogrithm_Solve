class Solution {
    func trap(_ height: [Int]) -> Int {
        var leftIdx = 0
        var rightIdx = height.count - 1
        var leftValue = height[leftIdx]
        var rightValue = height[rightIdx]
        var answer = 0
        while leftIdx < rightIdx {
            if height[leftIdx] <= height[rightIdx] {
                leftIdx += 1
                leftValue = max(leftValue, height[leftIdx])
                answer += leftValue - height[leftIdx]
            } else {
                rightIdx -= 1
                rightValue = max(rightValue, height[rightIdx])
                answer += rightValue - height[rightIdx]
            }
        }
        return answer
    }
}

//var height = [0,1,0,2,1,0,1,3,2,1,2,1]
//var height = [4,2,0,3,2,5]
var height = [6, 0, 3, 7, 5, 0, 5]

print(Solution().trap(height))
