let str1 = [Character(" ")]+Array(readLine()!)
let str2 = [Character(" ")]+Array(readLine()!)

var dp = [[Int]](repeating: [Int](repeating: 0, count: str1.count), count: str2.count)

for i in 1..<str2.count {
    for t in 1..<str1.count {
        if str2[i] == str1[t] {
            dp[i][t] = dp[i-1][t-1] + 1
        } else {
            dp[i][t] = max(dp[i-1][t], dp[i][t-1])
        }
    }
}

let lengthOfWord = dp[str2.count-1][str1.count-1]
var cnt = 0
var answer = [String.Element]()
var y = str2.count-1
var x = str1.count-1
while cnt < lengthOfWord {
    if dp[y][x] == dp[y-1][x] {
        y -= 1
    } else if dp[y][x] == dp[y][x-1] {
        x -= 1
    } else {
        answer.append(str1[x])
        cnt += 1
        y -= 1
        x -= 1
    }
}
print(lengthOfWord)
print(String(answer.reversed()))

