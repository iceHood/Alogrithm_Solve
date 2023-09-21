class Solution {
    func hammingWeight(_ n: Int) -> Int {
        var n = n
        var answer = 0
        while n != 0 {
            answer += n & 1
            n >>= 1
        }
        return answer
    }
    func hammingWeight2(_ n: Int) -> Int {
        n.nonzeroBitCount
    }
}
