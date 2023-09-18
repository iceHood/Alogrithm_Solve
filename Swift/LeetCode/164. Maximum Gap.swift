class Solution {
    func maximumGap2(_ nums: [Int]) -> Int {
        if nums.count < 2 { return 0 }
        if nums.count == 2 { return abs(nums[0]-nums[1]) }

        let nums = nums.sorted()

        var answer = -1
        for i in 0..<nums.count-1 {
            answer = max(answer, nums[i+1]-nums[i])
        }
        return answer
    }
    func maximumGap(_ nums: [Int]) -> Int {
        if nums.count < 2 { return 0 }
        if nums.count == 2 { return abs(nums[0]-nums[1]) }

        let minNum = nums.min()!
        let maxNum = nums.max()!
        let bucketSize = max(1, (maxNum - minNum) / (nums.count - 1))
        let bucketCount = (maxNum - minNum) / bucketSize + 1

        var minBucket = [Int](repeating: .max, count: bucketCount)
        var maxBucket = [Int](repeating: .min, count: bucketCount)

        for num in nums {
            let idx = (num - minNum) / bucketSize
            minBucket[idx] = min(minBucket[idx], num)
            maxBucket[idx] = max(maxBucket[idx], num)
        }

        var gap = 0
        var prevMax = minNum

        for i in 0..<bucketCount {
            if minBucket[i] == .max { continue }
            gap = max(gap, minBucket[i] - prevMax)
            prevMax = maxBucket[i]
        }

        return gap
    }
}
