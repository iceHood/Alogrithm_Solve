final class Solution {
    func minPairSum(_ nums: [Int]) -> Int {
        let nums = nums.sorted()
        let n = nums.count-1
        var answer = 0
        for i in 0..<nums.count/2 {
            answer = max(answer, nums[i]+nums[n-i])
        }
        return answer
    }
}
var nums = [Int]()
for _ in 1...500 {
    nums.append(.random(in: 1...100000))
}
print(nums)
