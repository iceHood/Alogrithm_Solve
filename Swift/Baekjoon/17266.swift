
let N = Int(readLine()!)!
let M = Int(readLine()!)!
let position = readLine()!.split(separator: " ").map{ Int($0)! }

var answer = max(position.first!, N-position.last!)

for i in 1..<position.count {
    let diff = position[i] - position[i-1]
    answer = max(answer, diff/2 + diff%2)
}

print(answer)



