class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        
//        var arrayCounts = (1...nums.count).reduce(1) { $0 * $1 }
        var result = [[Int]]()
        var numbers = nums
        
        func findIt(_ idx: Int) {
            if idx >= numbers.count-1 {
                result.append(numbers)
                return
            }
            for i in idx...numbers.count-1 {
                numbers.swapAt(idx, i)
                findIt(idx+1)
                numbers.swapAt(i, idx)
            }
        }
        
        for i in 0...numbers.count-1 {
            numbers.swapAt(0, i)
            findIt(1)
            numbers.swapAt(i, 0)
        }
        
        return result
    }
}
var nums = [1,2,3,4,5,6]
print(Solution().permute(nums))

