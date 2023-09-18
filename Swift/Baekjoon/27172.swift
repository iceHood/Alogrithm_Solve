let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
var answer = [Int](repeating: 0, count: 1000001)
var isHas = [Bool](repeating: false, count: 1000001)
arr.forEach { num in
    isHas[num] = true
}
for i in 0..<N {
    for j in stride(from: arr[i]*2, through: 1000000, by: arr[i]) {
        if isHas[j] {
            answer[arr[i]] += 1
            answer[j] -= 1
        }
    }
}
var str = ""
arr.forEach({ str += "\(answer[$0]) " })
print(str)
