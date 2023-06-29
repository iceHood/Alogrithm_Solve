//
//let NS = readLine()!.split(separator: " ").map { Int(String($0))! }
//let (N, S) = (NS[0], NS[1])
//let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
//
//var answer = Int.max
//var prevJ = 0
//var prevSum = 0
//for i in 0..<arr.count {
//    guard i <= prevJ else { break }
//    var sum = prevSum
//    for j in prevJ..<arr.count {
//        sum += arr[j]
//        if sum >= S {
//            answer = min(answer, j-i+1)
//            prevJ = j
//            prevSum = sum - arr[j] - (i != j ? arr[i] : 0)
//            break
//        }
//    }
//}
//
//print(answer == .max ? 0 : answer)
///*
//10 15
//1 1 1 1 1 17 4 9 2 8
// */
