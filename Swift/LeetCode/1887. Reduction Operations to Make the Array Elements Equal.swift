class Solution {
    func reductionOperations(_ nums: [Int]) -> Int {
        var dict = [Int: Int]()
        for num in nums {
            if let value = dict[num] {
                dict[num] = value + 1
            } else {
                dict[num] = 1
            }
        }
        var mult = 0
        var answer = 0
        for (_, value) in dict.sorted(by: {$0.key < $1.key}) {
            answer += value * mult
            mult += 1
        }
        return answer
    }
}
