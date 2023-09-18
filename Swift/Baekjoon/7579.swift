
//7579번 문제
/*
 현재 N개의 앱, A1, ..., AN이 활성화 되어 있다고 가정하자. 이들 앱 Ai는 각각 mi 바이트만큼의 메모리를 사용하고 있다. 또한, 앱 Ai를 비활성화한 후에 다시 실행하고자 할 경우, 추가적으로 들어가는 비용(시간 등)을 수치화 한 것을 ci 라고 하자. 이러한 상황에서 사용자가 새로운 앱 B를 실행하고자 하여, 추가로 M 바이트의 메모리가 필요하다고 하자. 즉, 현재 활성화 되어 있는 앱 A1, ..., AN 중에서 몇 개를 비활성화 하여 M 바이트 이상의 메모리를 추가로 확보해야 하는 것이다. 여러분은 그 중에서 비활성화 했을 경우의 비용 ci의 합을 최소화하여 필요한 메모리 M 바이트를 확보하는 방법을 찾아야 한다.
 
 [입력]
 입력은 3줄로 이루어져 있다. 첫 줄에는 정수 N과 M이 공백문자로 구분되어 주어지며, 둘째 줄과 셋째 줄에는 각각 N개의 정수가 공백문자로 구분되어 주어진다. 둘째 줄의 N개의 정수는 현재 활성화 되어 있는 앱 A1, ..., AN이 사용 중인 메모리의 바이트 수인 m1, ..., mN을 의미하며, 셋째 줄의 정수는 각 앱을 비활성화 했을 경우의 비용 c1, ..., cN을 의미한다

 단, 1 ≤ N ≤ 100, 1 ≤ M ≤ 10,000,000이며, 1 ≤ m1, ..., mN ≤ 10,000,000을 만족한다. 또한, 0 ≤ c1, ..., cN ≤ 100이고, M ≤ m1 + m2 + ... + mN이다.
 
 [출력]
 필요한 메모리 M 바이트를 확보하기 위한 앱 비활성화의 최소의 비용을 계산하여 한 줄에 출력해야 한다.
 
 [예제]
 (입력1)
 5 60
 30 10 20 35 40
 3 0 3 5 4
 (출력1)
 6
 */
let read1 = readLine()!.split(separator: " ")
let 메모리들 = [0] + readLine()!.split(separator: " ").map { Int($0)! }
let 비용들 = [0] + readLine()!.split(separator: " ").map { Int($0)! }

let N = Int(read1[0])!, M = Int(read1[1])!
var dp = [[Int]](repeating: [Int](repeating: 0, count: 10001), count: 101)
let sumOfCosts = 비용들.reduce(0) { partialResult, nums in
    partialResult + nums
}
for i in 1...N {
    for t in 0...sumOfCosts {
        if t - 비용들[i] >= 0 {
            dp[i][t] = max(dp[i][t], 메모리들[i] + dp[i-1][t-비용들[i]])
        }
        dp[i][t] = max(dp[i][t], dp[i-1][t])
    }
}
for i in 0...sumOfCosts {
    if dp[N][i] >= M {
        print(i)
        break
    }
}
