class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        let numbers = Set(nums)
        var temp = 0
        for x in nums {
            if !numbers.contains(x-1) {
                var next = x + 1
                while numbers.contains(next) {
                    next += 1
                }
                temp = max(temp, next - x)
            }
        }
        return temp
    }
}
