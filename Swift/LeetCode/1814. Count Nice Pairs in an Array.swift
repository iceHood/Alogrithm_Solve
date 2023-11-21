final class Solution {
    func countNicePairs(_ nums: [Int]) -> Int {
        var count = 0
        var dict = [Int: Int]()
        for num in nums {
            let revNum = rev(num)
            if let value = dict[num - revNum] {
                dict[num - revNum] = value + 1
            } else {
                dict[num - revNum] = 1
            }
        }
        
        for (_, value) in dict {
            count = (count + value * (value - 1) / 2) % 1000000007
        }
        
        return count
    }
    
    private func rev(_ num: Int) -> Int {
        var num = num
        var result = 0
        while num > 0 {
            result = result * 10 + num % 10
            num /= 10
        }
        return result
    }
}
