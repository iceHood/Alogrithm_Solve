class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var sets: Set<[Int]> = [[]]
        var nums = nums.sorted()
        var temp: [Int] = []
        func backTrack(start: Int) {
            if start == nums.count {
                return
            }
            for i in start..<nums.count {
                temp.append(nums[i])
                sets.insert(temp)
                backTrack(start: i + 1)
                temp.popLast()
            }
        }
        backTrack(start: 0)
        return Array(sets)
    }
}

var nums = [1,2,2]
print(Solution().subsetsWithDup(nums))

