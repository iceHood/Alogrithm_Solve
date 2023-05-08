
//let N = Int(readLine()!)!
//var costs = [[Int]](repeating: [], count: N)
//for i in 0..<N {
//    costs[i] = readLine()!.split(separator: " ").map { Int($0)! }
//}
//
//var dp = [[Int]](repeating: [Int](repeating: -1, count: 1<<N), count: N)
//let stopStatus = 1 << N - 1
//
//func dfs(_ nowPos: Int, _ nowStatus: Int) -> Int {
//    if nowStatus == stopStatus {
//        if costs[nowPos][0] == 0 { return 987654321 } // case: Cannot go to position 0
//        else { return costs[nowPos][0] } // case: Can go to position 0
//    }
//
//    if dp[nowPos][nowStatus] != -1 { return dp[nowPos][nowStatus] } // Already visited (Memoization)
//    dp[nowPos][nowStatus] = 987654321 // Not visited -> start with high costs
//
//    for i in 0..<N {
//        if costs[nowPos][i] == 0 { continue } // now -> now: Cannot go
//        if nowStatus & 1 << i == 1 << i { continue } // Already visited
//        dp[nowPos][nowStatus] = min(dp[nowPos][nowStatus], costs[nowPos][i] + dfs(i, nowStatus | 1 << i))
//    }
//    return dp[nowPos][nowStatus]
//}
//
//print(dfs(0, 1))
/**
 최종목표: 거리의 최소 합을 구하는 것 -> dp에 대한 값이 거리의 최소 합이 되어야함
 dp의 속성 정의:
 - 1. (0에서 시작함을 가정하여) 몇 번째에 도달했는지
 - 2. 현재 어디어디를 방문했는지 (비트마스킹을 이용) ex. 0010 -> 첫번째 도시 방문
 dfs사용: 어느곳이든 한번 최소 사이클을 형성하는 순간 어느 곳에서 시작하든 해당 사이클을 이용하게 됨
 따라서 우리는 0에서 출발함을 가정하여 하나의 사이클을 형성할 것임
 **/
