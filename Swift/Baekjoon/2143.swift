//
//let T = Int(readLine()!)!
//let n = Int(readLine()!)!
//let A = readLine()!.split(separator: " ").map({Int(String($0))!})
//let m = Int(readLine()!)!
//let B = readLine()!.split(separator: " ").map({Int(String($0))!})
//
//var dic: [Int: Int] = [:]
//for i in 0..<A.count {
//    var sum = A[i]
//    if let num = dic[T-sum] { dic[T-sum] = num + 1 } else { dic[T-sum] = 1 }
//    for t in i+1..<A.count {
//        sum += A[t]
//        if let num = dic[T-sum] { dic[T-sum] = num + 1 } else { dic[T-sum] = 1 }
//    }
//}
//
//var answer = 0
//for i in 0..<B.count {
//    var sum = B[i]
//    if let num = dic[sum] { answer += num }
//    for t in i+1..<B.count {
//        sum += B[t]
//        if let num = dic[sum] { answer += num }
//    }
//}
//
//print(answer)
//// 1, 4, 5, 7, 3, 4, 6, 1, 3, 2
//// 4, 1, 0, -2, 2, 1, -1, 4, 2, 3
//// 1, 4, 6, 3, 5, 2
//// 2, 2, 0, 1, 0, 2
