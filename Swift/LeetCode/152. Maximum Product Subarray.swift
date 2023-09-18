class Solution {
    func maxProduct1(_ nums: [Int]) -> Int {
        var results = [Int]()
        var answer = Int.min
        for num in nums {
            for j in 0..<results.count {
                results[j] *= num
            }
            results.append(num)
            answer = max(answer, results.max()!)
        }
        return answer
    }
    func maxProduct(_ nums: [Int]) -> Int {
        var maxPro = nums[0]
        var minPro = maxPro
        var answer = maxPro
        for num in nums[1...] {
            if num < 0 {
                swap(&maxPro, &minPro)
            }
            maxPro = max(num, maxPro * num)
            minPro = min(num, minPro * num)
            answer = max(answer, maxPro)
        }
        return answer
    }
}

