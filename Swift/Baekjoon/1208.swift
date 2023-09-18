
let NS = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, S) = (NS[0], NS[1])
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }

var dic: [Int: Int] = [:]
var answer = 0

func getRight(mid: Int, sum: Int) {
    if mid == N {
        if let num = dic[sum] { dic[sum] = num + 1 } else { dic[sum] = 1}
        return
    }
    
    getRight(mid: mid + 1, sum: sum + arr[mid])
    getRight(mid: mid + 1, sum: sum)
}

func getLeft(first: Int, sum: Int) {
    if first == N/2 {
        if let num = dic[S-sum] { answer += num }
        return
    }
    
    getLeft(first: first + 1, sum: sum + arr[first])
    getLeft(first: first + 1, sum: sum)
}

getRight(mid: N/2, sum: 0)
getLeft(first: 0, sum: 0)

if S == 0 {
    print(answer-1)
} else {
    print(answer)
}
