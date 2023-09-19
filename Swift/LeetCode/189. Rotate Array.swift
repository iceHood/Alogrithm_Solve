class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        let realK = k % nums.count
        nums = Array(nums.suffix(realK)) + Array(nums.prefix(nums.count-realK))
    }
}
