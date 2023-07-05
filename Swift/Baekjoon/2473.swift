//
//_ = readLine()
//var arr = readLine()!.split(separator: " ").map { Int(String($0))! }
//arr.sort()
//
//var leftIdx = 0
//var rightIdx = arr.count - 1
//
//var answer = (arr[leftIdx], arr[(leftIdx+rightIdx) / 2], arr[rightIdx])
//var sum = abs(answer.0 + answer.1 + answer.2)
//
//for i in 0..<arr.count-2 {
//    leftIdx = i + 1
//    rightIdx = arr.count - 1
//    while leftIdx < rightIdx {
//        let temp = arr[i] + arr[leftIdx] + arr[rightIdx]
//        if abs(temp) < sum {
//            sum = abs(temp)
//            answer.0 = arr[i]
//            answer.1 = arr[leftIdx]
//            answer.2 = arr[rightIdx]
//        }
//        
//        if temp < 0 {
//            leftIdx += 1
//        } else {
//            rightIdx -= 1
//        }
//    }
//}
//
//print(answer.0, answer.1, answer.2)
//
//
