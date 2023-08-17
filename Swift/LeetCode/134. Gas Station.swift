//class Solution {
//    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
//        var step = 0
//        var nowPos = 0
//        var gasTank = gas[0]
//        var cycle = 1
//        var answer = 0
//        
//        let nextPos = { now in (now + 1) % gas.count }
//
//        while step <= gas.count {
//            if cycle > gas.count { return -1 }
//            if gasTank < cost[nowPos] {
//                nowPos = nextPos(nowPos)
//                cycle += step + 1
//                step = 0
//                gasTank = gas[nowPos]
//                answer = nowPos
//                continue
//            }
//            gasTank -= cost[nowPos]
//            nowPos = nextPos(nowPos)
//            gasTank += gas[nowPos]
//            step += 1
//        }
//
//        return answer
//    }
//}
