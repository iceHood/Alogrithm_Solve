//
//let N = Int(readLine()!)!
//let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
//var seq = [Int]()
//
//func bs(num: Int) {
//    var left = 0
//    var right = seq.count-1
//    var mid = (left + right) / 2
//    var answer = Int.max
//    while left <= right {
//        mid = (left + right) / 2
//        let temp = seq[mid]
//        if num <= temp {
//            if mid < answer {
//                answer = mid
//            }
//            right = mid - 1
//        } else {
//            left = mid + 1
//        }
//    }
//    seq[answer] = num
//}
//
//seq.append(arr[0])
//for i in 1..<N {
//    if seq.last! < arr[i] {
//        seq.append(arr[i])
//    } else {
//        bs(num: arr[i])
//    }
//}
//
//print(seq.count)
