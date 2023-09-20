class Solution {
    func reverseBits(_ n: Int) -> Int {
        var answer = 0
        var n1 = n
        for _ in 1...32 {
            answer <<= 1
            answer += n1 & 1
            n1 >>= 1
        }
        return answer
    }
}
