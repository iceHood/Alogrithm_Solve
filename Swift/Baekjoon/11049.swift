//
//var matrix: [Int] = []
//let N = Int(readLine()!)!
//for _ in 1..<N {
//    matrix.append(Int(readLine()!.split(separator: " ")[0])!)
//}
//matrix.append(contentsOf: readLine()!.split(separator: " ").map { Int($0)! })
//
//var dp = [[Int]](repeating: [Int](repeating: 0, count: N+1), count: N+1)
//// [1][1] = 0
//// [2][2] = 0
//// [1][2] = [1][1] [1][2]
//// [1][4] = [1][2] [2][4], [1][3] [3][4]
//for l in 2...N {
//    for i in 0...N-l {
//        let j = i+l-1
//        dp[i][j] = 987654321
//        for p in i..<j {
//            dp[i][j] = min(dp[i][j], dp[i][p] + dp[p+1][j] + matrix[i] * matrix[p+1] * matrix[j+1])
//        }
//    }
//}
//print(dp[0][N-1])
//
//
////5
////3 5
////5 2
////2 3
////3 4
////4 5
//
