class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var left = 0
        var right = height.count - 1
        var answer = 0
        while left < right {
            let width = right - left
            answer = max(answer, width * min(height[left], height[right]))
            if height[left] <= height[right] {
                left += 1
            } else {
                right -= 1
            }
        }
        return answer
    }
}
let height = [1,8,6,2,5,4,8,3,7]
let tt = Solution()
print(tt.maxArea(height))

