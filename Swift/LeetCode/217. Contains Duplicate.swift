class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var ans = Set<Int>()
        for num in nums {
            if ans.contains(num) {
                return true
            }
            ans.insert(num)
        }
        return false
    }
}
