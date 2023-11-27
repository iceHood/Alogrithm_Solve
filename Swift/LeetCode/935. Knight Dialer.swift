class Solution {
    func knightDialer(_ n: Int) -> Int {
        let knightMove = [
            0: [4, 6],
            1: [6, 8],
            2: [7, 9],
            3: [4, 8],
            4: [0, 3, 9],
            5: [],
            6: [0, 1, 7],
            7: [2, 6],
            8: [1, 3],
            9: [2, 4]
        ]
        
        var dp = [[Int]](repeating: [Int](repeating: -1, count: 5001), count: 10)
        for i in 0...9 { dp[i][1] = 1 }
        
        func getResult(_ num: Int, _ count: Int) -> Int {
            if dp[num][count] != -1 {
                return dp[num][count]
            }
            var result = 0
            for i in knightMove[num]! {
                result = (result + getResult(i, count-1)) % 1000000007
            }
            dp[num][count] = result
            return result
        }
        return (0...9).reduce(0) { partialResult, i in
            return (partialResult + getResult(i, n)) % 1000000007
        }
    }
}

Solution().knightDialer(16)
