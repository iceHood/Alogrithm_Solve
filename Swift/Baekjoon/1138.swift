var n = Int(readLine()!)!
var read = readLine()!.split(separator: " ").map{ Int($0)! }
var result = [Int]()
for idx in stride(from: n, through: 1, by: -1) {
    result.insert(idx, at: read[idx-1])
}
for i in result {
    print(i, terminator: " ")
}
