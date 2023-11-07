import Foundation
class Solution {
    func eliminateMaximum(_ dist: [Int], _ speed: [Int]) -> Int {
        let times = dist.enumerated().map { Int(ceil(Double($0.element) / Double(speed[$0.offset]))) }.sorted()
        
        var coin = max(0, times[0]-1)
        var answer = 1
        for i in 1..<times.count {
            coin += times[i] - times[i-1] - 1
            if coin < 0 { break }
            answer += 1
        }
        return answer
    }
}

var dist =
[3,5,7,4,5],speed =
[2,3,6,3,2]
Solution().eliminateMaximum(dist, speed)
