//
//func sol() {
//    let N = Int(readLine()!)!
//    let mod = 1_000_000_000
//    var dp = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: 0, count: 1024), count: 10), count: N+1)
//    for i in 1...9 {
//        dp[1][i][1<<i] = 1
//    }
//
//    guard N > 1 else { print(0); return }
//    for i in 2...N {
//        for j in 0...9 {
//            for k in 0...1023 {
//                if j == 0 {
//                    dp[i][0][k|1<<0] = (dp[i][0][k|1<<0] + dp[i-1][1][k])%mod
//                } else if j == 9 {
//                    dp[i][9][k|1<<9] = (dp[i][9][k|1<<9] + dp[i-1][8][k])%mod
//                } else {
//                    dp[i][j][k|1<<j] = (dp[i][j][k|1<<j] + dp[i-1][j-1][k])%mod
//                    dp[i][j][k|1<<j] = (dp[i][j][k|1<<j] + dp[i-1][j+1][k])%mod
//                }
//            }
//        }
//    }
//    var answer = 0
//    for i in 0...9 {
//        answer = (answer + dp[N][i][1023]) % mod
//    }
//    print(answer)
//}
//sol()
