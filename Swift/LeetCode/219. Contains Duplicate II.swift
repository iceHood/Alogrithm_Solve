class Solution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        guard k != 0 else { return false }
        for i in 1...k {
            var idx = i
            while idx < nums.count {
                if nums[idx] == nums[idx-i] {
                    return true
                }
                idx += i
            }
        }
        return false
    }
}
