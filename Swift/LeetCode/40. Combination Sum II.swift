class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {

        var arr: [Int] = []
        var answer: Set<[Int]> = []
        let sortedCandidates = candidates.sorted()

        func backTracking(idx: Int) {
            let sum = arr.reduce(0) { $0 + $1 }
            if sum == target {
                answer.insert(arr)
                return
            } else if sum < target {
                guard idx < sortedCandidates.count else { return }
                var now = -1
                for i in idx..<sortedCandidates.count {
                    guard now != sortedCandidates[i] else { continue }
                    arr.append(sortedCandidates[i])
                    backTracking(idx: i + 1)
                    _ = arr.popLast()
                    now = sortedCandidates[i]
                }
            }
        }

        backTracking(idx: 0)

        return Array(answer)
    }
}

//var candidates = [10,1,2,7,6,1,5], target = 8
//var candidates = [2,5,2,1,2], target = 5
var candidates = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1], target = 30
print(Solution().combinationSum2(candidates, target))
