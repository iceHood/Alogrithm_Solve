import Foundation

func solution(_ dice:[[Int]]) -> [Int] {
    let diceNum = dice.count
    var dp = [[Int: Int]](repeating: [:], count: 1<<diceNum)
    func findCombi(cnt: Int, index: Int, sum: Int, next: Int) {
        if cnt == diceNum/2 {
            if let value = dp[index][sum] {
                dp[index][sum] = value + 1
            } else {
                dp[index][sum] = 1
            }
            return
        }
        var idx = 1<<next
        var count = next
        while idx < (1<<diceNum) {
            if idx & index == 0 {
                for num in dice[count] {
                    findCombi(cnt: cnt+1, index: idx|index, sum: sum+num, next: count+1)
                }
            }
            idx <<= 1
            count += 1
        }
    }
    findCombi(cnt: 0, index: 0, sum: 0, next: 0)
    var dpWin = [Int](repeating: -1, count: 1<<diceNum)
    var maxIndex = 0
    var maxNum = 0
    func findWin(count: Int, index: Int, next: Int) {
        if count == diceNum/2 {
            if dpWin[index] != -1 { return }
            let opp = 1<<diceNum - index - 1
            var win = 0
            var lose = 0
            for a in dp[index] {
                for b in dp[opp] {
                    if a.key < b.key {
                        lose += a.value * b.value
                    } else if a.key > b.key {
                        win += a.value * b.value
                    }
                }
            }
            if maxNum < win {
                maxNum = win
                maxIndex = index
            }
            dpWin[index] = win
            if maxNum < lose {
                maxNum = lose
                maxIndex = opp
            }
            dpWin[opp] = lose
        } else {
            var idx = 1<<next
            var cnt = next
            while idx < (1<<diceNum) {
                if idx & index == 0 {
                    findWin(count: count+1, index: idx|index, next: cnt+1)
                 }
                 idx <<= 1
                 cnt += 1
            }
        }
    }
    findWin(count: 0, index: 0, next: 0)
    var result = [Int]()
    var count1 = 1
    var idx1 = 1
    while idx1 < (1<<diceNum) {
        if idx1 & maxIndex != 0 {
            result.append(count1)
        }
        idx1 <<= 1
        count1 += 1
    }
    return result
}

let dice = [
    [40, 41, 42, 43, 44, 45],
    [43, 43, 42, 42, 41, 41],
    [1, 1, 80, 80, 80, 80],
    [70, 70, 1, 1, 70, 70]
]

//let dice = [
//    [1, 2, 3, 4, 5, 6],
//    [2, 2, 4, 4, 6, 6]
//]
print(solution(dice))
