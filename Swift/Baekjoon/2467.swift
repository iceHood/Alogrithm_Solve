let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int(String($0))! }

var leftIdx = 0 // left idx
var rightIdx = arr.count - 1 // right idx

let target = 0
var sum = abs(arr[leftIdx] + arr[rightIdx])

var answer = (left: arr[leftIdx], right: arr[rightIdx]) // answer left and right number

while leftIdx < rightIdx {
    let temp = arr[leftIdx] + arr[rightIdx]
    if abs(temp) < sum {
        sum = abs(temp)
        answer.left = arr[leftIdx]
        answer.right = arr[rightIdx]
    }

    if temp < 0 {
        leftIdx += 1
    } else {
        rightIdx -= 1
    }
}

print(answer.left, answer.right)
