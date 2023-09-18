class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        
        var arr: [Int] = []
        var answer: [[Int]] = []
        func backTrack(idx: Int) {
            let sum = arr.reduce(0) { $0 + $1 }
            if sum == target {
                answer.append(arr)
                return
            } else if sum < target {
                for i in idx...candidates.count - 1 {
                    arr.append(candidates[i])
                    backTrack(idx: i)
                    arr.popLast()
                }
            }
        }
        backTrack(idx: 0)
        
        return answer
    }
}

var candidates = [2], target = 1
//Output: [[2,2,3],[7]]

print(Solution().combinationSum(candidates, target))

