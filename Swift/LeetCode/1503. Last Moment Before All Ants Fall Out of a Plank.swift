final class Solution {
    func getLastMoment(_ n: Int, _ left: [Int], _ right: [Int]) -> Int {
        var answer = 0
        for num in left { answer = max(answer, num) }
        for num in right { answer = max(answer, n-num) }
        return answer
    }
    func getLastMoment2(_ n: Int, _ left: [Int], _ right: [Int]) -> Int {
        var leftAnt = [Bool](repeating: false, count: n+1)
        var rightAnt = [Bool](repeating: false, count: n+1)
        var answer = 0
        left.forEach {leftAnt[$0] = true}
        right.forEach {rightAnt[$0] = true}
        
        while true {
            var nextLeftAnt = [Bool](repeating: false, count: n+1)
            var nextRightAnt = [Bool](repeating: false, count: n+1)
            leftAnt[0] = false
            rightAnt[n] = false
            for i in 1...n {
                if leftAnt[i] {
                    if rightAnt[i-1] {
                        nextRightAnt[i] = true
                    } else {
                        nextLeftAnt[i-1] = true
                    }
                }
            }
            for i in 0..<n {
                if rightAnt[i] {
                    if leftAnt[i+1] {
                        nextLeftAnt[i] = true
                    } else {
                        nextRightAnt[i+1] = true
                    }
                }
            }
            if !leftAnt.reduce(false, {$0 || $1}) && !rightAnt.reduce(false, {$0 || $1}) {
                break
            }
            leftAnt = nextLeftAnt
            rightAnt = nextRightAnt
            answer += 1
        }
        return answer
    }
}
